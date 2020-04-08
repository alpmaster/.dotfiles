#Kubernetes
export KUBE_EDITOR="nano"
source <(kubectl completion bash)
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
[ -f ~/complete_alias ] && source ~/complete_alias
for _a in $(sed '/^alias /!d;s/^alias //;s/=.*$//' ~/.kubectl_aliases); do
  complete -F _complete_alias "$_a"
done
alias kw='watch -n 0.5 "kubectl config current-context; echo ''; kubectl config view | grep namespace; echo ''; kubectl get namespace,node,ingress,pod,svc,job,cronjob,deployment,rs,pv,pvc,secret,ep -o wide"'
