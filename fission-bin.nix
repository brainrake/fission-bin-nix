{ autoPatchelfHook, fetchurl, gmp, lzma, ncurses5, postgresql, stdenv, zlib, ... }:
stdenv.mkDerivation rec {
  pname = "fission-bin";
  version = "2.4.2";

  srcs = [
    (fetchurl {
      url = "https://github.com/fission-suite/fission/releases/download/${version}/fission-cli-linux-x86_64";
      hash = "sha256:17ryk4y1aykr8mcji43a5mxjl7aa5a4b3iqadikgg2rppxq6wl8i";
      executable = true;
    })
    (fetchurl {
      url = "https://github.com/fission-suite/fission/releases/download/${version}/fission-server-linux-x86_64";
      hash = "sha256:0lja8hsv84r9d223rcwz6vksshqd6mz3i3zhj4bkcrwdnbxyj6l4";
      executable = true;
    })
  ];

  buildInputs = [ autoPatchelfHook gmp lzma ncurses5.dev postgresql.lib zlib ];

  unpackPhase = "true";
  buildPhase = "true";

  installPhase = ''
    SRCS=($srcs)
    mkdir -p $out/bin
    cp "''${SRCS[0]}" $out/bin/fission
    cp "''${SRCS[1]}" $out/bin/fission-server
  '';
}
