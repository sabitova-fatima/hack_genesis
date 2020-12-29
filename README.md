# HACK GENESIS

Хакактон от Абслют банка. Задача: Собрать данные о гос. закупках и их исполнителях с сайта https://zakupki.gov.ru, положить их в реляционную базу данных (предпочтительно в PostgreSQL) и реализовать возможность удобно выгружать данные по требуемым срезам.

## Фронтенд
Мы собрали базовый сайт на HTML и CSS и загрузили его на платформу Wordpress

## Базы данных
MySQL 
Прототип базы данных:

## Сервер
Для веб-сервера мы использовали `LEMP` стэк.<br/>
Для сборки докер образа запустите команду:
```bash
./build.sh
```
или
```bash
bash build.sh
```
Для запуска контейнера:
```bash
./run.sh
```
Таким образом `Dockerfile` соберет наш образ, установит необходимые сервисы и сконфигурирует их, создаст базу данных `absolut_db` и запустит все наши сервисы.<br/>
Теперь вы можете иметь доступ к сайту на `localhost`, а также к сервису `phpMyAdmin`.<br/>
Имя пользователя: `absolut_user`<br/>
Пароль: `123qwe`
