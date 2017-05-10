# promDemo

### Prometheus Demo

Provisions demo environment for Prometheus Stack ( https://prometheus.io/docs/introduction/overview/ )

prometheus + alertmanager, cadvisor, consul, consul-exporter, grafana

`vagrant up` will create 2 nodes srv1 [172.29.1.100] and node1 [172.29.1.101] and provision them this docker + docker-compose


##### Start Prometheus Server 
`ssh -p 10022 vagrant@172.29.1.100`

```bash

cd /vagrant
docker-compose up -f docker-compose-node.yml
```

http://172.29.1.100:9090 - Prometheus
http://172.29.1.100:9093 - Alertmanager
http://172.29.1.100:3000 - Grafana (admin:cf12345)
http://172.29.1.100:720 - Cadvisor
http://172.29.1.100:8500 - Consul Server


##### Start Demo node on 172.29.1.101
`ssh -p 10122 vagrant@172.29.1.101`

```bash

cd /vagrant
docker-compose up -f docker-compose-server.yml
```

http://172.29.1.101:720 - Cadvisor on node1



