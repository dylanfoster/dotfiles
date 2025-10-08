# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.

  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!


export PATH="/Applications/Fortify/Fortify_SCA_and_Apps_21.2.3/bin:$PATH"
