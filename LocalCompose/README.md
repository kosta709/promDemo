*** Prometheus on Local Docker

`docker-compose up -d`

Query FS Usage

up

{__name__ =~ ".*", job = "kubernetes-pods"}

docker run -it progrium/stress --cpu 2 --io 4 --vm 2 --vm-bytes 128M --timeout 600s


(rate(container_cpu_system_seconds_total{id="/", image="" }[5m]) + rate(container_cpu_user_seconds_total{id="/", image="" }[5m])) * 100  /  on (node) group_left() machine_cpu_cores