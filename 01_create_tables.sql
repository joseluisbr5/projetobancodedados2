-- LIMPEZA TOTAL (garante que tudo comece do zero)
DROP TABLE IF EXISTS reproducoes CASCADE;
DROP TABLE IF EXISTS usuarios CASCADE;

-- TABELA USUARIOS PRINCIPAL (PAI)
CREATE TABLE usuarios (
    id_usuario INT GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR(100),
    pais VARCHAR(50),
    data_cadastro DATE NOT NULL,
    plano VARCHAR(20)
) PARTITION BY RANGE (data_cadastro);

-- TABELA REPRODUCOES PRINCIPAL (PAI)
CREATE TABLE reproducoes (
    id_reproducao INT GENERATED ALWAYS AS IDENTITY,
    id_usuario INT,
    data_reproducao DATE NOT NULL,
    duracao_segundos INT,
    categoria VARCHAR(50)
) PARTITION BY RANGE (data_reproducao);
