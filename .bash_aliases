###Kubernetes

export KUBE_EDITOR="mcedit"
export ETCDCTL_API=3

source <(kubectl completion bash)
source <(kubeadm completion bash)

#https://github.com/ahmetb/kubectl-aliases
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases

#https://github.com/cykerway/complete-alias
[ -f ~/.dotfiles/complete-alias/complete_alias ] && source ~/.dotfiles/complete-alias/complete_alias
for _a in $(sed '/^alias /!d;s/^alias //;s/=.*$//' ~/.kubectl_aliases); do
  complete -F _complete_alias "$_a"
done
for _a in $(sed '/^alias /!d;s/^alias //;s/=.*$//' ~/.bash_aliases); do
  complete -F _complete_alias "$_a"
done

#https://github.com/jonmosco/kube-ps1
[ -f ~/.dotfiles/kube-ps1/kube-ps1.sh ] && source ~/.dotfiles/kube-ps1/kube-ps1.sh
export PS1='[\u@\h \W $(kube_ps1)]\$ '

#https://github.com/ahmetb/kubectx
[ -f $HOME/.dotfiles/kubectx/completion/kubectx.bash ] && source $HOME/.dotfiles/kubectx/completion/kubectx.bash
export PATH="$HOME/.dotfiles/kubectx:$PATH"

#export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

#my alias
alias kc='kubectl create'
alias kce='kubectl create --edit -f'
alias kcoyaml='kubectl create --dry-run -o yaml'
alias kctx='kubectx'
alias ke='kubectl explain'
alias kev='watch -n 0.5 "kubectl get events --sort-by=.metadata.creationTimestamp | tail -5"'
alias kns='kubens'
alias kr='kubectl run'
alias kr='kubectl replace --force -f'
alias kroyaml='kubectl run --dry-run -o yaml'
alias krpo='kubectl run --generator=run-pod/v1'
alias krpooyaml='kubectl run --generator=run-pod/v1 --dry-run -o yaml'
alias kw='watch -n 0.5 "kubectl get namespace,node,ingress,pod,svc,job,cronjob,deployment,rs,pv,pvc,secret,ep -o wide"'

