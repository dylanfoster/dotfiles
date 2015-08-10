function fish_prompt
  eval $HOME/powerline-shell.py $status --shell bare ^/dev/null
  echo \n▶︎  " "
end
