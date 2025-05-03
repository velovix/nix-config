{ inputs, ... }: {
  imports = [
    ./gnome.nix
    ./1password.nix
    ./dconf
    ./shell.nix
    ./locale.nix
    ./sound.nix
  ];
}

