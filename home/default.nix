{lib, ...}: let
  user = "david";
in {
  # import sub modules
  imports = [
    ./core.nix
    ./starship.nix
    ./git.nix
    ./openssh.nix
    #./mackup.nix
    ./kitty.nix
    #./nnn.nix
    ./direnv.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "${user}";
    homeDirectory = lib.mkForce "/Users/${user}";
    stateVersion = "24.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  manual.manpages.enable = false;

  # Fully declarative dock using the latest from Nix Store
}
