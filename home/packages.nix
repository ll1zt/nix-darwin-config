{ config, pkgs, ... }:

let
  # Import the internal buildYarnPackage helper from the nixpkgs source.
  # This is the correct pattern when a builder isn't exposed at the top level.
  buildYarnPackage = pkgs.callPackage (
    "${pkgs.path}/pkgs/development/node-packages/build-yarn-package.nix"
  ) {};

  noteLinkJanitor = buildYarnPackage {
    pname = "note-link-janitor";
    version = "0.0.1";

    src = pkgs.fetchFromGitHub {
      owner = "andymatuschak";
      repo = "note-link-janitor";
      rev = "00127ed7e293cb4fd6a72880cf2df31846e79b81";
      hash = "sha256-j12WuCsdiLM/nFi/0u0VaWCAuyziFZZE3fAo0u/d5HI=";
    };

    nativeBuildInputs = [
      pkgs.typescript
      pkgs.makeWrapper
    ];

    # This is the hash for the dependencies in yarn.lock.
    # The build will fail once with a placeholder, telling you the correct hash.
    yarnDepsHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    buildPhase = ''
      runHook preBuild
      npx tsc
      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall
      mkdir -p $out/lib/node_modules/note-link-janitor $out/bin

      # Copy compiled code and dependencies
      cp -r dist node_modules $out/lib/node_modules/note-link-janitor/

      # Create a wrapper script to run the application
      makeWrapper ${pkgs.nodejs_22}/bin/node $out/bin/note-link-janitor \
        --add-flags $out/lib/node_modules/note-link-janitor/dist/index.js
      runHook postInstall
    '';

    meta = with pkgs.lib; {
      description = "Maintains backlink structure among interlinked Markdown notes";
      homepage = "https://github.com/andymatuschak/note-link-janitor";
      license = licenses.mit;
    };
  };
in
{
  home.packages = with pkgs; [
    noteLinkJanitor
  ];
}
