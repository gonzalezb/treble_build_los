
## Building PHH-based LineageOS GSIs ##

To get started with building LineageOS GSI, you'll need to get familiar with [Git and Repo](https://source.android.com/source/using-repo.html) as well as [How to build a GSI](https://github.com/phhusson/treble_experimentations/wiki/How-to-build-a-GSI%3F).

First, open a new Terminal window, which defaults to your home directory.  Clone the modified treble_experimentations repo there:

    git clone https://github.com/AndyCGYan/treble_experimentations

Create a new working directory for your LineageOS build and navigate to it:

    mkdir lineage-17.x-build-gsi; cd lineage-17.x-build-gsi

Initialize your LineageOS workspace:

    repo init -u https://github.com/LineageOS/android.git -b lineage-17.1

Clone the modified treble patches and this repo:

    git clone https://github.com/gonzalezb/device_phh_treble.git
    git clone https://github.com/gonzalezb/treble_build_los -b lineage-17.1

Must run this command to sync repo before running gapps.sh:

    repo sync

(This command is optional run if you want gapps included! If you do not run this script it will default to no gapps)

Run the folowing command to download OpenGapps manifest:

    . treble_build_los/gapps.sh

Run this command again:

    repo sync

Run this command to download OpenGapps files:

    repo forall -c git lfs pull

Finally, start the build script:

    bash treble_build_los/buildbot_treble.sh

Be sure to update the cloned repos from time to time!
