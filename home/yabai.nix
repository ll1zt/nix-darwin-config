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
      
    #  /opt/homebrew/bin/yabai -m config window_opacity_duration      2000.0   
      /opt/homebrew/bin/yabai -m config window_border                on
      /opt/homebrew/bin/yabai -m config window_border_width          6
      /opt/homebrew/bin/yabai -m config active_window_border_color   0xff775759
      /opt/homebrew/bin/yabai -m config normal_window_border_color   0xff555555
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
      :: default : /opt/homebrew/bin/yabai -m config active_window_border_color 0xffDF9A96
      :: window  : /opt/homebrew/bin/yabai -m config active_window_border_color 0xffF3C992

      # Mode Shortcuts
      default < ctrl - 0xC0 ; window 
      window < ctrl - 0xC0 ; default
      # Navigate Windows
      default < ctrl - k : /opt/homebrew/bin/yabai -m window --focus north
      default < ctrl - j : /opt/homebrew/bin/yabai -m window --focus south
      default < ctrl - l : /opt/homebrew/bin/yabai -m window --focus east
      default < ctrl - h : /opt/homebrew/bin/yabai -m window --focus west

      # Swap windows
      default < shift + ctrl - k : /opt/homebrew/bin/yabai -m window --swap north 
      default < shift + ctrl - j : /opt/homebrew/bin/yabai -m window --swap south
      default < shift + ctrl - l : /opt/homebrew/bin/yabai -m window --swap east
      default < shift + ctrl - h : /opt/homebrew/bin/yabai -m window --swap west 

      # Spaces 1 - 9
      window < ctrl - 1 : /opt/homebrew/bin/yabai -m space --focus 1 
      window < ctrl - 2 : /opt/homebrew/bin/yabai -m space --focus 2 
      window < ctrl - 3 : /opt/homebrew/bin/yabai -m space --focus 3 
      window < ctrl - 4 : /opt/homebrew/bin/yabai -m space --focus 4 
      window < ctrl - 5 : /opt/homebrew/bin/yabai -m space --focus 5 
      window < ctrl - 6 : /opt/homebrew/bin/yabai -m space --focus 6 
      window < ctrl - 7 : /opt/homebrew/bin/yabai -m space --focus 7 
      window < ctrl - 8 : /opt/homebrew/bin/yabai -m space --focus 8 
      window < ctrl - 9 : /opt/homebrew/bin/yabai -m space --focus 9

      # float / unfloat window and center on screen
      default < alt - t : /opt/homebrew/bin/yabai -m window --toggle float; \
                /opt/homebrew/bin/yabai -m window --grid 4:4:1:1:2:2

    '';
  };
}