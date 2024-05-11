.. highlight:: shell

*******************************
A simple 3D vector library
*******************************

``v3d`` is a simple vector library with the common operations.
   
Usage
=====

If you have **Open Dylan 2022.1 or later**, the program
:program:`dylan` is already installed as part of that release.  Create
your new project with ``dylan new application <name>``, and edit the file
``dylan-package.json`` created. Just add ``v3d`` in ``dependencies``.

To know more about :program:`dylan` package manager visit
`Dylan tool <https://opendylan.org/documentation/dylan-tool/>`_.

Quick summary of ``v3d``
========================

The module ``v3d`` exports the following features:

- ``<v3>`` and ``v3`` to create instances.

- Query dimensions: ``v-x``, ``v-y``, ``v-z``.
  
- Infix operations: ``+``, ``-``, ``*``, ``/``, ``negative``, ``*``
  (scalar multiplication), and ``=``.

- Other operations: ``squared``, ``magnitude``, ``cross-product``,
  ``normalize`` and ``distance``.

- Queries: ``unit?`` and ``zero?``

- Utility: ``$v3-zero`` and ``similar``.

See a detailed explanation with examples in the :doc:`v3d` link.

.. note::

   The vectors are read-only. You can't change the dimensions without
   creating a new instance. There are only getters methods and no
   setters.

Library structure and dependencies
==================================

The libraries used by the project are shown with the modules inside.
The arrows between the libraries are the dependencies.

.. graphviz::
   :caption: Libraries (light box) and modules (dark box) used

   digraph G {
         bgcolor="#eceff1";
	 graph [compound=true];
	 fontname = "times-bold";
	 node [
	   fontname="Arial";
	   shape="component";
	   color="#90a4ae";
	   fontcolor="#eceff1";
	   style="filled";
	 ]
	 edge [
	   fontname="Arial";
	   color="#37474f";
	   style="dashed";
	 ]
	 ranksep = 1.0;
	
	 subgraph cluster_v3d {
	   fontcolor="#37474f";
	   color="#cfd8dc";
	   style="filled";
	   shape="component";
	   label="v3d";
	   v3d;
	 };
	
	 subgraph cluster_cd {
	   fontcolor="#263238";
	   color="#cfd8dc";
	   style="filled";
	   label="common-dylan";
	   rank = same;
	   rankdir = LR;
	   "common-dylan";
	   transcendentals;
         };
	
         subgraph cluster_io {
	   fontcolor="#263238";
	   color="#cfd8dc";
	   style="filled";
	   label="io";
	   rank = same;
	   format;
	   streams;
	   print;
	 };

	 "v3d" -> streams         [ltail=cluster_v3d, lhead=cluster_io];
	 "v3d" -> "common-dylan"  [ltail=cluster_v3d, lhead=cluster_cd];
    }

.. toctree::
   :maxdepth: 2

   v3d
   
Index and Search
================

* :ref:`genindex`
* :ref:`search`
