#!/usr/bin/env sh

# Get the current branch in a Git repository
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Autocomplete for Git
git_completion=${HOME}/.git/.git-completion.bash
[ -f ${git_completion} ] && source ${git_completion}

