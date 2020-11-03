
## Building PHH-based LineageOS GSIs with Gapps ##

To get started with building LineageOS GSI, you'll need to get familiar with [Git and Repo](https://source.android.com/source/using-repo.html) as well as [How to build a GSI](https://github.com/phhusson/treble_experimentations/wiki/How-to-build-a-GSI%3F).

First, open a new Terminal window, which defaults to your home directory.  Clone the modified treble_experimentations repo there:

    git clone https://github.com/gonzalezb/treble_experimentations

Create a new working directory for your LineageOS build and navigate to it:

    mkdir lineage-17.x-build-gsi; cd lineage-17.x-build-gsi

Initialize your LineageOS workspace:

    repo init -u https://github.com/LineageOS/android.git -b lineage-17.1

Clone the modified treble patches and this repo:

    git clone https://github.com/gonzalezb/treble_patches
    git clone https://github.com/gonzalezb/treble_build_los -b lineage-17.1
    
Run this command to download all Sources needed to build Lineage with Gapps (Must run this i norder to pull the latest sources)

    bash treble_build_los/lineage_update.sh
    
Finally, start the build script:

    bash treble_build_los/lineage_build.sh

Be sure to update the cloned repos from time to time!
