/*PGR-GNU*****************************************************************
File: routing_ksp.sql

Copyright (c) 2015 Celia Virginia Vergara Castillo
vicky_vergara@hotmail.com

------

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

********************************************************************PGR-GNU*/
---------------
---------------
-- pgr_ksp
---------------
---------------

CREATE OR REPLACE FUNCTION _pgr_ksp(
    edges_sql TEXT,
    start_vid BIGINT,
    end_vid BIGINT,
    k INTEGER,

    directed BOOLEAN,
    heap_paths BOOLEAN,

    OUT seq INTEGER,
    OUT path_id INTEGER,
    OUT path_seq INTEGER,
    OUT node BIGINT,
    OUT edge BIGINT,
    OUT cost FLOAT,
    OUT agg_cost FLOAT)
RETURNS SETOF RECORD AS
'MODULE_PATHNAME', 'kshortest_path'
LANGUAGE C VOLATILE STRICT;

CREATE OR REPLACE FUNCTION pgr_ksp(
    TEXT, -- edges_sql (required)
    BIGINT, -- from_vids (required)
    BIGINT,   -- to_vids (required)
    INTEGER, -- K (required)

    directed BOOLEAN DEFAULT true,
    heap_paths BOOLEAN DEFAULT false,

    OUT seq INTEGER,
    OUT path_id INTEGER,
    OUT path_seq INTEGER,
    OUT node BIGINT,
    OUT edge BIGINT,
    OUT cost FLOAT,
    OUT agg_cost FLOAT)
RETURNS SETOF RECORD AS
$BODY$
    SELECT *
    FROM _pgr_ksp(_pgr_get_statement($1), $2, $3, $4, $5, $6);
$BODY$
LANGUAGE SQL VOLATILE STRICT
COST 100
ROWS 1000;

-- COMMENTS

COMMENT ON FUNCTION _pgr_ksp(TEXT, BIGINT, BIGINT, INTEGER, BOOLEAN, BOOLEAN)
IS 'pgRouting internal function';

COMMENT ON FUNCTION pgr_ksp(TEXT, BIGINT, BIGINT, INTEGER, BOOLEAN, BOOLEAN)
IS 'pgr_ksp -- edges_sql(id,source,target,cost[,reverse_cost]), from_vid, to_vid, K [,directed, heap_paths]';
