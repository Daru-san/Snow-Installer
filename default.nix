{pkgs, ...}:{

  # System packages
  environment.systemPackages = with pkgs; [
    ranger
    btop
    neofetch
    firefox
    gparted
  ];
  programs.git.enable = true;

  # Enable opengl and sway
  programs.sway.enable = true;
  hardware.opengl.enable = true;

  # Shell stuff
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;
  };
  programs.tmux.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # Network manager, more useful than wpa util
  networking ={
    networkmanager.enable = true;
    wireless.enable = true;
  };

  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (subject.isInGroup("wheel")) {
        return polkit.Result.YES;
      }
    });
  '';

  # Terminal fonts
  console = {
    font = "${pkgs.terminus_font}/share/consolefonts/ter-120n.psf.gz";
    packages = with pkgs; [ terminus_font ];
    earlySetup = true;
    keyMap = "us";
  };

  # Polkit for sway
  security.polkit.enable = true;
}
