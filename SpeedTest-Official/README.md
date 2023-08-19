# Com SpeedTest Offícial 

# sudo apt-get remove speedtest-cli
# sudo apt-get install curl
# curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
# sudo apt-get install speedtest

## Execute o comando speedtest com o usuario do zabbix e aceite os termos antes de iniciarmos os testes no zabbix!
```
# sudo -u zabbix speedtest
```
* Ele irá pedir para aceitar os termos "YES "YES"

## Após isso vamos executar com o usuario zabbix
```
# sudo -u zabbix speedtest -s 8927 --format=json -A
```
* O numero 8927 é um servidor ficticio e --format define que queremos o retorno em json

## Crie o arquivo speedtest.conf com o conteúdo de agente de monitoramento
```
# cd /etc/zabbix/zabbix_agentd.d
# cat <<EOF > speedtest.conf
UserParameter=speedtest[*],speedtest --format=json -A -s $1
EOF
```

## Reinicie o zabbix agent
```
# service zabbix-agent restart
```

