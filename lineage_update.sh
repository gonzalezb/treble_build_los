#! /bin/bash -
echo ""
echo "Lineage 17.x Sources update script"
echo "ATTENTION: this script syncs repo on each run"
echo "Executing in 5 seconds - CTRL-C to exit"
echo ""
sleep 5

# This syncs Lineage source must be done in order to download gapps source
echo "Syncing Lineage Sources"
echo ""
repo sync
echo ""

# This downloads the gapps manifest only if its not present already
if [[ ! -e .repo/local_manifests/opengapps.xml ]]; then
    echo "Downloading OpenGapps Manifest"
    mkdir -p .repo/local_manifests
    wget https://raw.githubusercontent.com/gonzalezb/gsi_gapps_manifest/main/opengapps.xml -P .repo/local_manifests
fi

# Syncs all sources again to download gapps source
echo "Syncing OpenGapps Sources"
echo ""
repo sync
echo ""

# This downloads the actual Gapps files very large
echo "Downloading OpenGapps"
echo "Be patient this will take awhile to download if its your first time!"
echo ""
for i in vendor/opengapps/sources/all vendor/opengapps/sources/arm vendor/opengapps/sources/arm64; do cd $HOME/lineage-17.x-build-gsi/$i; git lfs pull; done
echo ""

# This corrects directory structure caused by last command
echo "Correcting directory structure"
echo ""
cd $HOME/lineage-17.x-build-gsi
echo ""

# Syncs Lineage Source one last time
echo "Syncing repos"
repo sync -c --force-sync --no-clone-bundle --no-tags -j$(nproc --all)
echo ""
