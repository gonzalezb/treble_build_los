#!/bin/bash
#!/bin/bash
echo "Downloading manifest for OpenGapps"
echo "This script only needs to be ran onetime! Unless you are downloading lineageOS source code again!"
mkdir .repo/local_manifests
wget https://raw.githubusercontent.com/gonzalezb/gsi_gapps_manifest/main/opengapps.xml -P .repo/local_manifests
ls .repo/local_manifests
echo "Done now run: bash treble_build_los/buildbot_treble.sh"
echo ""
