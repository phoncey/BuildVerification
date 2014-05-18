Scripts in this repository have been designed a demonstrate a "proof of concept" of how features of git could be used to help verify that all content that goes into a software release has been peer reviewed. Further explanation is available in wiki.

Files:
Scen1.sh - bash script that uses git and GenerateRandomChanges.sh to simulate a scenario where all software changes merged into a software release have been peer reviewed. This is the ideal case.

Scen2.sh - bash script that uses git and GenerateRandomChanges.sh to simulate a scenario where not all software changes merge into a software release have been peer reviewed. This is perhaps the simplest example of an event where a software change can escape peer review and make it into a software release.

GenerateRandomChanges.sh - Bash script that generates a random set of files and commits them to the git repository.


First scenario useage:
./Scen1.sh
cd Scen1
git diff verify release.tag
(Note: the output of the diff command in this scenario should be nothing)

Second scenario useage:
./Scen2.sh
cd Scen2
git diff verify release.tag
(Note: the output of the diff command in this scenario should NOT be nothing)