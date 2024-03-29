function load_nvm --on-variable="PWD"
  set -l default_node_version (nvm version default)
  set -l node_version (nvm version)
  set -l nvmrc_path (nvm_find_nvmrc)

  if test -n "$nvmrc_path"
    set -l required_node_version (cat $nvmrc_path)
    set -l nvmrc_node_version (nvm version $required_node_version)

    if test "$nvmrc_node_version" = "N/A"
      echo "Node version $required_node_version (from $nvmrc_path) not installed"
    else if test "$nvmrc_node_version" != "$node_version"
      nvm use $nvmrc_node_version
    end

  else if test "$node_version" != "$default_node_version"
    nvm use default > /dev/null
  end
end
