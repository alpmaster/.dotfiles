###Kubernetes

export KUBE_EDITOR="mcedit"
export ETCDCTL_API=3
#export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

source <(kubectl completion bash)
source <(kubeadm completion bash)

[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases

[ -f ~/.dotfiles/complete-alias/complete_alias ] && source ~/.dotfiles/complete-alias/complete_alias
for _a in $(sed '/^alias /!d;s/^alias //;s/=.*$//' ~/.kubectl_aliases); do
  complete -F _complete_alias "$_a"
done

[ -f ~/.dotfiles/kube-ps1/kube-ps1.sh ] && source ~/.dotfiles/kube-ps1/kube-ps1.sh
export PS1='[\u@\h \W $(kube_ps1)]\$ '

alias kw='watch -n 0.5 "kubectl config current-context; echo ''; kubectl config view | grep namespace; echo ''; kubectl get namespace,node,ingress,pod,svc,job,cronjob,deployment,rs,pv,pvc,secret,ep -o wide"'
alias ke='watch -n 0.5 "kubectl get events --sort-by='.metadataCreationstamp' | tail -6"'
