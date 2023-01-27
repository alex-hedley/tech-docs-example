# Scripts

- [GitHub Actions: Fixing the 'Permission Denied' error for shell scripts](https://aileenrae.co.uk/blog/github-actions-shell-script-permission-denied-error/)

`git update-index --chmod=+x your_script.sh`

```
Run _scripts/moj/build.sh
  _scripts/moj/build.sh
  shell: sh -e {0}
/__w/_temp/06037362-ab92-4663-9115-63aa7860b3c4.sh: line 1: _scripts/moj/build.sh: Permission denied
Error: Process completed with exit code 126.
```
