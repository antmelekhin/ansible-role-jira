Jira
====

An Ansible role to install, configure and update [Jira](https://www.atlassian.com/ru/software/jira).

Requirements
------------

- Supported version of Ansible: 2.9 and highter.
- Supported platforms:
  - Debian
    - 10
    - 11
    - 12
  - RHEL
    - 7
    - 8
    - 9
  - Ubuntu
    - 18.04
    - 20.04
    - 22.04

Role Variables
--------------

- `jira_product` Jira product. Available values are: `software` (default), `core`.
- `jira_version` The version of Jira to download (default: `9.12.11`).
- `jira_archive_name` Jira archive name (default: `atlassian-jira-software-9.12.11.tar.gz`).
- `jira_download_url` URL to download the Jira archive (default: `https://www.atlassian.com/software/jira/downloads/binary`).
- `jira_checksum_url` The Jira checksum file URL (default: `{{ jira_download_url }}/{{ jira_archive_name }}.sha256`).
- `jira_download_path` Local path to download and extract the archive (default: `/tmp`).
- `jira_user` and `jira_group` System user and group that will be created (default: `jira`).
- `jira_root_path` The Jira installation directory (default: `/opt/atlassian/jira`).
- `jira_home_path` The Jira home directory (default: `/var/atlassian/application-data/jira`).
- `jira_min_nofiles_limit` If the limit of files that Jira can open is too low, it will be set to this value (default: `16384`).
- `jira_jvm_support_recommends_args` Occasionally Atlassian Support may recommend that you set some specific JVM arguments (default: `null`).
- `jira_jvm_gc_args` You can use variable below to modify garbage collector settings (default: `-XX:+ExplicitGCInvokesConcurrent`).
- `jira_jvm_minimum_memory` and `jira_jvm_maximum_memory` The minimum and maximum size of the heap (default: `384m` and `2048m`).
- `jira_jvm_initial_code_cache_size` and `jira_jvm_reserved_code_cache_size` The size of JVM code cache (default: `32m` and `512m`). A high value of reserved size allows Jira to work with more installed apps.
- `jira_jvm_required_args` The following are the required arguments for Jira.
- `jira_db_configuration` DB connection configuration (default: `false`).
- `jira_db_address` Hostname or IP address of your database server.
- `jira_db_port` TCP port number for your database server.
- `jira_db_name` DB name.
- `jira_db_username` and `jira_db_password` Database username and password to be passed to the JDBC driver.
- `jira_catalina_connector_proxyname` Fqdn server name. If you don't use a reverse proxy, then you'll need to leave this variable without value.
- `jira_catalina_connector_scheme` Connection scheme. Available values are: `http` (default), `https`.

    **Attention** If you use `https` value, you'll need to install SSL sertificate on server with reverse proxy.

- `jira_catalina_connector_proxyport` Server port (default: `80` or `443`).
  - `80` sets automatically if value in `jira_catalina_connector_scheme` is `http`.
  - `443` sets automatically if value in `jira_catalina_connector_scheme` is `https`.

Dependencies
------------

This role doesn't install a `Java` package, a reverse proxy (`Apache` or `Nginx`), or a database management system. You will need to install these packages before using the role.

Example Playbook
----------------

Install Jira with dependencies (`Java` and `PostgreSQL`):

Install dependencies:

```bash
ansible-galaxy install -r requirements.yml
```

Run playbook:

```yaml
---
- name: Setup Jira
  hosts: jira
  vars:
    db_name: 'jira'
    db_username: 'jira'
    db_password: 'P@ssw0rd!'

roles:
  - role: antmelekhin.java
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
    jira_db_host: 127.0.0.1
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
