==============================
Configuration Management e CLI
==============================

Buoni strumenti a linea di comando sono sempre fondamentali, e non sono dei relitti ereditati dal passato in confronto alle applicazioni basate su GUI.
Amministratori con le palle apprezzano la possibilità di utilizzare potenti script per automatizzare operazioni e semplificarsi la vita.

CM è uno framework per sviluppare CLI di gestione cisco style completamente scritto, estensibile e gestibile in bash. 
Utilizzando CM per la gestione dei propri sistemi si ha il vantaggio di usufruire di un CMDB (Configuration Management DataBase) e mantenere tutta la potenza dei sistemi UNIX.

-----------------------
Struttura del framework
-----------------------

Il framework si compone di:

* un CMDB
* una API per accedere al CMDB (vedi :ref:`cmdb API <cmdb_api>`)
* il comando `cm`
* un sistema di autocompletamento che sfrutta la bash completion [1]_ adattabile ad ogni comando
* un sistema di help per ogni cmando
* un sistema di verifica della sintassi dei comandi

-----
Links
-----

`A smarter CLI - Innovation by Simplicity <http://www.advogato.org/article/1015.html>`_

`Yatta CLI internals <http://wiki.het.net/wiki/CLI_internals>`_

.. [1] Bash completion: http://bash-completion.alioth.debian.org
