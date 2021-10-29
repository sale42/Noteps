Function nc{
[CmdletBinding()]
param(

    [Parameter(Mandatory=$true,
                    HelpMessage="Note text.")] 
        [string]$note,

    [switch]$task
)
BEGIN {

}
PROCESS {

    $time = (Get-Date -Format "HH:mm:ss").ToString()
    $date = (Get-Date -Format "yyyy-MM-dd").ToString()
    $fileName = $date + ".md"
    $path = "C:\Users\salen\OneDrive\Notes\Notes\DailyNotes\" + $fileName

    if($task -eq $true){
        $note = " - [ ] " + $note + " #task"
    }
    
    $template = "#### "+ $time +  ([Environment]::NewLine) + "- " + $note  + ([Environment]::NewLine) +"---" + ([Environment]::NewLine)
    $newFile = "### " + $date + ([Environment]::NewLine) + $template

    write $path
    if (!(Test-Path $path))
    {
       New-Item -path $path  -type "file" -value $newFile
       Write-Host "Created new file and text content added"
    }
    else
    { 
      Add-Content -path $path -value $template
      Write-Host "File already exists and new text content added"
    }

 }
END { }
}