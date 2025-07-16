{ pkgs, options, ... }: {
  users.defaultUserShell = pkgs.zsh;

  # Prevents the new user dialog from constantly appearing
  system.userActivationScripts.zshrc = "touch .zshrc";

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    # Fixes Ctrl+Left and Ctrl+Right
    promptInit = options.programs.zsh.promptInit.default + ''
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
      bindkey "^R" history-incremental-search-backward
      if [ -f "$HOME/secrets.sh" ]; then
        source "$HOME/secrets.sh"
      fi
      export PS1="%{$(tput setaf 226)%}%n%{$(tput setaf 220)%}@%{$(tput setaf 214)%}%m %{$(tput setaf 33)%}%1~ %{$(tput sgr0)%}$ "
    '';
  };
}

