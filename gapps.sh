#!/bin/bash
mkdir .repo/local_manifests
wget https://raw.githubusercontent.com/gonzalezb/gsi_gapps_manifest/main/opengapps.xml -P .repo/local_manifests
ls .repo/local_manifests
