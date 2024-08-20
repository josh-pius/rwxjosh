### General
 - systemctl command **manages both system and service configurations, enabling administrators to manage the OS and control the status of services**

### Enable vs Start
- `systemctl enable` and `systemctl start` do different things
- `enable` will hook the specified unit into relevant places, so that it will automatically start on boot, or when relevant hardware is plugged in, or other situations depending on what's specified in the unit file.
- `start` Starts the unit right now.
- `disable` and `stop` are the opposite of these, respectively