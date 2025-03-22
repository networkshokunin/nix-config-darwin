{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # archives
    zip
    unzip

    # utils
    bat
    fx
    
    # misc
    age
    which
    tree
    gnused
    gnutar
    gawk
    gnupg 
    go
    pyenv
    eza
    zsh-fzf-tab
    php
    autojump
    e2fsprogs
    sops
    nix-inspect
    nixfmt-rfc-style
    nixd
    arc-browser
    qpdf
    awscli2
    xz
  ];

  
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      completionInit = "autoload -U compinit && compinit\nsource ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh";
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      initExtra = ''
        #homebrew
        eval "$(/opt/homebrew/bin/brew shellenv)"

        #pyenv
        export PYENV_ROOT="$HOME/.pyenv"
        [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init -)"

        #autojump
        .  ${pkgs.autojump}/share/autojump/autojump.zsh

        j () {
          cd "$(cat /Users/david/Library/autojump/autojump.txt | cut -f2 | sed 's|^/Users/david|~|' | fzf | sed 's|^~|/Users/david|')"
        }

        bindkey "^[[1;4D" backward-word
        bindkey "^[[1;4C" forward-word
        bindkey "^[[1;4A" backward-kill-word
        #show key codes - OSX = use "cat -vte", Linux = "sudo showkey -a"
      '';
      shellAliases = {
        yoink = "open -a Yoink";
      };
    };

    # modern vim
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
      viAlias = true;
    };

    # A modern replacement for ‘ls’
    # useful in bash/zsh prompt, not in nushell.
    eza = {
      enable = true;
      enableZshIntegration = false;
      git = true;
      icons = "auto";
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
