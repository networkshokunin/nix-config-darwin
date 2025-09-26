{ ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "1" = {
        host = "*.snicker5.com";
        extraOptions = {
          "IdentityAgent" = "'~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock'";
        };
        serverAliveInterval = 5;
        forwardAgent = true;
      };
      "*" = {
        host = "*";
        extraOptions = {
          "IdentityAgent" = "'~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock'";
        };
        serverAliveInterval = 15;
      };
    };
  };
}
