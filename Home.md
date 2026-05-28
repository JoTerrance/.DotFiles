# .DotFiles

Bienvenido al repositorio de dotfiles de **JoTerrance**. Este repositorio contiene configuraciones personales, scripts de instalación y playbooks de Ansible para configurar automáticamente un entorno de desarrollo completo en Ubuntu/Debian.

## ¿Qué hace este repositorio?

- Instala y configura herramientas de desarrollo mediante **Ansible**
- Gestiona dotfiles (`.zshrc`, `.wezterm.lua`, etc.) con **symlinks**
- Permite aprovisionar **máquinas virtuales** con Vagrant
- Es compatible con **GitHub Codespaces** para entornos en la nube

## Estructura del repositorio

```
.DotFiles/
├── install.sh              # Script principal de instalación
├── .zshrc                  # Configuración de Zsh
├── .wezterm.lua            # Configuración del terminal WezTerm
├── fsb.sh                  # Script fzf para búsqueda de branches de Git
├── fshow.sh                # Script fzf para búsqueda de commits de Git
├── ansible/                # Playbooks y tareas de Ansible
│   ├── localhost-deploy.yml    # Playbook para instalación completa local
│   ├── minimal-deploy.yml      # Playbook minimalista (Codespaces)
│   ├── vm-deploy.yml           # Playbook para máquinas virtuales
│   └── tasks/              # Tareas modulares de Ansible
├── config/                 # Archivos de configuración para herramientas CLI
│   ├── i3/                 # Configuración del gestor de ventanas i3
│   ├── iredis/             # Configuración de iredis
│   ├── litecli/            # Configuración de litecli
│   ├── mssqlcli/           # Configuración de mssqlcli
│   ├── mycli/              # Configuración de mycli
│   └── pgcli/              # Configuración de pgcli
├── Vagrant/                # Configuración de Vagrant para VMs
└── vscode_profiles/        # Perfiles de VSCode exportados
```

## Inicio rápido

### Instalación en Ubuntu/Debian

```bash
# Clonar el repositorio
git clone https://github.com/JoTerrance/.DotFiles.git ~/.DotFiles
cd ~/.DotFiles

# Ejecutar el script de instalación
bash install.sh
```

> El script detecta automáticamente si estás en GitHub Codespaces y usa el playbook apropiado.

## Páginas de la wiki

| Página | Descripción |
|--------|-------------|
| [Instalación](Installation) | Guía detallada de instalación paso a paso |
| [Playbooks de Ansible](Ansible-Playbooks) | Descripción de cada playbook y tarea |
| [Herramientas instaladas](Tools-and-Software) | Listado completo del software que se instala |
| [Configuración de la shell](Shell-Configuration) | Zsh, plugins y scripts fzf |
| [Archivos de configuración](Configuration-Files) | WezTerm, i3, clientes de BD y más |
| [Vagrant](Vagrant) | Aprovisionamiento de máquinas virtuales |
| [GitHub Codespaces](GitHub-Codespaces) | Uso en entornos cloud |
| [Perfiles de VSCode](VSCode-Profiles) | Perfiles de Visual Studio Code |

## Requisitos previos

- Ubuntu 22.04 / 24.04 (o Debian equivalente)
- Acceso a `sudo`
- Conexión a internet

## Contribuir

1. Haz fork del repositorio
2. Crea una rama para tu cambio
3. Valida los playbooks con `ansible-playbook --syntax-check`
4. Abre un Pull Request
