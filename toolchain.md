# Toolchain Cheat Sheet

| Name                    | Tool URL                                                                                            | Username | Password
|-------------------------|-----------------------------------------------------------------------------------------------------|----------|--------------------------------------------------------------
| Private Docker Registry |
| Taiga                   | http://192.168.0.11:8080/                                                                           | admin    | 123123
| GitLab                  | http://192.168.0.11:10080/                                                                          | root     | password
| Drone                   | http://192.168.0.11                                                                                 | N/A      | N/A
| SonarQube               | http://192.168.0.11:9000/                                                                           | admin    | admin
| PlantUML Server         | http://192.168.0.11:8081                                                                            | N/A      | N/A
| Kubernetes Dashboard    | https://192.168.0.11:6443/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy  | admin    | user/password returned by `./get_kubeconfig_yml.sh` and token returned by `./get_k3s_token.sh`
| Traefik Ingresses       | http://192.168.0.11:8082<path associated with service>                                              | N/A      | N/A 
| Traefik Dashboard       | http://192.168.0.11:8083/dashboard/                                                                 | N/A      | N/A
