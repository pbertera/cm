=====================
cm save <destination>
=====================

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

