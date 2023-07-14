#!/bin/bash
# save this file to ${HOME}/.config/clash/start-clash.sh

# save pid file
echo $$ > ${HOME}/.config/clash/clash.pid

diff ${HOME}/.config/clash/config.yaml <(curl -s ${CLASH_URL})
if [ "$?" == 0 ]
then
    /usr/local/bin/clash -d ${HOME}/.config/clash
else
    TIME=`date '+%Y%m%d%H%M%S'`
    cp ${HOME}/.config/clash/config.yaml "${HOME}/.config/clash/config.yaml.${TIME}"
    curl -L -o ${HOME}/.config/clash/config.yaml ${CLASH_URL}
    sed -i '40i\external-ui: /home/yang/Applications/clash/ui' ${HOME}/.config/clash/config.yaml
    sed -i 's/log-level: silent/log-level: info/g' ${HOME}/.config/clash/config.yaml
    /usr/local/bin/clash -d ${HOME}/.config/clash
fi
