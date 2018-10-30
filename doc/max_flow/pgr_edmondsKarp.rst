..
   ****************************************************************************
    pgRouting Manual
    Copyright(c) pgRouting Contributors

    This documentation is licensed under a Creative Commons Attribution-Share
    Alike 3.0 License: http://creativecommons.org/licenses/by-sa/3.0/
   ****************************************************************************

pgr_edmondsKarp
===============================================================================

``pgr_edmondsKarp`` — Calculates the flow on the graph edges that maximizes the flow from the sources to the targets using Push Relabel Algorithm.


.. figure:: images/boost-inside.jpeg
   :target: http://www.boost.org/libs/graph/doc/push_relabel_max_flow.html

   Boost Graph Inside

.. Rubric:: Availability

* Official on v3.0.0
* Renamed on v2.5.0
* Experimental on v2.3.0

  * pgr_maxFlowEdmondsKarp

Description
-------------------------------------------------------------------------------

.. include::  flow-family.rst
    :start-after: characteristics_start
    :end-before: characteristics_end

* Running time: :math:`O( V * E ^ 2)`

Signatures
-------------------------------------------------------------------------------

.. rubric:: Summary

.. code-block:: none

    pgr_edmondsKarp(edges_sql, source,  target)
    pgr_edmondsKarp(edges_sql, sources, target)
    pgr_edmondsKarp(edges_sql, source,  targets)
    pgr_edmondsKarp(edges_sql, sources, targets)
    RETURNS SET OF (seq, edge, start_vid, end_vid, flow, residual_capacity)
    OR EMPTY SET

.. index::
    single: edmondsKarp(One to One)

One to One
...............................................................................

.. code-block:: none

    pgr_edmondsKarp(edges_sql, source,  target)
    RETURNS SET OF (seq, edge, start_vid, end_vid, flow, residual_capacity)
    OR EMPTY SET

:Example: From vertex :math:`6` to vertex :math:`11`

.. literalinclude:: doc-pgr_edmondsKarp.queries
   :start-after: -- q1
   :end-before: -- q2

.. index::
    single: edmondsKarp(One to Many)

One to Many
...............................................................................

.. code-block:: none

    pgr_edmondsKarp(edges_sql, source,  targets)
    RETURNS SET OF (seq, edge, start_vid, end_vid, flow, residual_capacity)
    OR EMPTY SET

:Example: From vertex :math:`6` to vertices :math:`\{1, 3, 11\}`

.. literalinclude:: doc-pgr_edmondsKarp.queries
   :start-after: -- q2
   :end-before: -- q3

.. index::
    single: edmondsKarp(Many to One)

Many to One
...............................................................................

.. code-block:: none

    pgr_edmondsKarp(edges_sql, sources,  target)
    RETURNS SET OF (seq, edge, start_vid, end_vid, flow, residual_capacity)
    OR EMPTY SET

:Example: From vertices :math:`\{6, 8, 12\}` to vertex :math:`11`

.. literalinclude:: doc-pgr_edmondsKarp.queries
   :start-after: -- q3
   :end-before: -- q4

.. index::
    single: edmondsKarp(Many to Many)

Many to Many
...............................................................................

.. code-block:: none

    pgr_edmondsKarp(edges_sql, sources,  targets)
    RETURNS SET OF (seq, edge, start_vid, end_vid, flow, residual_capacity)
    OR EMPTY SET

:Example: From vertices :math:`\{6, 8, 12\}` to vertices :math:`\{1, 3, 11\}`

.. literalinclude:: doc-pgr_edmondsKarp.queries
   :start-after: -- q4
   :end-before: -- q5

Parameters
-------------------------------------------------------------------------------

.. include::  ./pgr_maxFlow.rst
    :start-after: pgr_flow_parameters_start
    :end-before: pgr_flow_parameters_end

Inner query
-------------------------------------------------------------------------------

edges_sql
...............................................................................

.. include:: pgRouting-concepts.rst
    :start-after: flow_edges_sql_start
    :end-before: flow_edges_sql_end

Result Columns
-------------------------------------------------------------------------------

.. include:: pgRouting-concepts.rst
    :start-after: result_flow_start
    :end-before: result_flow_end

See Also
-------------------------------------------------------------------------------

* :doc:`flow-family`, :doc:`pgr_boykovKolmogorov`, :doc:`pgr_pushRelabel`
* http://www.boost.org/libs/graph/doc/edmonds_karp_max_flow.html
* https://en.wikipedia.org/wiki/Edmonds%E2%80%93Karp_algorithm

.. rubric:: Indices and tables

* :ref:`genindex`
* :ref:`search`

