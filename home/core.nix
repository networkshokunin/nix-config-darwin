{pkgs, ...}: {
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
    alejandra
    sops
  ];

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      completionInit = "autoload -U compinit && compinit\nsource ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh";
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      initExtra = ''
        #pyenv
        export PYENV_ROOT="$HOME/.pyenv"
        [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init -)"

        #autojump
        .  ${pkgs.autojump}/share/autojump/autojump.zsh

        j () {
          cd "$(cat /Users/david/Library/autojump/autojump.txt | cut -f2 | sed 's|^/Users/david|~|' | fzf | sed 's|^~|/Users/david|')"
        }

        bindkey "^[[1;7D" backward-word
        bindkey "^[[1;7C" forward-word
        bindkey "^[[1;7A" backward-kill-word
        #show key codes - OSX = use ctrl v, Linux = "sudo showkey -a"

        [ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
      '';
      shellAliases = {
        s = "kitten ssh";
        yoink= "open -a Yoink";
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
      icons = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
