
{ lib
, stdenv
, fetchurl
, nodejs
, makeWrapper
}:

stdenv.mkDerivation rec {
  pname = "note-link-janitor";
  version = "0.0.1";

  src = fetchurl {
    url = "https://registry.npmjs.org/@andymatuschak/note-link-janitor/-/note-link-janitor-${version}.tgz";
    sha256 = "0w6znhxg8jvzar134zafwhr9ca3pm7hq88kfmmzhx8qv0d2xnvcw";
  };

  buildInputs = [ nodejs makeWrapper ];

  unpackPhase = ''
    tar -xzf $src
    cd package
  '';

  installPhase = ''
    mkdir -p $out/lib/node_modules/@andymatuschak/note-link-janitor
    mkdir -p $out/bin
    
    # 复制所有文件
    cp -r . $out/lib/node_modules/@andymatuschak/note-link-janitor/
    
    # 创建可执行文件
    makeWrapper ${nodejs}/bin/node $out/bin/note-link-janitor \
      --add-flags "$out/lib/node_modules/@andymatuschak/note-link-janitor/dist/index.js"
  '';

  meta = with lib; {
    description = "Maintains backlink structure among interlinked Markdown notes";
    homepage = "https://github.com/andymatuschak/note-link-janitor";
    license = licenses.mit;
    maintainers = [ ];
    platforms = platforms.all;
    mainProgram = "note-link-janitor";
  };
}
