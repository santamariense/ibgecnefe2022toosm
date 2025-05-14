-- Gera lista de palavras que contem no CNEFE 2022
DROP TABLE IF EXISTS public.dicionario_palavras_cnefe2022;
CREATE TABLE public.dicionario_palavras_cnefe2022 AS
WITH words AS (
  SELECT word,
         column_name,
         ROW_NUMBER() OVER() AS row_id
  FROM public.dados_tipos_corrigidos,
       LATERAL unnest(array[
         'DSC_LOCALIDADE', 'NOM_TIPO_SEGLOGR', 'NOM_TITULO_SEGLOGR', 'NOM_SEGLOGR',
         'DSC_MODIFICADOR', 'NOM_COMP_ELEM1', 'VAL_COMP_ELEM1', 'NOM_COMP_ELEM2',
         'VAL_COMP_ELEM2', 'NOM_COMP_ELEM3', 'VAL_COMP_ELEM3', 'NOM_COMP_ELEM4',
         'VAL_COMP_ELEM4', 'NOM_COMP_ELEM5', 'VAL_COMP_ELEM5', 'DSC_ESTABELECIMENTO'
       ]) AS column_name
  CROSS JOIN LATERAL regexp_split_to_table(
       CASE column_name
           WHEN 'DSC_LOCALIDADE' THEN "DSC_LOCALIDADE"
           WHEN 'NOM_TIPO_SEGLOGR' THEN "NOM_TIPO_SEGLOGR"
           WHEN 'NOM_TITULO_SEGLOGR' THEN "NOM_TITULO_SEGLOGR"
           WHEN 'NOM_SEGLOGR' THEN "NOM_SEGLOGR"
           WHEN 'DSC_MODIFICADOR' THEN "DSC_MODIFICADOR"
           WHEN 'NOM_COMP_ELEM1' THEN "NOM_COMP_ELEM1"
           WHEN 'VAL_COMP_ELEM1' THEN "VAL_COMP_ELEM1"
           WHEN 'NOM_COMP_ELEM2' THEN "NOM_COMP_ELEM2"
           WHEN 'VAL_COMP_ELEM2' THEN "VAL_COMP_ELEM2"
           WHEN 'NOM_COMP_ELEM3' THEN "NOM_COMP_ELEM3"
           WHEN 'VAL_COMP_ELEM3' THEN "VAL_COMP_ELEM3"
           WHEN 'NOM_COMP_ELEM4' THEN "NOM_COMP_ELEM4"
           WHEN 'VAL_COMP_ELEM4' THEN "VAL_COMP_ELEM4"
           WHEN 'NOM_COMP_ELEM5' THEN "NOM_COMP_ELEM5"
           WHEN 'VAL_COMP_ELEM5' THEN "VAL_COMP_ELEM5"
           WHEN 'DSC_ESTABELECIMENTO' THEN "DSC_ESTABELECIMENTO"
       END, '\s+') AS word
)
SELECT word,
       COUNT(*) AS occurrences,
       STRING_AGG(DISTINCT column_name, ', ') AS list_of_fields_where_they_are_found
FROM words
GROUP BY word
ORDER BY occurrences DESC, word;
