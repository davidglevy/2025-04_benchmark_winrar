# Package up the benchmark into an exe that we can run.

$outputDir = '../output'
$venvDir = '.build-venv'
$test = 'Running Python command'


Write-Host $test

# Make output directory if not already exists.
if (Test-Path -Path $outputDir) {
    Write-Host "Output directory $outputDir already exists"
} else {
    Write-Host "Creating new directory $outputDir"
    New-Item -Name $outputDir -ItemType Directory
}

# Switch directory to $outputDir
Write-Host "Changing directory $outputDir"
Set-Location -Path $outputDir

# Create virtual environment if not already exists.
if (Test-Path -Path $venvDir) {
    Write-Host "venv directory $venvDir already exists"
} else {
    Write-Host "Creating venv directory $venvDir"
    $pythonOutput = & "python" "-m" "venv" $venvDir
}

# Activate venv
Write-Host "Activating Build Virtual Environment"
$activationOutput = & "$venvDir/Scripts/Activate.ps1"
Write-Host "Build Virtual Environment was activated successfully"

# Install pyinstaller
& "pip" "install" "pyinstaller"

& "pyinstaller" "--onefile" "../main.py"

#$pythonOutput = & "python" "say_hello.py"
#Write-Host "Output was:" $pythonOutput