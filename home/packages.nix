{ config, pkgs, ... }:

let
  # 使用 stdenv.mkDerivation 直接构建
  noteLinkJanitor = pkgs.stdenv.mkDerivation {
    pname = "note-link-janitor";
    version = "0.0.1";

    src = pkgs.fetchFromGitHub {
      owner = "andymatuschak";
      repo = "note-link-janitor";
      rev = "00127ed7e293cb4fd6a72880cf2df31846e79b81";
      hash = "sha256-j12WuCsdiLM/nFi/0u0VaWCAuyziFZZE3fAo0u/d5HI=";
    };

    buildInputs = with pkgs; [ nodejs_22 ];

    buildPhase = ''
      # 如果有 package.json，尝试安装依赖
      if [ -f package.json ]; then
        npm install --no-bin-links --ignore-scripts || true
      fi
      
      # 如果有 TypeScript 配置，尝试编译
      if [ -f tsconfig.json ]; then
        npx tsc || true
      fi
    '';

    installPhase = ''
      mkdir -p $out/bin $out/lib/node_modules/note-link-janitor
      
      # 复制所有文件
      cp -r . $out/lib/node_modules/note-link-janitor/
      
      # 创建可执行文件
      cat > $out/bin/note-link-janitor << 'EOF'
#!/bin/sh
exec ${pkgs.nodejs_22}/bin/node $out/lib/node_modules/note-link-janitor/index.js "$@"
EOF
      chmod +x $out/bin/note-link-janitor
    '';

    meta = with pkgs.lib; {
      description = "Maintains backlink structure among interlinked Markdown notes";
      homepage = "https://github.com/andymatuschak/note-link-janitor";
      license = licenses.mit;
      maintainers = [];
    };
  };
in
{
  # 将 noteLinkJanitor 添加到您的用户包列表
  home.packages = with pkgs; [
    # ... 您现有的其他包
    noteLinkJanitor
  ];

  # 其他 home-manager 配置...
}
