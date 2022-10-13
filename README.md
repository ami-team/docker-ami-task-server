[![][Build Status img]][Build Status]
[![][License img]][License]

<a href="http://lpsc.in2p3.fr/" target="_blank">
	<img src="http://ami.in2p3.fr/docs/images/logo_lpsc.png" alt="LPSC" height="72" />
</a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="http://www.in2p3.fr/" target="_blank">
	<img src="http://ami.in2p3.fr/docs/images/logo_in2p3.png" alt="IN2P3" height="72" />
</a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="http://www.univ-grenoble-alpes.fr/" target="_blank">
	<img src="http://ami.in2p3.fr/docs/images/logo_uga.png" alt="UGA" height="72" />
</a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="http://home.cern/" target="_blank">
	<img src="http://www.cern.ch/ami/images/logo_atlas.png" alt="CERN" height="72" />
</a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="http://atlas.cern/" target="_blank">
	<img src="http://ami.in2p3.fr/docs/images/logo_cern.png" alt="CERN" height="72" />
</a>

AMITaskServer Docker Image
==========================

The ATLAS Metadata Interface Task Server (AMITaskServer) is a generic high level time-based job scheduler. It was originally developed for the A Toroidal LHC ApparatuS (ATLAS) experiment, one of the two general-purpose detectors at the Large Hadron Collider (LHC).

This is the official Docker image.

Environment variables
=====================

* `SERVER_NAME`
* `MQTT_URL`
* `MQTT_USERNAME`
* `MQTT_PASSWORD`
* `JDBC_URL`
* `JDBC_USERNAME`
* `JDBC_PASSWORD`
* `EXCLUSION_SERVER_URL`<sup>opt, default: <i>empty</i></opt>
* `PING_PERIOD`<sup>opt, default: 10</opt>
* `CLEANUP_PERIOD`<sup>opt, default: 172800</opt>
* `QUALITY_OF_SERVICE`<sup>opt, default: 0</opt>
* `MAX_NB_OF_RUNNING_TASKS`<sup>opt, default: 10</opt>
* `PRIORITY_PROBABILITY_RATIO`<sup>opt, default: 2.0</opt>

Volume
======

Task scripts/programs must be located there: `/AMITaskServer/workspace/`.

Developers
==========

* [Jérôme ODIER](https://annuaire.in2p3.fr/4121-4467/jerome-odier) ([CNRS/LPSC](http://lpsc.in2p3.fr/))

[Build Status]:https://github.com/ami-team/docker-ami-task-server/actions/workflows/docker-image.yml
[Build Status img]:https://github.com/ami-team/docker-ami-task-server/actions/workflows/docker-image.yml/badge.svg?branch=master

[License]:http://www.cecill.info/licences/Licence_CeCILL_V2.1-en.txt
[License img]:https://img.shields.io/badge/license-CeCILL-blue.svg
