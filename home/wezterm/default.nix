{ pkgs, inputs, ... }:
{
  programs.wezterm = {
    #fixme: https://github.com/wez/wezterm/issues/5990
    package = inputs.wezterm.packages.${pkgs.system}.default; 
    enable = true;
    extraConfig = builtins.readFile ./config.lua;
  };
}
