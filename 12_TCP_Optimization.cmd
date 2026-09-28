@echo off
echo.                                                                  RELLO FOR TWEAKS

REG ADD HKey_Local_Machine\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\ /v TcpAckFrequency /t REG_DWORD /d 0 /f

REG ADD HKey_Local_Machine\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\ /v TCPNoDelay /t REG_DWORD /d 0 /f

netsh int tcp set global rsc=disabled

netsh int tcp set global rss=disabled

netsh int tcp set global ecncapability=enabled

netsh int tcp set global autotuninglevel=disabled

netsh advfirewall firewall add rule name="StopThrottling" dir=in action=block remoteip=173.194.55.0/24,206.111.0.0/16 enable=yes

cd\
netsh int tcp set heuristics disabled
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global fastopen=enable
netsh int tcp set supplemental internet congestionprovider=ctcp

netsh interface ipv4 set dns name="Wi-Fi" static 1.1.1.1
netsh interface ipv4 add dns name="Wi-Fi" 1.0.0.1 index=2

@echo
@pause