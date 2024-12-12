{ lib, ... }:
let
  user = "david";
in
{
  # import sub modules
  imports = [
    ./core.nix
    ./wezterm
    ./starship.nix
    #./aerospace
    ./karabiner
    ./git.nix
    ./openssh.nix
    ./nnn.nix
    ./direnv.nix
    #./spotlight.nix
    ./trampolines.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "${user}";
    homeDirectory = lib.mkForce "/Users/${user}";
    stateVersion = "24.11";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  manual.manpages.enable = false;
}
