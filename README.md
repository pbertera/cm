CM: Configuration manager tools and framework
=============================================

Cosa e'?
--------

CM è un framework scritto in bash con lo scopo di rendere semplice lo sviluppo di una CLI cisco style per la gestione di macchine UNIX.
E' possibile utilizzare CM cosi' come è, con i comandi implementati nei vari packages oppure implementare nuovi comandi aggiungendo 
dei semplici script bash.

Features
--------

CM è scritto attorno a [bash](http://www.gnu.org/software/bash/) e si appoggia molte sue funzionalità.

 * autompletamento: essendo basato su bash si possono sfruttare le robuste basi della bash completion
 * help integrato: ogni package prevede un proprio help per ogni comando
 * possibilità di creare comandi sincroni o asincroni
 * diversi livelli di accesso: es: operator mode e configure mode
 * integrabile: tramite le api bash di accesso al CMDB (Configuration Management Database)
 * possibilità di import/export del CMDB
 * flessibile: i comandi della CLI CM possono essere inclusi in qualisasi script
 * robusta: di ogni comando viene verificata la corretta sintassi

Installazione
-------------

1. Configura cm editando il file src/config.mk di seguito il significato delle variabili:
	* CM_LIBDIR `/opt/cm/lib` directory in cui verra installato il framework
	* CM_BINDIR `/opt/cm/bin` directory in cui verranno installati i comandi
	* CM_DBDIR `/opt/cm/db` directory in cui risederà il CMDB
	* COMPLETION_DIR `/etc/bash_completion.d/` directory in cui risiedono i file di bash completion
	* CM_OPERATOR_USER `cm` utente non privilegiato utilizzato come operatore
	* CM_OPERATOR_HOME `/home/$(CM_OPERATOR_USER)` home direcotry dell'utente operatore
	* CM_OPERATOR_LIBEXECDIR `/opt/cm/operator-libexec` directory in cui verranno installati gli script di livello operatore
	* CM_CONFIGURE_USER `cmsu` nome utente privilegiato (con uid e gid = 0) con cui verranno eseguiti i comandi in configure mode
	* CM_CONFIGURE_HOME `/home/$(CM_CONFIGURE_USER)` home directory dell'utente privilegiato
	* CM_CONFIGURE_LIBEXECDIR `/opt/cm/configure-libexec` directory in cui verranno installati gli script di livello configure
	* CM_CONFIGURE_PWD `changeme` password dell'utente privilegiato

2.
	make all

# API DOC(in progress)
	Struttura:
	
	command branch= percorso fino al comando
	command leaf= nome del comando
	command parameters= tutto quello che segue il command leaf
	
	Es:
	set system hostname ciccio pasticcio
	----------|--------|----------------|
	  branch     leaf      parameters

	deve eseguire il comando
	$libexec/system/hostname "ciccio pasticcio"
	
	se salva il valore nel db lo salva in
	
	echo "ciccio pasticcio" > $db/system/hostname
