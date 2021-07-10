# Uploads any file to transfer.sh.
# Credit: https://github.com/franciscolourenco/fish-upload
function transfer --description 'Upload any file to transfer.sh'
  # Write URL to temporary file because of progress bar
  set tmpfile (mktemp -t transfer.XXX)

  curl --progress-bar --upload-file $argv https://transfer.sh/(basename $argv | tr -d [:space:]) >> $tmpfile
  cat $tmpfile

  # Copy to clipboard if 'wl-copy' is available
  if type wl-copy > /dev/null
    wl-copy < $tmpfile
  end

  rm -f $tmpfile
end
