#!/bin/sh

touch /etc/apt/sources.list.d/supersh.list # создаем файл для добавления репозитория
echo 'deb [trusted=yes] http://93.88.74.208:55557 stable free' > /etc/apt/sources.list.d/supersh.list # добавляем репозиторий
apt update # обновляем репозиторий
apt install supersh # устанавливаем пакет с добавленного репозитория
