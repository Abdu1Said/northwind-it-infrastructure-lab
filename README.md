# northwind-it-infrastructure-lab

A simulated small-business IT infrastructure lab for practicing Active Directory, DNS/DHCP, Group Policy, PowerShell automation, monitoring, and help desk documentation.





\## Day 1 — Domain Controller Foundation



Completed the first stage of the Northwind Solutions home lab by building the main Windows Server 2022 domain controller.



\### What I configured

\- Installed Windows Server 2022 Standard Evaluation (Desktop Experience)

\- Renamed the server to `DC01`

\- Set a static IPv4 address: `10.0.0.10`

\- Configured DNS to point to `10.0.0.10`

\- Installed Active Directory Domain Services

\- Promoted `DC01` to a domain controller

\- Created the domain `northwind.local`

\- Set the NetBIOS domain name to `NORTHWIND`



\### Evidence

\- `screenshots/day1-dc01-static-ip-ipconfig-all.png`

\- `screenshots/day1-adds-domain-created.png`

\- `screenshots/day1-server-manager-ad-ds-dns.png`



\### What I learned

I learned how to prepare a Windows Server for Active Directory by setting a static IP address first, then installing AD DS and promoting the server to a domain controller. I also saw why DNS is important because the domain controller uses DNS for domain name resolution inside the lab.









\## Day 2 — DHCP and Organizational Units



Completed the second stage of the Northwind Solutions home lab by adding DHCP services and creating a structured Active Directory OU layout for the company.



\### What I configured

\- Installed the DHCP Server role on `DC01`

\- Authorized the DHCP server in Active Directory

\- Created a DHCP scope named `Northwind LAN`

\- Configured the DHCP range from `10.0.0.100` to `10.0.0.200`

\- Set DHCP options for gateway, DNS server, and DNS domain

\- Created a main `Northwind` OU

\- Created department OUs for `Sales`, `Engineering`, `Management`, and `IT`

\- Created `Users` and `Computers` OUs inside each department

\- Created a `Disabled Users` OU for offboarding



\### Evidence

\- `screenshots/day2-dhcp-scope-created.png`

\- `screenshots/day2-ou-structure-created.png`



\### What I learned

I learned how DHCP supports a managed business network by automatically assigning IP addresses to client machines. I also practiced organizing Active Directory with OUs so users and computers can be managed by department, which will make Group Policy and onboarding easier later in the lab.

