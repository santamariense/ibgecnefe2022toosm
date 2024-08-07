






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
