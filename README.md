Jira
====

An Ansible role for install, configure and update [Jira](https://www.atlassian.com/ru/software/jira).

Requirements
------------

- Supported version of Ansible: 2.9 and highter.
- Supported platforms:
  - Debian
    - 10
    - 11
  - RHEL
    - 7
    - 8
  - Ubuntu
    - 18.04
    - 20.04

Role Variables
--------------

- `jira_product` Jira product.

  Available values:
  - `software` (default)
  - `core`

- `jira_version` The specific version of Jira to download (default: `9.12.0`).
- `jira_archive_name` Jira archive name (default: `atlassian-jira-software-9.12.0.tar.gz`).
- `jira_download_url` URL to download an archive with Jira (default: `https://www.atlassian.com/software/jira/downloads/binary`).
- `jira_username` and `jira_group` Unix username and group (default: `jira`).
- `jira_root_path` Path to Jira installation directory (default: `/opt/atlassian/jira`).
- `jira_home_path` Path to Jira home directory (default: `/var/atlassian/application-data/jira`).
- `jira_jvm_minimum_memory` and `jira_jvm_maximum_memory` The minimum and maximum size of the heap (default: `384m` and `2048m`).
- `jira_db_configuration` DB connection configuration (default: `false`).
- `jira_db_address` IP address or DNS name of DB server.
- `jira_db_port` DB port.
- `jira_db_name` DB name.
- `jira_db_username` DB username.
- `jira_db_password` DB password.
- `jira_catalina_connector_proxyname` Fqdn server name. If you don't use a reverse proxy, then you'll need to leave this variable without value.
- `jira_catalina_connector_scheme` Connection scheme.

  Available values:
  - `http` (default)
  - `https`

    **Attention** If you use `https` value, you'll need to install SSL sertificate on server with reverse proxy.

- `jira_catalina_connector_proxyport` Server port (default: `80` or `443`).
  - `80` sets automatically if value in `jira_catalina_connector_scheme` is `http`.
  - `443` sets automatically if value in `jira_catalina_connector_scheme` is `https`.

Dependencies
------------

This role doesn't install `java`, reverse proxy (`apache` or `nginx`) and DB management system. You'll need to install packages before using.

Example Playbook
----------------

- Install `Jira` with dependencies (`Java` and `PostgreSQL`):

  - Install dependencies:

    ```bash
    ansible-galaxy install -r requirements.yml
    ```

  - Run playbook:

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
      - role: antmelekhin.jira
        jira_db_configuration: true
        jira_db_address: 127.0.0.1
        jira_db_port: 5432
        jira_db_name: '{{ db_name }}'
        jira_db_username: '{{ db_username }}'
        jira_db_password: '{{ db_password }}'
    ```

License
-------

MIT

Author Information
------------------

Melekhin Anton.
