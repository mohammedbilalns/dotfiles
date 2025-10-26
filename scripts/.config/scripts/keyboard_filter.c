#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <libevdev/libevdev.h>
#include <libevdev/libevdev-uinput.h>
#include <errno.h>

#define BUFFER_SIZE 128

struct key_event {
    unsigned int code;
    int value;
    int forwarded;
};

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s /dev/input/eventX\n", argv[0]);
        return 1;
    }

    const char *device_path = argv[1];
    int fd = open(device_path, O_RDONLY|O_NONBLOCK);
    if (fd < 0) {
        perror("Failed to open device");
        return 1;
    }

    struct libevdev *dev = NULL;
    if (libevdev_new_from_fd(fd, &dev) < 0) {
        fprintf(stderr, "Failed to init libevdev\n");
        return 1;
    }

    printf("Input device name: %s\n", libevdev_get_name(dev));

    // Try to grab device exclusively
    if (libevdev_grab(dev, LIBEVDEV_GRAB) != 0) {
        fprintf(stderr, "Failed to grab device exclusively. Duplicates may occur.\n");
    }

    struct libevdev_uinput *uinput_dev;
    if (libevdev_uinput_create_from_device(dev, 
            LIBEVDEV_UINPUT_OPEN_MANAGED, &uinput_dev) < 0) {
        fprintf(stderr, "Failed to create uinput device\n");
        return 1;
    }

    struct key_event buffer[BUFFER_SIZE];
    int buf_index = 0;

    int last_forwarded[KEY_MAX+1];
    memset(last_forwarded, -1, sizeof(last_forwarded));

    int v_pressed = 0;

    while (1) {
        struct input_event ev;
        int rc = libevdev_next_event(dev, LIBEVDEV_READ_FLAG_NORMAL, &ev);
        if (rc == LIBEVDEV_READ_STATUS_SYNC) {
            // resync if needed
            continue;
        } else if (rc == -EAGAIN) {
            usleep(1000);
            continue;
        } else if (rc < 0) {
            fprintf(stderr, "Error reading event: %d\n", rc);
            break;
        }

        if (ev.type != EV_KEY)
            continue; // ignore non-key events

        // Prevent duplicate forwards
        if (last_forwarded[ev.code] == ev.value)
            continue;
        last_forwarded[ev.code] = ev.value;

        // Store in buffer
        buffer[buf_index] = (struct key_event){ .code = ev.code, .value = ev.value, .forwarded = 0 };

        // Check for retroactive filter
        if (ev.code == KEY_V) {
            v_pressed = ev.value;
        }
        if (v_pressed && ev.code == KEY_B && ev.value == 1) {
            // Modify event retroactively
            ev.code = KEY_B; // Here you can change to whatever effect you need
            buffer[buf_index].forwarded = 1;
            printf("Retroactive filter applied to B key at buffer index %d\n", buf_index);
        }

        // Forward event
        libevdev_uinput_write_event(uinput_dev, EV_KEY, ev.code, ev.value);
        libevdev_uinput_write_event(uinput_dev, EV_SYN, SYN_REPORT, 0);
        printf("Forwarded: code=%d value=%d\n", ev.code, ev.value);

        buf_index = (buf_index + 1) % BUFFER_SIZE;
    }

    libevdev_uinput_destroy(uinput_dev);
    libevdev_free(dev);
    close(fd);
    return 0;
}

