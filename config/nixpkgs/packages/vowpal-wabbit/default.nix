{ lib, stdenv, fetchgit, cmake, boost169, zlib, flatbuffers }:

let
 version = "8.9.2";
in
stdenv.mkDerivation {
  pname = "vowpal-wabbit";
  version = "${version}";
  src =
    fetchgit  {
      url = "https://github.com/VowpalWabbit/vowpal_wabbit.git";
      rev = "${version}";
      sha256 = "0np11nvxvbxgfdlm4q07lw7zni6mm4l93bf7pj0rif7fz15k8f3l";
      fetchSubmodules = true;
    };
  buildInputs = [
    cmake
    boost169
    zlib
  ];
  configurePhase = ''
    cmake . -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \
      -DVW_INSTALL=ON \
      -DBUILD_TESTS=OFF \
      -DBUILD_JAVA=OFF \
      -DBUILD_PYTHON=OFF \
      -DUSE_LATEST_STD=ON
  '';
  buildPhase = ''
    cmake --build . --target all --parallel $NIX_BUILD_CORES
  '';
  installPhase = ''
    cmake --install .
  '';
  meta = with lib; {
    description = "Machine learning system which pushes the frontier of machine learning with techniques such as online, hashing, allreduce, reductions, learning2search, active, and interactive learning";
    homepage = "https://github.com/VowpalWabbit/vowpal_wabbit/";
    license = licenses.bsd3;
    maintainers = with maintainers; [ danieldk ];
  };
}
