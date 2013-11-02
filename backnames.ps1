
New-ItemProperty -Path 'HKLM:\\SYSTEM\\CurrentControlSet\\services\\LanmanServer\\Parameters' -Name DisableStrictNameChecking -Value 1 -PropertyType "DWord"\
New-ItemProperty -Path 'HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Lsa\\MSV1_0' -Name BackConnectionHostNames -PropertyType MultiString\
//aggiungere ogni dominio di appartenenza\
Set-ItemProperty -Path 'HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Lsa\\MSV1_0' -Name BackConnectionHostNames -Value \'93<nome web app>\'94}