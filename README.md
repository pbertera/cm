# CM: Configuration manager tools and framework #

*	Cosa e'?
CM è un framework scritto in bash con lo scopo di rendere semplice lo sviluppo di una CLI cisco style per la gestione di macchine UNIX.
E' possibile utilizzare CM cosi' come è, con i comandi implementati nei vari packages oppure implementare nuovi comandi aggiungendo 
dei semplici script bash.

*	Features
	*	autompletamento: essendo basato su bash si possono sfruttare le robuste basi della bash completion
	*	help integrato: ogni package prevede un proprio help per ogni comando
	*	possibilità di creare comandi sincroni o asincroni
	*	diversi livelli di accesso: es: operator mode e configure mode
	*	integrabile: tramite le api bash di accesso al CMDB (Configuration Management Database)
	*	possibilità di import/export del CMDB
	*	flessibile: i comandi della CLI CM possono essere inclusi in qualisasi script
 

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
