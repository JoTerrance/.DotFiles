# Perfiles de VSCode

El directorio `vscode_profiles/` contiene perfiles exportados de **Visual Studio Code** para diferentes lenguajes y contextos de desarrollo.

## ¿Qué son los perfiles de VSCode?

Los perfiles de VSCode permiten tener configuraciones, extensiones y atajos separados para distintos proyectos o lenguajes. Cada perfil incluye:
- Extensiones instaladas
- Configuración (`settings.json`)
- Atajos de teclado (`keybindings.json`)
- Snippets y tareas

## Perfiles disponibles

### `All.code-profile` — Perfil completo

Perfil con todas las extensiones para desarrollo general, incluyendo web, cloud y herramientas de productividad.

**Extensiones principales:**

| Extensión | Descripción |
|-----------|-------------|
| `github.copilot` | GitHub Copilot (IA) |
| `github.copilot-chat` | GitHub Copilot Chat |
| `github.vscode-pull-request-github` | Gestión de PRs de GitHub |
| `github.vscode-github-actions` | GitHub Actions en VSCode |
| `github.codespaces` | Integración con Codespaces |
| `github.classroom` | GitHub Classroom |
| `ms-azuretools.vscode-docker` | Gestión de Docker |
| `ms-vscode-remote.remote-containers` | Dev Containers |
| `ms-vsliveshare.vsliveshare` | Live Share (colaboración) |
| `asvetliakov.vscode-neovim` | Neovim integrado en VSCode |
| `esbenp.prettier-vscode` | Formateo de código |
| `dbaeumer.vscode-eslint` | ESLint |
| `enkia.tokyo-night` | Tema Tokyo Night |
| `ms-ceintl.vscode-language-pack-es` | Pack de idioma español |
| `ms-python.python` | Soporte Python |
| `ms-toolsai.jupyter` | Soporte Jupyter Notebooks |
| `anbuselvanrocky.bootstrap5-vscode` | Bootstrap 5 snippets |
| `hansuxdev.bootstrap5-snippets` | Bootstrap 5 snippets adicionales |
| `amazonwebservices.aws-toolkit-vscode` | AWS Toolkit |
| `jigar-patel.odoosnippets` | Snippets de Odoo |

---

### `Bootstrap.code-profile` — Desarrollo web con Bootstrap

Perfil minimalista para desarrollo de interfaces web con Bootstrap.

**Extensiones:**

| Extensión | Descripción |
|-----------|-------------|
| `anbuselvanrocky.bootstrap5-vscode` | Bootstrap 5 (intellisense y snippets) |
| `hansuxdev.bootstrap5-snippets` | Snippets adicionales de Bootstrap 5 |
| `esbenp.prettier-vscode` | Formateo de HTML/CSS/JS |

---

### `Java.code-profile` — Desarrollo Java

Perfil para desarrollo Java con Maven y debugging.

**Extensiones:**

| Extensión | Descripción |
|-----------|-------------|
| `vscjava.vscode-java-debug` | Depuración de Java |
| `vscjava.vscode-maven` | Soporte Maven |
| `redhat.vscode-xml` | Soporte XML (para pom.xml) |
| `ms-vscode-remote.remote-containers` | Dev Containers |
| `github.copilot` | GitHub Copilot |

---

### `Python.code-profile` — Desarrollo Python / Odoo

Perfil para desarrollo Python con soporte de Jupyter y Odoo.

**Extensiones:**

| Extensión | Descripción |
|-----------|-------------|
| `ms-python.python` | Soporte Python |
| `ms-python.vscode-pylance` | Language Server Python |
| `ms-python.isort` | Organización de imports |
| `ms-toolsai.jupyter` | Jupyter Notebooks |
| `ms-toolsai.jupyter-keymap` | Atajos de Jupyter |
| `ms-toolsai.jupyter-renderers` | Renderizadores de Jupyter |
| `jigar-patel.odoosnippets` | Snippets de Odoo |
| `mstuttgart.odoo-snippets` | Más snippets de Odoo |
| `scapigliato.vsc-odoo-development` | Herramientas de desarrollo Odoo |
| `ms-vscode-remote.remote-containers` | Dev Containers |

---

### `Salesforcecode-profile.code-profile` — Salesforce / Apex

Perfil especializado para desarrollo en la plataforma Salesforce.

**Extensiones:**

| Extensión | Descripción |
|-----------|-------------|
| `salesforce.salesforcedx-vscode` | Salesforce Extension Pack |
| `salesforce.salesforcedx-vscode-apex` | Soporte Apex |
| `salesforce.salesforcedx-vscode-apex-debugger` | Depurador de Apex |
| `salesforce.salesforcedx-vscode-apex-replay-debugger` | Replay Debugger |
| `salesforce.salesforcedx-vscode-core` | Núcleo de Salesforce DX |
| `salesforce.salesforcedx-vscode-lightning` | LWC y Aura |
| `salesforce.salesforcedx-vscode-soql` | SOQL |
| `salesforce.salesforcedx-vscode-visualforce` | Visualforce |
| `salesforce.salesforce-vscode-slds` | SLDS (Salesforce Lightning Design System) |
| `chuckjonas.apex-pmd` | PMD para Apex |
| `financialforce.lana` | LANA para Apex |
| `tabnine.tabnine-vscode` | Tabnine (autocompletado IA) |
| `enkia.tokyo-night` | Tema Tokyo Night |
| `ms-ceintl.vscode-language-pack-es` | Pack de idioma español |
| `github.copilot` | GitHub Copilot |
| `ms-vscode-remote.remote-containers` | Dev Containers |

---

## Cómo importar un perfil

### Método 1: Desde la interfaz de VSCode

1. Abre VSCode
2. Ve a **File → Preferences → Profiles → Import Profile...**
   (o usa el comando `Profiles: Import Profile`)
3. Selecciona el archivo `.code-profile` del directorio `vscode_profiles/`
4. Confirma la importación

### Método 2: Desde la línea de comandos

```bash
# Abrir VSCode con el perfil (primero importarlo desde la UI)
code --profile "Java"
```

### Método 3: Desde GitHub (URL)

Puedes importar directamente desde la URL de GitHub:

1. Ve a **File → Preferences → Profiles → Import Profile...**
2. Pega la URL raw del archivo en GitHub:
   ```
   https://raw.githubusercontent.com/JoTerrance/.DotFiles/main/vscode_profiles/Java.code-profile
   ```

## Exportar tu propio perfil

Si modificas un perfil y quieres guardarlo en el repositorio:

1. En VSCode: **File → Preferences → Profiles → Export Profile...**
2. Selecciona las partes a exportar (extensiones, configuración, etc.)
3. Guarda el archivo como `.code-profile` en `vscode_profiles/`
4. Haz commit de los cambios

## Configuración de `tasks/code.yml`

Ansible puede configurar VSCode automáticamente. El archivo `tasks/code.yml` gestiona la configuración relacionada con VSCode durante el despliegue.
