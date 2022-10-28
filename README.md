Jira
====

Ansible роль для установки, настройки и обновления [Jira](https://www.atlassian.com/ru/software/jira).

Требования
----------

- Поддерживаемая версия Ansible: 2.7 и выше.
- Список поддерживаемых платформ описан в файле метаданных роли.

Используемые переменные
-----------------------

- `jira_product` Продукт Jira.

  Доступные значения:
  - `software` (default)
  - `core`

- `jira_version` Версия Jira для установки (default: `8.20.2`).
- `jira_download_url` Ссылка на скачивание архива с приложением.
- `jira_username` Unix имя пользователя (default: `jira`).
- `jira_group` Unix группа пользователя (default: `jira`).
- `jira_root_path` Каталог, в который будет распакован архив и установлено приложение (default: `/opt/atlassian/jira`).
- `jira_home_path` Домашний каталог Jira (default: `/var/atlassian/application-data/jira`).
- `jira_jvm_minimum_memory` Минимальный объем памяти, используемый JVM (default: `384m`).
- `jira_jvm_maximum_memory` Максимальный объем памяти, используемый JVM (default: `2048m`).
- `jira_db_configuration` Настройка подключения к БД (default: `false`).
- `jira_db_address` IP адрес или DNS имя сервера БД.
- `jira_db_port` Порт БД.
- `jira_db_name` Имя БД.
- `jira_db_username` Имя пользователя БД.
- `jira_db_password` Пароль пользователя БД.
- `jira_catalina_connector_proxyname` Fqdn имя сервера. Если обратный прокси не используется, то нужно эту переменную оставить без значения.
- `jira_catalina_connector_scheme` Протокол.

  Доступные значения:
  - `http` (default)
  - `https`

    **Внимание** При использовании `https` протокола нужно установить SSL сертификат на сервере с обратным прокси.

- `jira_catalina_connector_proxyport` Порт сервера (default: `80` или `443`).
  - `80` при установке переменной `jira_catalina_connector_scheme` в значение `http`.
  - `443` при установке переменной `jira_catalina_connector_scheme` в значение `https`.

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
        jira_db_configuration: true
        jira_db_address: 127.0.0.1
        jira_db_port: 5432
        jira_db_name: '{{ db_name }}'
        jira_db_username: '{{ db_username }}'
        jira_db_password: '{{ db_password }}'
    ```

Лицензия
--------

MIT

Информация об авторе
--------------------

Мелехин Антон.
