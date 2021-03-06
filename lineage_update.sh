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
repo sync -c --force-sync --no-clone-bundle --no-tags -j$(nproc --all)
echo ""

# This downloads the gapps manifest and also pulls it in from the repo and downloads the gapps files
if [[ ! -e .repo/local_manifests/opengapps.xml ]]; then
    echo "Downloading OpenGapps Manifest"
    mkdir -p .repo/local_manifests
    wget https://raw.githubusercontent.com/gonzalezb/gsi_gapps_manifest/main/opengapps.xml -P .repo/local_manifests
    repo sync
    echo "Downloading OpenGapps"
    echo "Be patient this will take awhile to download if its your first time!"
    echo ""
    for i in vendor/opengapps/sources/all vendor/opengapps/sources/arm vendor/opengapps/sources/arm64; do cd $HOME/lineage-17.x-build-gsi/$i; git lfs pull; done
    echo ""
    cd $HOME/lineage-17.x-build-gsi
fi

# This updates the actual Gapps files may be large
echo "Updating OpenGapps"
echo "This may take a minute to update!"
echo ""
for i in vendor/opengapps/sources/all vendor/opengapps/sources/arm vendor/opengapps/sources/arm64; do cd $HOME/lineage-17.x-build-gsi/$i; git lfs pull; done
echo ""

# This corrects directory structure caused by last command
echo "Correcting directory structure"
echo ""
cd $HOME/lineage-17.x-build-gsi
echo ""

# Sync lineage source one last time or bad things happen
echo "Syncing source one last time!"
echo ""
repo sync
echo ""
