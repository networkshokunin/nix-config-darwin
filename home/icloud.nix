{ config, ... }:
{
  home.file."icloud".source = config.lib.file.mkOutOfStoreSymlink"/Users/david/Library/Mobile Documents/com~apple~CloudDocs";
}
