# Archivos de configuración

El directorio `config/` contiene archivos de configuración para diversas herramientas. Ansible crea **symlinks** desde `~/.DotFiles/config/` hacia las rutas esperadas por cada herramienta.

## Configuraciones incluidas

| Directorio | Ruta de symlink | Herramienta |
|------------|-----------------|-------------|
| `config/mycli/.myclirc` | `~/.myclirc` | mycli (cliente MySQL) |
| `config/pgcli/config` | `~/.config/pgcli/config` | pgcli (cliente PostgreSQL) |
| `config/litecli/config` | `~/.config/litecli/config` | litecli (cliente SQLite) |
| `config/mssqlcli/config` | `~/.config/mssqlcli/config` | mssql-cli (cliente SQL Server) |
| `config/iredis/.iredisrc` | `~/.iredisrc` | iredis (cliente Redis) |
| `config/i3/config` | `~/.config/i3/config` | i3 (gestor de ventanas) |

---

## WezTerm (`.wezterm.lua`)

El archivo `.wezterm.lua` en la raíz del repositorio configura el terminal **WezTerm**.

**Shell por defecto:**
```lua
default_prog = {"/usr/bin/zsh", "-l"}
```

**Atajos de teclado configurados:**

| Atajo | Acción |
|-------|--------|
| `Ctrl+T` | Nueva pestaña (mismo dominio) |
| `Alt+T` | Nueva pestaña (dominio por defecto) |
| `Ctrl+←` | Mover pestaña a la izquierda |
| `Ctrl+→` | Mover pestaña a la derecha |
| `Alt+←` | Ir a la pestaña anterior |
| `Alt+→` | Ir a la pestaña siguiente |
| `Alt+1` ... `Alt+9` | Ir a la pestaña N |
| `Alt+0` | Ir a la última pestaña |

**Tema de colores (barra de pestañas):**

| Elemento | Color |
|----------|-------|
| Fondo de la barra | `#262626` |
| Pestaña activa (fondo) | `#404040` |
| Pestaña activa (texto) | `#c0c0c0` |
| Pestaña inactiva (fondo) | `#202020` |
| Pestaña inactiva (texto) | `#808080` |
| Hover pestaña inactiva | `#363636` |

**Nota:** El ajuste de tamaño de ventana al cambiar el tamaño de fuente está desactivado:
```lua
adjust_window_size_when_changing_font_size = false
```

---

## Clientes de bases de datos

### mycli (`config/mycli/.myclirc`)

Cliente MySQL/MariaDB con autocompletado y resaltado de sintaxis.

**Instalación:** via `pipx install mycli`

**Uso básico:**
```bash
mycli -u usuario -p -h localhost base_de_datos
mycli mysql://usuario:contraseña@host/base_de_datos
```

### pgcli (`config/pgcli/config`)

Cliente PostgreSQL con autocompletado inteligente.

**Instalación:** via `pipx install pgcli`

**Uso básico:**
```bash
pgcli -U usuario -h localhost base_de_datos
pgcli postgresql://usuario:contraseña@host/base_de_datos
```

### litecli (`config/litecli/config`)

Cliente SQLite con autocompletado.

**Instalación:** via `pipx install litecli` y Nix

**Uso básico:**
```bash
litecli mi_base.db
litecli :memory:    # Base de datos en memoria
```

### mssql-cli (`config/mssqlcli/config`)

Cliente SQL Server con autocompletado.

**Instalación:** via `pipx install mssql-cli`

**Uso básico:**
```bash
mssql-cli -S servidor -U usuario -P contraseña -d base_de_datos
```

### iredis (`config/iredis/.iredisrc`)

Cliente Redis con autocompletado y documentación inline.

**Instalación:** via `pipx install iredis`

**Uso básico:**
```bash
iredis                          # Conecta a localhost:6379
iredis -h host -p puerto -n db  # Conexión personalizada
```

---

## i3 (`config/i3/config`)

Configuración del gestor de ventanas **i3** (tiling window manager).

El archivo de configuración se enlaza desde `~/.DotFiles/config/i3/config` hacia `~/.config/i3/config`.

i3 se usa principalmente en la instalación completa de escritorio (no en Codespaces ni en instalaciones mínimas).

---

## Neovim (`tasks/nvim.yml`)

Neovim se instala tanto via apt (en el PATH) como via Nix. La configuración de Neovim no está incluida en este repositorio pero se puede integrar por separado.

**Dependencias instaladas para Neovim:**
- `pynvim` (soporte Python)
- `luarocks` (soporte Lua)
- `ccls` (language server C/C++)
- `pyright` (language server Python, via npm)

---

## Nerd Fonts (`tasks/nerd-fonts.yml`)

Se instalan **Nerd Fonts** para soporte de iconos en el terminal. Estas fuentes son necesarias para el correcto funcionamiento de:
- El prompt Pure de Zsh
- Los iconos en nnn
- Los iconos en editores como Neovim y Helix

---

## Agregar una nueva configuración

Para agregar la configuración de una nueva herramienta al repositorio:

1. Crea el archivo de configuración en `config/<herramienta>/`
2. Añade una tarea en `ansible/tasks/zsh.yml` (u otra tarea apropiada) para crear el symlink:

```yaml
- name: nombre-herramienta symlink
  file:
    src: ~/.DotFiles/config/nombre-herramienta/config
    dest: ~/.config/nombre-herramienta/config
    state: link
    force: yes
```

3. Valida el playbook:
```bash
ansible-playbook --syntax-check ansible/localhost-deploy.yml
```
