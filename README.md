### Hexlet tests and linter status:
[![Actions Status](https://github.com/AllegroGH/devops-for-programmers-project-76/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/AllegroGH/devops-for-programmers-project-76/actions)

### :small_blue_diamond: Краткое описание
Автоматизированное развертывание Docker-контейнера Redmine на кластере виртуальных машин в Yandex Cloud с использованием Ansible. Для мониторинга состояния серверов с приложением используется агент DataDog.

**Ключевые компоненты:**
- 2 виртуальные машины Compute Cloud (Ubuntu 22.04 LTS)
- Балансировщик Application Load Balancer
- Кластер Managed Service for PostgreSQL

### :small_blue_diamond: Установка и настройка
#### 1. Клонирование репозитория
```bash
git clone git@github.com:AllegroGH/devops-for-programmers-project-76.git
cd devops-for-programmers-project-76
```
#### 2. Установка зависимостей
```bash
sudo apt update

# Основные пакеты
sudo apt install -y ansible python3-pip

# Python-зависимости
pip3 install docker ansible-vault

# Ansible-зависимости
make install-deps
```
#### 3. Настройка конфигурации
- Скопируйте шаблон инвентаря:
   ```bash
   cp inventory.ini.template inventory.ini
   ```
- Заполните `inventory.ini` реальными данными (IPs, usernames, paths to keys)</br>

- Создайте зашифрованный файл `secrets.yml` и заполните его реальными данными</br>
(используйте переменные из шаблона `group_vars/webservers/secrets.yml.template`):
  ```bash
  ansible-vault create group_vars/webservers/secrets.yml
  ```
- Использованный пароль запишите в файл `.vault-password`:
  ```bash
  echo "your_vault_password" >> .vault-password
  ```
- :information_source: Для редактированя `secrets.yml` можно использовать короткую команду:
  ```bash
  make edit-secret
  ```

### :small_blue_diamond: Деплой
- Одной общей командой:
```bash
make deploy
```
- Отдельными командами:
```bash
# Установка зависимостей на ВМ
make prepare

# Развертывание Docker-контейнера Redmine на ВМ
make redmine

# Установка агента DataDog и настройка HTTP Check
make datadog
```
#### :link: [Ссылка](https://allegrohub.ru) на задеплоенное приложение
