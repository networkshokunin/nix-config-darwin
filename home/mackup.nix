{...}: {
  home.file.".mackup.cfg" = {
    enable = true;
    text = ''
      [storage]
      engine = icloud
      directory = backup/work/mackup

      [applications_to_sync]
      bartender
      beyond-compare
      cleanshot
      docker
      istat-menus
      rectangle
    '';
  };
}
