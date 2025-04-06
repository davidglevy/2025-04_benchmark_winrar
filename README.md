# Benchmark WinRAR vs Windows Native extraction 

## Pre-requisites
You must have a valid copy of WinRAR installed and it must be accessible in the PATH. This doesn't
happen by default so you might have to add it.

## To Build
We compile our benchmark by running the Power Shell command in
the build folder - please ensure your current director is set
as that folder before running the following command:

```
PowerShell.exe -File build_exe.ps1
```
This will create our benchmark executable "main.exe" in the folder "output/dist"

## To Run
We can run our command as so:

```
main.exe ZIP_COMPARISON_FILE
```
## Test Results

I downloaded the original Spring Framework v1 zip file, which is 19MB and has 3386 files. Here are the
results:

```
Running benchmark on [C:\Users\DavidLevy\Downloads\spring-framework-1.0-with-dependencies.zip]
WinRAR duration to extract was [5.651324987411499]
Windows native duration to extract was [204.78540706634521]
```
As you can see, and this aligns to experiences, WinRAR is 36x faster than Windows Native extraction.

