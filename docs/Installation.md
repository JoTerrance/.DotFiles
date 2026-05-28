# Instalación

Esta guía explica cómo instalar y configurar el entorno de desarrollo usando este repositorio de dotfiles.

## Requisitos previos

- **Sistema operativo**: Ubuntu 22.04 o 24.04 (o Debian compatible)
- **Acceso `sudo`**: necesario para instalar paquetes del sistema
- **Conexión a internet**: para descargar paquetes y herramientas
- **Git**: para clonar el repositorio

## Instalación completa (máquina local)

### 1. Clonar el repositorio

```bash
git clone https://github.com/JoTerrance/.DotFiles.git ~/.DotFiles
cd ~/.DotFiles
```

> Se recomienda clonar en `~/.DotFiles` ya que los symlinks están configurados para esa ruta.

### 2. Ejecutar el script de instalación

```bash
bash install.sh
```

El script `install.sh` realiza los siguientes pasos:

1. Actualiza los paquetes del sistema (`apt update`)
2. Instala las dependencias base: `curl`, `python3-pip`, `ansible`
3. Instala el gestor de paquetes **Nix**
4. Instala la colección `community.general` de Ansible Galaxy
5. Ejecuta el playbook de Ansible apropiado:
   - **En máquina local**: `ansible/localhost-deploy.yml` (pedirá la contraseña sudo)
   - **En GitHub Codespaces**: `ansible/minimal-deploy.yml` (sin contraseña)

### 3. Reiniciar la shell

Una vez completada la instalación, cierra y abre tu terminal, o ejecuta:

```bash
exec zsh
```

## Instalación manual paso a paso

Si prefieres instalar solo partes del entorno, puedes ejecutar playbooks de Ansible individualmente.

### Instalar solo dependencias base

```bash
sudo apt update
sudo apt install curl python3-pip ansible -y
ansible-galaxy collection install community.general
```

### Ejecutar un playbook específico

```bash
# Playbook completo para máquina local
ansible-playbook ./ansible/localhost-deploy.yml --ask-become-pass

# Playbook mínimo (Codespaces o entornos restringidos)
ansible-playbook ./ansible/minimal-deploy.yml
```

### Ejecutar solo tareas específicas

Cada módulo de Ansible se puede ejecutar de forma independiente usando tags o incluyendo la tarea directamente:

```bash
# Ejemplo: instalar solo los paquetes apt
ansible-playbook -e "include_tasks=tasks/apt.yml" ./ansible/localhost-deploy.yml --ask-become-pass
```

## Notificación por Telegram (opcional)

El playbook `localhost-deploy.yml` incluye una notificación de Telegram al finalizar. Para activarla:

1. Crea un bot de Telegram en [@BotFather](https://t.me/BotFather) y obtén el token
2. Obtén tu Chat ID (puedes usar [@userinfobot](https://t.me/userinfobot))
3. Crea el archivo `ansible/vars/telegram.yml`:

```yaml
telegram_bot_token: "TU_TOKEN_AQUI"
telegram_chat_id: "TU_CHAT_ID_AQUI"
```

> Si no configuras Telegram, la notificación simplemente se omite sin error.

## Verificar la instalación

Después de instalar, puedes comprobar que las herramientas principales están disponibles:

```bash
zsh --version       # Shell Zsh
nvim --version      # Neovim
docker --version    # Docker
brew --version      # Homebrew (Linuxbrew)
nix --version       # Nix package manager
jenv --version      # Java version manager
```

## Solución de problemas

### El script falla al instalar paquetes apt

Verifica que tienes acceso a internet y los repositorios de Ubuntu están disponibles:

```bash
sudo apt update && sudo apt upgrade -y
```

### Nix no se instala correctamente

Asegúrate de que el instalador de Nix tenga permiso de ejecución y que no estés usando una versión antigua de bash:

```bash
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --no-daemon
```

### Error de permisos de Ansible

Si Ansible falla con errores de permisos, asegúrate de ejecutar con `--ask-become-pass` para máquinas locales.

### Validar la sintaxis de los playbooks

```bash
ansible-playbook --syntax-check ansible/localhost-deploy.yml
ansible-playbook --syntax-check ansible/minimal-deploy.yml
```
