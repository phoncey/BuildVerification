#!/bin/bash

#Generate Folder

mkdir Scen1
cd Scen1
git init

echo "origin tag"
../GenerateRandomChanges.sh 1 init txt
git tag -a "origin.tag" -m "Starting point of all commits and branches"

echo "DevA branch"
git checkout -b DevA_b origin.tag
../GenerateRandomChanges.sh 5 DevA_b txt
git tag -a "DevA_b.review" -m "Review tag for DevA_b branch"

#DevB branch
git checkout -b DevB_b origin.tag
../GenerateRandomChanges.sh 700 DevB_b txt
git tag -a "DevB_b.review" -m "Review tag for DevB_b branch"
git checkout master

git merge --no-ff DevA_b -m "Merging DevA_b branch"

git merge --no-ff DevB_b -m "Merging DevB_b branch"

git checkout -b DevC_b master
../GenerateRandomChanges.sh 10 DevC_b txt
../GenerateRandomChanges.sh 10 DevA_b txt
../GenerateRandomChanges.sh 10 DevB_b txt

git tag -a "DevC_b.review" -m "Review tag for DevC_b branch"
git checkout master
git merge --no-ff DevC_b -m "Merging DevC_b branch"
git tag -a release.tag -m "Tag for a release"

#start verify brnach
git checkout -b verify origin.tag

git merge DevA_b.review -m "Merging DevA_b.review tag"
git merge DevB_b.review -m "Merging DevB_b.review tag"
git merge DevC_b.review -m "Merging DevC_b.review tag"