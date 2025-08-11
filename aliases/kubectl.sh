alias k="kubectl"
alias kx="kubectx"
alias kn="kubens"bn
alias kprd="kubectx core-prd"
alias kstg="kubectx core-stg"
alias kdev="kubectx core-dev"
alias kcare="kubens carejourney"
alias kpods="kubectl get pods"

alias kpickpod="k get pods -o json | jq '.items[].metadata.name' -r | fzf"

kpickcontainer() {
	k get pod "${1}" -o json | jq '.spec.containers[].name' -r | fzf --select-1
}

kexec() {
	local pod
	local container

	pod=`kpickpod`
	if test -z "$pod"; then
		return
	fi

	container=`kpickcontainer $pod`
	if test -z "$container"; then
		return
	fi

	kubectl -it exec -c "$container" "$pod" -- /bin/bash
}

klogs() {
	local pod
	local container

	pod=`kpickpod`
	if test -z "$pod"; then
		return
	fi

	container=`kpickcontainer $pod`
	if test -z "$container"; then
		return
	fi

	kubectl logs -f -c "$container" "$pod"
}
