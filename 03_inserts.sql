-- INSERINDO USUÁRIOS
INSERT INTO usuarios (nome, pais, data_cadastro, plano)
VALUES
('Maria Silva', 'Brasil', '2023-05-12', 'Free'),
('João Costa', 'Portugal', '2023-11-03', 'Premium'),
('Ana Torres', 'Espanha', '2024-02-15', 'Family'),
('Luca Rossi', 'Itália', '2024-07-10', 'Premium');

-- INSERINDO REPRODUÇÕES
INSERT INTO reproducoes (id_usuario, data_reproducao, duracao_segundos, categoria)
VALUES
(1, '2023-05-15', 3600, 'Filme'),
(2, '2023-12-10', 2400, 'Série'),
(3, '2024-02-20', 1800, 'Documentário'),
(4, '2024-07-15', 3000, 'Infantil');
