{ lib
, llvmPackages_11
, cmake
, spdlog
, abseil-cpp }:

llvmPackages_11.stdenv.mkDerivation rec {
  pname = "cpp-examples";
  version = "0.1.0";
  
  src = ./.;

  nativeBuildInputs = [
    cmake
  ];

  buildInputs = [
    llvmPackages_11.libcxx
    spdlog
    abseil-cpp
  ];

  CPATH = builtins.concatStringsSep ":" [
    (lib.makeSearchPathOutput "dev" "include" [llvmPackages_11.libcxx])
    (lib.makeSearchPath "resource-root/include" [llvmPackages_11.clang])
  ];

  cmakeFlags = [
    "-DENABLE_TESTING=OFF"
    "-DENABLE_INSTALL=ON"
  ];

  meta = with lib; {
    homepage = "https://github.com/nixvital/nix-based-cpp-starterkit";
    description = ''
      A template for Nix based C++ project setup.";
    '';
    licencse = licenses.mit;
    platforms = with platforms; linux ++ darwin;
    maintainers = [ maintainers.breakds ];    
  };
}
