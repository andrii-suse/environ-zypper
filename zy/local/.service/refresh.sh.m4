(
mkdir -p __workdir/__service/var/log
export ZYPP_LOGFILE=__workdir/__service/var/log/zypper.log
SECONDS=0
zypper --root __workdir/__service -n --gpg-auto-import-keys --no-gpg-checks refresh "$@"
echo $SECONDS > __workdir/__service/.times_refresh
)
