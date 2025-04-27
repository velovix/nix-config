{ inputs, ... }: {
  imports = [
    ./gpus.nix
    ./docker.nix
    ./virtualbox.nix
  ];
}

