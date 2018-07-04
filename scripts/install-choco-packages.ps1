# install programs with chocolatey
foreach ($line in Get-Content ../configs/choco-programs.txt) {
    choco install $line
}