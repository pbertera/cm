########################
Bacula Director Commands
########################

.. |OK| replace::
   **OK** Implemented

.. |TODO| replace::
   **TODO** To implement

.. |HC| replace::
   **HC** HardCoded

.. |NO| replace::
   **NO** Not in planning

Questo `package` contiene i comandi per configurare il Director Bacula.

Di seguito le tabelle dei comandi che verranno implementati


**Director Resource Type**

The Director resource defines the attributes of the Directors running on the network.

========================= ====================
Directive                 Implementation state
========================= ====================
Name                       |OK|
Description                |OK|
Password                   |OK|
Messages                   |TODO|
Working Directory          |HC|
Pid Directory              |HC|
Scripts Directory          |NO|
QueryFile                  |HC|
Heartbeat Interval         |NO|
Maximum Concurrent Jobs    |OK|
FD Connect Timeout         |NO|
SD Connect Timeout         |NO|
DirAddresses               |NO|
DirPort                    |OK|
DirAddress                 |OK|
DirSourceAddress           |OK|
Statistics Retention       |OK|
VerId                      |NO|
MaximumConsoleConnections  |NO|
========================= ====================

**Client Resource Type**

The Client resource defines the attributes of the Clients that are served by this Director; that is the machines that are to be backed up. You will need one Client resource definition for each machine to be backed up. 

========================= ====================
Directive                 Implementation state
========================= ====================
Name                       |OK|
Address                    |OK|
FD Port                    |OK|
Catalog                    |NO|
Password                   |OK|
File Retention             |TODO|
Job Retention              |TODO|
AutoPrune                  |TODO|
Maximum Concurrent Jobs    |TODO|
Priority                   |TODO|
========================= ====================

**Storage Resource**

**Pool Resource**

**Catalog Resource**

Per ora esisterà un solo catalog locale e tutti iriferimenti ad esso saranno hardcodati.

========================= ====================
Directive                 Implementation state
========================= ====================
Name                      |TODO|
password                  |TODO|
DB Name                   |TODO|
user                      |TODO|
DB Socket                 |TODO|
DB Address                |TODO|
DB Port                   |TODO|
========================= ====================

**Messages Resource**

**Console Resource**

**Job Resource**

**Schedule Resource**

========================= ====================
Directive                 Implementation state
========================= ====================
Name                       |TODO|
Run                        |TODO|
========================= ====================

**FileSet Resource**

=====================
cm bacula-dir commit
=====================

|syntax| 

|normal-command| cm bacula-dir commit

|negate-command| nocm bacula-dir commit

|configuration-mode|

|usage|

Questo comando applica le confiurazioni del bacula director

=======================================
cm bacula-dir client <client-id> commit
=======================================

|syntax| 

|normal-command| cm bacula-dir client <client-id> commit

|negate-command| nocm bacula-dir client <client-id> commit

|configuration-mode|

|usage|

Questo comando salva la configurazione del bacula client `<client-id>` client

========================================
cm bacula-dir client <client-id> address
========================================

|syntax| 

|normal-command| cm bacula-dir client <client-id> address <address>

|negate-command| nocm bacula-dir client <client-id> address

|configuration-mode|

|parameters| 

* `address`: The address of client or a fqdn name.

|default| *none*

|usage|

Questo comando imposta l'indirizzo del client, deve essere un indirzzo IP o un fqdn name.

=========================================
cm bacula-dir client <client-id> password
=========================================

|syntax| 

|normal-command| cm bacula-dir client <client-id> password <password>

|negate-command| nocm bacula-dir client <client-id> password <password>

|configuration-mode|

|parameters| 

* `password`: The password of client.

|default| *none*

|usage|

Questo comando imposta la password del client

=====================================
cm bacula-dir client <client-id> port
=====================================

|syntax| 

|normal-command| cm bacula-dir client <client-id> port <port>

|negate-command| nocm bacula-dir client <client-id> port

|configuration-mode|

|parameters| 

* `port`: The port of client file server daemon.

|default| *9102*

|usage|

Questo comando imposta la port tcp su cui risponde il client

=====================================
cm bacula-dir client <client-id> name
=====================================

|syntax| 

|normal-command| cm bacula-dir client <client-id> name <name>

|negate-command| nocm bacula-dir client <client-id> name <name>

|configuration-mode|

|parameters| 

* `name`: The name of client.

|default| *none*

|usage|

Questo comando imposta il nome del client

=========================
cm bacula-dir description
=========================

|syntax| 

|normal-command| cm bacula-dir description <description>

|negate-command| nocm bacula-dir description <description>

|configuration-mode|

|parameters| 

* `description`: The text field contains a description of the Director that will be displayed in the graphical user interface.

|default| *none*

|usage|

Quest comando imposta la descrizione del director.

=====================
cm bacula-dir maxjobs
=====================

|syntax| 

|normal-command| cm bacula-dir maxjobs <number>

|negate-command| nocm bacula-dir maxjobs

|configuration-mode|

|parameters| 

* `number`: number is the maximum number of total Director Jobs that should run concurrently.

|default| *1*

|usage|

Questo comando imposta il numero massimo di job bacula concorrenti.

=====================
cm bacula-dir address
=====================

|syntax| 

|normal-command| cm bacula-dir address <address>

|negate-command| nocm bacula-dir address

|configuration-mode|

|parameters| 

* `address`: this command will cause the Director server to bind to the specified IP-Address,

|default| *0.0.0.0*

|usage|

Questo comando imposta l'ip su cui si mette in ascolto il directos

========================
cm bacula-dir client add
========================

|syntax| 

|normal-command| cm bacula-dir client add <name>

|negate-command| nocm bacula-dir client add <name>

|configuration-mode|

|parameters| 

* `client-id`:  is the identifier of client do add

|default| `none`

|usage|

Questo comando aggiunge i comandi per configurare un nuovo client

Una volta aggiunto il client sarà possibile configurarlo tramite i comandi

 *cm bacula-dir client <client-id> \**

===========================================================
cm bacula-dir schedule <schedule-id> run <run-id> monthspec
===========================================================

|syntax| 

|normal-command| cm bacula-dir schedule <schedule-id> run <run-id> monthspec <monthspec>

|negate-command| nocm bacula-dir schedule <schedule-id> run <run-id> monthspec

|configuration-mode|

|parameters| 

* `momnthspec`: The specification for monthly scheduling

|default| *jan-dec*

|usage|

Questo comando imposta la spcifica per lo scheduling mensile

=========================================================
cm bacula-dir schedule <schedule-id> run <run-id> dayspec
=========================================================

|syntax| 

|normal-command| cm bacula-dir schedule <schedule-id> run <run-id> dayspec <dayspec>

|negate-command| nocm bacula-dir schedule <schedule-id> run <run-id> dayspec

|configuration-mode|

|parameters| 

* `dayspec`: The specification for monthly scheduling

|default| *daily*

|usage|

Questo comando imposta la specifica per lo scheduling giornalier

==========================================================
cm bacula-dir schedule <schedule-id> run <run-id> timespec
==========================================================

|syntax| 

|normal-command| cm bacula-dir schedule <schedule-id> run <run-id> timespec <timespec>

|negate-command| nocm bacula-dir schedule <schedule-id> run <run-id> timespec

|configuration-mode|

|parameters| 

* `timespec`: The specification for hourli specification

|default| *daily*

|usage|

Questo comando imposta la specifica per lo scheduling orario

======================
cm bacula-dir password
======================

|syntax| 

|normal-command| cm bacula-dir password <password>

|negate-command| nocm bacula-dir password <password>

|configuration-mode|

|parameters| 

* `password`: Specifies the password that must be supplied for the default Bacula Console to be authorized.

|default| *none*

|usage|

Questo comando imposta la password utilizzata per connettersi tramite console al bacula director.

==================
cm bacula-dir port
==================

|syntax| 

|normal-command| cm bacula-dir port <port>

|negate-command| nocm bacula-dir port

|configuration-mode|

|parameters| 

* `port`: this command will cause the Director server to bind to the specified tcp port,

|default| *9101*

|usage|

Questo comando imposta la porta tcp su cui si mette in ascolto il directos

====================
cm bacula-dir name
====================

|syntax| 

|normal-command| cm bacula-dir name <name>

|negate-command| nocm bacula-dir name

|configuration-mode|

|parameters| 

* `name`: The director name used by the system administrator.

|default| *none*

|usage|

Questo comando imposta il nome del Bacula director

#############
Base Commands
#############

Questo `package` contiene i comandi base

=======
cm save
=======

|syntax| 

|normal-command| cm save <destination>

|negate-command| *none*

|configuration-mode|

|parameters| 

* `destination`: the destination

|default| *none*

|usage|

Questo comando copia  il CMDB nella destionazione indicata dal parametro `destination`. La destinazione puo' essere un file locale oppure un file remoto copiato via scp.

=====================
cm system name-server
=====================

|syntax| 

|normal-command| cm system name-server <name-server>

|negate-command| nocm system name-server

|configuration-mode|

|parameters| 

* `name-server`: Internet address (in dot notation) of a name server that the resolver should query

|default| *none*

|usage|

Questo comando imposta il server DNS da utilizzare per risolvere i nomi di dominio. In forma negata rimuove tale impostazione.

==================
cm system hostname
==================

|syntax| 

|normal-command| cm system hostname <hostname>

|negate-command| nocm system hostname <hostname>

|configuration-mode|

|parameters| 

* `hostname`: the hostname

|default| *none*

|usage|

Questo comando imposta l'hostname locale. Il comando normale imposta l'hostname, in modalità negata rimuove l'hostname.

==================
cm system domain
==================

|syntax| 

|normal-command| cm system domain <domain>

|negate-command| nocm system domain <domain>

|configuration-mode|

|parameters| 

* `domain`: the local domain name

|default| *none*

|usage|

Il comando *cm system domain* imposta il nome di dominio locale.

=============
cm system end
=============

|syntax| 

|normal-command| cm system end

|negate-command| *none*

|configuration-mode|

|parameters| 

 *none*

|usage|

Questo comando esce dalla modalità di configurazione.

