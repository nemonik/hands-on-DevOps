# Toolchain Cheat Sheet

| Name                           | Tool URL                                                                                                     | Username | Password
|--------------------------------|-------------------------------------------------------------------------------------------------------------|----------|--------------------------------------------------------------
| Private container registry     | http://192.168.0.10:5000/v2/_catalog                                                                        |          |
| Passthrough container registry | http://192.168.0.10:5001/v2/_catalog                                                                        |          |
| Taiga                          | http://192.168.0.204                                                                                        | admin    | 123123
| GitLab                         | http://192.168.0.202                                                                                        | root     | password
| Drone                          | http://192.168.0.10                                                                                         | N/A      | N/A
| SonarQube                      | http://192.168.0.205:9000/                                                                                  | admin    | admin
| PlantUML Server                | http://192.168.0.203                                                                                        | N/A      | N/A
| Kubernetes Dashboard           | https://192.168.0.10:6443/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy | admin    | user/password returned by `./get_kubeconfig_yml.sh` and token returned by `./get_k3s_token.sh`
| Traefik Ingresses              | http://192.168.0.206/<path associated with service>                                                         | N/A      | N/A 
| Traefik Dashboard              | http://192.168.0.206:8080/dashboard/                                                                        | N/A      | N/A
