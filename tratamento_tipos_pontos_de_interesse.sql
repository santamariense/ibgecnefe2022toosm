-- Passo a passo:

/*-- Faz backup
DROP TABLE IF EXISTS public.tipos_de_pontos_de_interesse_original;
CREATE TABLE public.tipos_de_pontos_de_interesse_original AS
SELECT * FROM public.tipos_de_pontos_de_interesse;
*/

-- Importa tipos de ponto de interesse formatados pela comunidade
DROP TABLE IF EXISTS public.tipos_de_pontos_de_interesse;
CREATE TABLE public.tipos_de_pontos_de_interesse AS
SELECT 
   tpi."DSC_ESTABELECIMENTO",
   tpi.ocorrencias,
   NULLIF(REPLACE(REPLACE(tpic.status, '<', ','), '^', ''''), '') AS status, -- status de completude e usabilidade do "DSC_ESTABELECIMENTO"
   NULLIF(REPLACE(REPLACE(tpic.description, '<', ','), '^', ''''), '') AS description,
   NULLIF(REPLACE(REPLACE(tpic."name", '<', ','), '^', ''''), '') AS "name",
   NULLIF(REPLACE(REPLACE(tpic.short_name, '<', ','), '^', ''''), '') AS short_name,
   NULLIF(REPLACE(REPLACE(tpic.amenity, '<', ','), '^', ''''), '') AS amenity,
   NULLIF(REPLACE(REPLACE(tpic.association, '<', ','), '^', ''''), '') AS association,
   NULLIF(REPLACE(REPLACE(tpic.aeroway, '<', ','), '^', ''''), '') AS aeroway,
   NULLIF(REPLACE(REPLACE(tpic.beauty, '<', ','), '^', ''''), '') AS beauty,
   NULLIF(REPLACE(REPLACE(tpic.brand, '<', ','), '^', ''''), '') AS brand,
   NULLIF(REPLACE(REPLACE(tpic."brand:wikidata", '<', ','), '^', ''''), '') AS "brand:wikidata",
   NULLIF(REPLACE(REPLACE(tpic."brand:wikipedia", '<', ','), '^', ''''), '') AS "brand:wikipedia",
   NULLIF(REPLACE(REPLACE(tpic.building, '<', ','), '^', ''''), '') AS building,
   NULLIF(REPLACE(REPLACE(tpic.clothes, '<', ','), '^', ''''), '') AS clothes,
   NULLIF(REPLACE(REPLACE(tpic.club, '<', ','), '^', ''''), '') AS club,
   NULLIF(REPLACE(REPLACE(tpic.content, '<', ','), '^', ''''), '') AS "content",
   NULLIF(REPLACE(REPLACE(tpic.craft, '<', ','), '^', ''''), '') AS craft,
   NULLIF(REPLACE(REPLACE(tpic.cuisine, '<', ','), '^', ''''), '') AS cuisine,
   NULLIF(REPLACE(REPLACE(tpic.denomination, '<', ','), '^', ''''), '') AS denomination,
   NULLIF(REPLACE(REPLACE(tpic.depot, '<', ','), '^', ''''), '') AS depot,
   NULLIF(REPLACE(REPLACE(tpic.dispensing, '<', ','), '^', ''''), '') AS dispensing,
   NULLIF(REPLACE(REPLACE(tpic.distributor, '<', ','), '^', ''''), '') AS distributor,
   NULLIF(REPLACE(REPLACE(tpic."disused:building", '<', ','), '^', ''''), '') AS "disused:building",
   NULLIF(REPLACE(REPLACE(tpic."disused:shop", '<', ','), '^', ''''), '') AS "disused:shop",
   NULLIF(REPLACE(REPLACE(tpic.emergency, '<', ','), '^', ''''), '') AS emergency,
   NULLIF(REPLACE(REPLACE(tpic.farmyard, '<', ','), '^', ''''), '') AS farmyard,
   NULLIF(REPLACE(REPLACE(tpic.fee, '<', ','), '^', ''''), '') AS fee,
   NULLIF(REPLACE(REPLACE(tpic.fixme, '<', ','), '^', ''''), '') AS fixme,
   NULLIF(REPLACE(REPLACE(tpic.government, '<', ','), '^', ''''), '') AS government,
   NULLIF(REPLACE(REPLACE(tpic.hairdresser, '<', ','), '^', ''''), '') AS hairdresser,
   NULLIF(REPLACE(REPLACE(tpic.healthcare, '<', ','), '^', ''''), '') AS healthcare,
   NULLIF(REPLACE(REPLACE(tpic."healthcare:counselling", '<', ','), '^', ''''), '') AS "healthcare:counselling",
   NULLIF(REPLACE(REPLACE(tpic."healthcare:speciality", '<', ','), '^', ''''), '') AS "healthcare:speciality",
   NULLIF(REPLACE(REPLACE(tpic.industrial, '<', ','), '^', ''''), '') AS industrial,
   NULLIF(REPLACE(REPLACE(tpic.landuse, '<', ','), '^', ''''), '') AS landuse,
   NULLIF(REPLACE(REPLACE(tpic.crop, '<', ','), '^', ''''), '') AS crop,
   NULLIF(REPLACE(REPLACE(tpic.leisure, '<', ','), '^', ''''), '') AS leisure,
   NULLIF(REPLACE(REPLACE(tpic.male, '<', ','), '^', ''''), '') AS male,
   NULLIF(REPLACE(REPLACE(tpic.man_made, '<', ','), '^', ''''), '') AS man_made,
   NULLIF(REPLACE(REPLACE(tpic.military, '<', ','), '^', ''''), '') AS military,
   NULLIF(REPLACE(REPLACE(tpic."mobile_phone:repair", '<', ','), '^', ''''), '') AS "mobile_phone:repair",
   NULLIF(REPLACE(REPLACE(tpic."natural", '<', ','), '^', ''''), '') AS "natural",
   NULLIF(REPLACE(REPLACE(tpic.office, '<', ','), '^', ''''), '') AS office,
   NULLIF(REPLACE(REPLACE(tpic.official_name, '<', ','), '^', ''''), '') AS official_name,
   NULLIF(REPLACE(REPLACE(tpic.old_name, '<', ','), '^', ''''), '') AS old_name,
   NULLIF(REPLACE(REPLACE(tpic."operator", '<', ','), '^', ''''), '') AS "operator",
   NULLIF(REPLACE(REPLACE(tpic.place, '<', ','), '^', ''''), '') AS place,
   NULLIF(REPLACE(REPLACE(tpic."power", '<', ','), '^', ''''), '') AS "power",
   NULLIF(REPLACE(REPLACE(tpic.produce, '<', ','), '^', ''''), '') AS produce,
   NULLIF(REPLACE(REPLACE(tpic.product, '<', ','), '^', ''''), '') AS product,
   NULLIF(REPLACE(REPLACE(tpic.recycling_type, '<', ','), '^', ''''), '') AS recycling_type,
   NULLIF(REPLACE(REPLACE(tpic.religion, '<', ','), '^', ''''), '') AS religion,
   NULLIF(REPLACE(REPLACE(tpic.rental, '<', ','), '^', ''''), '') AS rental,
   NULLIF(REPLACE(REPLACE(tpic.repair, '<', ','), '^', ''''), '') AS repair,
   NULLIF(REPLACE(REPLACE(tpic.second_hand, '<', ','), '^', ''''), '') AS second_hand,
   NULLIF(REPLACE(REPLACE(tpic."service:vehicle:electrical", '<', ','), '^', ''''), '') AS "service:vehicle:electrical",
   NULLIF(REPLACE(REPLACE(tpic."service:vehicle:motor", '<', ','), '^', ''''), '') AS "service:vehicle:motor",
   NULLIF(REPLACE(REPLACE(tpic."service:vehicle:truck_repair", '<', ','), '^', ''''), '') AS "service:vehicle:truck_repair",
   NULLIF(REPLACE(REPLACE(tpic.shop, '<', ','), '^', ''''), '') AS shop,
   NULLIF(REPLACE(REPLACE(tpic.sport, '<', ','), '^', ''''), '') AS sport,
   NULLIF(REPLACE(REPLACE(tpic.stone, '<', ','), '^', ''''), '') AS stone,
   NULLIF(REPLACE(REPLACE(tpic.studio, '<', ','), '^', ''''), '') AS studio,
   NULLIF(REPLACE(REPLACE(tpic.takeaway, '<', ','), '^', ''''), '') AS takeaway,
   NULLIF(REPLACE(REPLACE(tpic.tourism, '<', ','), '^', ''''), '') AS tourism,
   NULLIF(REPLACE(REPLACE(tpic."townhall:type", '<', ','), '^', ''''), '') AS "townhall:type",
   NULLIF(REPLACE(REPLACE(tpic.training, '<', ','), '^', ''''), '') AS training,
   NULLIF(REPLACE(REPLACE(tpic.wheelchair, '<', ','), '^', ''''), '') AS wheelchair,
   NULLIF(REPLACE(REPLACE(tpic.website, '<', ','), '^', ''''), '') AS website,
   CASE WHEN tpi.ocorrencias >= 66 THEN 'tabela10mil+:comunidade' ELSE NULL END AS substituicoes_aplicadas
FROM public.tipos_de_pontos_de_interesse_original as tpi
LEFT JOIN public.tipos_de_pontos_de_interesse_comunidade202407250940 tpic
ON tpi."DSC_ESTABELECIMENTO" = tpic."DSC_ESTABELECIMENTO";


/*-- Obter palavras mais recorrentes para completar os campos da mais importante para a menos importante
WITH words AS (
    SELECT regexp_split_to_table("DSC_ESTABELECIMENTO", '\s+') AS word
    FROM public.tipos_de_pontos_de_interesse
),
word_counts AS (
    SELECT word, COUNT(*) AS occurrences
    FROM words
    GROUP BY word
)
SELECT word, occurrences
FROM word_counts
ORDER BY occurrences DESC;
*/


-- A partir deste pontos serão completados campos conforme palavra(s) que DSC_ESTABELECIMENTO contem --
-- (Nas top 10mi + alimentado pela comunidade são completadas as de ocorrencia >= 66. Essas, aqui são ignoradas) --

-- _NOME_ --
-- #TODO --

-- LOJA|LOJAS|LOJINHA|LOJINHAS|SHOP|STORE -> shop=yes --
 UPDATE public.tipos_de_pontos_de_interesse
 SET shop = CASE
      WHEN shop IS NULL THEN 'yes'
      WHEN NOT('yes' = ANY(string_to_array(shop, ';'))) THEN shop || ';yes'
      ELSE shop
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'LOJA|LOJAS|LOJINHA|LOJINHAS|SHOP|STORE'
      WHEN NOT('LOJA|LOJAS|LOJINHA|LOJINHAS|SHOP|STORE' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';LOJA|LOJAS|LOJINHA|LOJINHAS|SHOP|STORE'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'LOJA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'LOJAS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'LOJINHA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'LOJINHAS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
		 'L0JA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'L0JAS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'L0JINHA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'SHOP' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'STORE' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'STORES' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ESTORE' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ESTORES' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' '))
       ) AND ocorrencias <= 65;

-- BAR -> amenity=pub --
 UPDATE public.tipos_de_pontos_de_interesse
 SET amenity = CASE
      WHEN amenity IS NULL THEN 'pub'
      WHEN NOT('pub' = ANY(string_to_array(amenity, ';'))) THEN amenity || ';pub'
      ELSE amenity
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'BAR'
      WHEN NOT('BAR' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';BAR'
      ELSE substituicoes_aplicadas
    END
 WHERE 'BAR' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) AND ocorrencias <= 65;

-- DEPOSITO|BARRACAO -> building=warehouse  --
 UPDATE public.tipos_de_pontos_de_interesse
 SET building = CASE
      WHEN building IS NULL THEN 'warehouse'
      WHEN NOT('warehouse' = ANY(string_to_array(building, ';'))) THEN building || ';warehouse'
      ELSE building
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'DEPOSITO|BARRACAO'
      WHEN NOT('DEPOSITO|BARRACAO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';DEPOSITO|BARRACAO'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'DEPOSITO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'DEP0SITO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'DEPOSIT0' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'DEPOZITO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'DEPOSITOS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BARRACAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BARRACA0' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BARACA0' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BARACAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) 
       ) AND ocorrencias <= 65;

-- CASA : ignorar --

-- IGREJA -> amenity=place_of_worship quando inicia com 'IGREJA%' --
 UPDATE public.tipos_de_pontos_de_interesse
 SET amenity = CASE
      WHEN amenity IS NULL THEN 'place_of_worship'
      WHEN NOT('place_of_worship' = ANY(string_to_array(amenity, ';'))) THEN amenity || ';place_of_worship'
      ELSE amenity
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'IGREJA'
      WHEN NOT('IGREJA' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';IGREJA'
      ELSE substituicoes_aplicadas
    END
 WHERE "DSC_ESTABELECIMENTO" LIKE 'IGREJA%' AND ocorrencias <= 65;

-- ESCOLA --
-- #TODO: Trabalhar subtipos --

-- SALAO --
-- #TODO: Trabalhar subtipos --

-- OFICINA --
-- #TODO: Trabalhar subtipos --

-- CENTRO : ignorar --

-- SITIO -> place=farm quando inicia com 'SITIO%' --
 UPDATE public.tipos_de_pontos_de_interesse
 SET place = CASE
      WHEN place IS NULL THEN 'farm'
      WHEN NOT('farm' = ANY(string_to_array(place, ';'))) THEN place || ';farm'
      ELSE place
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'SITIO'
      WHEN NOT('SITIO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';SITIO'
      ELSE substituicoes_aplicadas
    END
 WHERE "DSC_ESTABELECIMENTO" LIKE 'SITIO%' AND ocorrencias <= 65;

-- ESTANCIA|FAZENDA|SITIO|CHACARA -> place=farm quando inicia com 'ESTANCIA%' ou 'FAZENDA%' ou 'SITIO%' ou 'CHACARA%'  --
 UPDATE public.tipos_de_pontos_de_interesse
 SET place = CASE
      WHEN place IS NULL THEN 'farm'
      WHEN NOT('farm' = ANY(string_to_array(place, ';'))) THEN place || ';farm'
      ELSE place
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'ESTANCIA|FAZENDA|SITIO|CHACARA'
      WHEN NOT('ESTANCIA|FAZENDA|SITIO|CHACARA' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';ESTANCIA|FAZENDA|SITIO|CHACARA'
      ELSE substituicoes_aplicadas
    END
 WHERE ( "DSC_ESTABELECIMENTO" LIKE 'ESTANCIA%' OR
         "DSC_ESTABELECIMENTO" LIKE 'FAZENDA%' OR
         "DSC_ESTABELECIMENTO" LIKE 'SITIO%' OR
         "DSC_ESTABELECIMENTO" LIKE 'SITI0%' OR
         "DSC_ESTABELECIMENTO" LIKE 'CHACARA%'
		 ) AND ocorrencias <= 65;

-- RESTAURANTE -> amenity=restaurant --
 UPDATE public.tipos_de_pontos_de_interesse
 SET amenity = CASE
      WHEN amenity IS NULL THEN 'restaurant'
      WHEN NOT('restaurant' = ANY(string_to_array(amenity, ';'))) THEN amenity || ';restaurant'
      ELSE amenity
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'RESTAURANTE'
      WHEN NOT('RESTAURANTE' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';RESTAURANTE'
      ELSE substituicoes_aplicadas
    END
 WHERE 'RESTAURANTE' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) AND ocorrencias <= 65;

-- AUTO --
-- #TODO: Trabalhar subtipos --

-- BELEZA|HAIR|CABELO|CABELEIREIRO -> shop=hairdresser --
 UPDATE public.tipos_de_pontos_de_interesse
 SET shop = CASE
      WHEN shop IS NULL THEN 'hairdresser'
      WHEN NOT('hairdresser' = ANY(string_to_array(shop, ';'))) THEN shop || ';hairdresser'
      ELSE shop
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'BELEZA|HAIR|CABELO|CABELEIREIRO'
      WHEN NOT('BELEZA|HAIR|CABELO|CABELEIREIRO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';BELEZA|HAIR|CABELO|CABELEIREIRO'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'BELEZA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BELEZAS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BELESA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'HAIR' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'HAIRS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'CABELO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'CABELOS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
		 "DSC_ESTABELECIMENTO" LIKE '%CABELE%' OR
		 "DSC_ESTABELECIMENTO" LIKE '%CABELH%' OR
		 "DSC_ESTABELECIMENTO" LIKE '%CABELL%' OR
		 "DSC_ESTABELECIMENTO" LIKE '%CABELR%' 
       ) AND ocorrencias <= 65;

-- ESCRITORIO -> office=yes --
 UPDATE public.tipos_de_pontos_de_interesse
 SET office = CASE
      WHEN office IS NULL THEN 'yes'
      WHEN NOT('yes' = ANY(string_to_array(office, ';'))) THEN office || ';yes'
      ELSE office
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'ESCRITORIO'
      WHEN NOT('ESCRITORIO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';ESCRITORIO'
      ELSE substituicoes_aplicadas
    END
 WHERE 'ESCRITORIO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) AND ocorrencias <= 65;

-- MUNICIPAL|DO MUNICIPIO -> operator=Município --
 UPDATE public.tipos_de_pontos_de_interesse
 SET "operator" = CASE
      WHEN "operator" IS NULL THEN 'Município'
      WHEN NOT('Município' = ANY(string_to_array("operator", ';'))) THEN "operator" || ';Município'
      ELSE "operator"
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'MUNICIPAL|DO MUNICIPIO'
      WHEN NOT('MUNICIPAL|DO MUNICIPIO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';MUNICIPAL|DO MUNICIPIO'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'MUNICIPAL' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
		 "DSC_ESTABELECIMENTO" LIKE '% DO MUNIC%' 
       ) AND ocorrencias <= 65;

-- ESPACO : ignorar --

-- COMERCIO|COMERCIAL|VENDA|REVENDA -> shop=yes --
 UPDATE public.tipos_de_pontos_de_interesse
 SET shop = CASE
      WHEN shop IS NULL THEN 'yes'
      WHEN NOT('yes' = ANY(string_to_array(shop, ';'))) THEN shop || ';yes'
      ELSE shop
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'COMERCIO|COMERCIAL|VENDA|REVENDA'
      WHEN NOT('COMERCIO|COMERCIAL|VENDA|REVENDA' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';COMERCIO|COMERCIAL|VENDA|REVENDA'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'COMERCIO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'C0MERCIO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'C0MERCI0' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'COMERCI0' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'COMERSIO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'COMERCIAL' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'C0MERCIAL' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'COMERSIAL' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'VENDA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'REVENDA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' '))
       ) AND ocorrencias <= 65;

-- MERCEARIA|CONVENIENCIA|ARMAZEM -> shop=convenience quando ARMAZEM não for significar "local onde se armazena algo" --
 UPDATE public.tipos_de_pontos_de_interesse
 SET shop = CASE
      WHEN shop IS NULL THEN 'convenience'
      WHEN NOT('convenience' = ANY(string_to_array(shop, ';'))) THEN shop || ';convenience'
      ELSE shop
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'MERCEARIA|CONVENIENCIA|ARMAZEM'
      WHEN NOT('MERCEARIA|CONVENIENCIA|ARMAZEM' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';MERCEARIA|CONVENIENCIA|ARMAZEM'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'MERCEARIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'MERCIARIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR 
         'MECEARIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR 
         'MERSEARIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR 
         'MERSIARIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR 
         'CONVENIENCIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
		 "DSC_ESTABELECIMENTO" LIKE '%CONVENIE%' OR
		 "DSC_ESTABELECIMENTO" LIKE '%CANVENIE%' OR
		 "DSC_ESTABELECIMENTO" LIKE '%COMVENIE%' OR
		 "DSC_ESTABELECIMENTO" LIKE '%COMVINIE%' OR
		 "DSC_ESTABELECIMENTO" LIKE '%CONVINIE%' OR
		 "DSC_ESTABELECIMENTO" LIKE '%CONVENE%' OR
		 "DSC_ESTABELECIMENTO" LIKE '%CONVN%' OR
		 "DSC_ESTABELECIMENTO" LIKE '%CONVINE%' OR
		 ( ( 
		     "DSC_ESTABELECIMENTO" LIKE '%ARMAZEM%' OR
		     "DSC_ESTABELECIMENTO" LIKE '%ARMAZEN%' OR
		     "DSC_ESTABELECIMENTO" LIKE '%ARMAZEN %' OR
		     "DSC_ESTABELECIMENTO" LIKE '%ARMAZENS%' 
           ) AND (
             "DSC_ESTABELECIMENTO" NOT LIKE '%ZEM DE %' OR
             "DSC_ESTABELECIMENTO" NOT LIKE '%ZEN PARA %'
		   )
		 )
       ) AND ocorrencias <= 65;

-- MECANICA -> shop=car_repair --
 UPDATE public.tipos_de_pontos_de_interesse
 SET shop = CASE
      WHEN shop IS NULL THEN 'car_repair'
      WHEN NOT('car_repair' = ANY(string_to_array(shop, ';'))) THEN shop || ';car_repair'
      ELSE shop
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'MECANICA'
      WHEN NOT('MECANICA' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';MECANICA'
      ELSE substituicoes_aplicadas
    END
 WHERE 'MECANICA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) AND ocorrencias <= 65;

-- PECAS --
-- #TODO: Trabalhar subtipos --

-- BARBEARIA -> shop=hairdresser hairdresser=barber --
 UPDATE public.tipos_de_pontos_de_interesse
 SET shop = CASE
      WHEN shop IS NULL THEN 'hairdresser'
      WHEN NOT('hairdresser' = ANY(string_to_array(shop, ';'))) THEN shop || ';hairdresser'
      ELSE shop
    END,
	hairdresser = CASE
      WHEN hairdresser IS NULL THEN 'barber'
      WHEN NOT('barber' = ANY(string_to_array(hairdresser, ';'))) THEN hairdresser || ';barber'
      ELSE hairdresser
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'BARBEARIA'
      WHEN NOT('BARBEARIA' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';BARBEARIA'
      ELSE substituicoes_aplicadas
    END
 WHERE 'BARBEARIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) AND ocorrencias <= 65;

-- LANCHONETE|LANCHERIA|LANCHES -> amenity=fast_food --
 UPDATE public.tipos_de_pontos_de_interesse
 SET amenity = CASE
      WHEN amenity IS NULL THEN 'fast_food'
      WHEN NOT('fast_food' = ANY(string_to_array(amenity, ';'))) THEN amenity || ';fast_food'
      ELSE amenity
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'LANCHONETE|LANCHERIA|LANCHES'
      WHEN NOT('LANCHONETE|LANCHERIA|LANCHES' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';LANCHONETE|LANCHERIA|LANCHES'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'LANCHONETE' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'LANCHERIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'LANCHES' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) 
       ) AND ocorrencias <= 65;

-- CLINICA --
-- #TODO: Trabalhar subtipos --

-- CONSTRUCAO --
-- #TODO: Trabalhar subtipos. Diferenciar "EM CONSTRUCAO" de "DE CONSTRUCAO" --

-- MOVEIS --
-- #TODO: Trabalhar subtipos --

-- POSTO --
-- #TODO: Trabalhar subtipos --

-- SAUDE --
-- #TODO: Trabalhar subtipos --

-- CRIACAO |CURRAL? |REBANHO --
-- #TODO: Trabalhar subtipos --

-- DISTRIBUIDORA -> landuse=industrial industrial=distributor --
 UPDATE public.tipos_de_pontos_de_interesse
 SET landuse = CASE
      WHEN landuse IS NULL THEN 'industrial'
      WHEN NOT('industrial' = ANY(string_to_array(landuse, ';'))) THEN landuse || ';industrial'
      ELSE landuse
    END,
	industrial = CASE
      WHEN industrial IS NULL THEN 'distributor'
      WHEN NOT('distributor' = ANY(string_to_array(industrial, ';'))) THEN industrial || ';distributor'
      ELSE industrial
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'DISTRIBUIDORA'
      WHEN NOT('DISTRIBUIDORA' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';DISTRIBUIDORA'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'DISTRIBUIDORA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'DISTRIBUID0RA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'DISTRIBUIDORAS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' '))
       ) AND ocorrencias <= 65;

-- ROUPAS --
-- #TODO: Trabalhar subtipos --

-- FABRICA -> building=industrial man_made=works quando inicia com 'FABRICA %' --
 UPDATE public.tipos_de_pontos_de_interesse
 SET building = CASE
      WHEN building IS NULL THEN 'industrial'
      WHEN NOT('industrial' = ANY(string_to_array(building, ';'))) THEN building || ';industrial'
      ELSE building
    END,
    man_made = CASE
      WHEN man_made IS NULL THEN 'works'
      WHEN NOT('works' = ANY(string_to_array(man_made, ';'))) THEN man_made || ';works'
      ELSE man_made
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'FABRICA'
      WHEN NOT('FABRICA' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';FABRICA'
      ELSE substituicoes_aplicadas
    END
 WHERE "DSC_ESTABELECIMENTO" LIKE 'FABRICA %' AND ocorrencias <= 65;

-- MERCADO|SUPER MERCADO|SUPERMERCADO -> building=retail shop=supermarket quando inicia com 'MERCADO %' ou 'SUPER MERCADO%' ou 'SUPERMERCADO%' --
 UPDATE public.tipos_de_pontos_de_interesse
 SET building = CASE
      WHEN building IS NULL THEN 'retail'
      WHEN NOT('retail' = ANY(string_to_array(building, ';'))) THEN building || ';retail'
      ELSE building
    END,
    shop = CASE
      WHEN shop IS NULL THEN 'supermarket'
      WHEN NOT('supermarket' = ANY(string_to_array(shop, ';'))) THEN shop || ';supermarket'
      ELSE shop
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'MERCADO|SUPER MERCADO|SUPERMERCADO'
      WHEN NOT('MERCADO|SUPER MERCADO|SUPERMERCADO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';MERCADO|SUPER MERCADO|SUPERMERCADO'
      ELSE substituicoes_aplicadas
    END
 WHERE ( "DSC_ESTABELECIMENTO" LIKE 'MERCADO %' OR
         "DSC_ESTABELECIMENTO" LIKE 'MERCAD0%' OR
         "DSC_ESTABELECIMENTO" LIKE 'SUPER MERCAD%' OR
         "DSC_ESTABELECIMENTO" LIKE 'SUPERMERCAD%'
       ) AND ocorrencias <= 65;

-- CASA DO ADVOGADO -> shop=books books=advocacy name="Livraria Casa do Advogado" quando inicia com '%CASA DO ADVOGADO%' --
 ALTER TABLE public.tipos_de_pontos_de_interesse ADD COLUMN books TEXT;
 UPDATE public.tipos_de_pontos_de_interesse
 SET shop = CASE
      WHEN shop IS NULL THEN 'books'
      WHEN NOT('books' = ANY(string_to_array(shop, ';'))) THEN shop || ';books'
      ELSE shop
    END,
    books = CASE
      WHEN books IS NULL THEN 'advocacy'
      WHEN NOT('advocacy' = ANY(string_to_array(books, ';'))) THEN books || ';advocacy'
      ELSE books
    END,
    "name" = CASE
      WHEN "name" IS NULL THEN 'Livraria Casa do Advogado'
      WHEN NOT('Livraria Casa do Advogado' = ANY(string_to_array("name", ';'))) THEN "name" || ';Livraria Casa do Advogado'
      ELSE "name"
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'CASA DO ADVOGADO'
      WHEN NOT('CASA DO ADVOGADO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';CASA DO ADVOGADO'
      ELSE substituicoes_aplicadas
    END
 WHERE "DSC_ESTABELECIMENTO" LIKE '%CASA DO ADVOGADO%' AND ocorrencias <= 65;

-- OAB|ORDEM DOS ADVOGADOS -> office=association association=lawyers name="Ordem dos Advogados do Brasil" short_name=OAB brand=OAB brand:wikidata=Q873007 brand:wikipedia="pt:Ordem_dos_Advogados_do_Brasil" quando contém ('%ORDEM%' e ('%ADV%' ou '%ADIV%')) ou '%OAB%' --
 UPDATE public.tipos_de_pontos_de_interesse
 SET office = CASE
      WHEN office IS NULL THEN 'association'
      WHEN NOT('association' = ANY(string_to_array(office, ';'))) THEN office || ';association'
      ELSE office
    END,
    association = CASE
      WHEN association IS NULL THEN 'lawyers'
      WHEN NOT('lawyers' = ANY(string_to_array(association, ';'))) THEN association || ';lawyers'
      ELSE association
    END,
    "name" = CASE
      WHEN "name" IS NULL THEN 'Ordem dos Advogados do Brasil'
      WHEN NOT('Ordem dos Advogados do Brasil' = ANY(string_to_array("name", ';'))) THEN "name" || ';Ordem dos Advogados do Brasil'
      ELSE "name"
    END,
    short_name = CASE
      WHEN short_name IS NULL THEN 'OAB'
      WHEN NOT('OAB' = ANY(string_to_array(short_name, ';'))) THEN short_name || ';OAB'
      ELSE short_name
    END,
    brand = CASE
      WHEN brand IS NULL THEN 'OAB'
      WHEN NOT('OAB' = ANY(string_to_array(brand, ';'))) THEN brand || ';OAB'
      ELSE brand
    END,
    "brand:wikidata" = CASE
      WHEN "brand:wikidata" IS NULL THEN 'Q873007'
      WHEN NOT('Q873007' = ANY(string_to_array("brand:wikidata", ';'))) THEN "brand:wikidata" || ';Q873007'
      ELSE "brand:wikidata"
    END,
    "brand:wikipedia" = CASE
      WHEN "brand:wikipedia" IS NULL THEN 'pt:Ordem_dos_Advogados_do_Brasil'
      WHEN NOT('pt:Ordem_dos_Advogados_do_Brasil' = ANY(string_to_array("brand:wikipedia", ';'))) THEN "brand:wikipedia" || ';pt:Ordem_dos_Advogados_do_Brasil'
      ELSE "brand:wikipedia"
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'OAB|ORDEM DOS ADVOGADOS'
      WHEN NOT('OAB|ORDEM DOS ADVOGADOS' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';OAB|ORDEM DOS ADVOGADOS'
      ELSE substituicoes_aplicadas
    END
 WHERE ( ( "DSC_ESTABELECIMENTO" LIKE '%ORDEM%' AND (
            "DSC_ESTABELECIMENTO" LIKE '%ADV%' OR
            "DSC_ESTABELECIMENTO" LIKE '%ADIV%'
		 ) ) OR 'OAB' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' '))
       ) AND ocorrencias <= 65;

-- ADVOGAD|ADVOCACIA -> office=lawyer quando não tem 'CASA', nem 'OAB', nem 'ORDEM', e tem '%ADVOG%' ou '%ADIVOG%' ou '%ADV0G%' --
 UPDATE public.tipos_de_pontos_de_interesse
 SET office = CASE
      WHEN office IS NULL THEN 'lawyer'
      WHEN NOT('lawyer' = ANY(string_to_array(office, ';'))) THEN office || ';lawyer'
      ELSE office
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'OAB|ORDEM DOS ADVOGADOS'
      WHEN NOT('OAB|ORDEM DOS ADVOGADOS' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';OAB|ORDEM DOS ADVOGADOS'
      ELSE substituicoes_aplicadas
    END
 WHERE ( NOT('ORDEM' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' '))) AND
         NOT('OAB' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' '))) AND
         NOT('CASA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')))
	   ) AND ( "DSC_ESTABELECIMENTO" LIKE '%ADVOG%' OR
               "DSC_ESTABELECIMENTO" LIKE '%ADIVOG%' OR
               "DSC_ESTABELECIMENTO" LIKE '%ADV0G%'
			 ) AND ocorrencias <= 65;
	   
-- ESTETICA : ignorar --

-- MERCADINHO -> shop=convenience --
 UPDATE public.tipos_de_pontos_de_interesse
 SET shop = CASE
      WHEN shop IS NULL THEN 'convenience'
      WHEN NOT('convenience' = ANY(string_to_array(shop, ';'))) THEN shop || ';convenience'
      ELSE shop
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'MERCADINHO'
      WHEN NOT('MERCADINHO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';MERCADINHO'
      ELSE substituicoes_aplicadas
    END
 WHERE 'MERCADINHO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) AND ocorrencias <= 65;

-- MODAS -> shop=clothes --
 UPDATE public.tipos_de_pontos_de_interesse
 SET shop = CASE
      WHEN shop IS NULL THEN 'clothes'
      WHEN NOT('clothes' = ANY(string_to_array(shop, ';'))) THEN shop || ';clothes'
      ELSE shop
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'MODAS'
      WHEN NOT('MODAS' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';MODAS'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'MODAS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'M0DAS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'MODA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'M0DA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) 
       ) AND ocorrencias <= 65;

-- ACESSORIOS : ignorar --

-- PADARIA|PANIF* -> shop=bakery --
 UPDATE public.tipos_de_pontos_de_interesse
 SET shop = CASE
      WHEN shop IS NULL THEN 'bakery'
      WHEN NOT('bakery' = ANY(string_to_array(shop, ';'))) THEN shop || ';bakery'
      ELSE shop
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'PADARIA|PANIF*'
      WHEN NOT('PADARIA|PANIF*' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';PADARIA|PANIF*'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'PADARIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         "DSC_ESTABELECIMENTO" LIKE '%PANIF%' -- ex: PANIFICIO, PANIFICADORA, PANIFICACAO
       ) AND ocorrencias <= 65;

-- GARAGE*|GARAJE* -> building=garage --
 UPDATE public.tipos_de_pontos_de_interesse
 SET building = CASE
      WHEN building IS NULL THEN 'garage'
      WHEN NOT('garage' = ANY(string_to_array(building, ';'))) THEN building || ';garage'
      ELSE building
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'GARAGE*|GARAJE*'
      WHEN NOT('GARAGE*|GARAJE*' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';GARAGE*|GARAJE*'
      ELSE substituicoes_aplicadas
    END
 WHERE ( "DSC_ESTABELECIMENTO" LIKE '%GARAGE%' OR
         "DSC_ESTABELECIMENTO" LIKE '%GARAJE%'
       ) AND ocorrencias <= 65;

-- CAR : ignorar --

-- GALPAO|GALPA0 -> building=shed --
 UPDATE public.tipos_de_pontos_de_interesse
 SET building = CASE
      WHEN building IS NULL THEN 'shed'
      WHEN NOT('shed' = ANY(string_to_array(building, ';'))) THEN building || ';shed'
      ELSE building
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'GALPAO|GALPA0'
      WHEN NOT('GALPAO|GALPA0' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';GALPAO|GALPA0'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'GALPAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'GALPAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' '))
       ) AND ocorrencias <= 65;

-- BEBIDAS -> shop=beverages quando contem BEBIDAS, mas não contém FABRICA, DEPOSITO, DEPOSITOS, DISTRIBUIDORA, DISTRIBUIDORAS --
 UPDATE public.tipos_de_pontos_de_interesse
 SET shop = CASE
      WHEN shop IS NULL THEN 'beverages'
      WHEN NOT('beverages' = ANY(string_to_array(shop, ';'))) THEN shop || ';beverages'
      ELSE shop
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'BEBIDAS'
      WHEN NOT('BEBIDAS' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';BEBIDAS'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'BEBIDAS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) AND
         NOT('FABRICA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' '))) AND
         NOT('DEPOSITO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' '))) AND
         NOT('DEPOSITOS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' '))) AND
         NOT('DISTRIBUIDORA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' '))) AND
         NOT('DISTRIBUIDORAS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')))
       ) AND ocorrencias <= 65;

-- FABRICA DE BEBIDAS -> building=industrial industrial=beverages quando contem "FABRICA DE BEBIDAS" --
 UPDATE public.tipos_de_pontos_de_interesse
 SET building = CASE
      WHEN building IS NULL THEN 'industrial'
      WHEN NOT('industrial' = ANY(string_to_array(building, ';'))) THEN building || ';industrial'
      ELSE building
    END,
	industrial = CASE
      WHEN industrial IS NULL THEN 'beverages'
      WHEN NOT('beverages' = ANY(string_to_array(industrial, ';'))) THEN industrial || ';beverages'
      ELSE industrial
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'FABRICA DE BEBIDAS'
      WHEN NOT('FABRICA DE BEBIDAS' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';FABRICA DE BEBIDAS'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'BEBIDAS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BEBIDA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' '))
       ) AND
		 ( 'FABRICA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' '))
         ) AND ocorrencias <= 65;

-- ASSEMBLEIA DE DEUS -> name="Assembleia de Deus" amenity=place_of_worship brand:wikidata=Q1031397 brand:wikipedia=pt:Assembleia_de_Deus building=church denomination=assemblies_of_god religion=christian quando contem '%ASSEMBL%' e ('%DEUS%' ou '%IGREJ%' ou '%TEMPL%') --
 UPDATE public.tipos_de_pontos_de_interesse
 SET "name" = CASE
      WHEN "name" IS NULL THEN 'Assembleia de Deus'
      WHEN NOT('Assembleia de Deus' = ANY(string_to_array("name", ';'))) THEN "name" || ';Assembleia de Deus'
      ELSE "name"
    END,
	amenity = CASE
      WHEN amenity IS NULL THEN 'place_of_worship'
      WHEN NOT('place_of_worship' = ANY(string_to_array(amenity, ';'))) THEN amenity || ';place_of_worship'
      ELSE amenity
    END,
	building = CASE
      WHEN building IS NULL THEN 'church'
      WHEN NOT('church' = ANY(string_to_array(building, ';'))) THEN building || ';church'
      ELSE building
    END,
    denomination = CASE
      WHEN denomination IS NULL THEN 'assemblies_of_god'
      WHEN NOT('assemblies_of_god' = ANY(string_to_array(denomination, ';'))) THEN denomination || ';assemblies_of_god'
      ELSE denomination
    END,
    religion = CASE
      WHEN religion IS NULL THEN 'christian'
      WHEN NOT('christian' = ANY(string_to_array(religion, ';'))) THEN religion || ';christian'
      ELSE religion
    END,
	"brand:wikidata" = CASE
      WHEN "brand:wikidata" IS NULL THEN 'Q1031397'
      WHEN NOT('Q1031397' = ANY(string_to_array("brand:wikidata", ';'))) THEN "brand:wikidata" || ';Q1031397'
      ELSE "brand:wikidata"
    END,
    "brand:wikipedia" = CASE
      WHEN "brand:wikipedia" IS NULL THEN 'pt:Assembleia_de_Deus'
      WHEN NOT('pt:Assembleia_de_Deus' = ANY(string_to_array("brand:wikipedia", ';'))) THEN "brand:wikipedia" || ';pt:Assembleia_de_Deus'
      ELSE "brand:wikipedia"
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'ASSEMBLEIA DE DEUS'
      WHEN NOT('ASSEMBLEIA DE DEUS' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';ASSEMBLEIA DE DEUS'
      ELSE substituicoes_aplicadas
    END
 WHERE ( "DSC_ESTABELECIMENTO" LIKE '%ASEMBL%' OR
         "DSC_ESTABELECIMENTO" LIKE '%ASSEMBL%' OR
         "DSC_ESTABELECIMENTO" LIKE '%ASSENBL%' OR
         "DSC_ESTABELECIMENTO" LIKE '%ACEMBL%' OR
         "DSC_ESTABELECIMENTO" LIKE '%ACENBL%'
       ) AND (
         "DSC_ESTABELECIMENTO" LIKE '%DEUS%' OR
         "DSC_ESTABELECIMENTO" LIKE '%IGREJ%' OR
         "DSC_ESTABELECIMENTO" LIKE '%TEMPL%'
       ) AND ocorrencias <= 65;



-- VARIEDADES -> shop=variety_store quando contem VARIEDADES ou VARIEDADE, mas não contém CRIACAO --
 UPDATE public.tipos_de_pontos_de_interesse
 SET shop = CASE
      WHEN shop IS NULL THEN 'variety_store'
      WHEN NOT('variety_store' = ANY(string_to_array(shop, ';'))) THEN shop || ';variety_store'
      ELSE shop
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'VARIEDADES'
      WHEN NOT('VARIEDADES' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';VARIEDADES'
      ELSE substituicoes_aplicadas
    END
 WHERE ( ( 'VARIEDADES' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
           'VARIEDADE' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' '))
         ) AND
         NOT('CRIACAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')))
       ) AND ocorrencias <= 65;

-- ASSOCIACAO|ASSOCIACOES -> office=association quando contem ASSOCIACAO ou ASSOCIACOES, bem  como suas grafias erradas --
 UPDATE public.tipos_de_pontos_de_interesse
 SET office = CASE
      WHEN office IS NULL THEN 'association'
      WHEN NOT('association' = ANY(string_to_array(office, ';'))) THEN office || ';association'
      ELSE office
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'ASSOCIACAO|ASSOCIACOES'
      WHEN NOT('ASSOCIACAO|ASSOCIACOES' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';ASSOCIACAO|ASSOCIACOES'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'ASSOCIACAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ASSOCIACOES' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ACOCIACAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ACOCIACA0' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ACOCIASAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ACOCIASSAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ACOSIACAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ACOSSIACAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ACOSSIASAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ASOSIASAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ASSOSIASSAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ASOCIASSAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'AS0CIACAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ASSOCIASA0' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ASSOSIASAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ASS0CIACA0' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ASOCIASAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ASOSIACAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ASOSSIACAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ASSOCIACA0' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ASSOCIASAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ASS0CIACAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ASSOCIASSAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ASOCIACAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ASSOSIACAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ASSOSSIACAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) 
       ) AND ocorrencias <= 65;

-- SERVICOS : ignorar --

-- MOTOS --
-- #TODO: Trabalhar subtipos --

-- LAVA JATO|LAVA RAPIDO|LAVAGEM|LAVACAO|LAVA CAR  -> amenity=car_wash contem '%LAVA JATO%' ou '%LAVA A JATO%' ou '%LAVA JATI%' ou '%LAVAJATO%' ou '%LAVA RAPIDO%' ou '%LAVARAPIDO%' ou '%LAVARRAPIDO%' ou '%LAVAGE%' ou '%LAVAJE%' ou '%LAVACAO%' ou '%LAVACA0%' ou '%LAVASAO%' ou '%LAVA CAR%' --
 UPDATE public.tipos_de_pontos_de_interesse
 SET amenity = CASE
      WHEN amenity IS NULL THEN 'car_wash'
      WHEN NOT('car_wash' = ANY(string_to_array(amenity, ';'))) THEN amenity || ';car_wash'
      ELSE amenity
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'LAVA JATO|LAVA RAPIDO|LAVAGEM|LAVACAO|LAVA CAR'
      WHEN NOT('LAVA JATO|LAVA RAPIDO|LAVAGEM|LAVACAO|LAVA CAR' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';LAVA JATO|LAVA RAPIDO|LAVAGEM|LAVACAO|LAVA CAR'
      ELSE substituicoes_aplicadas
    END
 WHERE ( "DSC_ESTABELECIMENTO" LIKE '%LAVA JATO%' OR
         "DSC_ESTABELECIMENTO" LIKE '%LAVA A JATO%' OR
         "DSC_ESTABELECIMENTO" LIKE '%LAVA JATI%' OR
         "DSC_ESTABELECIMENTO" LIKE '%LAVAJATO%' OR
         "DSC_ESTABELECIMENTO" LIKE '%LAVA RAPIDO%' OR
         "DSC_ESTABELECIMENTO" LIKE '%LAVARAPIDO%' OR
         "DSC_ESTABELECIMENTO" LIKE '%LAVARRAPIDO%' OR
         "DSC_ESTABELECIMENTO" LIKE '%LAVAGE%' OR
         "DSC_ESTABELECIMENTO" LIKE '%LAVAJE%' OR
         "DSC_ESTABELECIMENTO" LIKE '%LAVACAO%' OR
         "DSC_ESTABELECIMENTO" LIKE '%LAVACA0%' OR
         "DSC_ESTABELECIMENTO" LIKE '%LAVASAO%' OR
         "DSC_ESTABELECIMENTO" LIKE '%LAVA CAR%'
       ) AND ocorrencias <= 65;

-- LOJA DE MATERIAIS DE CONSTRUCAO -> shop=doityourself quando contem '%MATER%CONSTR%' ou '%MATER%C0NSTR%' ou '%CONSTR%MATER%' ou '%C0NSTR%MATER%' mas não contem DEPOSITO --
 UPDATE public.tipos_de_pontos_de_interesse
 SET shop = CASE
      WHEN shop IS NULL THEN 'doityourself'
      WHEN NOT('doityourself' = ANY(string_to_array(shop, ';'))) THEN shop || ';doityourself'
      ELSE shop
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'LOJA DE MATERIAIS DE CONSTRUCAO'
      WHEN NOT('LOJA DE MATERIAIS DE CONSTRUCAO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';LOJA DE MATERIAIS DE CONSTRUCAO'
      ELSE substituicoes_aplicadas
    END
 WHERE ( ( "DSC_ESTABELECIMENTO" LIKE '%MATER%CONSTR%' OR
           "DSC_ESTABELECIMENTO" LIKE '%MATER%C0NSTR%' OR
           "DSC_ESTABELECIMENTO" LIKE '%CONSTR%MATER%' OR
           "DSC_ESTABELECIMENTO" LIKE '%C0NSTR%MATER%'
         ) AND
         ( "DSC_ESTABELECIMENTO" NOT LIKE '%DEPOSITO%' OR
           "DSC_ESTABELECIMENTO" NOT LIKE '%DEP0SITO%' OR
           "DSC_ESTABELECIMENTO" NOT LIKE '%DEPOSIT0%'OR
           "DSC_ESTABELECIMENTO" NOT LIKE '%DEPOZITO%'
         )
       ) AND ocorrencias <= 65;

-- DEPOSITO DE MATERIAIS DE CONSTRUCAO -> building=warehouse quando contem '%MATER%CONSTR%' ou '%MATER%C0NSTR%' ou '%CONSTR%MATER%' ou '%C0NSTR%MATER%' mas contem DEPOSITO --
 UPDATE public.tipos_de_pontos_de_interesse
 SET building = CASE
      WHEN building IS NULL THEN 'warehouse'
      WHEN NOT('warehouse' = ANY(string_to_array(building, ';'))) THEN building || ';warehouse'
      ELSE building
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'DEPOSITO DE MATERIAIS DE CONSTRUCAO'
      WHEN NOT('DEPOSITO DE MATERIAIS DE CONSTRUCAO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';DEPOSITO DE MATERIAIS DE CONSTRUCAO'
      ELSE substituicoes_aplicadas
    END
 WHERE ( ( "DSC_ESTABELECIMENTO" LIKE '%MATER%CONSTR%' OR
           "DSC_ESTABELECIMENTO" LIKE '%MATER%C0NSTR%' OR
           "DSC_ESTABELECIMENTO" LIKE '%CONSTR%MATER%' OR
           "DSC_ESTABELECIMENTO" LIKE '%C0NSTR%MATER%'
         ) AND
         ( "DSC_ESTABELECIMENTO" LIKE '%DEPOSITO%' OR
           "DSC_ESTABELECIMENTO" LIKE '%DEP0SITO%' OR
           "DSC_ESTABELECIMENTO" LIKE '%DEPOSIT0%'OR
           "DSC_ESTABELECIMENTO" LIKE '%DEPOZITO%'
         )
       ) AND ocorrencias <= 65;


-- PIZZARIA|PIZZA|PIZZAIOLO -> amenity=fast_food --
 UPDATE public.tipos_de_pontos_de_interesse
 SET amenity = CASE
      WHEN amenity IS NULL THEN 'fast_food'
      WHEN NOT('fast_food' = ANY(string_to_array(amenity, ';'))) THEN amenity || ';fast_food'
      ELSE amenity
    END,
    cuisine = CASE
      WHEN cuisine IS NULL THEN 'pizza'
      WHEN NOT('pizza' = ANY(string_to_array(cuisine, ';'))) THEN cuisine || ';pizza'
      ELSE cuisine
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'PIZZARIA|PIZZA|PIZZAIOLO'
      WHEN NOT('PIZZARIA|PIZZA|PIZZAIOLO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';PIZZARIA|PIZZA|PIZZAIOLO'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'PIZZARIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PIZZARIAS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PIZZA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PIZZAS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PIZA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PIZAS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PITZARIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PITIZARIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PIZZAIOLO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PIZZAIOLA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) 
       ) AND ocorrencias <= 65;

-- ESTACIONAMENTO -> amenity=parking --
 UPDATE public.tipos_de_pontos_de_interesse
 SET amenity = CASE
      WHEN amenity IS NULL THEN 'parking'
      WHEN NOT('parking' = ANY(string_to_array(amenity, ';'))) THEN amenity || ';parking'
      ELSE amenity
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'ESTACIONAMENTO'
      WHEN NOT('ESTACIONAMENTO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';ESTACIONAMENTO'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'ESTACIONAMENTO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ESTACIONAMENTOS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ESTACIONAMENT0' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) 
       ) AND ocorrencias <= 65;

-- EMPRESA : ignorar --

-- MATERIAL --
-- #TODO: Trabalhar subtipos? --

-- EMPRESA : ignorar --
-- PRODUTOS : ignorar --

-- BORRACHARIA -> shop=tyres repair=yes quando contem BORRACHARIA e suas grafias incorretas --
 UPDATE public.tipos_de_pontos_de_interesse
 SET shop = CASE
      WHEN shop IS NULL THEN 'tyres'
      WHEN NOT('tyres' = ANY(string_to_array(shop, ';'))) THEN shop || ';tyres'
      ELSE shop
    END,
	repair = CASE
      WHEN repair IS NULL THEN 'yes'
      WHEN NOT('yes' = ANY(string_to_array(repair, ';'))) THEN repair || ';yes'
      ELSE repair
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'BORRACHARIA'
      WHEN NOT('BORRACHARIA' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';BORRACHARIA'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'BORRACHARIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'B0RRACHARIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'B0RACHARIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BORACHARIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BORRACARIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'B0RRACARIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BORRAXARIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BORRACHARRIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BORACHARRIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'B0RACHARRIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BORAXARIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) 
       ) AND ocorrencias <= 65;

-- PET -> shop=pet quando contem PET sem a palavra GARRAFA --
 UPDATE public.tipos_de_pontos_de_interesse
 SET shop = CASE
      WHEN shop IS NULL THEN 'pet'
      WHEN NOT('pet' = ANY(string_to_array(shop, ';'))) THEN shop || ';pet'
      ELSE shop
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'PET'
      WHEN NOT('PET' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';PET'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'PET' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) 
       ) AND (
	      "DSC_ESTABELECIMENTO" NOT LIKE '%GARRAFA%' OR
          "DSC_ESTABELECIMENTO" NOT LIKE '%GARAFA%'
		 ) AND ocorrencias <= 65;

-- ASSISTENCIA --
-- #TODO: Trabalhar subtipos --

-- EVANGELICO -> religion=christian denomination=evangelical quando contem EVANGELICO e suas variações --
 UPDATE public.tipos_de_pontos_de_interesse
 SET religion = CASE
      WHEN religion IS NULL THEN 'christian'
      WHEN NOT('christian' = ANY(string_to_array(religion, ';'))) THEN religion || ';christian'
      ELSE religion
    END,
	denomination = CASE
      WHEN denomination IS NULL THEN 'evangelical'
      WHEN NOT('evangelical' = ANY(string_to_array(denomination, ';'))) THEN denomination || ';evangelical'
      ELSE denomination
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'EVANGELICO'
      WHEN NOT('EVANGELICO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';EVANGELICO'
      ELSE substituicoes_aplicadas
    END
 WHERE ( "DSC_ESTABELECIMENTO" LIKE '%VANGELIC%' OR
         "DSC_ESTABELECIMENTO" LIKE '%VAMGELIC%' OR
         "DSC_ESTABELECIMENTO" LIKE '%VANJELIC%' 
       ) AND ocorrencias <= 65;

-- GADO|TOURO|VACA|BOI|TERNEIRO -> landuse=animal_keeping animal_keeping=cattle --
 ALTER TABLE public.tipos_de_pontos_de_interesse ADD COLUMN animal_keeping TEXT;
 UPDATE public.tipos_de_pontos_de_interesse
 SET landuse = CASE
      WHEN landuse IS NULL THEN 'animal_keeping'
      WHEN NOT('animal_keeping' = ANY(string_to_array(landuse, ';'))) THEN landuse || ';animal_keeping'
      ELSE landuse
    END,
	animal_keeping = CASE
      WHEN animal_keeping IS NULL THEN 'cattle'
      WHEN NOT('cattle' = ANY(string_to_array(animal_keeping, ';'))) THEN animal_keeping || ';cattle'
      ELSE animal_keeping
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'GADO|TOURO|VACA|BOI|TERNEIRO'
      WHEN NOT('GADO|TOURO|VACA|BOI|TERNEIRO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';GADO|TOURO|VACA|BOI|TERNEIRO'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'GADO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'GAD0' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'GADOS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'GAD0S' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'VACA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'VACAS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         ( 'BOI' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) AND
		    "DSC_ESTABELECIMENTO" NOT LIKE '%CRIAC%'
		 ) OR
         'BOIS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'TERNEIRO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'TERNEIROS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'TERNEIRA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'TERNEIRAS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BOVINO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BOVIN0' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BOVINOS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BOVIN0S' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BEZERRO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BEZERROS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BESERROS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BEZERO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BEZEROS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) 
       ) AND ocorrencias <= 65;

-- MOTO --
-- #TODO: Trabalhar subtipos --

-- CLUBE -> club=yes quando contem CLUBE --
 UPDATE public.tipos_de_pontos_de_interesse
 SET club = CASE
      WHEN club IS NULL THEN 'yes'
      WHEN NOT('yes' = ANY(string_to_array(club, ';'))) THEN club || ';yes'
      ELSE club
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'CLUBE'
      WHEN NOT('CLUBE' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';CLUBE'
      ELSE substituicoes_aplicadas
    END
 WHERE 'CLUBE' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) 
       AND ocorrencias <= 65;

-- POUSADA|HOTELZINHO|AIRBNB -> tourism=guest_house building=yes quando contem  --
 UPDATE public.tipos_de_pontos_de_interesse
 SET tourism = CASE
      WHEN tourism IS NULL THEN 'guest_house'
      WHEN NOT('guest_house' = ANY(string_to_array(tourism, ';'))) THEN tourism || ';guest_house'
      ELSE tourism
    END,
	building = CASE
      WHEN building IS NULL THEN 'yes'
      WHEN NOT('yes' = ANY(string_to_array(building, ';'))) THEN building || ';yes'
      ELSE building
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'POUSADA|HOTELZINHO|AIRBNB'
      WHEN NOT('POUSADA|HOTELZINHO|AIRBNB' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';POUSADA|HOTELZINHO|AIRBNB'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'POUSADA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'P0USADA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'POUSADAS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'POUZADA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'POUSSADA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'POSSADA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'POSADA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'POZADA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'POSADA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'HOTELZINHO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'AIRBNB' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         "DSC_ESTABELECIMENTO" LIKE '%AIR BNB%' 
       ) AND ocorrencias <= 65;

-- CAFE -> crop=cafe quando contem CAFE --
 UPDATE public.tipos_de_pontos_de_interesse
 SET crop = CASE
      WHEN crop IS NULL THEN 'cafe'
      WHEN NOT('cafe' = ANY(string_to_array(crop, ';'))) THEN crop || ';cafe'
      ELSE crop
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'CAFE'
      WHEN NOT('CAFE' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';CAFE'
      ELSE substituicoes_aplicadas
    END
 WHERE 'CAFE' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) 
       AND ocorrencias <= 65;

-- MINISTERIO --
-- #TODO: Trabalhar subtipos --


-- CONFECCOES -> shop=clothes quando contem a palavra CONFECCOES, mas não como a primeira palavra e que também não contenha as palavras FABRICA e INDUSTRIA --
 UPDATE public.tipos_de_pontos_de_interesse
 SET shop = CASE
      WHEN shop IS NULL THEN 'clothes'
      WHEN NOT('clothes' = ANY(string_to_array(shop, ';'))) THEN shop || ';clothes'
      ELSE shop
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'CONFECCOES'
      WHEN NOT('CONFECCOES' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';CONFECCOES'
      ELSE substituicoes_aplicadas
    END
 WHERE ( ( 'CONFECCOES' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
           'CONFECOES' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
           'C0NFECCOES' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
           'COMFECCOES' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
           'COMFEQUICOES' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
           'CONFEQUICOES' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' '))
         ) AND -- que não seja a primeira palavra
         ( array_position(string_to_array("DSC_ESTABELECIMENTO", ' '), 'CONFECCOES') > 1 OR
           array_position(string_to_array("DSC_ESTABELECIMENTO", ' '), 'CONFECOES') > 1 OR
           array_position(string_to_array("DSC_ESTABELECIMENTO", ' '), 'C0NFECCOES') > 1 OR
           array_position(string_to_array("DSC_ESTABELECIMENTO", ' '), 'COMFECCOES') > 1 OR
           array_position(string_to_array("DSC_ESTABELECIMENTO", ' '), 'COMFEQUICOES') > 1 OR
           array_position(string_to_array("DSC_ESTABELECIMENTO", ' '), 'CONFEQUICOES') > 1 
         ) AND
         (
           "DSC_ESTABELECIMENTO" NOT LIKE '%FABRICA%' OR
           "DSC_ESTABELECIMENTO" NOT LIKE '%INDUSTR%' 
		 )
       ) AND ocorrencias <= 65;

-- CONTABILIDADE|CONTABILISTA|CONTABEIS|CONTABIL|CONTADOR -> office=accountant --
 UPDATE public.tipos_de_pontos_de_interesse
 SET office = CASE
      WHEN office IS NULL THEN 'accountant'
      WHEN NOT('accountant' = ANY(string_to_array(office, ';'))) THEN office || ';accountant'
      ELSE office
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'CONTABILIDADE|CONTABILISTA|CONTABEIS|CONTABIL|CONTADOR'
      WHEN NOT('CONTABILIDADE|CONTABILISTA|CONTABEIS|CONTABIL|CONTADOR' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';CONTABILIDADE|CONTABILISTA|CONTABEIS|CONTABIL|CONTADOR'
      ELSE substituicoes_aplicadas
    END
 WHERE ( "DSC_ESTABELECIMENTO" LIKE '%CONTAB%' OR
         "DSC_ESTABELECIMENTO" LIKE '%C0NTAB%' OR 
         "DSC_ESTABELECIMENTO" LIKE '%COMTAB%' OR 
         "DSC_ESTABELECIMENTO" LIKE '%CONTAD%'OR
         "DSC_ESTABELECIMENTO" LIKE '%GUARDA LIVRO%'
       ) AND ocorrencias <= 65;

-- VEICULOS --
-- #TODO: Trabalhar subtipos --

-- ACAI|ACAITERIA -> amenity=fast_food cuisine=açaí --
 UPDATE public.tipos_de_pontos_de_interesse
 SET amenity = CASE
      WHEN amenity IS NULL THEN 'fast_food'
      WHEN NOT('fast_food' = ANY(string_to_array(amenity, ';'))) THEN amenity || ';fast_food'
      ELSE amenity
    END,
    cuisine = CASE
      WHEN cuisine IS NULL THEN 'açaí'
      WHEN NOT('açaí' = ANY(string_to_array(cuisine, ';'))) THEN cuisine || ';açaí'
      ELSE cuisine
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'ACAI|ACAITERIA'
      WHEN NOT('ACAI|ACAITERIA' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';ACAI|ACAITERIA'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'ACAI' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ACAITERIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) 
       ) AND ocorrencias <= 65;

-- LOJA DE CALCADOS -> shop=shoes quando contem a palavra CALCADOS, mas não contem as palavras FABRICA, CONSERTO, ATELIER, RENOVADORA, REFORMADORA, UTI, HOSPITAL, CLINICA e INDUSTRIA --
 UPDATE public.tipos_de_pontos_de_interesse
 SET shop = CASE
      WHEN shop IS NULL THEN 'shoes'
      WHEN NOT('shoes' = ANY(string_to_array(shop, ';'))) THEN shop || ';shoes'
      ELSE shop
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'LOJA DE CALCADOS'
      WHEN NOT('LOJA DE CALCADOS' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';LOJA DE CALCADOS'
      ELSE substituicoes_aplicadas
    END
 WHERE ( ( 'CALCADOS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
           'CALCADO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
           'CALCAD0' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
           'CALCAD0S' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
           'CALSADOS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
           'CALSADO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
           'CAUSADO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) 
         ) AND
         (
           "DSC_ESTABELECIMENTO" NOT LIKE '%FABRIC%' OR
           "DSC_ESTABELECIMENTO" NOT LIKE '%INDUSTR%' OR
           "DSC_ESTABELECIMENTO" NOT LIKE '%CONSERT%' OR
           "DSC_ESTABELECIMENTO" NOT LIKE '%C0NSERT%' OR
           "DSC_ESTABELECIMENTO" NOT LIKE '%CONCERT%' OR
           "DSC_ESTABELECIMENTO" NOT LIKE '%ATELIE%' OR
           "DSC_ESTABELECIMENTO" NOT LIKE '%RENOVAD%' OR
           "DSC_ESTABELECIMENTO" NOT LIKE '%REN0VAD%' OR
           "DSC_ESTABELECIMENTO" NOT LIKE '%FABRIQ%' OR
           "DSC_ESTABELECIMENTO" NOT LIKE '%REFORM%' OR
           "DSC_ESTABELECIMENTO" NOT LIKE '%REF0RM%' OR
           "DSC_ESTABELECIMENTO" NOT LIKE '%HOSPITAL%' OR
           "DSC_ESTABELECIMENTO" NOT LIKE '%H0SPITAL%' OR
           "DSC_ESTABELECIMENTO" NOT LIKE '%CLINIC%' OR
           'UTI' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' '))
		 )
       ) AND ocorrencias <= 65;

-- CONSERTO DE CALCADOS -> craft=shoemaker quando contem a palavra CALCADOS, e contem as palavras FABRICA, CONSERTO, ATELIER, RENOVADORA, REFORMADORA, UTI, HOSPITAL, CLINICA e INDUSTRIA --
 UPDATE public.tipos_de_pontos_de_interesse
 SET craft = CASE
      WHEN craft IS NULL THEN 'shoemaker'
      WHEN NOT('shoemaker' = ANY(string_to_array(craft, ';'))) THEN craft || ';shoemaker'
      ELSE craft
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'CONSERTO DE CALCADOS'
      WHEN NOT('CONSERTO DE CALCADOS' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';CONSERTO DE CALCADOS'
      ELSE substituicoes_aplicadas
    END
 WHERE ( ( 'CALCADOS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
           'CALCADO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
           'CALCAD0' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
           'CALCAD0S' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
           'CALSADOS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
           'CALSADO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
           'CAUSADO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) 
         ) AND
         (
           "DSC_ESTABELECIMENTO" LIKE '%FABRIC%' OR
           "DSC_ESTABELECIMENTO" LIKE '%INDUSTR%' OR
           "DSC_ESTABELECIMENTO" LIKE '%CONSERT%' OR
           "DSC_ESTABELECIMENTO" LIKE '%C0NSERT%' OR
           "DSC_ESTABELECIMENTO" LIKE '%CONCERT%' OR
           "DSC_ESTABELECIMENTO" LIKE '%ATELIE%' OR
           "DSC_ESTABELECIMENTO" LIKE '%RENOVAD%' OR
           "DSC_ESTABELECIMENTO" LIKE '%REN0VAD%' OR
           "DSC_ESTABELECIMENTO" LIKE '%FABRIQ%' OR
           "DSC_ESTABELECIMENTO" LIKE '%REFORM%' OR
           "DSC_ESTABELECIMENTO" LIKE '%REF0RM%' OR
           "DSC_ESTABELECIMENTO" LIKE '%HOSPITAL%' OR
           "DSC_ESTABELECIMENTO" LIKE '%H0SPITAL%' OR
           "DSC_ESTABELECIMENTO" LIKE '%CLINIC%' OR
           'UTI' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' '))
		 )
       ) AND ocorrencias <= 65;

-- INFANTIL : #TODO ignorar pois parece não ter tag específica genérica ou aplicar conforme as outras tags  --

-- UNIDADE --
-- #TODO: Trabalhar subtipos --

-- FESTAS --
-- #TODO: Trabalhar subtipos --

-- FARMACIA|DROGARIA -> amenity=pharmacy building=retail --
 UPDATE public.tipos_de_pontos_de_interesse
 SET amenity = CASE
      WHEN amenity IS NULL THEN 'pharmacy'
      WHEN NOT('pharmacy' = ANY(string_to_array(amenity, ';'))) THEN amenity || ';pharmacy'
      ELSE amenity
    END,
	building = CASE
      WHEN building IS NULL THEN 'retail'
      WHEN NOT('retail' = ANY(string_to_array(building, ';'))) THEN building || ';retail'
      ELSE building
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'FARMACIA|DROGARIA'
      WHEN NOT('FARMACIA|DROGARIA' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';FARMACIA|DROGARIA'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'FARMACIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'FARMACIAS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'DROGARIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'DROGARIAS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'DR0GARIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'DR0GARIAS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'FARNACIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'FARNACIAS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'FARMASIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'DROGARRIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) 
       ) AND ocorrencias <= 65;

-- PENTECOSTAL -> religion=christian denomination=pentecostal quando contem PENTECOSTAL --
 UPDATE public.tipos_de_pontos_de_interesse
 SET religion = CASE
      WHEN religion IS NULL THEN 'christian'
      WHEN NOT('christian' = ANY(string_to_array(religion, ';'))) THEN religion || ';christian'
      ELSE religion
    END,
	denomination = CASE
      WHEN denomination IS NULL THEN 'pentecostal'
      WHEN NOT('pentecostal' = ANY(string_to_array(denomination, ';'))) THEN denomination || ';pentecostal'
      ELSE denomination
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'PENTECOSTAL'
      WHEN NOT('PENTECOSTAL' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';PENTECOSTAL'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'PENTECOSTAL' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PENTEC0STAL' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PETECOSTAL' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PENTECOSTAU' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PENTICOSTAL' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) 
       ) AND ocorrencias <= 65;

-- BATISTA : ignorar --

-- HOTEL -> tourism=hotel building=hotel quando contem HOTEL --
 UPDATE public.tipos_de_pontos_de_interesse
 SET tourism = CASE
      WHEN tourism IS NULL THEN 'hotel'
      WHEN NOT('hotel' = ANY(string_to_array(tourism, ';'))) THEN tourism || ';hotel'
      ELSE tourism
    END,
	building = CASE
      WHEN building IS NULL THEN 'hotel'
      WHEN NOT('hotel' = ANY(string_to_array(building, ';'))) THEN building || ';hotel'
      ELSE building
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'HOTEL'
      WHEN NOT('HOTEL' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';HOTEL'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'HOTEL' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'HOTEL' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'OTEL' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) 
       ) AND ocorrencias <= 65;

-- GAS|GAZ -> shop=gas quando contem GAS OU GAZ --
 UPDATE public.tipos_de_pontos_de_interesse
 SET shop = CASE
      WHEN shop IS NULL THEN 'gas'
      WHEN NOT('gas' = ANY(string_to_array(shop, ';'))) THEN shop || ';gas'
      ELSE shop
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'GAS|GAZ'
      WHEN NOT('GAS|GAZ' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';GAS|GAZ'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'GAS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'GAZ' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' '))
       ) AND ocorrencias <= 65;

-- MILHO -> crop=corn quando contem MILHO --
 UPDATE public.tipos_de_pontos_de_interesse
 SET crop = CASE
      WHEN crop IS NULL THEN 'corn'
      WHEN NOT('corn' = ANY(string_to_array(crop, ';'))) THEN crop || ';corn'
      ELSE crop
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'MILHO'
      WHEN NOT('MILHO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';MILHO'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'MILHO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'MILH0' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'MILIO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' '))
       ) AND ocorrencias <= 65;

-- VAGO|VAGA|FECHADO|FECHADA|VAZIO|VAZIA|ABANDONADO|ABANDONADA|ANTIGO|ANTIGA|DESATIVADO|DESATIVADA --
-- #TODO: Trabalhar tag --

-- SEM DENOMINACAO|SEM NOME --
-- #TODO: Trabalhar tag. Implica name=NULL --

-- ATELIE|ATELIER : ignorar --

-- BAZAR -> shop=second_hand --
 UPDATE public.tipos_de_pontos_de_interesse
 SET shop = CASE
      WHEN shop IS NULL THEN 'second_hand'
      WHEN NOT('second_hand' = ANY(string_to_array(shop, ';'))) THEN shop || ';second_hand'
      ELSE shop
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'BAZAR'
      WHEN NOT('BAZAR' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';BAZAR'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'BAZAR' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BAZZAR' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BASAR' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BAZA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
		 'BAAZAR' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'BAZAAR' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) 
       ) AND ocorrencias <= 65;

-- PLANTACAO -> landuse=farmland contem PLANTACAO --
 UPDATE public.tipos_de_pontos_de_interesse
 SET landuse = CASE
      WHEN landuse IS NULL THEN 'farmland'
      WHEN NOT('farmland' = ANY(string_to_array(landuse, ';'))) THEN landuse || ';farmland'
      ELSE landuse
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'PLANTACAO'
      WHEN NOT('PLANTACAO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';PLANTACAO'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'PLANTACAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PLAMTACAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PLATACAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PLATASAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PLANTASAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PLANTASSAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PANTACAO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PLANTACOES' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PLAMTACOES' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PLATACOES' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PLANTAC0ES' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PLANTASOES' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) 
       ) AND ocorrencias <= 65;

-- SERRALHERIA|SERRALHEIRO -> craft= metal_construction quando contem a palavra SERRALHERIA ou SERRALHEIRO --
 UPDATE public.tipos_de_pontos_de_interesse
 SET craft = CASE
      WHEN craft IS NULL THEN 'metal_construction'
      WHEN NOT('metal_construction' = ANY(string_to_array(craft, ';'))) THEN craft || ';metal_construction'
      ELSE craft
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'SERRALHERIA|SERRALHEIRO'
      WHEN NOT('SERRALHERIA|SERRALHEIRO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';SERRALHERIA|SERRALHEIRO'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'SERRALHERIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'SERRALERIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'SERALHERIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'SERALERIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'CERRALHERIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'CERALHERIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'CERALERIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'CERRALERIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'SERARRELIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'SERRALHEIRO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'SERRALHERO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) 
	   ) AND ocorrencias <= 65;

-- PAPELARIA|ARTIGOS/MATERIAIS/SUPREMENTOS ESCRITORIO -> shop=stationery --
 UPDATE public.tipos_de_pontos_de_interesse
 SET shop = CASE
      WHEN shop IS NULL THEN 'stationery'
      WHEN NOT('stationery' = ANY(string_to_array(shop, ';'))) THEN shop || ';stationery'
      ELSE shop
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'PAPELARIA|ARTIGOS/MATERIAIS/SUPREMENTOS ESCRITORIO'
      WHEN NOT('PAPELARIA|ARTIGOS/MATERIAIS/SUPREMENTOS ESCRITORIO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';PAPELARIA|ARTIGOS/MATERIAIS/SUPREMENTOS ESCRITORIO'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'PAPELARIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PAPELHARIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'PAPELARRIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
		 "DSC_ESTABELECIMENTO" LIKE '%ARTIG%ESCRIT%' OR
		 "DSC_ESTABELECIMENTO" LIKE '%MATER%ESCRIT%' OR
         "DSC_ESTABELECIMENTO" LIKE '%MATERI%ESCOL%' OR
         "DSC_ESTABELECIMENTO" LIKE '%SUPR%ESCRIT%'
       ) AND ocorrencias <= 65;

-- EVENTOS -> amenity=events_venue --
 UPDATE public.tipos_de_pontos_de_interesse
 SET amenity = CASE
      WHEN amenity IS NULL THEN 'events_venue'
      WHEN NOT('events_venue' = ANY(string_to_array(amenity, ';'))) THEN amenity || ';events_venue'
      ELSE amenity
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'EVENTOS'
      WHEN NOT('EVENTOS' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';EVENTOS'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'EVENTOS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'EVENTO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'EVENT0S' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'EVEMTOS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) 
       ) AND ocorrencias <= 65;


-- CONSULTORIO -> amenity=doctors healthcare=doctor --
 UPDATE public.tipos_de_pontos_de_interesse
 SET amenity = CASE
      WHEN amenity IS NULL THEN 'doctors'
      WHEN NOT('doctors' = ANY(string_to_array(amenity, ';'))) THEN amenity || ';doctors'
      ELSE amenity
    END,
    healthcare = CASE
      WHEN healthcare IS NULL THEN 'doctor'
      WHEN NOT('doctor' = ANY(string_to_array(healthcare, ';'))) THEN healthcare || ';doctor'
      ELSE healthcare
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'CONSULTORIO'
      WHEN NOT('CONSULTORIO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';CONSULTORIO'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'CONSULTORIO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'CONSULTORI0' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'COMSULTORIO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'CONSULT0RIO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'CONSUTORIO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'COSUTORIO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'CONSULTORRIO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'CONSULTORIOS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'C0NSULTORIOS' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) 
       ) AND ocorrencias <= 65;

-- ENGENHARIA|ENGENHEIRO -> office=engineer quando contem ENGENHEIRO, ENGENHEIRA e ENGENHARIA, bem  como suas grafias erradas --
 UPDATE public.tipos_de_pontos_de_interesse
 SET office = CASE
      WHEN office IS NULL THEN 'engineer'
      WHEN NOT('engineer' = ANY(string_to_array(office, ';'))) THEN office || ';engineer'
      ELSE office
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'ENGENHARIA|ENGENHEIRO'
      WHEN NOT('ENGENHARIA|ENGENHEIRO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';ENGENHARIA|ENGENHEIRO'
      ELSE substituicoes_aplicadas
    END
 WHERE ( "DSC_ESTABELECIMENTO" LIKE '%ENGENHA%' OR
         "DSC_ESTABELECIMENTO" LIKE '%ENGENHE%' OR 
         "DSC_ESTABELECIMENTO" LIKE '%EMGENHA%' OR 
         "DSC_ESTABELECIMENTO" LIKE '%ENJENHA%' OR 
         "DSC_ESTABELECIMENTO" LIKE '%GENHAR%' OR 
         "DSC_ESTABELECIMENTO" LIKE '%GEMHAR%' OR 
         "DSC_ESTABELECIMENTO" LIKE '%GENIAR%' OR 
         "DSC_ESTABELECIMENTO" LIKE '%GENHEA%' 
       ) AND ocorrencias <= 65;

-- SORVETERIA|SORVETES -> amenity=ice_cream cuisine=ice_cream --
 UPDATE public.tipos_de_pontos_de_interesse
 SET amenity = CASE
      WHEN amenity IS NULL THEN 'ice_cream'
      WHEN NOT('ice_cream' = ANY(string_to_array(amenity, ';'))) THEN amenity || ';ice_cream'
      ELSE amenity
    END,
    cuisine = CASE
      WHEN cuisine IS NULL THEN 'ice_cream'
      WHEN NOT('ice_cream' = ANY(string_to_array(cuisine, ';'))) THEN cuisine || ';ice_cream'
      ELSE cuisine
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'SORVETERIA|SORVETES'
      WHEN NOT('SORVETERIA|SORVETES' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';SORVETERIA|SORVETES'
      ELSE substituicoes_aplicadas
    END
 WHERE ( "DSC_ESTABELECIMENTO" LIKE '%SORVE%' OR 
         "DSC_ESTABELECIMENTO" LIKE '%SOVER%' OR 
         "DSC_ESTABELECIMENTO" LIKE '%ICE CREA%' OR 
         "DSC_ESTABELECIMENTO" LIKE '%SORBET%'  
       ) /*AND
       (
         "DSC_ESTABELECIMENTO" NOT LIKE '%FABRICA%' OR -- #TODO: ignorar?
         "DSC_ESTABELECIMENTO" NOT LIKE '%INDUSTR%' 
	   )*/ AND ocorrencias <= 65;
	   
-- PINTURA --
-- #TODO: Trabalhar subtipos --

-- COLEGIO -> amenity=school  --
 UPDATE public.tipos_de_pontos_de_interesse
 SET amenity = CASE
      WHEN amenity IS NULL THEN 'school'
      WHEN NOT('school' = ANY(string_to_array(amenity, ';'))) THEN amenity || ';school'
      ELSE amenity
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'COLEGIO'
      WHEN NOT('COLEGIO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';COLEGIO'
      ELSE substituicoes_aplicadas
    END
 WHERE ( "DSC_ESTABELECIMENTO" LIKE 'COLEGIO%' OR 
         "DSC_ESTABELECIMENTO" LIKE 'COLEJIO%' OR 
         "DSC_ESTABELECIMENTO" LIKE 'C0LEGIO%' OR 
         "DSC_ESTABELECIMENTO" LIKE 'C0LEGI0%' OR 
         "DSC_ESTABELECIMENTO" LIKE 'COLEGI0%' OR 
         "DSC_ESTABELECIMENTO" LIKE 'COLEGO%' OR 
         "DSC_ESTABELECIMENTO" LIKE 'COLEJO%' 
       )  AND ocorrencias <= 65;

-- IMOVEIS|IMOBILIARIA -> office=estate_agent quando contem IMOVEIS ou IMOBILAIRIA, mas não contem REGISTRO nem CARTORIO --
 UPDATE public.tipos_de_pontos_de_interesse
 SET office = CASE
      WHEN office IS NULL THEN 'estate_agent'
      WHEN NOT('estate_agent' = ANY(string_to_array(office, ';'))) THEN office || ';estate_agent'
      ELSE office
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'IMOVEIS|IMOBILIARIA'
      WHEN NOT('IMOVEIS|IMOBILIARIA' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';IMOVEIS|IMOBILIARIA'
      ELSE substituicoes_aplicadas
    END
 WHERE ( "DSC_ESTABELECIMENTO" LIKE '%IMOVEIS%' OR
         "DSC_ESTABELECIMENTO" LIKE '%IM0VEIS%' OR
         "DSC_ESTABELECIMENTO" LIKE '%IMOVIES%' OR
         "DSC_ESTABELECIMENTO" LIKE '%IMOVIS%' OR
         "DSC_ESTABELECIMENTO" LIKE '%IMOVES%' OR
         "DSC_ESTABELECIMENTO" LIKE '%IMOBILIARIA%' OR
         "DSC_ESTABELECIMENTO" LIKE '%IM0BILIARIA%' OR
         "DSC_ESTABELECIMENTO" LIKE '%IMOBILHARIA%' OR
         "DSC_ESTABELECIMENTO" LIKE '%IMOBOLIARIA%' OR
         "DSC_ESTABELECIMENTO" LIKE '%IMOBILARIA%' OR
         "DSC_ESTABELECIMENTO" LIKE '%EMOBILIARIA%'
       ) AND (
            "DSC_ESTABELECIMENTO" NOT LIKE '%REGIST%' OR
            "DSC_ESTABELECIMENTO" NOT LIKE '%CART%'
       ) AND ocorrencias <= 65;

-- ACOUGUE|CASA DE CARNES -> shop=butcher --
 UPDATE public.tipos_de_pontos_de_interesse
 SET shop = CASE
      WHEN shop IS NULL THEN 'butcher'
      WHEN NOT('butcher' = ANY(string_to_array(shop, ';'))) THEN shop || ';butcher'
      ELSE shop
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'ACOUGUE|CASA DE CARNES'
      WHEN NOT('ACOUGUE|CASA DE CARNES' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';ACOUGUE|CASA DE CARNES'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'ACOUGUE' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ACOUGUES' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ACOGUE' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ACOGUES' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ACOUGHE' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'AC0UGUE' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'AC0UGUES' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'AC0GUE' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ASSOUGUE' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ASSOGUE' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ASOGUE' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ASOGE' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
		 "DSC_ESTABELECIMENTO" LIKE '%CASA%CARNE%'
       ) AND ocorrencias <= 65;

-- COMUNIDADE|CENTRO COMUNITARIO -> amenity=community_centre  --
 UPDATE public.tipos_de_pontos_de_interesse
 SET amenity = CASE
      WHEN amenity IS NULL THEN 'community_centre'
      WHEN NOT('community_centre' = ANY(string_to_array(amenity, ';'))) THEN amenity || ';community_centre'
      ELSE amenity
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'COMUNIDADE|CENTRO COMUNITARIO'
      WHEN NOT('COMUNIDADE|CENTRO COMUNITARIO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';COMUNIDADE|CENTRO COMUNITARIO'
      ELSE substituicoes_aplicadas
    END
 WHERE ( "DSC_ESTABELECIMENTO" LIKE 'COMUNIDADE%' OR 
         "DSC_ESTABELECIMENTO" LIKE 'C0MUNIDADE%' OR 
         "DSC_ESTABELECIMENTO" LIKE 'COMUDADE%' OR 
         "DSC_ESTABELECIMENTO" LIKE 'COMUNID%' OR 
         "DSC_ESTABELECIMENTO" LIKE 'CEN%COMUNIT%%' OR
         "DSC_ESTABELECIMENTO" LIKE 'CEN%C0MUNIT%%'
       ) AND ocorrencias <= 65;

-- INDUSTRIA|INDUSTRIAL -> landuse=industrial building=industrial --
 UPDATE public.tipos_de_pontos_de_interesse
 SET landuse = CASE
      WHEN landuse IS NULL THEN 'industrial'
      WHEN NOT('industrial' = ANY(string_to_array(landuse, ';'))) THEN landuse || ';industrial'
      ELSE landuse
    END,
	building = CASE
      WHEN building IS NULL THEN 'industrial'
      WHEN NOT('industrial' = ANY(string_to_array(building, ';'))) THEN building || ';industrial'
      ELSE building
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'INDUSTRIA|INDUSTRIAL'
      WHEN NOT('INDUSTRIA|INDUSTRIAL' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';INDUSTRIA|INDUSTRIAL'
      ELSE substituicoes_aplicadas
    END
 WHERE ( "DSC_ESTABELECIMENTO" LIKE '%INDUSTRIA%' OR 
         "DSC_ESTABELECIMENTO" LIKE '%IMDUSTRIA%'
       ) AND ocorrencias <= 65;
	   
-- INFORMATICA --
-- #TODO: Trabalhar subtipos --
	   
-- INSTITUTO --
-- #TODO: Trabalhar subtipos --

-- ESTADUAL|DO ESTADO -> operator=Estado --
 UPDATE public.tipos_de_pontos_de_interesse
 SET "operator" = CASE
      WHEN "operator" IS NULL THEN 'Estado'
      WHEN NOT('Estado' = ANY(string_to_array("operator", ';'))) THEN "operator" || ';Estado'
      ELSE "operator"
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'ESTADUAL|DO ESTADO'
      WHEN NOT('ESTADUAL|DO ESTADO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';ESTADUAL|DO ESTADO'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'ESTADUAL' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'ESTADOAL' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
		 "DSC_ESTABELECIMENTO" LIKE '% DO ESTAD%' OR 
		 "DSC_ESTABELECIMENTO" LIKE '% D0 ESTAD%' 
       ) AND ocorrencias <= 65;

-- MARCENARIA|MARCENEIRO -> craft=joiner quando contem a palavra MARCENARIA ou MARCENEIRO --
 UPDATE public.tipos_de_pontos_de_interesse
 SET craft = CASE
      WHEN craft IS NULL THEN 'joiner'
      WHEN NOT('joiner' = ANY(string_to_array(craft, ';'))) THEN craft || ';joiner'
      ELSE craft
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'MARCENARIA|MARCENEIRO'
      WHEN NOT('MARCENARIA|MARCENEIRO' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';MARCENARIA|MARCENEIRO'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'MARCENARIA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'MARCENEIRO' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         'MARCENEIRA' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' '))
	   ) AND ocorrencias <= 65;

-- LOJA DE PRESENTES -> shop=gift quando contem a palavra PRESENTES --
 UPDATE public.tipos_de_pontos_de_interesse
 SET shop = CASE
      WHEN shop IS NULL THEN 'gift'
      WHEN NOT('gift' = ANY(string_to_array(shop, ';'))) THEN shop || ';gift'
      ELSE shop
    END,
	substituicoes_aplicadas = CASE
      WHEN substituicoes_aplicadas IS NULL THEN 'LOJA DE PRESENTES'
      WHEN NOT('LOJA DE PRESENTES' = ANY(string_to_array(substituicoes_aplicadas, ';'))) THEN substituicoes_aplicadas || ';LOJA DE PRESENTES'
      ELSE substituicoes_aplicadas
    END
 WHERE ( 'PRESENTES' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) OR
         ( 'PRESENTE' = ANY(string_to_array("DSC_ESTABELECIMENTO", ' ')) AND
		   (
             "DSC_ESTABELECIMENTO" LIKE '%LOJA%' OR 
             "DSC_ESTABELECIMENTO" LIKE '%L0JA%' OR 
             "DSC_ESTABELECIMENTO" LIKE '%ARTIG%' 
		   )
		   AND  "DSC_ESTABELECIMENTO" NOT LIKE '%DEUS%'
		 ) 
       ) AND ocorrencias <= 65;






