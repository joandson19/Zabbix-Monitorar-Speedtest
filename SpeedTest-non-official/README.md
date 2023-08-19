# Zabbix-Monitorar-Speedtest
## Antes de mais nada, vamos entender que o valor do teste estará limitado ao servidor escolhido e no limite da porta ethernet do zabbix.
* Acho bem óbvio, mas preciso explicar que se a sua porta ethernet for de 1GB ou 100MB não espere nada maior que isso no teste!
* Escolha também um servidor confiável, pois se for um servidor ruim o resultado do teste não será bom.
  
### Vamos começar instalando nossas ferramentas.
```
# apt update -y ; apt upgrade -y
# apt install speedtest-cli
```
### Teste para ver se está tudo ok
```
# speedtest-cli
```
### Após vamos criar uma nova pasta em /etc/zabbix e baixar os arquivos
```
# cd /etc/zabbix/zabbix_agentd.d/
# wget https://raw.githubusercontent.com/joandson19/Zabbix-Monitorar-Speedtest/main/SpeedTest-non-official/userparameter_speedtest.conf -O userparameter_speedtest.conf
```
### Altere o Timeout do zabbix-agent
```
# nano /etc/zabbix/zabbix_agentd.conf
Timeout=30
```
### Restart o zabbix agent
```
# service zabbix-agent restart
```
### Agora vamos coletar i id do server que usaremos para efetuar os testes! Lembre de escolher um server confiável. 
```
speedtest-cli --list
```
![image](https://github.com/joandson19/Zabbix-Monitorar-Speedtest/assets/36518985/b8f5a3ab-f641-412d-a4b3-2a400215a3fc)

* Anote a id do server que você escolheu

### Vá até o seu zabbix e importe o template 
[https://github.com/joandson19/Zabbix-Monitorar-Speedtest/blob/main/SpeedTest-non-official/template_speedtest_non-official.xml](https://github.com/joandson19/Zabbix-Monitorar-Speedtest/blob/main/SpeedTest-non-official/template_speedtest_non-official.xml)
### Crie o novo host da forma que achar melhor.

* Crie o host e atribua o template que você importou 
* Em interface agente use o ip 127.0.0.1
* Em Macros herdadas e do host atribua a macro {$SERVER_ID} o valor de id do server! 

### Se você seguiu todos os passou corretamente, após salvar é só executar os itens "Speed-Teste Download" e "Speed-Teste Upload" manualmente para testar e verificar os resultados em Dados Recentes.
### Execute um item e após 1 minutos execute o outro para evitar resultado falso devido a possível estouro de banda da porta.
