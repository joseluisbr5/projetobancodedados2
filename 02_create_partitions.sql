

-- Partições de usuarios (2023 e 2024)
CREATE TABLE usuarios_2023 PARTITION OF usuarios
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE usuarios_2024 PARTITION OF usuarios
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Partições de reproducoes (2023 e 2024)
CREATE TABLE reproducoes_2023 PARTITION OF reproducoes
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE reproducoes_2024 PARTITION OF reproducoes
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
