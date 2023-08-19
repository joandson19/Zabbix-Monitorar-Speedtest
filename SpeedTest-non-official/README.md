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
![image](https://github.com/joandson19/Zabbix-Monitorar-Speedtest/assets/36518985/0a99bcd5-381b-4862-a10b-07f20bf5e188)

### Após vamos criar uma nova pasta em /etc/zabbix e baixar os arquivos
```
# mkdir /etc/zabbix/scripts
# cd /tmp
# git clone https://github.com/joandson19/Zabbix-Monitorar-Speedtest.git
# cd Zabbix-Monitorar-Speedtest/
# mv speedtest_* /etc/zabbix/scripts/
# mv userparameter_speedtest.conf /etc/zabbix/zabbix_agentd.d/
# cd ..
# rm -rf Zabbix-Monitorar-Speedtest/
```
### Permissões
```
# chown zabbix. -R /etc/zabbix/scripts
# chmod +x /etc/zabbix/scripts
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
speedtest --list
```
![image](https://github.com/joandson19/Zabbix-Monitorar-Speedtest/assets/36518985/3ec3c3c3-abf1-4e56-b310-9380e4d34b31)

* Anote a id do server que você escolheu

### Vá até o seu zabbix e importe o template 
[https://github.com/joandson19/Templates-Zabbix/blob/main/speedtest/template_speedtest.xml](https://github.com/joandson19/Templates-Zabbix/blob/main/speedtest/template_speedtest.xml)
### Crie o novo host da forma que achar melhor.

* Crie o host e atribua o template que você importou 
* Em interface agente use o ip 127.0.0.1

![image](https://github.com/joandson19/Zabbix-Monitorar-Speedtest/assets/36518985/44d20f22-86e7-415f-9fbf-d72439226869)

* Em Macros herdadas e do host atribua a macro {$SERVER_ID} o valor de id do server! 

![image](https://github.com/joandson19/Zabbix-Monitorar-Speedtest/assets/36518985/55491399-ebd2-49df-9662-3182dd82b7d9)

### Se você seguiu todos os passou corretamente, após salvar é só executar os itens "Speed-Teste Download" e "Speed-Teste Upload" manualmente para testar e verificar os resultados em Dados Recentes.
### Execute um item e após 1 minutos execute o outro para evitar resultado falso devido a possível estouro de banda da porta.
![image](https://github.com/joandson19/Zabbix-Monitorar-Speedtest/assets/36518985/49361849-966e-4093-a3cd-655af64c6efa)
``
Exemplo de retorno em Dados Recentes.
``
![image](https://github.com/joandson19/Zabbix-Monitorar-Speedtest/assets/36518985/4eb23cea-b592-460b-b01b-271a5c41d41d)
