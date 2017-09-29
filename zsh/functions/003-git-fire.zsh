#!/usr/bin/env sh

# Helpers.
_git-fire_current_branch() {
	basename "$(git symbolic-ref HEAD)"
}

_git-fire_current_epoch() {
	date +%s
}

_git-fire_user_email() {
	git config user.email
}

_git-fire_new_branch() {
	echo "fire-${1:-$(_git-fire_current_branch)}-$(_git-fire_user_email)-$(_git-fire_current_epoch)"
}

git-fire() {
    initial_branch="$(_git-fire_current_branch)"

	git checkout -b "$(_git-fire_new_branch)"

	# cd to git root directory
	cd "$(git rev-parse --show-toplevel)"

	git add -A

	if test -z "$1"; then
		message="Fire! Branch $(_git-fire_current_branch)."
	else
		message="$*"
	fi

	# for git >= 2.x add the --no-gpg-sign flag
 	if git version | grep \\s2\. > /dev/null; then
 		nosignflag="--no-gpg-sign"
 	else
 		nosignflag=""
 	fi
 
 	git commit -m "$message" --no-verify $nosignflag

	for remote in $(git remote); do
		git push --set-upstream "${remote}" "$(_git-fire_current_branch)" || true
	done

    if test -n "$(git stash list)"; then
        for sha in $(git rev-list -g stash); do
            git push origin "$sha":refs/heads/"$(_git-fire_current_branch $initial_branch)"-stash-"$sha"
        done
    fi

	printf "\n\nLeave building!\n"
}