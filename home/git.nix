{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user ={
        name = "David Lim";
        email = "david@networkshokunin.com";
      };
      init.defaultBranch = "master";
      user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ7X82I2M5GWwCnXugSceeFn4sSUexcoth4aRkZLyzkz";
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      push.autoSetupRemote = true;
      #diff.tool = "bc";
      #merge.tool = "bc";
      alias = {
        #ff = "merge --ff-only";
        #pushall = "!git remote | xargs -L1 git push --all";
        graph = "log --decorate --oneline --graph";
        #add-nowhitespace = "!git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero -";
        #fast-forward = "merge --ff-only";
      };
    };
    ignores = [ ".direnv" ];
  };
}
