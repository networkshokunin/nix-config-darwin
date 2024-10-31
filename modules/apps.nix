{
  config,
  pkgs,
  ...
}: {
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  environment.systemPackages = with pkgs; [
    # utils
    mkalias
    # misc
    pyenv
  ];

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
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
      SinkItForReddit = 6449873635;
    };

    taps = [
    ];

    # `brew install`
    brews = [
      "wget" 
      "curl" # do not install curl via nixpkgs, it's not working well on macOS!
      "php"
      "aria2"
      "gnu-sed"
      "gnu-tar"
      "git-trim"
    ];

    # `brew install --cask`
    # TODO Feel free to add your favorite apps here.
    casks = [
      "visual-studio-code"
      "1password"
      "1password-cli"
      "alfred"
      "signal"
      "setapp"
      "beyond-compare"
      "showmeyourhotkeys"
      "thingsmacsandboxhelper"
      "keyboardcleantool"
      "appcleaner"
      "karabiner-elements"
      "obsidian"
      "arc"
      "cleanclip"
      "openinterminal"
      "ledger-live"
      "topnotch"
      "raindropio"
      "elgato-stream-deck"
    ];
  };
}
