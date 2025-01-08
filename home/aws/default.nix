{...}: 
{
  home.file.aws_config = {
    source = ./aws_config.txt;
    target = ".aws/credentials";
  };
}