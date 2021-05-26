{ lib, stdenv, fetchFromGitHub, cmake, boost, openssl, zlib }:

stdenv.mkDerivation rec {
  pname = "cpprestsdk";
  version = "2.10.18";

  src = fetchFromGitHub {
    owner = "microsoft";
    repo = "cpprestsdk";
    rev = version;
    sha256 = "07qyip57wyzpmlgyz1fri4ljmla7ar3isddvfkm8hzv6q35bx2rn";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [ cmake ];

  buildInputs = [
    boost
  ];

  propagatedBuildInputs = [ zlib openssl ];

  # -DBUILD_TESTS=OFF is set as both it saves time in the build and the default
  # cmake flags appended by the builder include -DBUILD_TESTING=OFF for which
  # this is the equivalent flag.
  cmakeFlags = [
    "-DCPPREST_EXCLUDE_WEBSOCKETS=ON"
    "-DCPPREST_EXCLUDE_COMPRESSION=ON"
    "-DCPPREST_EXCLUDE_BROTLI=ON"
    "-DBUILD_TESTS=OFF"
    "-DBUILD_SAMPLES=OFF"
    "-DWERROR=OFF"
  ];
}
