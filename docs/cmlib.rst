==================
Funzioni Generiche
==================

Le funzioni in questa sezioni sono ad utilità generica

.. function:: __cm_print_help_header(command)
   
   Stampa l'help header del comando

   ``__cm_print_help_header "system interface ethernet eth0 address4"`` produrrà in stdout ::

      -----------------------------------------------
      Command Help: system interface ethernet eth0 address4
      -----------------------------------------------
   
   :param command: il comando da documentare
   :type command: String

.. function:: __cm_print_help_bottom()
   
   Stampa l'help bottom del comando

   ``__cm_print_help_bottom`` produrrà in stdout ::

      -----------------------------------------------
   
.. function:: __cm_debug([text],[...])
   
   Stampa la stringa passata in stderr solo se è impostata la variabile ``__cm_debug``

   ``__cm_debug Hello world`` produrrà in stderr ::

       Debug: Hello world 
   
   :param text: la stringa da stampare
   :type text: String

.. function:: __cm_exit_error([text],[...])
   
   Stampa la stringa passata in stderr ed esce

   :param text: la stringa da stampare
   :type text: String

=======================
Commands Management API
=======================

Le funzioni in questa sezione servono ad estrapolare le varie parti dei comandi (nome, parametri, script, ecc..)

.. function:: __cm_command_param(command)
   
   Stampa i soli parametri che fanno parte della stringa ``command``

   :param command: il comando da cui estrarre i parametri
   :type command: String

.. function:: __cm_command_name(command)
   
   Stampa il solo nome del comando ``command``

   :param command: il comando da cui estrarre il nome
   :type command: String

.. function:: __cm_command_name(command)
   
   Stampa il comando completo esclusi i parametri di ``command``

   :param command: il comando da cui togliere gli eventuali parametri
   :type command: String

.. function:: __cm_command_path(command)
   
   Stampa il path dello script che implementa il comando ``command``

   :param command: il comando senza parametri
   :type command: String

.. function:: __cm_command_path_dir(command)
   
   Stampa il nome della directory che contiene lo script che implementa il comando ``command``

   :param command: il comando senza parametri
   :type command: String

.. function:: __cm_is_command(command)
   
   ritorna 0 se il comando ``command`` è un comando, altrimenti 1

   :param command: il comando senza parametri
   :type command: String
   :rtype: Integer

.. function:: __cm_is_branch(command)
   
   ritorna 0 se il comando ``command`` è un ramo, altrimenti 1

   :param command: il comando senza parametri
   :type command: String
   :rtype: Integer

.. function:: __cm_get_command_branch_priority(command_branch)
   
   stampa la priorità del command branch. Se non trova il file di priorità
   stampa la priorità definita dalla variabile ``_cm_default_priority``

   :param command_branch: il comando senza parametri
   :type command_branch: String
   :rtype: Integer

.. function:: __cm_get_command_branch_priority(command)
   
   stampa la priorità del comado. Se non trova il file di priorità
   stampa la priorità definita dalla variabile ``_cm_default_priority``

   :param command: il comando senza parametri
   :type command: String
   :rtype: Integer

.. _cmdb_api:

=====================================
Configuration Management Database API
=====================================

.. function:: __cm_db_create_branch(branch)
   
   Crea un branch all'interno del CMDB

   :param branch: il branch da creare
   :type command: String

.. function:: __cm_db_set_leaf(value, leaf_path)
   
   Crea una foglia con path `leaf_path` all'interno del CMDB impostando il valore a `value`. 
   Se la foglia esiste già viene sovrascritta. Es.: ::

   __cm_db_set_leaf 192.168.101.11 system name-server

   imposterà a `192.168.101.11` la foglia `name-server` sotto il path `system`

   :param value: il valore da assegnare alla foglia
   :param leaf_path: il path della foglia

.. function:: __cm_db_append_leaf(value, leaf_path)
   
   Aggiunge un valore ad foglia con path `leaf_path` all'interno del CMDB. 
   Se la foglia non esiste viene creata. Es.: ::

   __cm_db_append_leaf 192.168.101.11/24 interfaces ethernet eth0 address4

   imposterà a `192.168.101.11/24` la foglia `address4` sotto il path `interfaces ethernet eth0`

   :param value: il valore da aggiungere alla foglia
   :param leaf_path: il path della foglia

.. function:: __cm_db_get_leaf(leaf_path)
   
   Stampa il valore della foglia con path `leaf_path` all'interno del CMDB. 

   __cm_db_get_leaf interfaces ethernet eth0 address4

   stamperà il contenuto della foglia `address4` sotto il path `interfaces ethernet eth0`

   :param leaf_path: il path della foglia

.. function:: __cm_db_list_branches_sorted_priority(branch_path)
   
   Elenca i branch figli di `branch_path` ordinati per priorità all'interno del CMDB.
   Viene stampata anche la priorità

   :param branch_path: il path del branch

.. function:: __cm_db_list_branches_sorted(branch_path)
   
   Elenca i branch figli di `branch_path` ordinati per priorità all'interno del CMDB.

   :param branch_path: il path del branch

.. function:: __cm_db_branch_to_path(branch_path)
   
   Stampa il path del filesystem associato a `branch_path`.

   :param branch_path: il path del branch

.. function:: __cm_db_list_leaf_sorted(branch_path)
   
   Elenca le foglie figlie di `branch_path` ordinate per priorità all'interno del CMDB.
   Viene stampata anche la priorità

   :param branch_path: il path del branch

.. function:: __cm_db_list_leaf_sorted(branch_path)
   
   Elenca le foglie figlie di `branch_path` ordinate per priorità all'interno del CMDB.

   :param branch_path: il path del branch

.. function:: __cm_db_is_leaf(leaf_path)
   
   ritorna 0 se la foglia ``leaf_path`` è una foglia, altrimenti 1

   :param leaf_path: la voglia da verificare
   :type leaf_path: String
   :rtype: Integer

.. function:: __cm_db_show_tree([branch_path])
   
   Stampa un albero del CMDB partendo da `branch_path` ordinato per priorità.

   :param branch_path: il path del branch

.. function:: __cm_db_remove_leaf(leaf_path)
   
   Rimuove la foglia `leaf_path` dal CMDB.

   :param leaf_path: il path della foglia

.. function:: __cm_db_remove_branch(branch_path)
   
   Rimuove il branch `branch_path` dal CMDB.

   :param branch_path: il path del branch

.. function:: __cm_show_conf[branch_path])
   
   Stampa un albero del CMDB partendo da `branch_path` ordinato per priorità.
   A differenza di `__cm_db_show_tree` antepone il nome del comando prendendolo dalla variabile `__cm_bin`

   :param branch_path: il path del branch

