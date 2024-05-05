
WITH jogador AS (
    SELECT * FROM {{ ref('Selecionar_Nome_N_Duplicado_Jogador') }}
),

clube AS (
    SELECT * FROM {{ ref('Retirar_FC_ICONS_CLUBS') }}
),

liga_table AS (
    SELECT * FROM {{ ref('Retirar_FC_ICONS_LEAGUE') }}
),

pais_table AS (
    SELECT * FROM {{source("sources_FIFA","FIFA_PAIS")}}
)

SELECT jogador.*, clube.Clube, clube.url as url_club, liga_table.Liga, liga_table.Genero as Genero_Liga, liga_table.url as url_liga, pais_table.Nacionalidade AS Nacionalidade_Jogador, pais_table.url AS url_Pais
FROM jogador
LEFT JOIN clube ON jogador.ID_Clube = clube.ID_Clube
LEFT JOIN liga_table ON jogador.ID_Liga = liga_table.ID_Liga
LEFT JOIN pais_table ON jogador.ID_Nacionalidade = pais_table.ID_Nacionalidade

