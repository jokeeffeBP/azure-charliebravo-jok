$repoDir = "c:\repos"
$githubRepo = "https://github.com/jokeeffeBP/azure-charliebravo-jok.git"

New-Item $repoDir -ItemType Directory
Set-Location -Path $repoDir

git clone $githubRepo 2>&1 | Out-Null # The output gets mis-interpreted from powershell - send to the bit backet for now...