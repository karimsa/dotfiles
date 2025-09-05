alias k="kubectl"
alias kpods="kubectl get pods"
alias kpickpod="k get pods -o json --field-selector=status.phase=Running | jq '.items[].metadata.name' -r | fzf"

kctx() {
	query="$1"

	if test -z "$query"; then
		kubectx
		return
	fi

	kubectx `kubectl config get-contexts --output=name | fzf --query="$query" --select-1`
}

kns() {
	query="$1"

	if test -z "$query"; then
		kubens
		return
	fi

	kubens `kubectl get namespaces --output name | sed 's/namespace\///' | fzf --query="$query" --select-1`
}

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
