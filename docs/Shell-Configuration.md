# Configuración de la Shell

Este repositorio configura **Zsh** como shell principal con **Oh My Zsh**, el tema **Pure** y una selección de plugins potentes.

## Oh My Zsh

Se instala automáticamente desde [robbyrussell/oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) y el archivo `.zshrc` del repositorio se enlaza como symlink en `~/.zshrc`.

## Plugins de Zsh

Los plugins están definidos en `.zshrc`:

### Plugins incluidos en Oh My Zsh

| Plugin | Descripción |
|--------|-------------|
| `git` | Aliases y utilidades para Git |
| `aws` | Autocompletado para AWS CLI |
| `docker`, `docker-compose` | Autocompletado para Docker |
| `kubectl` | Autocompletado para Kubernetes |
| `npm` | Autocompletado para npm |
| `nvm` | Integración con NVM (modo lazy) |
| `pip` | Autocompletado para pip |
| `mvn` | Autocompletado para Maven |
| `fzf` | Integración de fzf con Zsh |
| `tmuxinator` | Autocompletado para tmuxinator |
| `jenv` | Integración con jenv |
| `fasd` | Navegación rápida por historial de directorios |
| `sudo` | Doble `Esc` para añadir `sudo` al comando anterior |
| `extract` | Extrae cualquier archivo comprimido con `extract` |
| `gitignore` | Genera `.gitignore` desde gitignore.io |
| `colorize` | Resaltado de sintaxis para `cat` |
| `colored-man-pages` | Páginas de manual con colores |
| `copypath` | Copia el path actual al portapapeles |
| `copybuffer` | `Ctrl+O` para copiar el buffer de comandos |
| `copyfile` | Copia el contenido de un archivo al portapapeles |
| `command-not-found` | Sugiere paquetes cuando un comando no existe |
| `dotenv` | Carga automáticamente archivos `.env` |
| `microk8s` | Autocompletado para microk8s |

### Plugins adicionales (instalados por Ansible)

| Plugin | Repositorio |
|--------|-------------|
| `zsh-syntax-highlighting` | [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) |
| `zsh-autosuggestions` | [zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) |
| `zsh-history-substring-search` | [zsh-users/zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search) |
| `zsh-completions` | [zsh-users/zsh-completions](https://github.com/zsh-users/zsh-completions) |
| `zsh-vi-mode` | [jeffreytse/zsh-vi-mode](https://github.com/jeffreytse/zsh-vi-mode) |

> **Nota**: `zsh-autosuggestions` se deshabilita si la variable de entorno `BLIND` está definida.

## Tema: Pure

Se usa el prompt minimalista [Pure](https://github.com/sindresorhus/pure) de Sindre Sorhus.

**Configuración en `.zshrc`:**
```zsh
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
PURE_CMD_MAX_EXEC_TIME=10
prompt pure
```

**Personalización de colores:**
```zsh
zstyle :prompt:pure:path color white
zstyle ':prompt:pure:prompt:*' color cyan
zstyle :prompt:pure:git:stash show yes
```

## Variables de entorno configuradas

| Variable | Valor | Descripción |
|----------|-------|-------------|
| `ZSH` | `~/.oh-my-zsh` | Directorio de Oh My Zsh |
| `JAVA_HOME` | `/usr/lib/jvm/java-21-openjdk-amd64/` | Java 21 |
| `JAVA_OPTIONS` | `-Xmx4096m -Xms4096m` | Opciones de JVM |
| `ANDROID_HOME` | `~/SDK/ANDROID/` | Android SDK |
| `SDKMAN_DIR` | `~/.sdkman` | SDKMan |
| `NVM_DIR` | `~/.nvm` | NVM |
| `NNN_PLUG` | `o:fzopen;p:preview-tui;...` | Plugins de nnn |
| `NNN_FIFO` | `/tmp/nnn.fifo` | FIFO para previews de nnn |
| `FZF_DEFAULT_OPTS` | Ver abajo | Opciones por defecto de fzf |
| `GTAGSLABEL` | `pygments` | Parser para GNU Global |

**FZF_DEFAULT_OPTS:**
```zsh
--preview "batcat --style=numbers --color=always --line-range :200 {}"
--bind "ctrl-y:execute(readlink -f {} | echo -n {1..} | xclip -selection clipboard)"
```

## Aliases útiles

Definidos en `~/.aliases` (cargados desde `.zshrc`):

| Alias | Comando | Descripción |
|-------|---------|-------------|
| `awscli` | `docker run ... amazon/aws-cli` | AWS CLI en Docker |
| `remoteDebugOn` | `export MAVEN_OPTS=...` | Habilita debug remoto de Maven |
| `remoteDebugOff` | `unset MAVEN_OPTS` | Deshabilita debug remoto de Maven |
| `jhotswap` | `export JAVA_HOME=...` | Usa JVM con HotSwap Agent |

## Scripts fzf personalizados

### `fsb` — Fuzzy Branch Switcher

Definido en `fsb.sh` y cargado desde `.zshrc`.

**Uso:**
```bash
fsb              # Muestra todas las ramas con fzf para seleccionar
fsb feature      # Filtra ramas que contienen "feature"
```

Al seleccionar una rama, ejecuta `git checkout` automáticamente. Funciona con ramas locales y remotas.

### `fshow` — Fuzzy Git Log

Definido en `fshow.sh` y cargado desde `.zshrc`.

**Uso:**
```bash
fshow            # Muestra el historial de commits con preview
```

**Controles:**
| Tecla | Acción |
|-------|--------|
| `Enter` | Ver el commit completo en `less` |
| `Ctrl-O` | Hacer checkout del commit seleccionado |
| `Ctrl-F` | Scroll hacia abajo en el preview |
| `Ctrl-B` | Scroll hacia arriba en el preview |
| `Ctrl-S` | Alternar ordenación |
| `q` | Salir |

## Función `_fzf_comprun`

Personaliza el comportamiento de fzf para completado de comandos específicos:

```zsh
_fzf_comprun() {
  case "$command" in
    cd)   fzf --preview 'tree -C {} | head -200' ;;
    ssh)  fzf --preview 'dig {}' ;;
    *)    fzf ;;
  esac
}
```

- **`cd **Tab`**: muestra árbol de directorios en el preview
- **`ssh **Tab`**: muestra información DNS del host

## Integración con zoxide

`zoxide` reemplaza al comando `cd` con navegación inteligente basada en historial:

```bash
z projects     # Salta al directorio que más visitas con "projects" en el nombre
zi             # Búsqueda interactiva con fzf
```

## Gestión de versiones de Node

Node.js 22 se activa automáticamente al iniciar la shell:

```zsh
nvm use 22
```

El plugin `nvm` está configurado en modo **lazy** para acelerar el inicio de la shell:
```zsh
zstyle ':omz:plugins:nvm' lazy yes
```
