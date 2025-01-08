{ ... }:
{
  home.file.".aerospace.toml" = {
    source = ./config.toml;
    onChange = ''
      /etc/profiles/per-user/david/bin/aerospace reload-config
    '';
  };
}
