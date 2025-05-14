------------------------------------------------------------------------
-- Create a table of postal codes that occurs in only one street name --
--        BEGIN                                                       --
------------------------------------------------------------------------

    -- Count how many records share the same COD_SETOR, NUM_QUADRA, NUM_FACE, and CEP within the current municipality.
      DROP TABLE IF EXISTS public.ceps_logradouro_temp01;
      CREATE TABLE public.ceps_logradouro_temp01 AS
      SELECT 
          "COD_SETOR",
          "NUM_QUADRA"::TEXT AS cd_quadra,
          "NUM_FACE"::TEXT AS cd_face,
          "CEP",
          COUNT(*) AS count
      FROM public.dados_tipos_corrigidos
      GROUP BY "COD_SETOR", "NUM_QUADRA", "NUM_FACE", "CEP";

    -- Sum the count values for each unique combination of COD_SETOR, cd_quadra, and cd_face
    DROP TABLE IF EXISTS public.ceps_logradouro_temp02;
    CREATE TABLE public.ceps_logradouro_temp02 AS
    SELECT 
       "COD_SETOR",
       cd_quadra,
       cd_face,
       SUM(count) AS total
    FROM public.ceps_logradouro_temp01
    GROUP BY "COD_SETOR", cd_quadra, cd_face;  

    -- Select the most common CEP (the one with the highest count) for each unique combination of COD_SETOR, cd_quadra, and cd_face
    DROP TABLE IF EXISTS public.ceps_logradouro_temp03;
    CREATE TABLE public.ceps_logradouro_temp03 AS
    SELECT DISTINCT ON ("COD_SETOR", cd_quadra, cd_face)
        "COD_SETOR",
        cd_quadra,
        cd_face,
        "CEP" AS most_common_cep,
        count
    FROM public.ceps_logradouro_temp01
    ORDER BY "COD_SETOR", cd_quadra, cd_face, count DESC;

    -- Group records by COD_SETOR, cd_quadra, and cd_face, and creates an array of all distinct CEPs
	-- for each group, formatting them with a hyphen (e.g., 12345678 -> 12345-678).
    DROP TABLE IF EXISTS public.ceps_logradouro_temp04;
    CREATE TABLE public.ceps_logradouro_temp04 AS
    SELECT 
        "COD_SETOR",
        cd_quadra,
        cd_face,
        ARRAY_AGG(DISTINCT REGEXP_REPLACE("CEP", '(\d{5})(\d{3})', '\1-\2')) AS all_ceps
    FROM public.ceps_logradouro_temp01
    GROUP BY "COD_SETOR", cd_quadra, cd_face;

    -- It joins the tables with the most common CEP, total counts, and all distinct CEPs per 
	-- COD_SETOR, cd_quadra, and cd_face, then formats the most common CEP with a hyphen and
	-- calculates its percentage usage within the group.
    DROP TABLE IF EXISTS public.ceps_logradouro_temp05;
    CREATE TABLE public.ceps_logradouro_temp05 AS
    SELECT 
        m."COD_SETOR",
        m.cd_quadra,
        m.cd_face,
        REGEXP_REPLACE(m.most_common_cep, '(\d{5})(\d{3})', '\1-\2') AS most_common_cep,
        ROUND(100.0 * m.count / NULLIF(t.total, 0), 1) AS usage_percent,
        a.all_ceps
    FROM ceps_logradouro_temp03 m
    JOIN ceps_logradouro_temp02 t ON t."COD_SETOR" = m."COD_SETOR" AND t.cd_quadra = m.cd_quadra AND t.cd_face = m.cd_face
    JOIN ceps_logradouro_temp04 a ON a."COD_SETOR" = m."COD_SETOR" AND a.cd_quadra = m.cd_quadra AND a.cd_face = m.cd_face;

    -- Join formatted street names and geometries from faces_de_logradouros with the most common CEP data 
	-- from ceps_logradouro_temp05, and includes CEP usage percentage 
	-- and all associated CEPs for each street segment.
      DROP TABLE IF EXISTS public.ceps_logradouro_temp06;
      CREATE TABLE public.ceps_logradouro_temp06 AS
      SELECT
         INITCAP(
           REGEXP_REPLACE(
             COALESCE(fl.nm_tip_log, '') || ' ' || COALESCE(fl.nm_tit_log, '') || ' ' || COALESCE(fl.nm_log, ''), 
             '\s+', ' ', 'g'
           )
         ) AS street_name,
         ca.most_common_cep AS postal_code, --"name",
         ca.usage_percent AS cep_percentage_usage,
         ca.all_ceps,
         fl.geom AS geometry,
		 fl.id
      FROM public.faces_de_logradouros fl
      JOIN ceps_logradouro_temp05 ca
        ON fl.cd_setor = ca."COD_SETOR"
       AND CAST(fl.cd_quadra AS INTEGER) =  CAST(ca.cd_quadra AS INTEGER)
       AND CAST(fl.cd_face AS INTEGER) =  CAST(ca.cd_face AS INTEGER);

    -- Count how many distinct street names are associated with each postal code
    DROP TABLE IF EXISTS public.ceps_logradouro_temp07;
    CREATE TABLE public.ceps_logradouro_temp07 AS
    SELECT 
        postal_code AS cep,
        COUNT(DISTINCT street_name) AS distinct_street_name_count
    FROM public.ceps_logradouro_temp06
    GROUP BY postal_code;

    -- Filter only those CEPs that appear with ONE distinct street name
    DROP TABLE IF EXISTS public.ceps_logradouro_temp08;
    CREATE TABLE public.ceps_logradouro_temp08 AS
    SELECT cep
    FROM ceps_logradouro_temp07
    WHERE distinct_street_name_count = 1;

    -- Get id and cep from temp06 where the CEP is among those with 1 street only
    DROP TABLE IF EXISTS public.ceps_logradouro_temp09;
    CREATE TABLE public.ceps_logradouro_temp09 AS
    SELECT 
        cl.id,
        cl.postal_code AS cep
    FROM public.ceps_logradouro_temp06 cl
    JOIN ceps_logradouro_temp08 b
      ON cl.postal_code = b.cep;

	-- Update final table
    DROP TABLE IF EXISTS public.faces_de_logradouros_ceps_unicos;
    CREATE TABLE public.faces_de_logradouros_ceps_unicos AS
	SELECT * FROM ceps_logradouro_temp09;

	-- Drop temporary tables
    DROP TABLE IF EXISTS public.ceps_logradouro_temp01;
    DROP TABLE IF EXISTS public.ceps_logradouro_temp02;
    DROP TABLE IF EXISTS public.ceps_logradouro_temp03;
    DROP TABLE IF EXISTS public.ceps_logradouro_temp04;
    DROP TABLE IF EXISTS public.ceps_logradouro_temp05;
    DROP TABLE IF EXISTS public.ceps_logradouro_temp06;
    DROP TABLE IF EXISTS public.ceps_logradouro_temp07;
    DROP TABLE IF EXISTS public.ceps_logradouro_temp08;
    DROP TABLE IF EXISTS public.ceps_logradouro_temp09;


------------------------------------------------------------------------
-- Create a table of postal codes that occurs in only one street name --
--        END                                                       --
------------------------------------------------------------------------


/* -- JOIN TEST

DROP TABLE IF EXISTS public._faces_de_logradouros_ceps_unicos;
CREATE TABLE IF NOT EXISTS public._faces_de_logradouros_ceps_unicos AS
SELECT cep.id, cep.cep, fl.nm_tip_log, fl.nm_tit_log, fl.nm_log, fl.geom
FROM public.faces_de_logradouros_ceps_unicos cep
LEFT JOIN public.faces_de_logradouros fl
ON cep.id = fl.id
WHERE fl.cd_setor LIKE '4303004%';

*/

/* -- OTHERS TESTS

-- Wrapped geometries option
DROP TABLE IF EXISTS public.ceps_logradouro_2616407_temp08;
CREATE TABLE public.ceps_logradouro_2616407_temp08 AS
SELECT 
    postal_code,
    all_street_names[1] AS street_name, -- Consider only CEP - Street Name relations 1:1
	--'residential' AS highway,
    merged_geometry
FROM public.ceps_logradouro_2616407_temp07
WHERE distinct_street_name_count = 1;

-- Unwrapped geometries option
DROP TABLE IF EXISTS public.ceps_logradouro_2616407_temp09;
CREATE TABLE public.ceps_logradouro_2616407_temp09 AS
SELECT 
    postal_code,
    street_name,
    (ST_Dump(merged_geometry)).geom AS geometry
FROM public.ceps_logradouro_2616407_temp08;

-- Version containing text rendered as geometry
    -- render_text_as_geometry is available at https://github.com/santamariense/postgis_render_text_as_geometry
DROP TABLE IF EXISTS public.ceps_logradouro_2616407_temp10;
CREATE TABLE public.ceps_logradouro_2616407_temp10 AS
SELECT (ST_Dump(geometry)).geom AS geometry FROM (
    SELECT 
        postal_code,
    	render_text_as_geometry(postal_code,0.5,'LINES',ST_LineMerge(geometry),-10,5) AS geometry
    FROM public.ceps_logradouro_2616407_temp09 UNION ALL
    SELECT 
        street_name,
    	render_text_as_geometry(street_name,0.4,'LINES',ST_LineMerge(geometry),0,2) AS geometry
    FROM public.ceps_logradouro_2616407_temp09
);

*/