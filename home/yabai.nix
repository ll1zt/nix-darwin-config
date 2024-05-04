{ config, pkgs, lib, ... }: {
  home.file.yabai = {
    executable = true;
    target = ".config/yabai/yabairc";
    text = ''
      #!/usr/bin/env sh

      # load scripting addition
      sudo /opt/homebrew/bin/yabai --load-sa
      /opt/homebrew/bin/yabai -m signal --add event=dock_did_restart action="sudo /opt/homebrew/bin/yabai --load-sa"
                  
      # global settings
      
      /opt/homebrew/bin/yabai -m config auto_balance                 off    
      /opt/homebrew/bin/yabai -m config split_ratio                  0.50
      
      /opt/homebrew/bin/yabai -m config window_origin_display        default
      /opt/homebrew/bin/yabai -m config window_placement             second_child
      /opt/homebrew/bin/yabai -m config window_topmost               off
      /opt/homebrew/bin/yabai -m config window_shadow                on
      /opt/homebrew/bin/yabai -m config window_opacity               on
      /opt/homebrew/bin/yabai -m config active_window_opacity        1.0
      /opt/homebrew/bin/yabai -m config normal_window_opacity        0.85
      
    # /opt/homebrew/bin/yabai -m config window_opacity_duration      2000.0   
    # /opt/homebrew/bin/yabai -m config window_border                off
    # /opt/homebrew/bin/yabai -m config window_border_width          6
    # /opt/homebrew/bin/yabai -m config active_window_border_color   0xff775759
    # /opt/homebrew/bin/yabai -m config normal_window_border_color   0xff555555
    # /opt/homebrew/bin/yabai -m config insert_feedback_color        0xffd75f5f



      /opt/homebrew/bin/yabai -m config mouse_modifier               fn
      /opt/homebrew/bin/yabai -m config mouse_action1                move
      /opt/homebrew/bin/yabai -m config mouse_action2                resize
      /opt/homebrew/bin/yabai -m config mouse_drop_action            swap
      /opt/homebrew/bin/yabai -m config mouse_follows_focus          off



      # general space settings
      /opt/homebrew/bin/yabai -m config layout         bsp
      /opt/homebrew/bin/yabai -m config top_padding    0
      /opt/homebrew/bin/yabai -m config bottom_padding 0
      /opt/homebrew/bin/yabai -m config left_padding   0
      /opt/homebrew/bin/yabai -m config right_padding  0
      /opt/homebrew/bin/yabai -m config window_gap     0

      # rules
      /opt/homebrew/bin/yabai -m rule --add app="^System Preferences$" manage=off

      echo "yabai configuration loaded.."
    '';
  };

  home.file.skhd = {
    target = ".config/skhd/skhdrc";
    text = ''

    # Modes
    :: default : sketchybar -m --set modal icon="N" icon.color="0xFF$(awk -F '0x21#0x1E' '/color4/{print $2}' ~/.Xresources)" background.color="0xFF$(awk -F '0x21#0x1E' '/background/{print $2}' ~/.Xresources)"
    :: window @ : sketchybar -m --set modal icon="W" icon.color="0xFF$(awk -F '0x21#0x1E' '/background/{print $2}' ~/.Xresources)" background.color="0xFF$(awk -F '0x21#0x1E' '/color4/{print $2}' ~/.Xresources)"
    :: scripts @ : sketchybar -m --set modal icon="S" icon.color="0xFF$(awk -F '0x21#0x1E' '/color0/{print $2}' ~/.Xresources)" background.color="0xFF$(awk -F '0x21#0x1E' '/color2/{print $2}' ~/.Xresources)"


      # Navigate Windows
      default < ctrl - k : yabai -m window --focus north
      default < ctrl - j : yabai -m window --focus south
      default < ctrl - l : yabai -m window --focus east
      default < ctrl - h : yabai -m window --focus west

      # Swap windows
      default < shift + ctrl - k : yabai -m window --swap north 
      default < shift + ctrl - j : yabai -m window --swap south
      default < shift + ctrl - l : yabai -m window --swap east
      default < shift + ctrl - h : yabai -m window --swap west 

      # Spaces 1 - 9
      default < ctrl - 1 : yabai -m space --focus 1 
      default < ctrl - 2 : yabai -m space --focus 2 
      default < ctrl - 3 : yabai -m space --focus 3 
      default < ctrl - 4 : yabai -m space --focus 4 
      default < ctrl - 5 : yabai -m space --focus 5 
      default < ctrl - 6 : yabai -m space --focus 6 
      default < ctrl - 7 : yabai -m space --focus 7 
      default < ctrl - 8 : yabai -m space --focus 8 
      default < ctrl - 9 : yabai -m space --focus 9


      # fast focus desktop
      # cmd + alt - x : yabai -m space --focus recent
      #ctrl + alt - 1 : yabai -m space --focus 1

      # send window to desktop and follow focus
      # shift + cmd - z : yabai -m window --space next; yabai -m space --focus next
      #ctrl + cmd - 2 : yabai -m window --space  2; yabai -m space --focus 2
      #ctrl + alt - 2 : yabai -m space --focus 2 


      # float / unfloat window and center on screen
      alt - t : /opt/homebrew/bin/yabai -m window --toggle float; \
                /opt/homebrew/bin/yabai -m window --grid 4:4:1:1:2:2

    '';
  };
}