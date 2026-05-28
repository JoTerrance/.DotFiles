# Vagrant

Este repositorio incluye un `Vagrantfile` para aprovisionar una máquina virtual Ubuntu con el entorno de desarrollo completo.

## Requisitos

- [Vagrant](https://www.vagrantup.com/) instalado en el host
- Un proveedor de virtualización compatible:
  - **VirtualBox** (recomendado, gratuito)
  - **VMware Desktop** (requiere licencia de plugin)
- Ansible instalado en el host (para el aprovisionamiento)

> Vagrant se puede instalar via Nix: `nix-env -iA nixpkgs.vagrant`

## Configuración de la VM

El `Vagrantfile` está en el directorio `Vagrant/`:

```ruby
IMAGE_NAME = "bento/ubuntu-24.04"

config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus   = 4
    v.gui    = true   # Habilita la interfaz gráfica
end
```

**Especificaciones de la VM:**
| Parámetro | Valor |
|-----------|-------|
| Imagen base | `bento/ubuntu-24.04` |
| RAM | 4096 MB (4 GB) |
| CPUs | 4 |
| GUI | Habilitada |
| Red | Privada (`192.168.50.10`) |
| Hostname | `master` |
| Proveedor | VirtualBox o VMware Desktop |

## Inventario de Ansible

El archivo `Vagrant/hosts` define el inventario de hosts para Vagrant:

- Host `master`: `192.168.50.10`

## Comandos básicos de Vagrant

### Crear e iniciar la VM

```bash
cd ~/.DotFiles/Vagrant
vagrant up
```

Este comando:
1. Descarga la imagen `bento/ubuntu-24.04` si no está disponible localmente
2. Crea la máquina virtual en VirtualBox (o VMware)
3. Ejecuta el playbook `ansible/vm-deploy.yml` automáticamente

### Conectarse a la VM via SSH

```bash
vagrant ssh
```

### Pausar y reanudar la VM

```bash
vagrant suspend    # Pausa la VM (guarda el estado)
vagrant resume     # Reanuda la VM pausada
```

### Apagar y encender la VM

```bash
vagrant halt       # Apaga la VM
vagrant up         # Enciende la VM (sin reprovisionar)
```

### Reprovisionar la VM (re-ejecutar Ansible)

```bash
vagrant provision
# o
vagrant up --provision
```

### Destruir la VM

```bash
vagrant destroy
```

## El playbook `vm-deploy.yml`

El Vagrantfile apunta al playbook `../ansible/vm-deploy.yml`, que incluye:

1. **Todas las tareas de `main.yml`** (misma instalación completa que `localhost-deploy.yml`)
2. **Cambio de shell a Zsh** con la contraseña `vagrant`
3. **Cambio de teclado a español** (`localectl set-keymap es`)
4. **Permisos de Docker** — asigna el ownership de `/var/run/docker.sock` al usuario `vagrant`

### Variables de la VM

| Variable | Valor |
|----------|-------|
| `ansible_become_pass` | `vagrant` (contraseña por defecto) |
| `eclipse_base_dir` | `/home/vagrant/ide/eclipse` |
| `node_ip` | `192.168.50.10` |

## Configuración de proveedores

### VirtualBox

```bash
vagrant up --provider=virtualbox
```

### VMware Desktop

Requiere el plugin de Vagrant para VMware:

```bash
vagrant plugin install vagrant-vmware-desktop
vagrant up --provider=vmware_desktop
```

## Troubleshooting

### Error: "No usable default provider"

Asegúrate de tener VirtualBox instalado:

```bash
# Ubuntu
sudo apt install virtualbox virtualbox-ext-pack

# Via Nix
nix-env -iA nixpkgs.virtualbox
```

### La VM no arranca con GUI

Verifica que VirtualBox Guest Additions estén instaladas. La imagen `bento/ubuntu-24.04` suele incluirlas por defecto.

### Ansible falla durante el provisionamiento

Puedes re-ejecutar solo el aprovisionamiento sin recrear la VM:

```bash
vagrant provision
```

Para depuración con más verbosidad, el `Vagrantfile` ya incluye `ansible.verbose = "vv"`.

### No se puede conectar a la red privada

Verifica que la red privada de Vagrant esté activa:

```bash
vagrant status
vagrant reload
```
