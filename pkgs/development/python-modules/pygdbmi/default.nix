{ stdenv
, lib
, buildPythonPackage
, fetchPypi
, gdb
}:

buildPythonPackage rec {
  pname = "pygdbmi";
  version = "0.10.0.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-MIqMx6AC6Q41iPWkgBJ9f12V69C6mZOu7umFqkGOeL4=";
  };

  checkInputs = [ gdb ];

  # tests require gcc for some reason
  doCheck = !stdenv.hostPlatform.isDarwin;

  meta = with lib; {
    description = "Parse gdb machine interface output with Python";
    homepage = "https://github.com/cs01/pygdbmi";
    license = licenses.mit;
    maintainers = [ maintainers.mic92 ];
  };
}
