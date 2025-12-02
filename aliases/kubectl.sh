alias k="kubectl"
alias kpods="kubectl get pods"

kpickpod() {
	query="$1"
	k get pods -o json | jq '.items[].metadata.name' -r | fzf --query="$query" --select-1
}

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
	kubens `kubectl get namespaces --output name | sed 's/namespace\///' | fzf --query="$query" --select-1`
}

kpickcontainer() {
	pod="$1"
	container_query="$2"

	k get pod "${pod}" -o json | jq '.spec.containers[].name' -r | fzf --query="${container_query}" --select-1
}

kexec() {
	local pod
	local container

	query="$1"
	pod=`kpickpod $query`
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

	query="$1"
	pod=`kpickpod $query`
	if test -z "$pod"; then
		return
	fi

	container=`kpickcontainer $pod`
	if test -z "$container"; then
		return
	fi

	kubectl logs -f -c "$container" "$pod"
}

kjsonlogs() {
	local pod
	local container

	query="$1"
	pod=`kpickpod $query`
	if test -z "$pod"; then
		return
	fi

	container=`kpickcontainer $pod`
	if test -z "$container"; then
		return
	fi

	kubectl logs -f -c "$container" "$pod" | npx pino-pretty@12
}

kdelete() {
	query="$1"
	pod=`kpickpod $query`
	kubectl delete pod/"${pod}"
}
