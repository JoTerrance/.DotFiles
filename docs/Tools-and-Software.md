# Herramientas y Software

Esta página lista todo el software que se instala automáticamente mediante los playbooks de Ansible.

## Paquetes del sistema (apt)

Instalados via `tasks/apt.yml`:

### Lenguajes y runtimes
| Herramienta | Descripción |
|-------------|-------------|
| `python3`, `python3-pip`, `python3-wheel` | Python 3 y gestores de paquetes |
| `openjdk-17-jdk`, `openjdk-21-jdk` | Java 17 y 21 |
| `maven`, `gradle` | Herramientas de build para Java |
| `npm` | Node Package Manager |
| `cargo` | Gestor de paquetes de Rust |
| `lua5.1`, `lua5.4`, `luarocks` | Lua y su gestor de paquetes |

### Herramientas de desarrollo
| Herramienta | Descripción |
|-------------|-------------|
| `git`, `git-gui` | Control de versiones |
| `gh` | GitHub CLI |
| `build-essential` | Compiladores y herramientas de build |
| `clang`, `clangd`, `cmake` | Toolchain de C/C++ |
| `ripgrep` | Búsqueda de texto ultra-rápida |
| `fd-find` | Alternativa a `find` más rápida |
| `bat` | `cat` con resaltado de sintaxis |
| `fzf` (via Brew) | Fuzzy finder interactivo |
| `global`, `exuberant-ctags` | Navegación de código/tags |

### Terminal y shell
| Herramienta | Descripción |
|-------------|-------------|
| `zsh` | Shell Zsh |
| `zoxide` | Navegación inteligente de directorios |
| `mc` | Midnight Commander (gestor de archivos TUI) |
| `nnn` | Gestor de archivos en terminal |
| `tmuxinator` | Gestor de sesiones de tmux |
| `fonts-powerline` | Fuentes Powerline para el terminal |
| `stterm` | Terminal simple de suckless |
| `terminator` | Emulador de terminal con splits |

### Red y sistema
| Herramienta | Descripción |
|-------------|-------------|
| `curl`, `wget` | Descarga de archivos |
| `net-tools` | Herramientas de red (`ifconfig`, etc.) |
| `podman` | Alternativa a Docker sin daemon |
| `unzip` | Descompresión de archivos |
| `atool` | Gestión de archivos comprimidos |
| `xclip` | Acceso al portapapeles desde terminal |
| `tree` | Visualización de árbol de directorios |

### Desarrollo gráfico (solo en máquina completa)
| Herramienta | Descripción |
|-------------|-------------|
| `chromium-browser` | Navegador web |
| `libx11-dev`, `libxext-dev`, `libxft-dev` | Librerías X11 para desarrollo |

---

## Paquetes Nix (`tasks/nix.yml`)

Instalados via Nix package manager:

| Herramienta | Descripción |
|-------------|-------------|
| `eclipse-jee` | Eclipse IDE para Java EE |
| `lazygit` | TUI para Git |
| `lazydocker` | TUI para Docker |
| `lazysql` | TUI para bases de datos SQL |
| `litecli` | Cliente SQLite con autocompletado |
| `ripgrep` | Búsqueda de texto (también via apt) |
| `tmuxinator` | Gestor de sesiones de tmux |
| `postman` | Cliente REST para APIs |
| `awscli2` | AWS Command Line Interface v2 |
| `rustup` | Gestor de toolchains de Rust |
| `k3s` | Kubernetes ligero |
| `gh` | GitHub CLI |
| `ccls` | Language server para C/C++ |
| `dbeaver-bin` | Cliente gráfico universal de BD |
| `cheat` | Hojas de trucos para comandos |
| `neovim` | Editor Neovim |
| `zoxide` | Navegación inteligente de directorios |
| `vagrant` | Gestión de máquinas virtuales |
| `terraform` | Infraestructura como código |
| `burpsuite` | Suite de seguridad web |
| `luarocks-nix` | Luarocks para Nix |

---

## Paquetes Homebrew (`tasks/brew.yml`)

Instalados via Linuxbrew:

| Herramienta | Descripción |
|-------------|-------------|
| `tig` | Interfaz TUI para Git |
| `ctop` | Monitor de contenedores |
| `helm` | Gestor de paquetes para Kubernetes |
| `lf` | Gestor de archivos en terminal |
| `dive` | Explorador de imágenes Docker |
| `stern` | Multi-pod log tailing para Kubernetes |
| `tmuxinator` | Gestor de sesiones de tmux |
| `ripgrep` | Búsqueda de texto |
| `lnav` | Visor de logs avanzado |
| `terraform` | Infraestructura como código |
| `dry` | TUI para Docker |
| `lazygit` | TUI para Git |
| `lazydocker` | TUI para Docker |
| `lazynpm` | TUI para npm |
| `k9s` | TUI para Kubernetes |
| `fzf` | Fuzzy finder interactivo |

---

## Paquetes Python (`tasks/pip.yml`)

Instalados via `pipx` (entornos aislados):

| Herramienta | Descripción |
|-------------|-------------|
| `flake8` | Linter para Python |
| `yapf` | Formateador de código Python |
| `thefuck` | Corrector automático de comandos |
| `autoflake` | Elimina imports no usados |
| `isort` | Organiza imports de Python |
| `coverage` | Cobertura de tests de Python |
| `python-language-server` | LSP para Python |
| `pylint` | Analizador estático de Python |
| `pynvim` | Soporte de Python para Neovim |
| `pygments` | Resaltado de sintaxis genérico |
| `mycli` | Cliente MySQL con autocompletado |
| `pgcli` | Cliente PostgreSQL con autocompletado |
| `mssql-cli` | Cliente SQL Server con autocompletado |
| `litecli` | Cliente SQLite con autocompletado |
| `iredis` | Cliente Redis con autocompletado |

---

## Paquetes Node.js (`tasks/npm.yml`)

Node.js se instala via **NVM** (Node Version Manager):

- NVM v0.40.4
- Node.js LTS (versión más reciente LTS)
- pnpm (gestor de paquetes alternativo)

Paquetes globales instalados:

| Herramienta | Descripción |
|-------------|-------------|
| `pyright` | Language server para Python (usado en Neovim) |
| `dockly` | TUI para gestión de Docker |
| `fkill-cli` | Matar procesos de forma interactiva |

---

## Docker (`tasks/docker.yml`)

Se instala **Docker CE** desde el repositorio oficial de Docker:

- `docker-ce` — Docker Community Edition
- `docker-ce-cli` — CLI de Docker
- `containerd.io` — Runtime de contenedores

---

## Gestores de versiones

| Herramienta | Gestiona | Instalado con |
|-------------|----------|---------------|
| **jenv** | Versiones de Java | `tasks/jenv.yml` |
| **SDKMan** | JDKs, Kotlin, Scala, etc. | `tasks/sdkman.yml` |
| **NVM** | Versiones de Node.js | `tasks/npm.yml` |
| **Nix** | Paquetes multiplataforma | `install.sh` |
| **Homebrew** | Paquetes Linux/macOS | `tasks/brew.yml` |

---

## Instalación mínima (Codespaces)

En GitHub Codespaces solo se instala:

- `zsh` — Shell
- `mc` — Midnight Commander
- `zoxide` — Navegación de directorios
- `fzf` — Fuzzy finder
- Configuración base de Zsh

Ver [GitHub Codespaces](GitHub-Codespaces) para más detalles.
