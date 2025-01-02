param($input_version, $bin_dir, $bin_path)

if ($input_version -eq "1.1") {
  $version=$input_version
} else {
  $version=$input_version + "a"
}
New-Item -Path "$bin_dir" -ItemType Directory -Force | Out-Null
Invoke-WebRequest -URI "http://www.bertnase.de/npiet/npiet-$version-win32.zip" -OutFile "$bin_dir\npiet.zip"
Expand-Archive "$bin_dir\npiet.zip" -DestinationPath "$bin_dir"
Remove-Item -Path "$bin_dir\npiet.zip"
ls -la .
echo "$bin_path" | Out-File -FilePath $Env:GITHUB_PATH -Encoding utf8 -Append
