## Add Windows Boot Entry (for systemd-boot)

1. **Mount the Windows EFI partition**

   ```bash
   sudo mount /dev/<windows-efi-partition> /mnt/windows
   ```

2. **Copy Windows EFI files to Linux EFI partition**

   ```bash
   sudo cp -r /mnt/windows/EFI/Microsoft /boot/efi/
   ```

3. **Update systemd-boot entries**

   ```bash
   sudo bootctl update
   ```

4. **(Optional) Create a manual Windows boot entry**
   If systemd-boot doesn’t automatically detect Windows, create a new entry file:

   ```bash
   sudo vim /boot/loader/entries/windows.conf
   ```

   Add the following content:

   ```
   title   Windows Boot Manager
   efi     /EFI/Microsoft/Boot/bootmgfw.efi
   ```



