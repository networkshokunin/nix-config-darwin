{lib, ...}: let
  user = "david";
in {
  # import sub modules
  imports = [
    ./core.nix
    ./starship.nix
    ./git.nix
    ./openssh.nix
    ./mackup.nix
    ./kitty.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "${user}";
    homeDirectory = lib.mkForce "/Users/${user}";
    stateVersion = "23.11";

    file.yabai = {
            executable = true;
            target = ".config/yabai/yabairc";
            text = ''
              #!/usr/bin/env sh
  
              # global settings
              yabai -m config                                 \
                  mouse_follows_focus          on            \
                  focus_follows_mouse          autofocus      \
                  window_origin_display        default        \
                  window_placement             second_child   \
                  window_zoom_persist          on             \
                  window_shadow                on             \
                  window_animation_duration    0.0            \
                  window_animation_frame_rate  120            \
                  window_opacity_duration      0.0            \
                  active_window_opacity        1.0            \
                  normal_window_opacity        0.90           \
                  window_opacity               off            \
                  insert_feedback_color        0xffd75f5f     \
                  split_ratio                  0.50           \
                  split_type                   auto           \
                  auto_balance                 off            \
                  top_padding                  5               \
                  bottom_padding               5               \
                  left_padding                 5               \
                  right_padding                5               \
                  window_gap                   06             \
                  layout                       bsp            \
                  mouse_action1                move           \
                  mouse_action2                resize         \
                  mouse_drop_action            swap
    
              # rules
              yabai -m rule --add app="^(Software Update|Dictionary|System Preferences|System Settings|Archive Utility|App Store|Alfred|Activity Monitor|1Password|Setapp|Things|Karabiner-Elements|SnippetsLab|Typing Mind|Messages|WhatsApp|Signal)$" manage=off
              yabai -m rule --add label="Finder" app="^Finder$" title="(Co(py|nnect)|Move|Info|Pref)" manage=off
              yabai -m rule --add label="Safari" app="^Safari$" title="^(General|(Tab|Password|Website|Extension)s|AutoFill|Se(arch|curity)|Privacy|Advance)$" manage=off
              yabai -m rule --add label="About This Mac" app="System Information" title="About This Mac" manage=off
        
              echo "yabai configuration loaded"
            '';
            };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  manual.manpages.enable = false;

  # Fully declarative dock using the latest from Nix Store
}
