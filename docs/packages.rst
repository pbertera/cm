###############
Bacula Commands
###############

Questo `package` contiene i comandi di Bacula

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

|negate-command| nocm bacula-dir maxjobs <hostname>

|configuration-mode|

|parameters| 

* `number`: number is the maximum number of total Director Jobs that should run concurrently.

|default| *none*

|usage|

Questo comando imposta il numero massimo di job bacula concorrenti.

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

