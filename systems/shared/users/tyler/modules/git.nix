{ ... }: {
  programs.git = {
    enable = true;
    userName = "Tyler Compton";
    userEmail = "xaviosx@gmail.com";
    lfs.enable = true;
  };
}
