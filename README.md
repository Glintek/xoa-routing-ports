# XOA Routing Ports

A tool for managing routing ports

## Installation

You can install the tool using the following command:

```bash
curl -sSL https://raw.githubusercontent.com/Glintek/xoa-routing-ports/main/install.sh | bash
```
This will install the cli at current working directory

To make CLI install and require system to use our configuaraton for firewall, please run:
```bash 
doas ./xoa-routing-ports install
```
Now router will use this cli conf (please remove if not use it anymore)

## Usage

After installation, you can run the tool using:

```bash
./xoa-routing-ports
```

## Usage

### Check System Health
```bash
doas ./xoa-routing-ports health
```

### Port Forwarding

#### Add a Port Forward
```bash
doas ./xoa-routing-ports forward --from-port <local-port> --to <destination-ip:port>
```
Example:
```bash
doas ./xoa-routing-ports forward --from-port 80 --to 192.168.20.100:8080
```

#### List Active Forwards
```bash
doas ./xoa-routing-ports list
```

#### Remove a Port Forward
```bash
doas ./xoa-routing-ports unforward <local-port>
```
Example:
```bash
doas ./xoa-routing-ports unforward 80
```

### Configuration Management

#### Update Base Configuration
```bash
doas ./xoa-routing-ports update-base
```

#### Restore Original Configuration
```bash
doas ./xoa-routing-ports restore
```

#### Uninstall
```bash
doas ./xoa-routing-ports uninstall
```
Remove system config
```bash
doas ./uninstall.sh
```

