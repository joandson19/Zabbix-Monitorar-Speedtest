# Com SpeedTest Offícial 

```
# sudo apt-get remove speedtest-cli
# sudo apt-get install curl
# curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
# sudo apt-get install speedtest
```

## Execute o comando speedtest com o usuario do zabbix e aceite os termos antes de iniciarmos os testes no zabbix!
```
# sudo -u zabbix speedtest
```
* Ele irá pedir para aceitar os termos "YES" "YES"

## Agora vamos selecionar o servidor que usaremos no teste.
```
# sudo -u zabbix speedtest -L
```
![image](https://github.com/joandson19/Zabbix-Monitorar-Speedtest/assets/36518985/62688540-2099-431a-9e10-07ccd0e08a0a)

## Após isso vamos executar com o usuario zabbix
```
# sudo -u zabbix speedtest -s 12561 --format=json -A
```
* O numero 12561 é o ID do servidor que eu escolhi da lista e --format define que queremos o retorno em json

## Crie o arquivo speedtest.conf com o conteúdo de agente de monitoramento
```
# cd /etc/zabbix/zabbix_agentd.d
# cat <<EOF > speedtest.conf
UserParameter=speedtest_download[*],speedtest --format=json -A -s $1
UserParameter=speedtest_upload[*],speedtest --format=json -A -s $1
EOF
```

## Reinicie o zabbix agent
```
# service zabbix-agent restart
```

## Após vá até o servidor zabbix!
* Importe o template_speedtest_official.xml
* Crie um novo host e set o ip agent = 127.0.0.1 ou use o host zabbix !
* Adicione o template e execute o item manualmente para verificar. 
