{ inputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./gpus.nix
    ./docker.nix
    ./virtualbox.nix
  ];
}

