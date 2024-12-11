{ ... }:
{
  home.file.".aerospace.toml" = {
    source = ./config.toml;
    onChange = ''
      /opt/homebrew/bin/aerospace reload-config
    '';
  };
}
