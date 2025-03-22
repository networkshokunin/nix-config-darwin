{ pkgs, ... }:
let
  #fix https://github.com/nix-community/home-manager/issues/6295#issuecomment-2597644501
  ghostty-mock = pkgs.writeShellScriptBin "ghostty-mock" ''
    true
    '';
in 
{
  programs.ghostty = {
    enable = true;
    package = ghostty-mock; # Set explicitly to null, as it is managed externally
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      scrollback-limit = 100000000;
      macos-option-as-alt = true;
      font-family = "JetBrainsMonoNL Nerd Font Mono";
      font-size = 18;
      window-save-state = "always";
      theme = "catppuccin-mocha";
      };
  };
}