#  Управление пакетами. Дистрибьюция софта 
## Цель домашнего задания:
Научиться самостоятельно собирать пакет из исходников и публиковать его в собственном репозитории. 

В работе использовался vagrant box: "generic/debian10" version "4.2.16"

Использовалась дополнительная информация со следующих электронных ресурсов:

https://habr.com/ru/articles/78094/

https://interface31.ru/tech_it/2020/03/sozdaem-sobstvennyy-repozitoriy-dlya-1spredpriyatie-v-srede-linux.html

Описание домашнего задания:

1) Создать свой DEB пакет;
2) Создать свой репозиторий и разместиь там ранее собранный DEB-пакет.

### Создать свой DEB пакет

 Для создания пакета будем использовать стандартную утилиту dpkg-deb.
 Установим необходимы пакеты:
 
 `sudo apt-get install dpkg debconf debhelper lintian `
 
 Создаем директории для будущего пакета:
 `mkdir ~/supersh`
 
 `mkdir -p ~/supersh/DEBIAN` # управляющая папка
 
 `mkdir -p ~/supersh/usr/bin` # путь к скрипту
 
 `cp super.sh ~/supersh/usr/bin/` # копируем наш скрипт в нужное место
 
 В наше примере реально используется только обязательный файл DEBIAN/control.

`Package: supersh` <br/>
`Version: 1.0-1` <br/>
`Section: misc`  <br/>
`Architecture: all`  <br/>
`Depends: bash`  <br/>
`Maintainer: test testov`  <br/>
`Description: Super Shell Script`  <br/>
