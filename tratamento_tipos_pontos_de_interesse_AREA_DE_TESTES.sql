== RASCUNHO PARA DETECTAR PALAVRAS UNIDAS COM NÚMEROS ==
-- Query to select and process words based on the given criteria
SELECT DISTINCT word_part FROM (
    SELECT 
        pcu.palavra,
        substring(pcu.palavra FROM '^[0-9]+([A-Za-z]+)[0-9]+$') AS word_part,
        pcu.exemplo_uso,
        pcu.ocorrencias
    FROM public.palavras_com_uso pcu
    WHERE pcu.palavra ~ '^[0-9]+[A-Za-z]+[0-9]+$'
    --AND pcu.palavra LIKE 'RA%'
    ORDER BY substring(pcu.palavra FROM '^([0-9]+[A-Za-z]+[0-9]+)$') DESC
--LIMIT 1000;
) ORDER BY word_part ASC


/*SELECT * FROM public.dados_tipos_corrigidos
WHERE "VAL_COMP_ELEM1"  ~ '^[0-9]+CADA;$'
   OR "VAL_COMP_ELEM2"  ~ '^[0-9]+CADA;$'
   OR "VAL_COMP_ELEM3"  ~ '^[0-9]+CADA;$'
   OR "VAL_COMP_ELEM4"  ~ '^[0-9]+CADA;$'
   OR "VAL_COMP_ELEM5"  ~ '^[0-9]+CADA;$' 
   OR "DSC_MODIFICADOR"  ~ '^[0-9]+CADA;$'
*/


SELECT DISTINCT word_part FROM (
    SELECT 
        pcu.palavra,
        regexp_replace(pcu.palavra, '[0-9]+', '#') AS word_part,
		pcu.exemplo_uso,
        pcu.ocorrencias
    FROM public.palavras_com_uso pcu
    WHERE pcu.palavra ~ '^[A-Za-z]+[0-9]+[A-Za-z]+$'
    --AND pcu.palavra LIKE '%HO%'
    ORDER BY substring(pcu.palavra FROM '^([A-Za-z]+[0-9]+[A-Za-z]+)$') ASC
--LIMIT 1000;
) ORDER BY word_part ASC


SELECT * FROM public.dados_tipos_corrigidos
WHERE "VAL_COMP_ELEM1"  LIKE '%DNAGORGINA%'
   OR "VAL_COMP_ELEM2"  LIKE '%DNAGORGINA%'
   OR "VAL_COMP_ELEM3"  LIKE '%DNAGORGINA%'
   OR "VAL_COMP_ELEM4"  LIKE '%DNAGORGINA%'
   OR "VAL_COMP_ELEM5"  LIKE '%DNAGORGINA%'
   OR "DSC_MODIFICADOR" LIKE '%DNAGORGINA%'
   


==========================================================



-- Consulta para selecionar palavras que não estão na tabela pt_words do banco de dados dictionary
-- Obter palavras potencialmente com typos
--SELECT pcu.* 
SELECT pcu.palavra, REPLACE(pcu.palavra, 'GLEBA', ' Gleba ') AS substituir_por
FROM public.palavras_com_uso pcu
LEFT JOIN (
    SELECT upper(wordascii) AS wordascii
    FROM dblink('dbname=dictionary',
                'SELECT upper(wordascii) FROM public.pt_words;')
    AS bd_fonte(wordascii TEXT)
) AS dicionario
ON pcu.palavra = dicionario.wordascii
--WHERE pcu.palavra LIKE '0%'
WHERE  pcu.palavra ~ '^[0-9]+PALAFITA$'
  AND pcu.palavra ~ '[^0-9]' -- ignora "palavras" composta apenas por números
  -- AND pcu.palavra ~ '^[0-9]+PALAFITA$'
  --AND pcu.palavra ~ '^[0-9]+PALAFITA[0-9]+$'
  --AND pcu.palavra ~ '^PALAFITA[0-9]+$'
ORDER BY pcu.palavra ASC
;








================================================================



SELECT * FROM public.tipos_de_pontos_de_interesse
WHERE "DSC_ESTABELECIMENTO" LIKE '%PRESENTE%' --'%ASSEMBLEA%'
 -- AND NOT('ACAI' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) )
--   OR "DSC_ESTABELECIMENTO" LIKE '%CONSTR%MATER%' --'%ASSEMBLEA%'
  AND "DSC_ESTABELECIMENTO" NOT LIKE '%PRESENTES%'
  --AND "DSC_ESTABELECIMENTO" NOT LIKE '%CABELE%'
  --AND "DSC_ESTABELECIMENTO" not LIKE '%PANIFICACAO%'
--AND ocorrencias <= 65
--LIMIT 100
 WHERE ( 'COLEGIO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) --SERRALHERIA
       ) --AND (
	      --"DSC_ESTABELECIMENTO" NOT LIKE '%GARRAFA%' OR
          --"DSC_ESTABELECIMENTO" NOT LIKE '%GARAFA%'
		 --)
		 AND ocorrencias <= 65;



SELECT column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'tipos_de_pontos_de_interesse';




WITH words AS (
    SELECT
        regexp_split_to_table("DSC_ESTABELECIMENTO", '\s+') AS word
    FROM
        public.tipos_de_pontos_de_interesse
),
word_counts AS (
    SELECT
        word,
        COUNT(*) AS occurrences
    FROM
        words
    GROUP BY
        word
)
SELECT
    word,
    occurrences
FROM
    word_counts
WHERE
    occurrences < 12000
ORDER BY
    occurrences DESC;
