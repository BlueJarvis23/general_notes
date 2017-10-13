
# dd

## Create bootable flash drive from iso for Mac/Linux

Use the `dd` command to create the a bootable flashdrive. First identify the locations of 
the bootable media.

- Linux --    `lsblk`
- Mac --      `diskutil list`

Make sure that the device is unmounted and then use the `dd` command to copy the image.

- Linux --    `dd if=PATH_TO_ISO of=PATH_TO_DEVICE bs=4M && sync`
- Mac --      `dd if=PATH_TO_ISO of=PATH_TO_DEVICE bs=4m && sync`

Note the lower and upper case 'M/m' difference for Mac.

