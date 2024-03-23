{...}: {
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "z" = {
        host = "*";
        extraOptions = {"IdentityAgent" = "'~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock'";};
        serverAliveInterval = 15;
      };
    };
  };
}
