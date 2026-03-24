/*
Analise: Ranking de Produtos Mais Vendidos
Objetivo: Identificar produtos com maior volume de vendas e criar um ranking para entender quais itens são os principais responsáveis pela receita
*/

USE AdventureWorksDW2022

SELECT TOP 5
	t2.ProductKey AS IdProduto,
	t2.EnglishProductName AS NomeProduto,
	count(DISTINCT t1.SalesOrderNumber) AS QtdeVendas,
	format(sum(t1.SalesAmount), 'C2') AS TotalFaturamento,
	rank() OVER(ORDER BY count(t1.SalesOrderNumber) DESC) AS RankProdutos
FROM
	FactInternetSales AS t1
LEFT JOIN
	DimProduct AS t2
	ON 
	t1.ProductKey = t2.ProductKey
GROUP BY
	t2.ProductKey,
	t2.EnglishProductName;

