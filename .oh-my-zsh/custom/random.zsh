rnd-string () {
  date +%s | sha256sum | base64 | head -c 32 ; echo
}

rnd-string-64 () {
  date +%s | sha256sum | base64 | head -c 64 ; echo
}
