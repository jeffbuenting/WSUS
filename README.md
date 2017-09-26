# WSUS

Poweshell WSUS Scripts


### Functions
- **Cleanup-WSUSServerMaintenance** 
  -  Following WSUS best practice, the clean up wizard should be run periodically.  Also a SQL reindex should be perfromed after the clean up.  This script automates these steps.
  
  - **`[String]`ComputerName** : WSUS Server Computername.
  - **`[String]`SQLServer** : Name of the SQL Server that hosts the SUSDB.
  - **`[Int]`Port** : WSUS Port**

  - Reference Links :
    -  https://blogs.technet.microsoft.com/configurationmgr/2016/01/26/the-complete-guide-to-microsoft-wsus-and-configuration-manager-sup-maintenance/
	-  ttps://technet.microsoft.com/itpro/powershell/windows/wsus/invoke-wsusservercleanup
	-  https://gallery.technet.microsoft.com/scriptcenter/6f8cde49-5c52-4abd-9820-f1d270ddea61

