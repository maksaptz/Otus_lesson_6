#  Управление пакетами. Дистрибьюция софта 
## Цель домашнего задания:
Научиться самостоятельно собирать пакет из исходников и публиковать его в собственном репозитории. 

В работе использовался vagrant box: "generic/debian10" version "4.2.16"

Использовалась дополнительная информация со следующих электронных ресурсов:

https://habr.com/ru/articles/78094/<br/>
https://interface31.ru/tech_it/2020/03/sozdaem-sobstvennyy-repozitoriy-dlya-1spredpriyatie-v-srede-linux.html

Описание домашнего задания:

1) Создать свой DEB пакет;
2) Создать свой репозиторий и разместиь там ранее собранный DEB-пакет.

### Создать свой DEB пакет

 Для создания пакета будем использовать стандартную утилиту dpkg-deb.
 Установим необходимы пакеты:
 
 `sudo apt-get install -y dpkg debconf debhelper fakeroot`
 
 Создаем директории для будущего пакета:  <br/>
 `mkdir ~/supersh` <br/>
 `mkdir -p ~/supersh/DEBIAN` # управляющая папка  <br/>
 `mkdir -p ~/supersh/usr/bin` # путь к скрипту   <br/>
 `cp super.sh ~/supersh/usr/bin/` # копируем наш скрипт в нужное место   <br/>
 
 В нашем примере реально используется только обязательный файл DEBIAN/control:

`Package: supersh` <br/>
`Version: 1.0-1` <br/>
`Section: misc`  <br/>
`Architecture: all`  <br/>
`Maintainer: Test <testov.ru>`  <br/>
`Description: Super Shell Script`  <br/>

Впринципе этого уже достаточно для сборки минимального пакета: <br/>
`fakeroot dpkg-deb --build supersh` <br/>
Переименовываем файл в соответсвии со стандартами:<br/>
`mv supersh.deb supersh_1.0-1_all.deb`<br/>

Пакет готов теперь необходимо его разместить.

### Создать свой репозиторий и разместить там ранее собранный DEB-пакет
Для размещения пакета был настроен рабочий веб-сервер на базе Apache. <br/>
Репозиторий был создан с помощью утилиты aptly <br/>
`apt install aptly`

Создаем конфиг /etc/aptly.conf

```
{
  "rootDir": "/opt/aptly",
  "downloadConcurrency": 4,
  "downloadSpeedLimit": 0,
  "architectures": [],
  "dependencyFollowSuggests": false,
  "dependencyFollowRecommends": false,
  "dependencyFollowAllVariants": false,
  "dependencyFollowSource": false,
  "dependencyVerboseResolve": false,
  "gpgDisableSign": false,
  "gpgDisableVerify": false,
  "gpgProvider": "gpg",
  "downloadSourcePackages": false,
  "skipLegacyPool": true,
  "ppaDistributorID": "ubuntu",
  "ppaCodename": "",
  "skipContentsPublishing": false,
  "FileSystemPublishEndpoints": {},
  "S3PublishEndpoints": {},
  "SwiftPublishEndpoints": {}
}
```

Для создания репозитория выполним: <br/>
`aptly repo create --comment="supersh" --distribution="stable" --architectures="i386,amd64" --component="free" stable` <br/>
Добавим наш пакет в репозиторий: <br/>
`aptly repo add stable ~/supersh_1.0-1_all.deb`  <br/>
Опубликуем наш репозиторий:  <br/>
`aptly publish repo -skip-signing stable`

#### Проверка домашнего задания
Для проверки задания требуется запустить Vagrantfile и ввести следующую команду: <br/>
`sudo super.sh`

#### deb_script.sh содержит комментарии с описанием выполняемых команд!
