### eventlog-forwarder: A simple Windows Eventlog forwarder to Syslog using TCP SSL.

Perform the following steps to setup eventlog-forwarding to the Syslog server:

- Configure the Syslog Server IP at [eventlog-forwarder-config.bat](eventlog-forwarder-config.bat)
- Check the log forwarding works invoking: [eventlog-forwarder.bat](eventlog-forwarder.bat)
- Once the configuration is working schedule a daily task: `eventlog-forwarder.bat daily`

#### Usage

~~~
C:\eventlog-forwarder> eventlog-forwarder.bat usage

usage: eventlog-forwarder.bat [usage|daily|disable|status]
- usage: show eventlog-forwarder.bat usage
- daily: schedule daily eventlog-forwarder.bat task
- disable: delete eventlog-forwarder.bat daily schedule task
- status: show eventlog-forwarder.bat status
- otherwise, run the eventlog-forwarder

usage: eventlog-forwarder Server-IP Protocol Port AppName LogNames LogCycle LogRange # @version v1.5
@copyright #Innovarew (c) Copyright 2013. All rights reserved.
~~~

