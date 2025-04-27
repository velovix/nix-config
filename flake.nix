{
  description = "Tyler's NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations = {
      amorphous = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	specialArgs = { inherit inputs; };
        modules = [
          { networking.hostName = "amorphous"; }
          ./hardware/framework13
          ./systems/personal
        ];
      };
      tyler-raise = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	specialArgs = { inherit inputs; };
        modules = [
          { networking.hostName = "tyler-raise"; }
          ./hardware/thinkpad-p16s
          ./systems/personal
          ./systems/raise
        ];
      };
    };
  };
}

