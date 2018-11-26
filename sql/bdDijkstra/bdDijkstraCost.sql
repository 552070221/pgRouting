/*PGR-GNU*****************************************************************

Copyright (c) 2017 pgRouting developers
Mail: project@pgrouting.org

Copyright (c) 2017 Celia Virginia Vergara Castillo
mail: vicky_vergara@hotmail.com

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


----------------------
-- pgr_bdDijkstraCost
----------------------


-- ONE TO ONE
CREATE OR REPLACE FUNCTION pgr_bdDijkstraCost(
    TEXT,   -- edges_sql (required)
    BIGINT, -- from_vid (requiered)
    BIGINT, -- to_vid (requiered)

    directed BOOLEAN DEFAULT TRUE,

    OUT start_vid BIGINT,
    OUT end_vid BIGINT,
    OUT agg_cost FLOAT)
RETURNS SETOF RECORD AS
$BODY$
    SELECT a.start_vid, a.end_vid, a.agg_cost
    FROM _pgr_bdDijkstra(_pgr_get_statement($1), ARRAY[$2]::BIGINT[], ARRAY[$3]::BIGINT[], $4, true) AS a;
$BODY$
LANGUAGE sql VOLATILE STRICT
COST 100
ROWS 1000;

COMMENT ON FUNCTION pgr_bdDijkstraCost(TEXT, BIGINT, BIGINT, BOOLEAN)
IS 'pgr_bdDijkstraCost(One to One)
- Parameters:
   - Edges SQL with columns: id, source, target, cost [,reverse_cost]
   - From vertex identifier
   - To vertex identifier
- Optional Parameters
   - directed := true
- Documentation:
   - ${PGROUTING_DOC_LINK}/pgr_bdDijkstraCost.html
';


-- ONE TO MANY
CREATE OR REPLACE FUNCTION pgr_bdDijkstraCost(
    TEXT,     -- edges_sql (requiered)
    BIGINT,   -- from_vid (requiered)
    ANYARRAY, -- to_vids (requiered)
    directed BOOLEAN DEFAULT TRUE,
    OUT start_vid BIGINT,
    OUT end_vid BIGINT,
    OUT agg_cost FLOAT)
RETURNS SETOF RECORD AS
$BODY$
    SELECT a.start_vid, a.end_vid, a.agg_cost
    FROM _pgr_bdDijkstra(_pgr_get_statement($1), ARRAY[$2]::BIGINT[], $3::BIGINT[], $4, true) as a;
$BODY$
LANGUAGE sql VOLATILE STRICT
COST 100
ROWS 1000;


-- MANY TO ONE
CREATE OR REPLACE FUNCTION pgr_bdDijkstraCost(
    TEXT,     -- edges_sql (requiered)
    ANYARRAY, -- from_vids (requiered)
    BIGINT,   -- to_vid (requiered)
    directed BOOLEAN DEFAULT TRUE,
    OUT start_vid BIGINT,
    OUT end_vid BIGINT,
    OUT agg_cost FLOAT)
RETURNS SETOF RECORD AS
$BODY$
    SELECT a.start_vid, a.end_vid, a.agg_cost
    FROM _pgr_bdDijkstra(_pgr_get_statement($1), $2::BIGINT[], ARRAY[$3]::BIGINT[], $4, true) as a;
$BODY$
LANGUAGE sql VOLATILE STRICT
COST 100
ROWS 1000;



-- MANY TO MANY
CREATE OR REPLACE FUNCTION pgr_bdDijkstraCost(
    TEXT,     -- edges_sql (requiered)
    ANYARRAY, -- from_vids (requiered)
    ANYARRAY, -- to_vids (requiered)
    directed BOOLEAN DEFAULT TRUE,
    OUT start_vid BIGINT,
    OUT end_vid BIGINT,
    OUT agg_cost FLOAT)
RETURNS SETOF RECORD AS
$BODY$
    SELECT a.start_vid, a.end_vid, a.agg_cost
    FROM _pgr_bdDijkstra(_pgr_get_statement($1), $2::BIGINT[], $3::BIGINT[], directed, true) as a;
$BODY$
LANGUAGE SQL VOLATILE STRICT
COST 100
ROWS 1000;

-- COMMENTS

COMMENT ON FUNCTION pgr_bdDijkstraCost(TEXT, BIGINT, BIGINT, BOOLEAN)
IS 'pgr_bdDijkstraCost--One to One--(edges_sql(id,source,target,cost[,reverse_cost]), from_vid, to_vid [,directed])';
COMMENT ON FUNCTION pgr_bdDijkstraCost(TEXT, BIGINT, ANYARRAY, BOOLEAN)
IS 'pgr_bdDijkstraCost--One to Many--(edges_sql(id,source,target,cost[,reverse_cost]), from_vid, to_vids [,directed])';
COMMENT ON FUNCTION pgr_bdDijkstraCost(TEXT, ANYARRAY, BIGINT, BOOLEAN)
IS 'pgr_bdDijkstraCost--Many to One--(edges_sql(id,source,target,cost[,reverse_cost]), from_vids, to_vid [,directed])';
COMMENT ON FUNCTION pgr_bdDijkstraCost(TEXT, ANYARRAY, ANYARRAY, BOOLEAN)
IS 'pgr_bdDijkstraCost--Many to Many--(edges_sql(id,source,target,cost[,reverse_cost]), from_vids, to_vids [,directed])';
