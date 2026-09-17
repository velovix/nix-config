{ inputs, ... }: {
  imports = [
    ./gnome.nix
    #./cosmic.nix
    ./1password.nix
    ./dconf
    ./shell.nix
    ./locale.nix
    ./sound.nix
    ./gparted.nix
    ./neovim.nix
  ];
}

