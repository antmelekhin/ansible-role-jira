Jira
====

An Ansible role to install, configure and update [Jira](https://www.atlassian.com/ru/software/jira).

Upgrade to 2.x
--------------

In version 2.0.0, the `jira_root_path` variable was renamed to `jira_install_path`.

Requirements
------------

- Supported version of Ansible: 2.12 and highter.
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

All variables that can be overridden are stored in the [defaults/main.yml](https://github.com/antmelekhin/ansible-role-jira/blob/main/defaults/main.yml) file.
Please refer to the [meta/argument_specs.yml](https://github.com/antmelekhin/ansible-role-jira/blob/main/meta/argument_specs.yml) file for a description of the available variables.
Similarly, descriptions and defaults for preset variables can be found in the [vars/main.yml](https://github.com/antmelekhin/ansible-role-jira/blob/main/vars/main.yml) file.

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
