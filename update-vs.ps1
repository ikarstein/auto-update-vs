#written by Ingo Karstein (ik@kenaro.com)
#(C) 2020 by Ingo Karstein. Released under MIT License

# VS 2019

$t = "$(New-TemporaryFile).exe"

#Community Edition
#iwr "https://download.visualstudio.microsoft.com/download/pr/5f914955-f6c7-4add-8e47-2e090bdc02fa/dddcd58ea8cdecbd52547fb3a82ac79b37cfaa6b8600fe59baf476221ab4c81a/vs_Community.exe" -outfile $t

#Enterprise Edition
iwr "https://download.visualstudio.microsoft.com/download/pr/befdb1f9-8676-4693-b031-65ee44835915/aca15725008ae4ddc04b7509bd98f448f99e48b0ff773ed0f6aeea4194cf32d5/vs_Enterprise.exe" -OutFile $t

write-host "VS 2019"
get-childitem "C:\Program Files (x86)\Microsoft Visual Studio\2019" | % {
	write-host "`t$($_.FullName)"
	Start-Process $t -arg @("update", "--passive", "--installPath", """$($_.FullName)""") -Wait
}

remove-item $t -Force -Confirm:$false


# VS 2017

$t = "$(New-TemporaryFile).exe"

#Community Edition
#iwr "https://download.visualstudio.microsoft.com/download/pr/6a433d5c-4604-4a3e-8b78-707ba18a9ba0/acd74a4a755fb6272d68cb3ab678ea020faf0078a89099ce352dfabc623a1db7/vs_Community.exe" -outfile $t

#Enterprise Edition
iwr "https://download.visualstudio.microsoft.com/download/pr/5b7e9507-8acc-4120-80ee-84d67328e3a8/867f8fe9170cdf69929c7a9bb0c8cb8058ea94c83cb593d9dbf3fe7dc25f4c70/vs_Enterprise.exe" -OutFile $t

write-host "VS 2017"
get-childitem "C:\Program Files (x86)\Microsoft Visual Studio\2017" | % {
	write-host "`t$($_.FullName)"
	Start-Process $t -arg @("update", "--passive", "--installPath", """$($_.FullName)""") -Wait
}

remove-item $t -Force -Confirm:$false
