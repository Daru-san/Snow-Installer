{
  description = "My minimal NixOS install ISO";
  inputs.nixos.url = "github:nixos/nixpkgs/nixos-unstable";
  outputs = {self, nixos}:{
    nixosConfigurations = {
      nix = nixos.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          "${nixos}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
          ./default.nix
        ];
      };
    };
  };
}
