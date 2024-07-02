
-- Para dividir setores em partes iguais, caso deseja 
-- #TODO: Não está dividindo em partes iguais. Corrigir.
WITH ranked_setors AS (
    SELECT 
        cd_setor,
        NTILE(10) OVER (ORDER BY cd_setor) AS setor_group
    FROM 
        public.faces_de_logradouros
    WHERE 
        cd_setor LIKE '35%'
)
SELECT 
    MAX(cd_setor) AS last_cd_setor
FROM 
    ranked_setors
GROUP BY 
    setor_group;


-- OBS: Cada uma das partes abaixo deverá ser executada simultaneamente ou em lotes
---------------------------------------


-- Acre (AC)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_ac;
CREATE TABLE public.faces_geom_direcionadas_ac AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '12%'; -- AC

-- Alagoas (AL)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_al;
CREATE TABLE public.faces_geom_direcionadas_al AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '27%'; -- AL

-- Amapá (AP)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_ap;
CREATE TABLE public.faces_geom_direcionadas_ap AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '16%'; -- AP

-- Amazonas (AM)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_am;
CREATE TABLE public.faces_geom_direcionadas_am AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '13%'; -- AM

-- Bahia (BA)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_ba;
CREATE TABLE public.faces_geom_direcionadas_ba AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '29%'; -- BA

-- Ceará (CE)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_ce;
CREATE TABLE public.faces_geom_direcionadas_ce AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '23%'; -- CE

-- Distrito Federal (DF)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_df;
CREATE TABLE public.faces_geom_direcionadas_df AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '53%'; -- DF

-- Espírito Santo (ES)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_es;
CREATE TABLE public.faces_geom_direcionadas_es AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '32%'; -- ES

-- Goiás (GO)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_go;
CREATE TABLE public.faces_geom_direcionadas_go AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '52%'; -- GO

-- Maranhão (MA)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_ma;
CREATE TABLE public.faces_geom_direcionadas_ma AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '21%'; -- MA

-- Mato Grosso (MT)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_mt;
CREATE TABLE public.faces_geom_direcionadas_mt AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '51%'; -- MT

-- Mato Grosso do Sul (MS)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_ms;
CREATE TABLE public.faces_geom_direcionadas_ms AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '50%'; -- MS

-- Minas Gerais (MG)
/*
DROP TABLE IF EXISTS public.faces_geom_direcionadas_mg;
CREATE TABLE public.faces_geom_direcionadas_mg AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '31%'; -- MG
*/
   DROP TABLE IF EXISTS public.faces_geom_direcionadas_mg_01;
   CREATE TABLE public.faces_geom_direcionadas_mg_01 AS
   SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
   FROM public.faces_de_logradouros
   WHERE cd_setor LIKE '31%' 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT >= 310000000000000 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT <  310850305000014 ; -- MG
   
   DROP TABLE IF EXISTS public.faces_geom_direcionadas_mg_02;
   CREATE TABLE public.faces_geom_direcionadas_mg_02 AS
   SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
   FROM public.faces_de_logradouros
   WHERE cd_setor LIKE '31%' 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT >= 310850305000014 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT <  312770105000241 ; -- MG
   
   DROP TABLE IF EXISTS public.faces_geom_direcionadas_mg_03;
   CREATE TABLE public.faces_geom_direcionadas_mg_03 AS
   SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
   FROM public.faces_de_logradouros
   WHERE cd_setor LIKE '31%' 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT >= 312770105000241 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT <  314280905000088 ; -- MG
   
   DROP TABLE IF EXISTS public.faces_geom_direcionadas_mg_04;
   CREATE TABLE public.faces_geom_direcionadas_mg_04 AS
   SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
   FROM public.faces_de_logradouros
   WHERE cd_setor LIKE '31%' 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT >= 314280905000088 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT <  315780705000061 ; -- MG
   
   DROP TABLE IF EXISTS public.faces_geom_direcionadas_mg_05;
   CREATE TABLE public.faces_geom_direcionadas_mg_05 AS
   SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
   FROM public.faces_de_logradouros
   WHERE cd_setor LIKE '31%' 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT >= 315780705000061
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT <  317120405000346 ; -- MG
   
   DROP TABLE IF EXISTS public.faces_geom_direcionadas_mg_06;
   CREATE TABLE public.faces_geom_direcionadas_mg_06 AS
   SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
   FROM public.faces_de_logradouros
   WHERE cd_setor LIKE '31%' 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT >= 317120405000346 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT <= 319999999999999 ; -- MG

-- Pará (PA)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_pa;
CREATE TABLE public.faces_geom_direcionadas_pa AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '15%'; -- PA

-- Paraíba (PB)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_pb;
CREATE TABLE public.faces_geom_direcionadas_pb AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '25%'; -- PB

-- Paraná (PR)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_pr;
CREATE TABLE public.faces_geom_direcionadas_pr AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '41%'; -- PR

-- Pernambuco (PE)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_pe;
CREATE TABLE public.faces_geom_direcionadas_pe AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '26%'; -- PE

-- Piauí (PI)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_pi;
CREATE TABLE public.faces_geom_direcionadas_pi AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '22%';

-- Rio de Janeiro (RJ)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_rj;
CREATE TABLE public.faces_geom_direcionadas_rj AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '33%';

-- Rio Grande do Norte (RN)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_rn;
CREATE TABLE public.faces_geom_direcionadas_rn AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '24%';

-- Rio Grande do Sul (RS)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_rs;
CREATE TABLE public.faces_geom_direcionadas_rs AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '43%';

-- Rondônia (RO)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_ro;
CREATE TABLE public.faces_geom_direcionadas_ro AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '11%';

-- Roraima (RR)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_rr;
CREATE TABLE public.faces_geom_direcionadas_rr AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '14%';

-- Santa Catarina (SC)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_sc;
CREATE TABLE public.faces_geom_direcionadas_sc AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '42%';

-- São Paulo (SP)
/*
DROP TABLE IF EXISTS public.faces_geom_direcionadas_sp;
CREATE TABLE public.faces_geom_direcionadas_sp AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '35%';
*/

   DROP TABLE IF EXISTS public.faces_geom_direcionadas_sp_01;
   CREATE TABLE public.faces_geom_direcionadas_sp_01 AS
   SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
   FROM public.faces_de_logradouros
   WHERE cd_setor LIKE '35%' 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT >= 350000000000000 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT <  355080305000007 ; -- SP
      
   DROP TABLE IF EXISTS public.faces_geom_direcionadas_sp_02;
   CREATE TABLE public.faces_geom_direcionadas_sp_02 AS
   SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
   FROM public.faces_de_logradouros
   WHERE cd_setor LIKE '35%' 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT >= 355080305000007 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT <  351880005000757 ; -- SP
      
   DROP TABLE IF EXISTS public.faces_geom_direcionadas_sp_03;
   CREATE TABLE public.faces_geom_direcionadas_sp_03 AS
   SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
   FROM public.faces_de_logradouros
   WHERE cd_setor LIKE '35%' 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT >= 351880005000757 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT <  353060705000495 ; -- SP
      
   DROP TABLE IF EXISTS public.faces_geom_direcionadas_sp_04;
   CREATE TABLE public.faces_geom_direcionadas_sp_04 AS
   SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
   FROM public.faces_de_logradouros
   WHERE cd_setor LIKE '35%' 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT >= 353060705000495 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT <  352430305000090 ; -- SP
      
   DROP TABLE IF EXISTS public.faces_geom_direcionadas_sp_05;
   CREATE TABLE public.faces_geom_direcionadas_sp_05 AS
   SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
   FROM public.faces_de_logradouros
   WHERE cd_setor LIKE '35%' 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT >= 352430305000090 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT <  355730305000036 ; -- SP
      
   DROP TABLE IF EXISTS public.faces_geom_direcionadas_sp_06;
   CREATE TABLE public.faces_geom_direcionadas_sp_06 AS
   SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
   FROM public.faces_de_logradouros
   WHERE cd_setor LIKE '35%' 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT >= 355730305000036 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT <  353800605000302 ; -- SP
      
   DROP TABLE IF EXISTS public.faces_geom_direcionadas_sp_07;
   CREATE TABLE public.faces_geom_direcionadas_sp_07 AS
   SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
   FROM public.faces_de_logradouros
   WHERE cd_setor LIKE '35%' 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT >= 353800605000302 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT <  351110205000215 ; -- SP
      
   DROP TABLE IF EXISTS public.faces_geom_direcionadas_sp_08;
   CREATE TABLE public.faces_geom_direcionadas_sp_08 AS
   SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
   FROM public.faces_de_logradouros
   WHERE cd_setor LIKE '35%' 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT >= 351110205000215 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT <  354500110000007 ; -- SP
      
   DROP TABLE IF EXISTS public.faces_geom_direcionadas_sp_09;
   CREATE TABLE public.faces_geom_direcionadas_sp_09 AS
   SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
   FROM public.faces_de_logradouros
   WHERE cd_setor LIKE '35%' 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT >= 354500110000007 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT <  350600305000473 ; -- SP
      
   DROP TABLE IF EXISTS public.faces_geom_direcionadas_sp_10;
   CREATE TABLE public.faces_geom_direcionadas_sp_10 AS
   SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
   FROM public.faces_de_logradouros
   WHERE cd_setor LIKE '35%' 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT >= 350600305000473 
   AND left(cd_setor, length(cd_setor) - 1)::BIGINT <= 359999999999999 ; -- SP
   


-- Sergipe (SE)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_se;
CREATE TABLE public.faces_geom_direcionadas_se AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '28%';

-- Tocantins (TO)
DROP TABLE IF EXISTS public.faces_geom_direcionadas_to;
CREATE TABLE public.faces_geom_direcionadas_to AS
SELECT id, direciona_faces_de_quadra_em_sentido_horario(cd_setor, cd_quadra, cd_face) AS geom_direcionada
FROM public.faces_de_logradouros
WHERE cd_setor LIKE '17%';


------------------------------------------
---- Unir todas as tabelas em uma só -----
------------------------------------------


CREATE OR REPLACE PROCEDURE unir_tabelas_de_faces_direcionadas_em_uma_so_tabela()
LANGUAGE plpgsql
AS $$
DECLARE
    tabelas TEXT[];
    drop_query TEXT;
BEGIN
    -- Identificar todas as tabelas contendo a string 'faces_geom_direcionadas_' em seus nomes
    SELECT array_agg(quote_ident(table_schema) || '.' || quote_ident(table_name))
    INTO tabelas
    FROM information_schema.tables
    WHERE table_name LIKE 'faces_geom_direcionadas_%';

    -- Checar se há tabelas a serem unidas
    IF tabelas IS NULL THEN
        RAISE NOTICE 'Nenhuma tabela contendo a string faces_de_logradouros foi encontrada. Nada a ser unido';
        RETURN;
    END IF;

    -- Montar a consulta SQL dinâmica para unir as tabelas
    EXECUTE 'DROP TABLE IF EXISTS faces_de_logradouros_direcionadas';

    EXECUTE 'CREATE TABLE faces_de_logradouros_direcionadas AS ' ||
            'SELECT * FROM ' || array_to_string(tabelas, ' UNION ALL SELECT * FROM ');

    RAISE NOTICE 'Tabelas foram unidas em faces_de_logradouros_direcionadas com sucesso';

    -- Excluir tabelas que fora juntadas, neste caso, as que contem a string 'faces_geom_direcionadas_' em seus nomes
    FOR drop_query IN
        SELECT 'DROP TABLE ' || quote_ident(table_schema) || '.' || quote_ident(table_name)
        FROM information_schema.tables
        WHERE table_name LIKE 'faces_geom_direcionadas_%'
    LOOP
        EXECUTE drop_query;
        RAISE NOTICE 'Tabela excluida: %', drop_query;
    END LOOP;

    RAISE NOTICE 'Todas as tabelas temporárias foram excluidas com sucesso';
END;
$$;
CALL unir_tabelas_de_faces_direcionadas_em_uma_so_tabela();
