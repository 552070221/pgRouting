..
   ****************************************************************************
    pgRouting Manual
    Copyright(c) pgRouting Contributors

    This documentation is licensed under a Creative Commons Attribution-Share
    Alike 3.0 License: http://creativecommons.org/licenses/by-sa/3.0/
   ****************************************************************************

pgr_bdDijkstraCost
===============================================================================

``pgr_bdDijkstraCost`` — Returns the shortest path(s)'s cost using Bidirectional Dijkstra algorithm.

.. figure:: images/boost-inside.jpeg
   :target: http://www.boost.org/libs/graph/doc

   Boost Graph Inside

.. rubric:: Availability:

* Official on v3.0.0
* Proposed on v2.5.0

Description
-------------------------------------------------------------------------------
* **TBD**

Signatures
-------------------------------------------------------------------------------

.. rubric:: Summary

.. code-block:: none

    pgr_bdDijkstraCost(edges_sql, from_vid,  to_vid  [, directed])
    pgr_bdDijkstraCost(edges_sql, from_vid,  to_vids [, directed])
    pgr_bdDijkstraCost(edges_sql, from_vids, to_vid  [, directed])
    pgr_bdDijkstraCost(edges_sql, from_vids, to_vids [, directed])
    
    RETURNS SET OF (start_vid, end_vid, agg_cost)
    OR EMPTY SET

.. rubric:: Using default

.. code-block:: none

    pgr_bdDijkstraCost(edges_sql, from_vid,  to_vid)
    RETURNS SET OF (seq, path_seq, node, edge, cost, agg_cost)
    OR EMPTY SET

:Example: From vertex :math:`2` to vertex  :math:`3` on a **directed** graph

.. literalinclude:: doc-pgr_bdDijkstraCost.queries
   :start-after: -- q1
   :end-before: -- q2

.. index::
    single: bdDijkstraCost(One to One)

One to One
...............................................................................

.. code-block:: none

    pgr_bdDijkstraCost(edges_sql, from_vid,  to_vid  [, directed])
    RETURNS SET OF (seq, path_seq, node, edge, cost, agg_cost)
    OR EMPTY SET

:Example: From vertex :math:`2` to vertex  :math:`3` on an **undirected** graph

.. literalinclude:: doc-pgr_bdDijkstra.queries
   :start-after: -- q2
   :end-before: -- q3

.. index::
    single: bdDijkstraCost(One to Many)

One to Many
...............................................................................

.. code-block:: none

    pgr_bdDijkstraCost(edges_sql, from_vid,  to_vids [, directed])
    RETURNS SET OF (seq, path_seq, end_vid, node, edge, cost, agg_cost)
    OR EMPTY SET

:Example: From vertex :math:`2` to vertices :math:`\{3, 11\}` on a **directed** graph

.. literalinclude:: doc-pgr_bdDijkstraCost.queries
   :start-after: -- q3
   :end-before: -- q4

.. index::
    single: bdDijkstraCost(Many to One)

Many to One
...............................................................................

.. code-block:: none

    pgr_bdDijkstraCost(edges_sql, from_vids, to_vids [, directed])
    RETURNS SET OF (seq, path_seq, start_vid, node, edge, cost, agg_cost)
    OR EMPTY SET

:Example: From vertices :math:`\{2, 7\}` to vertex :math:`3` on a **directed** graph

.. literalinclude:: doc-pgr_bdDijkstra.queries
   :start-after: -- q4
   :end-before: -- q5

.. index::
    single: bdDijkstraCost(Many to Many)

Many to Many
...............................................................................

.. code-block:: none

    pgr_bdDijkstra(edges_sql, start_vids, end_vids [, directed])
    RETURNS SET OF (seq, path_seq, start_vid, end_vid, node, edge, cost, agg_cost)
    OR EMPTY SET

:Example: From vertices :math:`\{2, 7\}` to vertices :math:`\{3, 11\}` on a **directed** graph

.. literalinclude:: doc-pgr_bdDijkstra.queries
   :start-after: -- q5
   :end-before: -- q6

Parameters
-------------------------------------------------------------------------------

.. include:: pgr_dijkstra.rst
    :start-after: pgr_dijkstra_parameters_start
    :end-before: pgr_dijkstra_parameters_end

Inner query
-------------------------------------------------------------------------------

.. include::  pgRouting-concepts.rst
    :start-after: basic_edges_sql_start
    :end-before: basic_edges_sql_end

Result Columns
-------------------------------------------------------------------------------

.. include::  pgRouting-concepts.rst
    :start-after: return_cost_start
    :end-before: return_cost_end

See Also
-------------------------------------------------------------------------------

* The queries use the :doc:`sampledata` network.
* :doc:`pgr_bdDijkstra`
* http://www.cs.princeton.edu/courses/archive/spr06/cos423/Handouts/EPP%20shortest%20path%20algorithms.pdf
* https://en.wikipedia.org/wiki/Bidirectional_search

.. rubric:: Indices and tables

* :ref:`genindex`
* :ref:`search`

