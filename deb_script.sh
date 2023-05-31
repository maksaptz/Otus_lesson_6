#!/bin/bash

touch /etc/apt/sources.list.d/supersh.list
echo 'deb [trusted=yes] http://93.88.74.208:55557 stable free' > /etc/apt/sources.list.d/supersh.list
apt update
apt install supersh
