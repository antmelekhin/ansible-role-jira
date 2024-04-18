# Changelog

## [1.1.2](https://github.com/antmelekhin/ansible-role-jira/compare/v1.1.1...v1.1.2) (2024-04-18)


### Code Refactoring

* update variable names and quote strings ([#12](https://github.com/antmelekhin/ansible-role-jira/issues/12)) ([5d47b4e](https://github.com/antmelekhin/ansible-role-jira/commit/5d47b4efc95a1489e9374466b165de12fee09a28))


### Continuous Integration

* add semantic version validation ([e63933c](https://github.com/antmelekhin/ansible-role-jira/commit/e63933cbcd801b1915220adc1585155f6445c0f1))
* fix exit code ([4ab8950](https://github.com/antmelekhin/ansible-role-jira/commit/4ab895083e4a9ec19d07efd0c50f6786a0e5ed05))
* update `checkout` action version ([1ba3949](https://github.com/antmelekhin/ansible-role-jira/commit/1ba3949fe9c272d848c3a0b9b4e65a78e982f68b))
* update release rules ([e11d015](https://github.com/antmelekhin/ansible-role-jira/commit/e11d015e59d606367f3c05042e00495f586dc18f))
* update test matrix ([002c264](https://github.com/antmelekhin/ansible-role-jira/commit/002c26416da1b994f8a85aa1e74b10dc3b6d682a))
* update workflows ([ce45063](https://github.com/antmelekhin/ansible-role-jira/commit/ce450632d42965558b59e73e297ba363605d2d03))


### Documentation

* update supported os versions ([de210c6](https://github.com/antmelekhin/ansible-role-jira/commit/de210c6df6bc416e3634cb54630b9e1c027b6108))


### Styles

* add empty line after ansible comment ([f1eb8d4](https://github.com/antmelekhin/ansible-role-jira/commit/f1eb8d4475940684d628b5751bca5e3ed8b4f7e2))
* rename some task names and minor changes ([#10](https://github.com/antmelekhin/ansible-role-jira/issues/10)) ([3c8e744](https://github.com/antmelekhin/ansible-role-jira/commit/3c8e7443365bbe1596d2891f898d8fe4e7614357))


### Tests

* add tox ([f2a639a](https://github.com/antmelekhin/ansible-role-jira/commit/f2a639a857c5a989476f69c942b01e6b76033111))
* use my java ansible role ([3aad8ff](https://github.com/antmelekhin/ansible-role-jira/commit/3aad8ff7320a67212f8fe21f388a7e5e8ea7f4e6))

## [1.1.1](https://github.com/antmelekhin/ansible-role-jira/compare/v1.1.0...v1.1.1) (2023-12-06)


### Fixes

* **version:** jira updated to `9.12.0` release ([#8](https://github.com/antmelekhin/ansible-role-jira/issues/8)) ([f6eca56](https://github.com/antmelekhin/ansible-role-jira/commit/f6eca568b878a91c8ab1b3a73667da9c2062ecb9))

## [1.1.0](https://github.com/antmelekhin/ansible-role-jira/compare/v1.0.4...v1.1.0) (2023-12-06)


### Features

* add variables to `setenv.sh` to make it possible to change JVM arguments ([#9](https://github.com/antmelekhin/ansible-role-jira/issues/9)) ([d0434a5](https://github.com/antmelekhin/ansible-role-jira/commit/d0434a575622bb092c1cedbc80df314c0a00817e))

## [1.0.4](https://github.com/antmelekhin/ansible-role-jira/compare/v1.0.3...v1.0.4) (2023-11-14)


### Fixes

* **version:** jira updated to `9.4.12` release ([#7](https://github.com/antmelekhin/ansible-role-jira/issues/7)) ([fa95834](https://github.com/antmelekhin/ansible-role-jira/commit/fa9583404c25d2c7abfef26a446b73d76ad11fe3))

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
