::
:: @file eventlog-forwarder-config.bat
:: @version v1.4
::
:: @url https://innovarew.appspot.com/
:: @author Innovarew <innovarew.solutions (at) gmail (dot) com>
:: @copyright (C) 2013 Innovarew Solutions. All Rights Reserved.
:: @license Proprietary and confidential
::     Unauthorized copying of this file, via any medium is strictly prohibited.
:: Contact us if you are interested in using our products and services.
::
:: Changelog:
::
:: [dd/mm/yyyy]        [author]
:: [brief description]
::
:: 21/01/2013        innovare.solutions
:: v1.0 Initial version
::
:: 15/02/2013        innovare.solutions
:: v1.1 Added TCP TLS support
::
:: 10/03/2013        innovare.solutions
:: v1.2 Added config eventlog-forwarder-config.bat
::
:: 08/04/2013        innovare.solutions
:: v1.3 Support forwarding several LogNames="Security,System" etc.
::
:: 14/04/2013        innovare.solutions
:: v1.4 Support forwarding regular application log files.
::
:: 13/12/2013        innovarew.solutions
:: v1.5 Release stable version
::
:: 17/12/2013        innovarew.solutions
:: v1.6 Add forwarder command
::
:: 18/12/2013        innovarew.solutions
:: v1.7 Add firewall and antivirus logs (pfirewall.log & co.) TBD
::

:: IMPORTANT Remember to add the correspnding TLS certificate to the store with
:: certutil -addstore -enterprise -f "Root" /path/to/certificate/file

:: Configurable options

:: Example of Syslog UPD/514 configuration
::set server=172.20.17.140
::set protocol="UDP"
::set port=514

:: Example of Syslog TCP/SSL configuration
set server=172.20.17.140
set protocol="TCPwithTLS"
set port=1999

:: keep logs from last week (remove logs older than 7 days)
set logcycle=7
:: forward logs from today (send logs from 1 day back from today)
set logrange=1

:: Next, forward the EventLogs to the Syslog Server
%eventlogfwd% forwarder %server% %protocol% %port% "EventLog" "Security" %logcycle% %logrange%
:: And, forward also the App Logs to the Syslog Server
%eventlogfwd% forwarder %server% %protocol% %port% "AppLog" "/path/to/app.log" %logcycle% %logrange%
:: And, forward also the firewall Logs to the Syslog Server
%eventlogfwd% forwarder %server% %protocol% %port% "AppLog" %windir%\system32\logfiles\firewall\pfirewall. log %logcycle% %logrange%

