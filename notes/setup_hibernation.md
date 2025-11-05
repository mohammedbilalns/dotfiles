#  Setup Hibernation with Swap Partition

1. **Add `resume=UUID=<uuid_of_swap_partition>` to kernel parameters**

   #### Systemd Boot

   * Edit `/boot/loader/entries/kernel.conf` and add the param to the `options` line.

   #### Grub

   * Add to `GRUB_CMDLINE_LINUX_DEFAULT` in `/etc/default/grub`.
   * Update grub:

     ```bash
     sudo update-grub
     # or
     sudo grub-mkconfig -o /boot/grub/grub.cfg
     ```

2. **Add `resume` hook/module to initramfs configuration**

   #### mkinitcpio

   * Edit `/etc/mkinitcpio.conf`
   * Add `resume` **after** `udev` in the `HOOKS` array:

     ```bash
     HOOKS=(base udev resume autodetect modconf block filesystems keyboard fsck)
     ```
   * Rebuild initramfs:

     ```bash
     sudo mkinitcpio -P
     ```

   #### dracut

   * Edit or create `/etc/dracut.conf.d/resume.conf` and add:

     ```
     add_dracutmodules+=" resume "
     ```
   * Rebuild initramfs:

     ```bash
     sudo dracut --force
     ```

3. **Reboot**

   ```bash
   sudo reboot
   ```

---

