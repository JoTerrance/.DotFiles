# Playbooks de Ansible

Este repositorio usa **Ansible** para automatizar la instalación y configuración del entorno de desarrollo. Los playbooks están en el directorio `ansible/`.

## Playbooks principales

### `localhost-deploy.yml` — Instalación completa local

Diseñado para instalar el entorno completo en una **máquina Linux local** (Ubuntu/Debian).

**Características:**
- Se ejecuta sobre `localhost`
- Usa elevación de privilegios con `sudo` cuando es necesario
- Soporta notificación por Telegram al finalizar
- Requiere el archivo `vars/telegram.yml` (puede estar vacío o no existir)

**Ejecución:**
```bash
ansible-playbook ./ansible/localhost-deploy.yml --ask-become-pass
```

**Tareas incluidas** (en orden):
1. `nix.yml` — Instala paquetes via Nix
2. `apt.yml` — Instala paquetes del sistema via apt
3. `helix.yml` — Instala el editor Helix
4. `zsh.yml` — Configura Zsh y symlinks de configuración
5. `docker.yml` — Instala Docker
6. `jenv.yml` — Instala jenv (gestor de versiones de Java)
7. `npm.yml` — Instala paquetes globales de Node.js
8. `brew.yml` — Instala Homebrew (Linuxbrew) y paquetes
9. `pip.yml` — Instala paquetes Python
10. `sdkman.yml` — Instala SDKMan
11. `nvim.yml` — Instala y configura Neovim
12. `nnn.yml` — Instala el gestor de archivos nnn
13. `grv.yml` — Instala GRV (Git Repository Viewer)
14. `code.yml` — Configura VSCode
15. `zed.yml` — Instala el editor Zed
16. `nerd-fonts.yml` — Instala Nerd Fonts

---

### `minimal-deploy.yml` — Instalación mínima (Codespaces)

Diseñado para entornos **restringidos o en la nube**, como GitHub Codespaces.

**Características:**
- Se ejecuta sobre `localhost`
- No requiere contraseña sudo
- Instalación rápida con solo herramientas esenciales

**Ejecución:**
```bash
ansible-playbook ./ansible/minimal-deploy.yml
```

**Tareas incluidas:**
1. Instala paquetes esenciales via apt: `zsh`, `mc`, `zoxide`, `fzf`
2. Ejecuta `zsh-core.yml` (configuración base de Zsh)
3. Cambia la shell por defecto del usuario a Zsh

---

### `vm-deploy.yml` — Aprovisionamiento de VM (Vagrant)

Diseñado para aprovisionar una **máquina virtual** gestionada por Vagrant.

**Características:**
- Se ejecuta en el host `master` (definido en el inventario de Vagrant)
- Configura el teclado en español
- Cambia la shell a Zsh
- Gestiona permisos de Docker

**Ejecución** (automática desde Vagrant):
```bash
cd Vagrant
vagrant up
```

**Tareas adicionales específicas de VM:**
- Cambia la shell a Zsh con contraseña `vagrant`
- Configura el teclado al layout español (`es`)
- Asigna el ownership de `/var/run/docker.sock` al usuario `vagrant`

---

## Tareas modulares (`ansible/tasks/`)

Cada archivo de tarea es independiente y puede ser incluido en cualquier playbook.

| Archivo | Descripción |
|---------|-------------|
| `main.yml` | Orquestador principal — incluye todas las tareas en orden |
| `minimal.yml` | Configuración mínima para Codespaces |
| `apt.yml` | Instala paquetes del sistema con apt |
| `nix.yml` | Instala paquetes via Nix package manager |
| `brew.yml` | Instala Homebrew y paquetes con brew |
| `pip.yml` | Instala paquetes Python con pip |
| `npm.yml` | Instala paquetes globales de Node.js |
| `docker.yml` | Instala y configura Docker |
| `zsh.yml` | Configura Zsh, symlinks y plugins |
| `zsh-core.yml` | Configuración base de Zsh (compartida) |
| `nvim.yml` | Instala Neovim |
| `helix.yml` | Instala el editor Helix |
| `zed.yml` | Instala el editor Zed |
| `jenv.yml` | Instala jenv para gestionar versiones de Java |
| `sdkman.yml` | Instala SDKMan |
| `nnn.yml` | Instala el gestor de archivos nnn |
| `grv.yml` | Instala GRV (Git Repository Viewer) |
| `code.yml` | Configura Visual Studio Code |
| `nerd-fonts.yml` | Instala Nerd Fonts |

## Variables de entorno en los playbooks

Los playbooks usan las siguientes variables de entorno:

| Variable | Uso | Playbook |
|----------|-----|----------|
| `NIXPKGS_ALLOW_UNFREE=1` | Permite instalar paquetes no-libres de Nix | `localhost-deploy.yml` |
| `PATH` ampliado | Incluye Linuxbrew en el PATH | `localhost-deploy.yml`, `brew.yml` |
| `telegram_bot_token` | Token del bot de Telegram | `localhost-deploy.yml` |
| `telegram_chat_id` | Chat ID de Telegram | `localhost-deploy.yml` |
| `CODESPACE_NAME` | Detecta automáticamente GitHub Codespaces | `install.sh` |

## Validación de sintaxis

Antes de ejecutar un playbook, valida su sintaxis:

```bash
ansible-playbook --syntax-check ansible/localhost-deploy.yml
ansible-playbook --syntax-check ansible/minimal-deploy.yml
```
