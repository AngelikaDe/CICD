# !bin/bash

REMOTE_HOST="000.000.00.0"

scp -r cat/ angelika@$REMOTE_HOST:/usr/local/bin
scp -r grep/ angelika@$REMOTE_HOST:/usr/local/bin

