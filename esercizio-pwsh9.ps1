

Get-ChildItem -Path "$env:UserProfile\OneDrive\Documenti\Obsidian Vault" -Recurse -File | 
Where-Object { $_.LastWriteTime -gt (Get-Date).AddMinutes(-10) } | 
Select-Object Name, DirectoryName, LastWriteTime | Sort-Object LastWriteTime -Descending