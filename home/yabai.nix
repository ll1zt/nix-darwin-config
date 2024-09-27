{ config, pkgs, lib, ... }: {
  home.file.yabai = {
    executable = true;
    target = ".config/yabai/yabairc";
    text = ''
      #!/usr/bin/env sh

      # load scripting addition
      /opt/homebrew/bin/yabai -m signal --add event=dock_did_restart action="sudo /opt/homebrew/bin/yabai --load-sa"
      sudo /opt/homebrew/bin/yabai --load-sa
                  
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
      /opt/homebrew/bin/yabai -m config window_border_width          10
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
}