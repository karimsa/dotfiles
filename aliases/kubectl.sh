alias k="kubectl"
alias kx="kubectx"
alias kn="kubens"bn
alias kprd="kubectx core-prd"
alias kstg="kubectx core-stg"
alias kdev="kubectx core-dev"
alias kcare="kubens carejourney"
alias kpods="kubectl get pods"

kexec() {
	local pod

	pod=`k get pods -o json | jq '.items[].metadata.name' -r | fzf`
	if test -z "$pod"; then
		return
	fi

	container=`k get pod ${pod} -o json | jq '.spec.containers[].name' -r | fzf --select-1`
	if test -z "$container"; then
		return
	fi

	kubectl -it exec -c "$container" "$pod" -- /bin/bash
}

