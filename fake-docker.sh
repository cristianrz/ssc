#!/bin/sh

ROOTFS="/home/crz/.local/var/lib/dockie/guests/ubuntu/rootfs/"

set -eu

_run() {
	unshare -u -p /proc/self/exe "$0" child "$@"
}

_child() {
	chroot "$ROOTFS" "$@"
}

_panic() {
	echo "$@"
	exit 1
}

cmd="$1"
shift

case "$cmd" in
run) _run "$@" ;;
child) _child "$@" ;;
*) _panic "what?" ;;
esac
