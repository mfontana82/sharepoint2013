{\rtf1\ansi\ansicpg1252\cocoartf1265
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural

\f0\fs24 \cf0 \
\
New-ItemProperty -Path 'HKLM:\\SYSTEM\\CurrentControlSet\\services\\LanmanServer\\Parameters' -Name DisableStrictNameChecking -Value 1 -PropertyType "DWord"\
New-ItemProperty -Path 'HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Lsa\\MSV1_0' -Name BackConnectionHostNames -PropertyType MultiString\
//aggiungere ogni dominio di appartenenza\
Set-ItemProperty -Path 'HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Lsa\\MSV1_0' -Name BackConnectionHostNames -Value \'93<nome web app>\'94}