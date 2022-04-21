echo "Installing rules..."

repo_url="https://github.com/KMU-Incident-Response/KMU-Basis-Logging.git"
tmp_dir="/tmp/wazuh_rules"



clone_copy_rules (){
    mkdir -p $tmp_dir
    git clone $repo_url $tmp_dir
    cd "$tmp_dir"
    sed -i "s/git@github.com:/https:\/\/github.com\//" .git/config .gitmodules
    git submodule init
    git submodule update
    cd "$tmp_dir/custom_rules"
    cp 0*.xml /var/ossec/etc/rules/
    chown ossec:ossec -R /var/ossec/etc/rules/
    chmod 660 /var/ossec/etc/rules/0*.xml
    mkdir -p /var/ossec/etc/shared/windows
    cp windows-agent.conf /var/ossec/etc/shared/windows/agent.conf
    chmod 770 /var/ossec/etc/shared/windows
    chown -R ossec:ossec /var/ossec/etc/shared/windows
    chmod 660 /var/ossec/etc/shared/windows/agent.conf
    rm -Rf $tmp_dir
    systemctl restart wazuh-manager.service
}


if [ -d "/var/ossec/etc/rules/" ]; then
    clone_copy_rules &>/dev/null
else
    echo "Wazuh installation not found!"
    exit 1
fi