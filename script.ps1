
$repos = @(
    "https://github.com/louisruocco/Fitness-App", 
    "https://github.com/louisruocco/Nonna"
)

function Pull-Repos {
    foreach($repo in $repos){
        $ProjectName = $repo -replace 'https://github.com/louisruocco/', ''
        $path = "E:\Code\$ProjectName"
        if(!(Test-Path $path)){
            Write-host "Creating $ProjectName folder in $path"
            New-Item -ItemType Directory -Path $path
            Set-Location $path
            Write-Host "Cloning into $path"
            git init
            git clone $repo
        } else {
            Set-Location $path
            Write-Host "Pulling down Master Branch from $ProjectName"
            git init
            git remote add origin $repo
            git pull origin master
        }
    }
}

Pull-Repos