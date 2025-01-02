param($input_version, $bin_dir, $bin_path)

if ($input_version -eq "1.1") {
  $version=$input_version
} else {
  $version=$input_version + "a"
}
# Create target directory
New-Item -Path "$bin_path" -ItemType Directory -Force | Out-Null
# Prepare target file path
$file_path = Join-Path -Path $bin_path -ChildPath "npiet.zip"
# Download archive
Invoke-WebRequest -URI "http://www.bertnase.de/npiet/npiet-$version-win32.zip" -OutFile "$file_path"
# Unarchive
Expand-Archive "$file_path" -DestinationPath "$bin_path"
# Remove archive file
Remove-Item -Path "$file_path"
# Add to PATH
echo "$bin_path" | Out-File -FilePath $Env:GITHUB_PATH -Encoding utf8 -Append
