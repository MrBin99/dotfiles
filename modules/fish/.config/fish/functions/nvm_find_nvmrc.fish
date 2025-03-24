function nvm_find_nvmrc
  if type bass &> /dev/null
    bass source $NVM_ROOT/nvm.sh --no-use ';' nvm_find_nvmrc
  end
end
