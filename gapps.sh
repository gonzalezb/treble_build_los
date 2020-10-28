#!/bin/bash
#!/bin/bash
echo "Downloading manifest for OpenGapps"
echo "This script only needs to be ran onetime! Unless you are downloading lineageOS source code again!"
wget https://raw.githubusercontent.com/gonzalezb/gsi_gapps_manifest/main/opengapps.xml -P .repo/manifests
ls .repo/manifests
echo "Done now run: bash treble_build_los/buildbot_treble.sh"
echo ""
