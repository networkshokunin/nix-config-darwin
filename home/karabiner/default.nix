{...}: 
{
  home.file.karabiner = {
    source = ./karabiner.json;
    target = ".config/karabiner/karabiner.json";
    onChange = ''
      /bin/launchctl stop org.pqrs.karabiner.karabiner_console_user_server
      /bin/launchctl start org.pqrs.karabiner.karabiner_console_user_server
    '';
  };
}
