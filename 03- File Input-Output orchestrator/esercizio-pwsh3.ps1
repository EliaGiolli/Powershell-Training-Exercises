# Esercizio originale

New-Item 
    -Path "C:\temp" 
    -Name "text.txt" 
    -ItemType "File" 
    -Value "This is some random text"


Set-Content 
    -Path "C:\temp\text.txt"
    -Value "This is some updated text"

Add-Content 
    -Path "C:\temp\text.txt"
    -Value "This is some text appended at the end of the previous one"

Get-Content
    -Path "C:\temp\text.txt"