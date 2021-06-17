#!/bin/bash

# a message regarding the creation/addition of a gpg key
gpg_message=$(<< EOM
You may want to generate/add a gpg key as well, you can follow the tutorial at https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/generating-a-new-gpg-key for more information.

If you are having problems getting git to use the gpg key on a commit, visit the problem here https://stackoverflow.com/questions/39494631/gpg-failed-to-sign-the-data-fatal-failed-to-write-commit-object-git-2-10-0
EOM
)

echo $gpg_message | tee $HOME/Documents/next_steps.txt
