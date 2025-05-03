{ inputs, ... }: {
  users.users.tyler = {
    isNormalUser = true;
    description = "Tyler Compton";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.tyler = import ./home.nix;
  };
}

