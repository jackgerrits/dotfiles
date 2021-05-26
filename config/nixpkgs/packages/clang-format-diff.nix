{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation {
  name = "clang-format-diff";
  src = pkgs.fetchurl {
    url = "https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang-10.0.0.src.tar.xz";
    sha256 = "08fbxa2a0kr3ni35ckppj0kyvlcyaywrhpqwcdrdy0z900mhcnw8";
  };
  phases = [ "unpackPhase" "installPhase" "fixupPhase" ];
  propagatedBuildInputs = [ pkgs.python pkgs.clang_10 ];
  installPhase = ''
    mkdir -p $out/bin
    cp tools/clang-format/clang-format-diff.py $out/bin
    cp tools/clang-format/clang-format-diff.py $out/bin/clang-format-diff
  '';
}
