{pkgs, ...}: let
	yazi-plugins = pkgs.fetchFromGitHub {
		owner = "yazi-rs";
		repo = "plugins";
		rev = "5186af7984aa8cb0550358aefe751201d7a6b5a8";  # Replace!
		hash = "sha256-Cw5iMljJJkxOzAGjWGIlCa7gnItvBln60laFMf6PSPM=";  # Replace!
	};
in {
	programs.yazi = {
		enable = true;
		enableZshIntegration = true;
		shellWrapperName = "y";

		settings = {
			manager = {
				show_hidden = true;
			};
			preview = {
				max_width = 1000;
				max_height = 1000;
			};
		};

		plugins = {
			chmod = "${yazi-plugins}/chmod.yazi";
			full-border = "${yazi-plugins}/full-border.yazi";
			max-preview = "${yazi-plugins}/max-preview.yazi";
			starship = pkgs.fetchFromGitHub {
				owner = "Rolv-Apneseth";
				repo = "starship.yazi";
				rev = "6c639b474aabb17f5fecce18a4c97bf90b016512";  # Replace!
				sha256 = "sha256-bhLUziCDnF4QDCyysRn7Az35RAy8ibZIVUzoPgyEO1A=";  # Replace!
			};
		};

		initLua = ''
			require("full-border"):setup()
			require("starship"):setup()
		'';

		keymap = {
			manager = {
        keymap = [
          # 核心导航 (Colemak 主行位置优化)
          {
            on = "n";       # 原位置 j → n (下移)
            run = "arrow_down";
            desc = "Move down";
          }
          {
            on = "e";       # 原位置 k → e (上移)
            run = "arrow_up";
            desc = "Move up";
          }
          {
            on = "h";       # 保持 h 左移不变
            run = "arrow_left";
            desc = "Move left";
          }
          {
            on = "i";       # 原位置 l → i (右移)
            run = "arrow_right";
            desc = "Move right";
          }

          # 目录导航
          {
            on = "h";       # 上移目录 (替代默认的 h)
            run = "cd ..";
            desc = "Go parent";
          }
          {
            on = "i";       # 进入目录 (替代默认的 l)
            run = "enter";
            desc = "Enter directory";
          }

          # 选择操作
          {
            on = "space";       # 选择文件 (原位置 space → t)
            run = "toggle_selection";
            desc = "Toggle selection";
          }
          /* {
            on = "T";       
            run = "toggle_all";
            desc = "Invert selection";
          } */

          # 快速跳转
          {
            on = "g";       # 跳转至顶部
            run = "arrow_top";
            desc = "Go top";
          }
          {
            on = "m";       # 跳转至中部
            run = "arrow_middle";
            desc = "Go middle";
          }
          {
            on = "G";       
            run = "arrow_bottom";
            desc = "Go bottom";
          }
        ];
        # 文件操作
        append_keymap = [
          {
            on = "r";
            run = "rename";
            desc = "Rename";
          }
          {
            on = "d";       # 删除 (保持 d 不变)
            run = "delete";
            desc = "Delete";
          }
          {
            on = "p";       # 粘贴 (原位置 p → 保持)
            run = "paste";
            desc = "Paste";
          }
          {
            on = "x";
            run = "cut";
            desc = "Cut";
          }
          {
            on = "c";       # 复制 (原位置 c → 保持)
            run = "copy";
            desc = "Copy";
          }
        ];

        # 预览面板操作
        preview.keymap = [
          {
            on = "e";         # 上翻页 (原位置 k → e)
            run = "scroll_up";
            desc = "Scroll up";
          }
          {
            on = "n";         # 下翻页 (原位置 j → n)
            run = "scroll_down";
            desc = "Scroll down";
          }
        ];

        prepend_keymap = [
          {
            on = "T";
            run = "plugin max-preview";
            desc = "Maximize or restore the preview pane";
          }
          {
            on = ["c" "m"];
            run = "plugin chmod";
            desc = "Chmod on selected files";
          }
        ];

      };
		};
	};
}
