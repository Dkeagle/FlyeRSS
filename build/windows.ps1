param (
    [ValidateSet("chrome", "edge", "firefox", "safari", "opera")]
    [string]$browser
)

if (-not $browser){
    Write-Error "No browser argument specified, Please provide one of the following: chrome, firefox, edge, safari, opera."
    exit
}

# Step 1: Create a "dist" directory
New-Item -ItemType Directory -Path "dist"

# Step 2: Copy everything from the "src" directory to the newly created "dist" one
Copy-Item -Path "src\*" -Destination "dist" -Recurse

# Step 3: Copy the {argument}.json file from the "manifests" directory to the "dist" directory
Copy-Item -Path "manifests\$browser.json" -Destination "dist\manifest.json"

# Step 4: Zip the "dist" directory in the "build" directory as {argument}.zip containing the "dist" directory and all the files inside
Compress-Archive -Path "dist\" -DestinationPath "build\$browser.zip"

# Step 5: Remove the "dist" directory
Remove-Item -Recurse -Force -Path "dist"
