Configuration Install_Git_and_Repo
{
	param
	(
		# Target nodes to apply the configuration
		$MachineName = 'localhost'
	)
	# Import the module that defines custom resources
	Import-DscResource -Module PSDesiredStateConfiguration
	Import-DscResource -Module xWebAdministration, xPSDesiredStateConfiguration

	$destinationPath = "c:\temp\"
	$installerFile = "Git-2.9.2-64-bit.exe"
	$sourcePath = "C:\setup\baz"
	$installerPackageUri = "https://github.com/git-for-windows/git/releases/download/v2.9.2.windows.1/" + $InstallerFile


	Node $MachineName
	{
		File TempDirectory
		{
			Ensure = "Present"
			Type = "Directory" # Default is "File".
			DestinationPath = $destinationPath    
		}
		xRemoteFile GitInstallerDownload
		{
			Uri = $installerPackageUri
			DestinationPath = $destinationPath + $installerFile
			DependsOn = "[File]TempDirectory"
		}
		
		Package Git
		{
			Ensure = "Present"
			Name = "Git"
			Path = $destinationPath + $installerFile
			ProductId = ''
		}
		
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