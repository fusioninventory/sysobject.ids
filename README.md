
# sysobject.ids

This repository handles the [FusionInventory](http://fusioninventory.org/) `sysobject.ids` file database.

`sysobject.ids` file database is a text-based file firstly intended to help to
identify network products based on their exposed SNMP values.

Actually it is only supported by
 [NetDiscovery](https://github.com/fusioninventory/fusioninventory-agent/blob/2.3.x/lib/FusionInventory/Agent/Task/NetDiscovery.pm)
 and [NetInventory](https://github.com/fusioninventory/fusioninventory-agent/blob/2.3.x/lib/FusionInventory/Agent/Task/NetInventory.pm)
  tasks used by the [FusionInventory Agent](https://github.com/fusioninventory/fusioninventory-agent)

# Contribution

Feel free to open an [issue](https://github.com/fusioninventory/sysobject.ids/issues) if you have any product supporting SNMP and you want to be discovered and inventoried by [FusionInventory Agent](https://github.com/fusioninventory/fusioninventory-agent) NetDiscovery and NetInventory tasks.

The `sysobject.ids` file is a text database mapping the SysObjectID snmp variable (`.1.3.6.1.2.1.1.2`) with manufacturer, type and model. It may also map to dedicated external module which can help to handle more complex case.

You can help populating the database by providing the output of following command (if available under linux, or any snmp walk more complete output):
```
# snmpget -v2c -c public "serverIP" 1.3.6.1.2.1.1.2.0
```

The following one, from a computer with [FusionInventory Agent](https://github.com/fusioninventory/fusioninventory-agent) installed, can also quickly help us:
```
# fusioninventory-netinventory --credentials version:2c,community:public --debug --host "serverIP"
```

As with the SysObjectID snmp variable content, you should provide the device related and expected manufacturer, type and model strings.

The device type can be one of the following types:
* COMPUTER
* NETWORKING
* PRINTER
* STORAGE
* POWER
* PHONE
* VIDEO
* KVM

# Release

As [FusionInventory Agent](https://github.com/fusioninventory/fusioninventory-agent/releases) would be released we will tag the incorporated `sysobject.ids` file starting with 2.3.20.

# Manual update

You can manually update `sysobject.ids` file into the installed `fusioninventory-agent/share` folder. You just have to [download it](https://github.com/fusioninventory/sysobject.ids/raw/master/sysobject.ids),
but do that at your own risk and always make a backup before updating manually.
