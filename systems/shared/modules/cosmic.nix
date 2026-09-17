{ pkgs, ... }: {
  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;

  # Standard utilities COSMIC is currently missing
  environment.systemPackages = with pkgs; [
    loupe
  ];
}

