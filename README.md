# StreamNow – Particionamento de Dados no PostgreSQL

## 🎯 Objetivo

Melhorar o desempenho e a escalabilidade do banco de dados da plataforma **StreamNow**, aplicando **particionamento de dados (RANGE)** nas tabelas `usuarios` e `reproducoes`.
O foco é reduzir o tempo de leitura, facilitar manutenção e permitir arquivamento de grandes volumes de dados.

---

## 🏢 Cenário

A StreamNow é uma plataforma de streaming com milhões de usuários e bilhões de reproduções.
O time de engenharia decidiu particionar as tabelas mais acessadas para otimizar consultas e manutenção, já que o volume de dados cresce rapidamente.

---

## 🧠 Estratégia de Particionamento

### Tabela `usuarios`

* **Tipo de particionamento:** `RANGE`
* **Coluna utilizada:** `data_cadastro`
* **Motivo:** As consultas mais frequentes analisam o crescimento de cadastros ao longo do tempo.
  Assim, particionar por data melhora a performance e simplifica o arquivamento.

### Tabela `reproducoes`

* **Tipo de particionamento:** `RANGE`
* **Coluna utilizada:** `data_reproducao`
* **Motivo:** As análises mais comuns são mensais e por categoria.
  O particionamento por período facilita essas consultas e o backup de dados antigos.

---

## 💻 Estrutura de Scripts

```
streamnow-particionamento/
│
├── scripts/
│   ├── 01_create_tables.sql      → Criação das tabelas principais (pais)
│   ├── 02_create_partitions.sql  → Criação das partições (filhas)
│   ├── 03_inserts.sql            → Inserção de dados de exemplo
│   ├── 04_queries.sql            → Consultas analíticas e testes
│
├── prints/
│   ├── query_usuarios.png
│   ├── query_reproducoes.png
│
└── README.md
```

---

## ⚙️ Execução no pgAdmin

1. Abra o **pgAdmin** → selecione seu banco (ex: `postgres`).
2. Vá em **Tools → Query Tool**.
3. Execute **na ordem:**

   1. `01_create_tables.sql`
   2. `02_create_partitions.sql`
   3. `03_inserts.sql`
   4. `04_queries.sql`
4. Veja os resultados no painel inferior.

---

## 🔍 Consultas principais

### Total de usuários por país

```sql
SELECT pais, COUNT(*) AS total_usuarios
FROM usuarios
GROUP BY pais
ORDER BY total_usuarios DESC;
```

### Total de reproduções por categoria

```sql
SELECT categoria, COUNT(*) AS total_reproducoes
FROM reproducoes
GROUP BY categoria;
```

### Histórico de reproduções com nome do usuário

```sql
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
```

### Teste de particionamento

```sql
SELECT tableoid::regclass AS particao, * FROM usuarios;
SELECT tableoid::regclass AS particao, * FROM reproducoes;
```

---

## 🧩 Resultados esperados

* **Consultas mais rápidas** em grandes volumes de dados.
* **Partições automáticas** por ano (2023 e 2024).
* **Facilidade de manutenção e arquivamento.**
* **Relatórios completos** com nomes, planos e categorias.

---

## 🏁 Conclusão

O particionamento das tabelas `usuarios` e `reproducoes` oferece ganho de desempenho e organização no banco da StreamNow.
Essa abordagem permite escalar o sistema conforme o crescimento da base de usuários e reproduções, mantendo as consultas ágeis e a manutenção simples.

---
