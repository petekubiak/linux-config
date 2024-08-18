# Storing git credentials
To store git credentials run
```sh
git config credential.helper store
```
Next time you enter username and password it will be stored **as plain text** in `~/.git-credentials`.
Therefore it is recommended to use an access token rather than your actual password.
