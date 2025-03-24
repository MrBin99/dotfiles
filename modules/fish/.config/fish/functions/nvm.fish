function nvm
  if type bass &> /dev/null
    bass source $HOME/.nvm/nvm.sh --no-use ';' nvm $argv
  end
end
