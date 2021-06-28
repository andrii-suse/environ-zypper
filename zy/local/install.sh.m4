for s in $(cat __libdir/.service.lst); do
    __workdir/$s/install "$@"
done
