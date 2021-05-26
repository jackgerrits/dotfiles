{ lib, stdenv, callPackage, fetchFromGitHub, cmake, flatbuffers, boost, openssl}:

let cpprestsdk = callPackage ../cpprestsdk {}; in
stdenv.mkDerivation rec {
  pname = "rlclientlib";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "VowpalWabbit";
    repo = "reinforcement_learning";
    rev = "fabaf26ad72871483fd332c919d46a03f6280370";
    sha256 = "07qyip57wyzpmlgyz1fri4ljmla7ar3isddvfkm8hzv6q35bx2rn";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [ cmake ];

  buildInputs = [
    cpprestsdk
    flatbuffers
    boost
    openssl
  ];

  # -DBUILD_TESTS=OFF is set as both it saves time in the build and the default
  # cmake flags appended by the builder include -DBUILD_TESTING=OFF for which
  # this is the equivalent flag.
  # cmakeFlags = [
  #   "-DCPPREST_EXCLUDE_WEBSOCKETS=ON"
  #   "-DCPPREST_EXCLUDE_COMPRESSION=ON"
  #   "-DCPPREST_EXCLUDE_BROTLI=ON"
  #   "-DBUILD_TESTS=OFF"
  #   "-DBUILD_SAMPLES=OFF"
  #   "-DWERROR=OFF"
  # ];
}
