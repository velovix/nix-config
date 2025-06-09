{ inputs, ... }: {
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.tyler = import ./home.nix;
  };
}

