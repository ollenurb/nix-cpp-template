{
  description = "C/C++ environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils, ... }@inputs:
    utils.lib.eachDefaultSystem (
      system:
      let
        p = import nixpkgs {
          inherit system;

          # Uncomment this if you need overlays 
          # your project.
          # overlays = [ ];

          # Uncomment this if you need unfree software (e.g. cuda) for
          # your project.
          # config.allowUnfree = true;
        };
        llvm = p.llvmPackages_latest;
      in
      {
        devShell = p.mkShell.override { stdenv = p.clangStdenv; } rec {
          packages = with p; [
            # builder
            gnumake
            cmake

            # debugger
            llvm.lldb
            gdb

            # fix headers not found
            clang-tools

            # LSP and compiler
            llvm.libstdcxxClang

            # other tools
            cppcheck
            llvm.libllvm
            valgrind

            # stdlib for cpp
            llvm.libcxx
              
            # libs
            # glm
            # SDL2
            # SDL2_gfx
          ];
          name = "C";
        };
      }
    );
}
