-- TOTAL DE USUÁRIOS POR PAÍS
SELECT pais, COUNT(*) AS total_usuarios
FROM usuarios
GROUP BY pais
ORDER BY total_usuarios DESC;

-- TOTAL DE CADASTROS POR MÊS DE 2024
SELECT DATE_TRUNC('month', data_cadastro) AS mes, COUNT(*) AS total
FROM usuarios
WHERE data_cadastro BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY mes
ORDER BY mes;

-- TOTAL DE REPRODUÇÕES POR CATEGORIA
SELECT categoria, COUNT(*) AS total_reproducoes
FROM reproducoes
GROUP BY categoria;

-- TOTAL DE HORAS ASSISTIDAS POR MÊS
SELECT DATE_TRUNC('month', data_reproducao) AS mes,
       SUM(duracao_segundos)/3600 AS horas_assistidas
FROM reproducoes
GROUP BY mes
ORDER BY mes;

-- HISTÓRICO DE REPRODUÇÕES COM NOME DO USUÁRIO
SELECT 
    u.nome AS usuario,
    u.pais,
    u.plano,
    r.categoria,
    r.data_reproducao,
    r.duracao_segundos / 60 AS minutos_assistidos
FROM reproducoes r
JOIN usuarios u ON u.id_usuario = r.id_usuario
ORDER BY r.data_reproducao;

-- TESTE DE PARTICIONAMENTO (ver onde cada linha foi salva)
SELECT tableoid::regclass AS particao, * FROM usuarios;
SELECT tableoid::regclass AS particao, * FROM reproducoes;
