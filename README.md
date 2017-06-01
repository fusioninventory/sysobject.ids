
# sysobject.ids

This repository handles the [FusionInventory](http://fusioninventory.org/) `sysobject.ids` file database.

`sysobject.ids` file database is a text-based file firstly intended to help to
identify network products based on their exposed SNMP values.

Actually it is only supported by
 [NetDiscovery](https://github.com/fusioninventory/fusioninventory-agent/blob/2.3.x/lib/FusionInventory/Agent/Task/NetDiscovery.pm)
 and [NetInventory](https://github.com/fusioninventory/fusioninventory-agent/blob/2.3.x/lib/FusionInventory/Agent/Task/NetInventory.pm)
  tasks used by the [FusionInventory Agent](https://github.com/fusioninventory/fusioninventory-agent)

# Contribution

Feel free to open an [issue](https://github.com/fusioninventory/sysobject.ids/issues) if you have any product supporting SNMP and you want to be detected by FusionInventory Agent.

# Release

As [FusionInventory Agent](https://github.com/fusioninventory/fusioninventory-agent/releases) would be released we will tag the incorporated `sysobject.ids` file starting with 2.3.20.

# Manual update

You can manually update `sysobject.ids` file into the installed `fusioninventory-agent/share` folder. You just have to [download it](https://github.com/fusioninventory/sysobject.ids/raw/master/sysobject.ids),
but do that at your own risk and always make a backup before updating manually.
