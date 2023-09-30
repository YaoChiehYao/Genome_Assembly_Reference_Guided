# make my subdirectories if they aren't already in the repo
mkdir data scripts results results/logs/  # will make each separate folder OR you could call individual mkdir commands

# add a brief description for each folder

echo "Stores input data for analysis. Data not tracked by git."> data/README.md
echo "Stores scripts for analysis. Scripts are tracked by git."> scripts/README.md
echo "Stores results from the analysis. These may or may not be tracked by git (depending on file size and type)."> results/README.md
echo "Stores logs from analysis runs. These will be tracked." > results/logs/README.md
