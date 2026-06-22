{pkgs}: let
  pname = "lookout";
  version = "0.3.3";
in
  pkgs.stdenv.mkDerivation {
    inherit pname version;
    src = pkgs.fetchurl {
      url = "https://github.com/hackclub/lookout/releases/download/v${version}/Lookout_linux-${version}_amd64.deb";
      sha256 = "sha256-g3DVHwOZKtb6WYjJCkuZxKuHJq4I6139uOmd5x9Iu1c=";
    };
    nativeBuildInputs = [pkgs.dpkg pkgs.autoPatchelfHook pkgs.makeWrapper];
    buildInputs = with pkgs; [
      webkitgtk_4_1
      gtk3
      glib
      cairo
      pango
      gdk-pixbuf
      libnotify
      at-spi2-core
      openssl
      libayatana-appindicator
    ];
    unpackPhase = ''
      dpkg-deb -x $src $out
    '';
    installPhase = ''
      mv $out/usr/* $out/
      rm -rf $out/usr
    '';
    postFixup = ''
      wrapProgram $out/bin/lookout-desktop \
        --prefix LD_LIBRARY_PATH : ${pkgs.libayatana-appindicator}/lib
    '';
  }
