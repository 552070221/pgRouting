..
   ****************************************************************************
    pgRouting Manual
    Copyright(c) pgRouting Contributors

    This documentation is licensed under a Creative Commons Attribution-Share
    Alike 3.0 License: http://creativecommons.org/licenses/by-sa/3.0/
   ****************************************************************************

.. _installation:

Installation
===============================================================================

This is a basic guide to download and install pgRouting.

The specific instructions for any given OS distribution may vary depending on the various package maintainers.
Contact the specific OS package maintainer for details.

.. note:: The following are only general instructions.

Additional notes and corrections can be found in `Installation wiki <https://github.com/pgRouting/pgrouting/wiki/Notes-on-Download%2C-Installation-and-building-pgRouting>`__

Also PostGIS provides some information about installation in this `Install Guide <http://www.postgis.us/presentations/postgis_install_guide_22.html>`__



Download
--------

Binary packages are provided for the current version on the following platforms:


Windows
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Winnie Bot Builds:

* `Winnie Bot Builds <http://postgis.net/windows_downloads>`_

Production Builds:

* Production builds are part of the Spatial Extensions/PostGIS Bundle available via Application StackBuilder
* Can also get PostGIS Bundle from http://download.osgeo.org/postgis/windows/


Ubuntu
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

pgRouting on Ubuntu can be installed using packages from a PostgreSQL repository:

Using a terminal window:

* Create /etc/apt/sources.list.d/pgdg.list. The distributions are called codename-pgdg.

.. code-block:: bash

   sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

* Import the repository key, update the package lists

.. code-block:: bash

    sudo apt install wget ca-certificates
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    sudo apt update

* Install pgrouting based on your postgres Installation: for this example is 9.3

.. code-block:: bash

    sudo apt install postgresql-9.3-pgrouting

This will also install all required packages such as PostgreSQL and PostGIS if not installed yet.

* To be up-to-date with changes and improvements


.. code-block:: bash

    sudo apt-get update & sudo apt-get upgrade


RHEL/CentOS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* Add repositories for dependencies:

  .. code-block:: bash

     wget http://repo.enetres.net/enetres.repo -O /etc/yum.repos.d/enetres.repo
     wget http://nextgis.ru/programs/centos/nextgis.repo -O /etc/yum.repos.d/nextgis.repo
     yum install epel-release

* Install PostgreSQL and PostGIS according to `this <https://trac.osgeo.org/postgis/wiki/UsersWikiPostGIS21CentOS6pgdg>`__ instructions.

* Install CGAL:

  .. code-block:: bash

     yum install libCGAL10

* Install pgRouting:

  .. code-block:: bash

     yum install pgrouting_94

More info (and packages for CentOS) can be found `here <https://github.com/nextgis/gis_packages_centos/wiki/Using-this-repo>`__.



Fedora
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* Fedora RPM's: https://admin.fedoraproject.org/pkgdb/package/rpms/pgRouting/


FreeBSD
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

pgRouting can be installed via ports:

.. code-block:: bash

  cd /usr/ports/databases/pgRouting
  make install clean


OS X
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. See `builds from KingChaos <http://www.kyngchaos.com/software/postgres>`_.

* Homebrew

.. code-block:: bash

	brew install pgrouting


Source Package
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You can find all the pgRouting Releases:

https://github.com/pgRouting/pgrouting/releases

See :ref:`build` to build the binaries from the source.

Using Git
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Git protocol (read-only):

.. code-block:: bash

	git clone git://github.com/pgRouting/pgrouting.git


HTTPS protocol (read-only):

.. code-block:: bash

	git clone https://github.com/pgRouting/pgrouting.git

See :ref:`build` to build the binaries from the source.

Installing in the database
--------------------------

pgRouting is an extension.

.. code-block:: sql

  CREATE EXTENSION postgis;
  CREATE EXTENSION pgrouting;


Upgrading the database
----------------------

To upgrade pgRouting to version 2.x.y use the following command:

.. code-block:: sql

   ALTER EXTENSION pgrouting UPDATE TO "2.x.y";

   For example to upgrade to 2.2.3

   .. code-block:: sql

   ALTER EXTENSION pgrouting UPDATE TO "2.2.3";


