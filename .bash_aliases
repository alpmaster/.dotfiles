#Kubernetes
source <(kubectl completion bash)
complete -F __start_kubectl k
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
function kubectl() { echo "+ kubectl $@">&2; command kubectl $@; }
alias kw='watch -n 0.5 "kubectl config current-context; echo ''; kubectl config view | grep namespace; echo ''; kubectl get namespace,node,ingress,pod,svc,job,cronjob,deployment,rs,pv,pvc,secret,ep -o wide"'