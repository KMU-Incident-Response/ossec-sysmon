# ossec-sysmon

## A Ruleset to enhance detection capabilities of Ossec using Sysmon
Special thanks to [@Hestat](https://github.com/Hestat) for the primary [ossec-sysmon](https://github.com/Hestat/ossec-sysmon) repository, which made this possible.

## manuelle Installation von Rules
Die Regeln können über den [universal Installer](../universal_installer/README.md) installiert werden.
1. Login als Root auf dem zukünftigen Wazuh Server
2. Installieren von vorbereiteten Regeln
``` bash 
curl -s https://raw.githubusercontent.com/KMU-Incident-Response/KMU-Basis-Logging/main/universal_installer/installer.sh | bash -s -- -o
```
3. Login auf dem Web UI mit dem Elastic User und dem Passwort in der Shell ersichtlich