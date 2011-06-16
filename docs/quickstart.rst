**********
Quickstart
**********

Questa sarà una breve introduzioen pratica all'uso della CLI `cm`.

=============
Installazione
=============

Il processo di installazione è molto semplice: si compone di tre fasi:

#. Download
#. Configurazione dei path di installazione e i nomi utente
#. Installazione

Gli unici requisiti di installazione sono il software `GNU Make` http://www.gnu.org/software/make/ e `Bash` http://www.gnu.org/software/bash/

--------
Download
--------

**TODO**

--------------
Configurazione
--------------

Una volta estratti i sorgenti occorre editare il file `src/config.mk` dichiarando le variabili di configurazione:

* **CM_LIBDIR**: (`/opt/cm/lib`) directory in cui verranno installati i file di :mod:`cmlib`
* **CM_BINDIR**: (`/opt/cm/bin`) directory in cui verranno installati gli eseguibili
* **CM_DBDIR**: (`/opt/cm/db`) directory che conterrà il CMDB
* **COMPLETION_DIR**: (`/etc/bash_completion.d/`) directory contente gli script di bash completion
* **CM_OPERATOR_USER**: (`cm`) l'account locale con privilegi di operatore
* **CM_OPERATOR_HOME**: (`/home/$(CM_OPERATOR_USER)`) la home directory dell'utente operatore
* **CM_OPERATOR_LIBEXECDIR**: (`/opt/cm/operator-libexec`) dove installare i comandi di operatore
* **CM_CONFIGURE_USER**: (`cmsu`) l'account locale con privilegi di configurazione
* **CM_CONFIGURE_HOME**: (`/home/$(CM_CONFIGURE_USER)`) la home directory dell'utente configuratore
* **CM_CONFIGURE_LIBEXECDIR**: (`/opt/cm/configure-libexec`) dove installare i comandi di configuratore
* **BASH_PATH**: (`/bin/bash`) il path del comando bash, usato come shell per gli utenti 

-------------
Installazione
-------------

Una volta effettuata la configurazione è possibile installare `cm` lanciando `make all` dall'interno della direcotry `src`: ::
  
  cd src
  make all

Questo comando si occuperà di:

* creare gli utenti necessari (`$CM_OPERATOR_USER` e `$CM_CONFIGURE_USER`)
* impostare l'ambiente per gli utenti (creazione di `~/.cmrc`, `~/.bash_profile`, ecc..)
* copiare i file necessari nelle directory specificate
* impostare le password degli utenti.

Verra' chiesto di inserire le password per gli utenti `$CM_OPERATOR_USER` e `$CM_CONFIGURE_USER`.

Tutti i comandi eseguiti da `make` saranno stampati a video.

Se non ci sono stati errori in queste fasi `cm` è correttamente installato, per poter iniziare ad usare `cm` occorre accedere alla macchina con l'utente definito da `$CM_OPERATOR_USER`.
E' possibile farlo accedendo in SSH oppure tramite il comando *su -*. ::

   localhost:~# su - cm
   > 

Il simbolo *>* è il prompt di `cm`, e significa che siamo in modalità **operatore**.

==========
Usare `cm`
==========

------------------
Modalità operative
------------------

Esistono due modalità oprative: **operatore** e **configurazione**.

* in modalità operatore si ha accesso a comandi che mostrano configurazioni, stato dei servizi, ecc..
* in modalità configurazione si possono eseguire dei comandi che operano sulle configurazioni.

di fatto queste due modalità di operazione sono implementate tramite i due utenti locali `$CM_OPERATOR_USER` e `$CM_CONFIGURE_USER`. L'utente `$CM_OPERATOR_USER` ha `uid` = 0, quindi equivale all'utente root e puo' scrivere nel database delle configurazioni (directory definita da `$CM_DBDIR`). Mentre l'utente `$CM_CONFIGURE_USER` è un utente normale non privilegiato.

Il file `~/.bash_profile` di ciascun utente si occupa di impostare le corrette variabili d'ambiente (import del file `~/.cmrc` per ciascuna modalità operativa al momento del login.

----------------------------
CM CLI e la shell di sistema
----------------------------

La CLI `cm` puo' essere installata su qualunque sistema UNIX. Una volta autenticati con l'utente `$CM_OPERATOR_USER` o `$CM_CONFIGURE_USER` si sta di fatto sempre usando una shell bash.
Quindi saranno sempre disponibili tutti i comandi UNIX che i privilegi dell'operatore corrente consentono. ::

  > ls /opt
  cm  cm-1307723782.tgz  cm-1308237350.tgz  cm-1308237571.tgz  cm-1308237740.tgz	cm-1308237825.tgz  cm-1308237832.tgz  cm-1308237848.tgz  cm-src
  > df -h
  Filesystem            Size  Used Avail Use% Mounted on
  /dev/sda1             8.3G  884M  7.4G  11% /
  tmpfs                 253M     0  253M   0% /lib/init/rw
  udev                   10M   76K   10M   1% /dev
  tmpfs                 253M     0  253M   0% /dev/shm
  > uptime
   17:37:11 up 20 days, 21:51,  4 users,  load average: 0.00, 0.00, 0.00

--------------
I comandi `cm`
--------------

`cm` mette a disposizione 4 comandi:

* **cm**: è un eseguibile ed è installato nella directory definita da `CM_BINDIR` in fase di configurazione. Tale directory viene inserita nella variabile `PATH` dal file `~/.bash_profile`
* **nocm**: è un alias che esegue `cm` impostando prima la variabile d'ambiente `__cm_no_command` a 1, serve per eseguire un comando negato.
* **dcm**: è un alias che esegue `cm` impostando prima la variabile d'ambiente `__cm_debug` a 1, esegue `cm` in modalità debug
* **dnocm**: è un alias che esegue `cm` impostando prima le variabili d'ambiente `__cm_debug` e `__cm_no_command` a 1, esegue `cm` negato in modalità debug.

Gli alias vengono impostati dal file `~/.bash_profile`.

------------------------
Comandi e comandi negati
------------------------

Qualsiasi comando **cm** (non negato) si occupa di *aggiungere* una configurazione. Es. ::

  cm system name-server 172.20.11.2

Imposta il server DNS locale *172.20.11.2*: aggiunge la configurazione del server dns. 

Un comando **nocm** (negato) elimina una configurazione. Es. ::

  nocm system name-server

Elimina l'impostazione del server DNS. 

-------
Il CMDB
-------

Tutte le configurazioni impostate vengono salvate nel database delle configurazioni (CMDB). Il CMDB è visionabile tramite il comando **cm show** (in operator mode) oppure **cm do show** (in configure mode). Es.::
  
  > cm show 
  cm interfaces ethernet eth0 description to net1
  cm interfaces ethernet eth0 dhcp4  
  cm interfaces ethernet eth0 state active
  cm interfaces ethernet eth0 commit
  cm interfaces ethernet eth1 description multi IP interface
  cm interfaces ethernet eth1 address4 192.168.2.30/24  
  cm interfaces ethernet eth1 address4 192.168.2.31/24  
  cm interfaces ethernet eth1 address4 192.168.2.32/24
  cm interfaces ethernet eth1 state active
  cm interfaces ethernet eth1 commit
  cm interfaces ethernet eth2 state inactive
  cm interfaces ethernet eth2 commit
  cm system hostname testmachine
  cm system domain example.com
  cm system name-server 192.168.3.33

Chiaramente è possibile associare il comando **cm show** (o qualsiasi altro) a tutti i potenti strumenti di una shell UNIX, ad esempio ecco una sessione di configurazione: ::

   localhost:~# su - cm
   > cm configure 
   Password: *******
   # nocm interfaces ethernet eth0 dhcp4
   # cm do show | grep eth0
   cm interfaces ethernet eth0 description interfaccia principale
   cm interfaces ethernet eth0 state active
   cm interfaces ethernet eth0 commit
   # cm interfaces ethernet eth0 address4 192.168.3.100/24
   # cm interfaces ethernet eth0 address4 192.168.3.101/24
   # cm interfaces ethernet eth0 address4 192.168.3.200/24
   # for IP in `cm do show | grep "eth0 address4" | cut -d \  -f 6`; do echo IP=$IP; done
   IP=192.168.3.100/24
   IP=192.168.3.101/24
   IP=192.168.3.200/24
   # cm do show | grep eth0
   cm interfaces ethernet eth0 description interfaccia principale
   cm interfaces ethernet eth0 address4 192.168.3.100/24
   cm interfaces ethernet eth0 address4 192.168.3.101/24
   cm interfaces ethernet eth0 address4 192.168.3.200/24
   cm interfaces ethernet eth0 state active
   cm interfaces ethernet eth0 commit

--------
CLI Help
--------

Ogni comando implementa un proprio help tramite il **command help script** ed è possibile richiamarlo usando `?` come parametro del comando. Es. ::

   # cm interfaces ethernet eth0 state ?
   
   -----------------------------------------------
   Command Help: interfaces ethernet eth0 state
   -----------------------------------------------
   
   activate or disactivate interface eth0
   
   Parameter: {active|inactive}
   
   -----------------------------------------------

------------------
Command completion
------------------

Tutti i comandi `cm` supportano l'autocompletamento tramite le funzionalità di bash e readline. Es. ::

   cm interfaces ethernet eth0 state<tab><tab>
   active    inactive
   cm interfaces ethernet eth0 state a<tab>
   cm interfaces ethernet eth0 state active                            # "ctive" è stato aggiunto automagicamente

Non tutti i valori sono predicibili (es. l'indirizzo ip da assegnare ad una interfaccia di rete) in quel caso premendo il tasto tabulatore verrà mostrato un suggerimento per il parametro. Es. ::

   cm interfaces ethernet eth0 address4 <tab><tab>
   xxx.xxx.xxx.xxx/yy - IP address and Netmask                               # viene mostrato un suggerimento per il parametro


