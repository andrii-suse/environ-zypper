(
SECONDS=0
zypper --root __workdir/__service -n --gpg-auto-import-keys --no-gpg-checks refresh "$@"
echo $SECONDS > __workdir/__service/.times_refresh
)
