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
   Se è impostata la varialbel __cm_debug stampa lo stack di chiamata delle funzioni

   :param text: la stringa da stampare
   :type text: String

.. function:: __cm_set_globvars()

  imposta le variabili `command` `command_path` `param` `command_path_dir` `command_name` `command_node_priority` `command_priority`

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

   :param command: il comando di cui si vuole conoscere il path del performer. 
    Deve essere il coamndo senza parametri
   :type command: String

.. function:: __cm_check_nodes_syntax(command)

   Naviga il comando `command` e per ogni nodo tag esegue lo script di sintassi

   :param command: il comando da verificare
   :type command: String
.. function:: __cm_exec_tag_nodes(command)

   Naviga il comando `command` e per ogni nodo tag esegue lo script di sintassi

   :param command: il comando da verificare
   :type command: String
.. function:: __cm_command_path_dir(command)
   
   Stampa il nome della directory che contiene lo script che implementa il comando ``command``

   :param command: il comando senza parametri
   :type command: String

.. function:: __cm_is_command_leaf(command)
   
   ritorna 0 se il comando ``command`` è una foglia, altrimenti 1

   :param command: il comando senza parametri
   :type command: String
   :rtype: Integer

.. function:: __cm_is_command_tag(command)
   
   ritorna 0 se il comando ``command`` è un nodo tag, altrimenti 1

   :param command: il comando senza parametri
   :type command: String
   :rtype: Integer

.. function:: __cm_is_command_node(command)
   
   ritorna 0 se il comando ``command`` è un ramo, altrimenti 1

   :param command: il comando senza parametri
   :type command: String
   :rtype: Integer

.. function __cm_analyze_command(command)

   stampa `type` e `performer` per il comando passato.
   `type` puo' essere **tag**, **node** o **leaf** a seconda del tipo di comando

   :param command: il comando da analizzare
   :type command: string
   :rtype: String
.. function:: __cm_get_command_node_priority(command_node)
   
   stampa la priorità del command node. Se non trova il file di priorità
   stampa la priorità definita dalla variabile ``_cm_default_priority``

   :param command_node: il comando senza parametri
   :type command_node: String
   :rtype: Integer

.. function:: __cm_get_command_priority(command)
   
   stampa la priorità del comado. Se non trova il file di priorità
   stampa la priorità definita dalla variabile ``_cm_default_priority``

   :param command: il comando senza parametri
   :type command: String
   :rtype: Integer

.. _cmdb_api:

=====================================
Configuration Management Database API
=====================================

.. function:: __cm_db_create_node(node)
   
   Crea un nodo all'interno del CMDB

   :param node: il branch da creare
   :type node: String

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

.. function:: __cm_db_list_nodes_sorted_priority(node_path)
   
   Elenca i nodi figli di `node_path` ordinati per priorità all'interno del CMDB.
   Viene stampata anche la priorità

   :param node_path: il path del node

.. function:: __cm_db_list_nodes_sorted(node)
   
   Elenca i nodi figli di `node` ordinati per priorità all'interno del CMDB.

   :param node: il path del nodo

.. function:: __cm_db_node_to_path(node)
   
   Stampa il path del filesystem associato a `node`.

   :param node: il path del node

.. function:: __cm_db_list_leaf_sorted_priority(node)
   
   Elenca le foglie figlie di `node` ordinate per priorità all'interno del CMDB.
   Viene stampata anche la priorità

   :param node: il path del node

.. function:: __cm_db_list_leaf_sorted(node)
   
   Elenca le foglie figlie di `node_path` ordinate per priorità all'interno del CMDB.

   :param node: il path del node

.. function:: __cm_db_is_leaf(leaf)
   
   ritorna 0 se la foglia ``leaf`` è una foglia, altrimenti 1

   :param leaf: la voglia da verificare
   :type leaf: String
   :rtype: Integer

.. function:: __cm_db_show_tree([node])
   
   Stampa un albero del CMDB partendo da `node` ordinato per priorità.
   `node` è facoltativo

   :param node: il path del branch

.. function:: __cm_db_remove_leaf(leaf_path)
   
   Rimuove la foglia `leaf_path` dal CMDB.

   :param leaf_path: il path della foglia

.. function:: __cm_db_remove_branch(node)
   
   Rimuove il node `node` dal CMDB.

   :param branch_path: il nodo da rimuovere

.. function:: __cm_show_conf[node])
   
   Stampa un albero del CMDB partendo da `node` ordinato per priorità.
   A differenza di `__cm_db_show_tree` antepone il nome del comando prendendolo dalla variabile `__cm_bin`

   :param branch_path: il nodo do partenza

