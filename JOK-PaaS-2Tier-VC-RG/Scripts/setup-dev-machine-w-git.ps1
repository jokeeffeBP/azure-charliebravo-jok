Configuration Clone_Repo
{
	# This script assumes that Git is already installed. For Azure VS2015 VMs it is.

	param
	(
		# Target nodes to apply the configuration
		$MachineName = 'localhost'
	)
	# Import the module that defines custom resources
	Import-DscResource -Module PSDesiredStateConfiguration

	Node $MachineName
	{
		Script CloneRepo
		{
			SetScript = { 
				$repoDir = "c:\repos"
				$githubRepo = "https://github.com/jokeeffeBP/azure-charliebravo-jok.git"

				New-Item $repoDir -ItemType Directory
				Set-Location -Path $repoDir

				git clone $githubRepo 2>&1 | Out-Null
			}
			TestScript = { Test-Path "C:\Program Files\Git\bin\git.exe" }
			GetScript = { @{ Result = (Get-Content "C:\Program Files\Git\LICENSE.txt") } }          
		}
	}
}