########################
Bacula Director Commands
########################

.. |OK| replace::
   **OK** Implemented

.. |TODO| replace::
   **TODO** To omplement

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
Catalog                    |TODO|
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

**Messages Resource**

**Console Resource**

**Job Resource**

**Schedule Resource**

**FileSet Resource**

