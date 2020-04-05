#Kubernetes
source <(kubectl completion bash)
complete -F __start_kubectl k
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
function kubectl() { echo "+ kubectl $@">&2; command kubectl $@; }