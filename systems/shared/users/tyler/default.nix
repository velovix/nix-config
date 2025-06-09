{ inputs, ... }: {
  # NixOS doesn't create a user group automatically, so we do it ourselves
  users.groups.tyler = {
    gid = 1000;
  };
  users.users.tyler = {
    isNormalUser = true;
    description = "Tyler Compton";
    group = "tyler";
    extraGroups = [ "networkmanager" "wheel" "users" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.tyler = import ./home.nix;
  };
}

