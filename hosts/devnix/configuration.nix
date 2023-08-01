{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #boot.loader.efi.efiSysMountPoint = "/boot/efi";

  #hardware.enableRedistributableFirmware = true;

  networking.hostName = "devnix";
  networking.networkmanager.enable = true;

  time.timeZone = "Pacific/Auckland";
  i18n.defaultLocale = "en_US.utf8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_NZ.utf8";
    LC_IDENTIFICATION = "en_NZ.utf8";
    LC_MEASUREMENT = "en_NZ.utf8";
    LC_MONETARY = "en_NZ.utf8";
    LC_NAME = "en_NZ.utf8";
    LC_NUMERIC = "en_NZ.utf8";
    LC_PAPER = "en_NZ.utf8";
    LC_TELEPHONE = "en_NZ.utf8";
    LC_TIME = "en_NZ.utf8";
  };


  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    helix
    wget
  ];

  system.stateVersion = "23.05"; # Did you read the comment?
}
