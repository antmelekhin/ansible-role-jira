Jira
====

Ansible роль для установки и настройки Jira.

Требования
----------

- Поддерживаемая версия Ansible: 2.7 и выше.
- Список поддерживаемых платформ описан в файле метаданных роли.

Используемые переменные
-----------------------

- `jira__product` Продукт Jira.

  Доступные значения:
  - `software` (default)
  - `core`

- `jira__version` Версия Jira для установки (default: `8.13.0`).
- `jira__archive_url` Ссылка на скачивание архива с приложением.
- `jira__username` Unix имя пользователя (default: `jira`).
- `jira__group` Unix группа пользователя (default: `jira`).
- `jira__install_path` Каталог, в который будет установлено приложение (default: `/opt/atlassian/jira`).
- `jira__home_path` Домашний каталог Jira (default: `/var/atlassian/application-data/jira`).
- `jira__db_configuration` Настройка подключения к БД (default: `false`).
- `jira__db_address` IP адрес или DNS имя сервера БД.
- `jira__db_port` Порт БД.
- `jira__db_name` Имя БД.
- `jira__db_username` Имя пользователя БД.
- `jira__db_password` Пароль пользователя БД.
- `jira__catalina_connector_proxyname` Fqdn имя сервера. Если обратный прокси не используется, то нужно эту переменную оставить без значения.
- `jira__catalina_connector_scheme` Протокол.

  Доступные значения:
  - `http` (default)
  - `https`

    **Внимание** При использовании `https` протокола нужно установить SSL сертификат на сервере с обратным прокси.

- `jira__catalina_connector_proxyport` Порт сервера (default: `80` или `443`).
  - `80` при установке переменной `jira__catalina_connector_scheme` в значение `http`.
  - `443` при установке переменной `jira__catalina_connector_scheme` в значение `https`.

Зависимости
-----------

Роль не устанавливает `java`, обратный прокси (`apache` или `nginx`) и систему управления БД, вы должны установить пакеты самостоятельно перед запуском роли.

Пример использования
--------------------

- Устанавливаем `Jira` и настраиваем подключение к БД через веб-интерфейс:

  ```yaml
  ---

  - name: Setup Jira
    hosts: jira

    roles:
      - role: ansible-role-jira
  ```

- Устанавливаем `Jira` со всеми зависимостями на одном хосте (`Java` и `PostgreSQL`):

  - Устанавливаем зависимости:

    ```bash
    ansible-galaxy install -r requirements.yml
    ```

  - Запускаем playbook:

    ```yaml
    ---

    - name: Setup Jira
      hosts: jira
      vars:
        db_name: 'jira'
        db_username: 'jira'
        db_password: 'P@ssw0rd!'

    roles:
      - role: geerlingguy.java
      - role: geerlingguy.postgresql
        postgresql_users:
          - name: '{{ db_username }}'
            password: '{{ db_password }}'
        postgresql_databases:
          - name: '{{ db_name }}'
            lc_collate: 'en_US.UTF-8'
            lc_ctype: 'en_US.UTF-8'
            encoding: 'UTF-8'
            template: 'template0'
            owner: '{{ db_username }}'
      - role: ansible-role-jira
        jira__db_configuration: true
        jira__db_address: 127.0.0.1
        jira__db_port: 5432
        jira__db_name: '{{ db_name }}'
        jira__db_username: '{{ db_username }}'
        jira__db_password: '{{ db_password }}'
    ```

Лицензия
--------

MIT

Информация об авторе
--------------------

Мелехин Антон, ООО "ЖИЛИЩНАЯ ЭКОСИСТЕМА ВТБ".
