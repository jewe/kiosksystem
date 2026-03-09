# AGENTS.md

This repository contains **system-level shell scripts** to install and operate an **Ubuntu MATE kiosk system**.

This file is written for both humans and automated coding agents. It documents what this repo does, how it is typically installed, and the constraints you must respect when changing things.

## What this project is

- **Primary target**: Ubuntu MATE (README mentions Ubuntu MATE; `setup_system.sh` says *Ubuntu MATE 24.04.1*).
- **Purpose**: turn a freshly installed system into a kiosk by:
  - creating a `kiosk` user
  - disabling screen blanking/lock screens/notifications
  - installing kiosk helper tools (xdotool, scrot, unclutter, etc.)
  - installing kiosk applications (Chromium, Chrome, slideshow, video, node-service, monitoring, …)
  - wiring apps into autostart and simple “service enable/disable” toggles
  - optionally enabling a **read-only root filesystem** via overlayroot

## Repository map (where things live)

- `setup_system.sh`: **Step 1** system setup (package removal, OS config, overlayroot prep, installs kiosk helper functions into `/etc/bash.bashrc`, then calls kiosk-user + desktop setup).
- `setup_02_kiosk-user.sh`: creates the `kiosk` user and configures privileges/ssh keys.
- `setup_03_mate-desktop.sh`: desktop UI/panel/background configuration via `gsettings`/`dconf`.
- `setup_kiosk_user.sh`: kiosk user session defaults and then calls `install_kiosk_software.sh`.
- `install_kiosk_software.sh`: installs core kiosk helper packages (node tooling, vnc, monitoring, …).

- `install_*.sh`: installers for specific kiosk apps and features.
  - These scripts typically:
    - copy an app runner to `/opt/*.sh`
    - drop an autostart `.desktop` file into `/home/{kiosk,user}/.config/autostart/`
    - enable/disable via `kioskctl` (see below)

- `opt/*.sh`: the actual runtime scripts that autostart uses (e.g. `/opt/chromium-browser.sh`, `/opt/slideshow.sh`).
- `opt/global_functions`: common bash functions that are appended to `/etc/bash.bashrc` during setup.
- `autostart/*.desktop`: desktop autostart entries.
- `services/*.service`: systemd units for performance tuning etc.
- `etc/rc.local`: installed to `/etc/rc.local` during setup.
- `www/index.html`: nginx webroot replacement.
- `docs/*`: operational notes.
- `rpi/*`: Raspberry Pi related scripts/services.
- `tests/*`: small operational test scripts.

## Assumptions baked into scripts

Many scripts assume the repo is cloned to:

```
/opt/tmp/kiosksystem
```

Examples:

- `setup_system.sh` appends `/opt/tmp/kiosksystem/opt/global_functions` into `/etc/bash.bashrc`.
- `kioskhelp` opens `/opt/tmp/kiosksystem/Commands.md`.

When editing scripts, try not to break this convention unless you also update the rest of the stack and documentation.

## “Services” model: kioskctl, enable/disable, logs

The kiosk uses a very lightweight toggle system:

- Service state files:
  - `/opt/kiosk/services/<service>` contains `enabled` or `disabled`
- Logs:
  - `/opt/kiosk/logs/kiosk.log` and `/opt/kiosk/logs/<service>.log`
- The helpers live in `opt/global_functions` and are intended to be sourced from `/etc/bash.bashrc`.

Key commands (also see `Commands.md`):

- `kioskctl enable <service>` / `kioskctl disable <service>`
- `kioskstatus` (mount status, IPs, services, logs, git status)
- `kioskmount ro|rw` (switch overlayroot mode; triggers reboot)
- `kiosktest` (basic checks)
- `kiosklogsclear` (truncate logs)

The runtime scripts in `/opt/*.sh` usually do:

- derive `SERVICE` name from their filename
- `exit_if_disabled "$SERVICE"`
- loop forever to restart the app after crashes

## Typical installation flow (high level)

From `README.md`:

1. Install Ubuntu MATE.
2. Clone repo to `/opt/tmp/kiosksystem` and run:
   - `sh setup_system.sh` (step 1)
3. Reboot, login as `kiosk`, then:
   - `sh setup_kiosk_user.sh`
   - `sh install_kiosk_software.sh`
4. Install desired kiosk apps:
   - `sh install_chromium-browser.sh` / `sh install_google-chrome.sh` / `sh install_slideshow.sh` / …
5. Optional:
   - `sh setup_secrets.sh`
   - `sh lockdown.sh` (read-only mounting / removing sudo from kiosk, etc.)

## Safety rules (important)

This repo is **not** a typical application/library. Scripts here can:

- remove packages (`apt remove --purge ...`)
- modify `/etc/*` (LightDM config, rc.local, bashrc)
- modify `/usr/share/backgrounds/*`
- enable/disable system services
- reboot the machine
- change root filesystem mode via overlayroot

If you are an automated agent:

- Do **not** suggest running install/setup scripts on a developer workstation.
- When asked to change behavior, **modify scripts first**, then document the operational impact.
- Keep changes as **idempotent** as practical (safe to run more than once).
- Prefer small, reviewable diffs.

## Editing conventions for this repo

- Most logic is in **bash/sh** scripts.
- Preserve existing comments and operational notes. **Never remove existing comments** unless explicitly asked.
- Avoid large refactors unless requested; these scripts run on real machines and are often executed manually.
- When changing paths or service names, also update:
  - `autostart/*.desktop`
  - `opt/*.sh`
  - `Commands.md` / `README.md`
  - any `install_*.sh` that copies/enables them

## How to validate changes (without installing a kiosk)

On a development machine (safe checks):

- Syntax check scripts:
  - `bash -n <script.sh>`
- Basic grep/search sanity checks when renaming:
  - search for the old service name/path across repo

On a real kiosk/VM (only when intended):

- Verify:
  - `/opt/kiosk/services/*` contains expected states
  - `/opt/kiosk/logs/*.log` gets new entries
  - autostart `.desktop` exists for the correct user
  - the `/opt/<service>.sh` runner loops and respects enable/disable
  - `kioskstatus` output is sensible

## Common operational touchpoints

- Autostart entries:
  - `/home/kiosk/.config/autostart/`
  - `/home/user/.config/autostart/`
- Web root (nginx):
  - `/var/www/html/` (replaced by `www/index.html` in installer)
- Display power scheduling:
  - cron entries may call `/opt/turn-off-display.sh` and `/opt/turn-on-display.sh`

## When you (as an agent) are asked to implement something

Please:

1. Identify where it fits (installer `install_*.sh`, runtime script in `opt/`, autostart `.desktop`, docs).
2. Keep backward compatibility with the `/opt/tmp/kiosksystem` convention unless the user requests otherwise.
3. Update documentation in `README.md`/`Commands.md`/`docs/*` when behavior changes.
4. Call out any change that:
   - alters autologin behavior
   - alters read-only filesystem behavior
   - changes security posture (ssh keys, sudoers, remote access)
