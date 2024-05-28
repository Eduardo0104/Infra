Get-Content "C:\..." | foreach { Add-CMDeviceCollectionDirectMembershipRule -CollectionName "" -ResourceID (Get-CMDevice -Name $_).ResourceID }
