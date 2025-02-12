{ inputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./gnome.nix
    ./1password.nix
    ./dconf.nix
    ./shell.nix
    ./locale.nix
    ./sound.nix
  ];
}

