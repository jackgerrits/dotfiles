# Source Nix setup script
fenv source ~/.nix-profile/etc/profile.d/nix.sh

# This starts nix-shell as the currently running shell and shows the list of
# packages in the shell to the right of the prompt.
any-nix-shell fish --info-right | source

# Aliases
alias pip 'python3 -m pip'
alias python 'python3'
alias c 'code'

set fish_greeting

function fmt-branch -d "Run clang-format-diff against given branch" --argument-names 'comparebranch'
    if test -n "$comparebranch"
        nix-shell -p clang-format-diff --command "git diff $comparebranch...HEAD -U0 --no-color | clang-format-diff -r '^.*\.(cc|h)\$' -p1 -i"
    else
        echo "Usage: fmt-branch BRANCH_TO_DIFF"
    end
end
