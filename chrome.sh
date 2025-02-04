if [[ "$OSTYPE" == "msys" ]]; then
  start chrome \
  --user-data-dir="$(pwd)/.chrome_profile" \
  --host-resolver-rules="MAP * 127.0.0.1" \
  --ignore-certificate-errors-spki-list="$(cat ./ca/in/sha256_base64)"

else
  "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --user-data-dir="./.chrome_profile" \
  --host-resolver-rules="MAP * 127.0.0.1" \
  --ignore-certificate-errors-spki-list="$(cat ./ca/in/sha256_base64)"

fi
