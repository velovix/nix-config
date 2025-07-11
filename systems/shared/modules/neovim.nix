{ pkgs, ... }: {
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];
}

