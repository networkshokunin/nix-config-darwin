{
  config,
  pkgs,
  ...
}: {
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  environment.systemPackages = with pkgs; [
    # utils

    # misc
    pyenv
  ];
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  # TODO To make this work, homebrew need to be installed manually, see https://brew.sh
  #
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };

    # Applications to install from Mac App Store using mas.
    # You need to install all these Apps manually first so that your apple account have records for them.
    # otherwise Apple Store will refuse to install them.
    # For details, see https://github.com/mas-cli/mas
    masApps = {
      # TODO Feel free to add your favorite apps here.

      Whatsapp = 310633997;
      PurePaste = 1611378436;
      OnepasswordSafari = 1569813296;
      Dato = 1470584107;
      Things3 = 904280696;
      Raindrop = 1549370672;
      Wireguard = 1451685025;
      WirelessSGx = 1449928544;
      CommandX = 6448461551;
    };

    taps = [
      "homebrew/cask-fonts"
      #"homebrew/services"
      #"homebrew/cask-versions"
      "koekeishiya/formulae" # yabai
    ];

    # `brew install`
    brews = [
      "curl" # do not install curl via nixpkgs, it's not working well on macOS!
      "goenv"
      "php"
      #"mackup"
      #"yabai"
    ];

    # `brew install --cask`
    # TODO Feel free to add your favorite apps here.
    casks = [
      "rectangle"
      "visual-studio-code"
      "1password"
      "1password-cli"
      "alfred"
      "signal"
      "setapp"
      #"soundsource"
      "beyond-compare"
      "showmeyourhotkeys"
      "thingsmacsandboxhelper"
      "keyboardcleantool"
      "appcleaner"
      "karabiner-elements"
      "obsidian"
      "firefox"
      "cleanclip"
      "openinterminal"
      "ledger-live"
      "topnotch"
      "raindropio"
      "elgato-stream-deck"
    ];
  };
}
