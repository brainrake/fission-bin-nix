{ pkgs ? import <nixpkgs> {}, ... }:
pkgs.callPackage ./fission-bin.nix {}
