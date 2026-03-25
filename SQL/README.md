# Análise de Dados de Vendas - AdventureWorksDW2022

Este repositório contém uma série de consultas SQL desenvolvidas para extrair insights do banco de dados **AdventureWorksDW2022** (Data Warehouse da Microsoft). O projeto simula cenários reais de Business Intelligence, focando em performance de vendas, comportamento do cliente e análise geográfica.

## Objetivos do Projeto
- Demonstrar proficiência em **SQL Server (T-SQL)**.
- Aplicar conceitos de **Modelagem Dimensional** (Star Schema).
- Transformar dados brutos em indicadores de negócio (KPIs).
- Fornecer subsídios para tomada de decisão baseada em dados.

## Tecnologias e Ferramentas
- **Banco de Dados:** SQL Server 2022
- **Interface:** SQL Server Management Studio (SSMS)
- **Linguagem:** T-SQL (Transact-SQL)

## Estrutura das Consultas

### 1. Top 10 Clientes por Faturamento
- **Arquivo:** `01_top_clientes_faturamento.sql`
- **O que demonstra:** Joins entre Fato e Dimensão, Agregações (`SUM`), Ordenação e Formatação de Moeda.
- **Insight:** Identificação dos clientes "VIP" que geram a maior parte da receita.
<img width="305" height="245" alt="image" src="https://github.com/user-attachments/assets/3fae8c73-3ded-450f-89ac-8c4bb7539151" />

### 2. Vendas por Categoria de Produto
- **Arquivo:** `02_analise_categoria_produto.sql`
- **O que demonstra:** Joins múltiplos (4 tabelas), `COUNT DISTINCT` para pedidos e cálculo de Ticket Médio por categoria.
- **Insight:** Identificação das linhas de produtos mais rentáveis e volumosas.
<img width="385" height="87" alt="image" src="https://github.com/user-attachments/assets/cd7b737e-26eb-4f67-962b-29962c3de3ad" />

### 3. Desempenho de Vendas por País
- **Arquivo:** `03_analise_geografica_vendas.sql`
- **O que demonstra:** Relacionamento entre tabelas de Dimensão (`Customer` -> `Geography`) e agrupamento geográfico.
- **Insight:** Visualização da penetração de mercado por região global.
<img width="382" height="146" alt="image" src="https://github.com/user-attachments/assets/f1e06795-f6a3-4315-b63a-372d7e309243" />

### 4. Evolução Mensal de Vendas (Time Series)
- **Arquivo:** `04_serie_temporal_vendas.sql`
- **O que demonstra:** Manipulação de datas (`YEAR`, `MONTH`), `CONCAT` e ordenação cronológica.
- **Insight:** Identificação de sazonalidade e tendências de crescimento ao longo do tempo.
<img width="195" height="643" alt="image" src="https://github.com/user-attachments/assets/39113400-d92a-4ae5-aa88-2b2189c8c820" />

### 5. Perfil de Fidelidade dos Clientes
- **Arquivo:** `05_analise_fidelidade_clientes.sql`
- **O que demonstra:** Uso da cláusula `HAVING` para filtrar dados agregados (clientes com > 2 pedidos).
- **Insight:** Separação de clientes recorrentes para estratégias de retenção e LTV.
<img width="465" height="719" alt="image" src="https://github.com/user-attachments/assets/b88446a5-e9b9-4023-9ed0-3948852813f6" />

### 6. Ranking de Produtos Mais Vendidos (Window Function)
- **Arquivo:** `06_ranking_produtos.sql`
- **Habilidades:** Uso da Window Function `RANK()` para classificação dinâmica.
- **Insight:** Ranking de performance de produtos por volume de pedidos e faturamento.
<img width="482" height="122" alt="image" src="https://github.com/user-attachments/assets/2e062712-e9e8-4cde-b598-cc1b0b98e856" />

### 7. Participação % por Categoria (Market Share Interno)
- **Arquivo:** `07_participacao_categoria.sql`
- **Habilidades:** Window Function com agregação (`SUM OVER`) para cálculo de proporção.
- **Insight:** Análise de representatividade de cada categoria no faturamento total da empresa.
<img width="430" height="86" alt="image" src="https://github.com/user-attachments/assets/dfde058d-fcb0-4f82-b519-65ed2cd23c03" />

### 8. Crescimento Mensal de Vendas (Month-over-Month)
- **Arquivo:** `08_crescimento_mensal_mom.sql`
- **Habilidades:** Window Function `LAG()` para comparação entre períodos (Time Intelligence).
- **Insight:** Cálculo da variação percentual (MoM) para identificar aceleração ou retração das vendas.
<img width="402" height="565" alt="image" src="https://github.com/user-attachments/assets/cbbd7428-d9d5-4749-8fd3-8cd7115b4275" />

## Como visualizar os resultados
1. Certifique-se de ter o banco `AdventureWorksDW2022` instalado em seu SQL Server.
2. Abra os arquivos `.sql` no SSMS.
3. Execute as consultas para visualizar as tabelas de resultados.

---
**Desenvolvido por Marcos Miranda.**
