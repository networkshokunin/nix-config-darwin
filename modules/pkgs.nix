{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
  ];

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
