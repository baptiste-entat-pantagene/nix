{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./boot.nix
    ./game.nix
    ./docker.nix
    ./direnv.nix
    ./gpu.nix
    ./OOM.nix
    ./firefox.nix
    ./gnome.nix
    ./sound.nix
    ./zsh.nix
    ./garbage-collection.nix
  ];
}
