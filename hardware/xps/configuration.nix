{ pkgs, inputs, ... }: {
  imports = [
    inputs.nixos-hardware.nixosModules.dell-xps-15-9550
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia-disable
    inputs.nixos-hardware.nixosModules.common-hidpi
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    inputs.nixos-hardware.nixosModules.common-pc-laptop-acpi_call
    inputs.nixos-hardware.nixosModules.common-pc-laptop-ssd
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";
    };

    kernel = { sysctl = { "fs.inotify.max_user_watches" = 524288; }; };

    initrd = {
      systemd.enable = true;
      verbose = false;
    };
  };

  system.stateVersion = "23.05";

  services.fstrim.enable = true;
  services.upower.enable = true;
  services.thermald.enable = true;

  powerManagement = {
    enable = true;
    powertop.enable = true;
  };
}
