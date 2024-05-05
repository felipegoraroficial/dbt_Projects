SELECT * FROM {{source("sources_FIFA","FIFA_JOGADOR")}}
WHERE 
Idade <= 38
AND
ID_Liga <> 2118
AND
    ID IN (
        SELECT MIN(ID)
        FROM {{source("sources_FIFA","FIFA_JOGADOR")}}
        GROUP BY Nome
    )


