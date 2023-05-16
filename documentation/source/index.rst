.. highlight:: shell

*******************************
A simple 3D vector library
*******************************

``v3d`` is a simple vector library with the common operations.
   
.. toctree::
   :maxdepth: 2

   v3d
   
.. contents::
   :depth: 3

Usage
=====

If you have **Open Dylan 2022.1 or later**, the program
:program:`dylan` is already installed as part of that release.  Create
your new project with ``dylan new application <name>``, and edit the file
``dylan-package.json`` created. Just add ``v3d`` in ``dependencies``

Change this:

.. code-block:: JSON
		
    "dependencies": [ ],

to this:

.. code-block:: JSON
		
    "dependencies": [ "v3d" ],

To know more about :program:`dylan` package manager visit
`Dylan tool <https://opendylan.org/documentation/dylan-tool/>`_

Quick summary of ``v3d``
========================

The module ``v3d`` exports the following features:

- ``<v3>``
- ``v3d``
- ``v-x``
- ``v-y``
- ``v-z``
- ``$v3-zero``
- ``similar``
- ``squared``
- ``magnitude``
- ``cross-product``
- ``unit?``
- ``normalize``
- ``unitize``
- ``distance``

.. note::

   The vectors are read-only. You can't change the dimensions without
   creating a new instance. There are only getters methods and no
   setters.

Library structure and dependencies
==================================

The libraries used by the project are shown with the modules inside.
The arrows between the modules are the dependencies.

.. uml::
   
   folder "v3d" as v3d_lib {
     [v3d] as v3d
   }

   folder "common-dylan" as common_dylan_lib {
     [common-dylan] as common_dylan
   }

   folder "io"  as io_lib {
     [format]
     [streams]
   }

   common_dylan <-- v3d
   format       <-- v3d 
   streams      <-- v3d




Index and Search
================

* :ref:`genindex`
* :ref:`search`
