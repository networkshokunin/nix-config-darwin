{ ... }:
let
  mkGreedy = caskName: { name = caskName; greedy = true; };
in
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
      Raindrop_Safari_Extension = 1549370672;
      Wireguard = 1451685025;
      SinkItForReddit = 6449873635;
      UnTrap = 1637438059;
      SocialFocus = 1661093205;
      StoptheMadness = 6471380298;
      SuperAgent = 1568262835;
      AccerlerateForSafari = 1459809092;
    };

    taps = [ "8ta4/plist" ];

    brews = [
      #"wget"
      #"curl" # do not install curl via nixpkgs, it's not working well on macOS!
      #"aria2"
      #"git-trim"
      "8ta4/plist/plist" #https://github.com/8ta4/plist
    ];

    #https://github.com/nix-darwin/nix-darwin/issues/935#issuecomment-2096813988
    casks =  map mkGreedy [
      "alfred"
      "visual-studio-code"
      "1password"
      "1password-cli"
      "signal"
      "setapp"
      #"thingsmacsandboxhelper"
      "keyboardcleantool"
      "appcleaner"
      "karabiner-elements"
      "obsidian"
      "cleanclip"
      #"ledger-live"
      "raindropio"
      #"elgato-stream-deck"
      "keyboard-maestro"
      "rectangle-pro"
      "ghostty"
      "jump-desktop-connect"
    ];
    
  };
}
