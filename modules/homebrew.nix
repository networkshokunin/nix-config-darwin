{ ... }:
{

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    masApps = {
      Whatsapp = 310633997;
      OnepasswordSafari = 1569813296;
      Dato = 1470584107;
      Things3 = 904280696;
      #Raindrop = 1549370672;
      Wireguard = 1451685025;
      WirelessSGx = 1449928544;
      SinkItForReddit = 6449873635;
      UnTrap = 1637438059;
      SocialFocus = 1661093205;
      StoptheMadness = 6471380298;
    };

    #taps = [ "nikitabobko/tap" ];

    brews = [
      #"wget"
      #"curl" # do not install curl via nixpkgs, it's not working well on macOS!
      #"aria2"
      #"git-trim"
      #"8ta4/plist/plist"
    ];

    casks = [
      "visual-studio-code"
      "1password"
      "1password-cli"
      "alfred"
      "signal"
      "setapp"
      #"beyond-compare"
      #"showmeyourhotkeys"
      "thingsmacsandboxhelper"
      "keyboardcleantool"
      #"appcleaner"
      #"karabiner-elements"
      "obsidian"
      #"arc"
      "cleanclip"
      #"ledger-live"
      #"topnotch"
      "raindropio"
      #"elgato-stream-deck"
      #"nikitabobko/tap/aerospace"
    ];
  };
}
