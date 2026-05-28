# GitHub Codespaces

Este repositorio está optimizado para usarse con **GitHub Codespaces**, permitiendo tener un entorno de desarrollo configurado en la nube en segundos.

## ¿Cómo funciona?

El script `install.sh` detecta automáticamente si está ejecutándose dentro de un Codespace mediante la variable de entorno `CODESPACE_NAME`:

```bash
if [ -z "$CODESPACE_NAME" ]; then
  # Máquina local: instalación completa
  ansible-playbook ./ansible/localhost-deploy.yml --ask-become-pass
else
  # GitHub Codespaces: instalación mínima
  ansible-playbook ./ansible/minimal-deploy.yml
fi
```

En Codespaces se usa el **playbook mínimo** (`minimal-deploy.yml`) porque:
- No se dispone de entorno gráfico (no necesita i3, WezTerm, etc.)
- El entorno ya tiene muchas herramientas preinstaladas
- La instalación debe ser rápida

## Configuración automática con devcontainer

Para que el entorno se configure automáticamente al abrir el Codespace, puedes añadir un archivo `.devcontainer/devcontainer.json` al repositorio:

```json
{
  "name": "DotFiles Dev Environment",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu-24.04",
  "postCreateCommand": "bash ~/.DotFiles/install.sh",
  "customizations": {
    "vscode": {
      "extensions": []
    }
  }
}
```

## Usar los dotfiles en cualquier Codespace

GitHub tiene soporte nativo para dotfiles. Puedes configurarlo en tu perfil:

1. Ve a **GitHub → Settings → Codespaces**
2. En la sección **Dotfiles**, activa "Automatically install dotfiles"
3. Selecciona el repositorio `JoTerrance/.DotFiles`
4. GitHub ejecutará automáticamente `install.sh` al crear cualquier Codespace

## Instalación manual en un Codespace existente

Si ya tienes un Codespace abierto:

```bash
# Clonar el repositorio
git clone https://github.com/JoTerrance/.DotFiles.git ~/.DotFiles
cd ~/.DotFiles

# Ejecutar la instalación (detecta Codespaces automáticamente)
bash install.sh
```

## Qué se instala en Codespaces

El playbook `minimal-deploy.yml` instala:

| Herramienta | Descripción |
|-------------|-------------|
| `zsh` | Shell Zsh |
| `mc` | Midnight Commander |
| `zoxide` | Navegación inteligente de directorios |
| `fzf` | Fuzzy finder interactivo |

Además, `zsh-core.yml` configura:
- **Oh My Zsh** con plugins base
- **zsh-syntax-highlighting**
- **zsh-autosuggestions**
- **zsh-history-substring-search**
- **Tema Pure**
- Symlink de `.zshrc`
- Clona/actualiza el repositorio `.DotFiles`

## Cambiar la shell a Zsh en Codespaces

Después de la instalación, la shell por defecto se cambia a Zsh automáticamente. Para aplicar el cambio en la sesión actual:

```bash
exec zsh
```

## Variables de entorno en Codespaces

GitHub Codespaces define automáticamente varias variables útiles:

| Variable | Descripción |
|----------|-------------|
| `CODESPACE_NAME` | Nombre único del Codespace (detectado por `install.sh`) |
| `GITHUB_USER` | Tu nombre de usuario de GitHub |
| `GITHUB_TOKEN` | Token de autenticación de GitHub |

Puedes añadir tus propios secretos en **GitHub → Settings → Codespaces → Secrets**.

## Limitaciones en Codespaces

Algunas herramientas **no se instalan** en Codespaces por no ser compatibles con entornos headless:

- WezTerm (emulador de terminal — se usa el terminal del navegador)
- i3 (gestor de ventanas)
- Eclipse IDE (entorno gráfico)
- DBeaver (entorno gráfico)
- Burp Suite (entorno gráfico)
- Postman (entorno gráfico)

Para entornos cloud se recomienda usar alternativas TUI como `lazysql`, `iredis`, `pgcli`, etc.
