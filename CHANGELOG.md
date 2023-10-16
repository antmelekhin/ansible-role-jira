# Changelog

## [1.0.3](https://github.com/antmelekhin/ansible-role-jira/compare/v1.0.2...v1.0.3) (2023-10-16)


### Continuous Integration

* add release type improv ([4b14118](https://github.com/antmelekhin/ansible-role-jira/commit/4b14118a2498f0361676b9966238a63c95217fcb))
* add script and workflow for update version ([#5](https://github.com/antmelekhin/ansible-role-jira/issues/5)) ([02925b6](https://github.com/antmelekhin/ansible-role-jira/commit/02925b67a82976acbc1571bfff15b0af19badb6d))


### Fixes

* **version:** jira updated to `9.4.11` release ([#6](https://github.com/antmelekhin/ansible-role-jira/issues/6)) ([8e66936](https://github.com/antmelekhin/ansible-role-jira/commit/8e66936eb91475c0ca371b659f9fd132e8aa9406))


### Styles

* add quotes in notify name ([e087fc7](https://github.com/antmelekhin/ansible-role-jira/commit/e087fc7bd60ebe47defaf7b14050c40dff6d142f))
* fix jinja2 statement ([a119496](https://github.com/antmelekhin/ansible-role-jira/commit/a119496d75964a436a9cf19a0f7f34d6af432929))


### Tests

* add `tzdata-java` package ([4b66cd1](https://github.com/antmelekhin/ansible-role-jira/commit/4b66cd1eea1809a9394d8dcde721b41ae6305623))

## [1.0.2](https://github.com/antmelekhin/ansible-role-jira/compare/v1.0.1...v1.0.2) (2023-06-20)


### Fixes

* move db configuration task from db.yml to configure.yml ([1b18d34](https://github.com/antmelekhin/ansible-role-jira/commit/1b18d34f1eeeab1daefa96c13bd2f91652ea2796))

## [1.0.1](https://github.com/antmelekhin/ansible-role-jira/compare/v1.0.0...v1.0.1) (2023-06-19)


### Continuous Integration

* add `publish` and `release` workflows ([934eae4](https://github.com/antmelekhin/ansible-role-jira/commit/934eae4498c999b2b0eb77502eb0af7c8e820440))


### Documentation

* update README and meta ([66a2c6c](https://github.com/antmelekhin/ansible-role-jira/commit/66a2c6c1ccbf0c80d67cf6762245cc6b38a50f1d))


### Fixes

* mv `daemon_reload` from tasks to handlers and reordering key names ([1f12611](https://github.com/antmelekhin/ansible-role-jira/commit/1f12611b6e35d4b4582792df9d733d43ecfc3e59))


### Tests

* fix linting rules ([9b652f2](https://github.com/antmelekhin/ansible-role-jira/commit/9b652f2e1d3fd027ffed84ddb3869f9c0307a27a))
* use my docker containers in molecule ([388122f](https://github.com/antmelekhin/ansible-role-jira/commit/388122f35b021b9025063c7de073e78e0a32769b))
