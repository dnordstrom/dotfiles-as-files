# Insert last command with sudo (without running it)
function pls 
  commandline -i "sudo $history[1]";history delete --exact --case-sensitive pls
end
