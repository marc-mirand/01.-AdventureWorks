/*
	Analise: Vendas por Categoria de Produto
	Objetivo: Identificar quais categorias de produto geraram mais receita no canal de vendas pela internet, permitindo entender quais linhas de produto são mais relevantes para o negócio.
*/

USE AdventureWorksDW2022

SELECT
	t4.EnglishProductCategoryName AS CategoriaProduto,
	count(DISTINCT t1.SalesOrderNumber) AS TotalVenda,
	format(SUM(t1.SalesAmount),'C2') AS TotalFaturamento,
	format(SUM(t1.SalesAmount)/ count(DISTINCT t1.SalesOrderNumber), 'C2') AS TicketMedio
FROM
	FactInternetSales AS t1
LEFT JOIN
	DimProduct AS t2
	ON
	t1.ProductKey = t2.ProductKey
LEFT JOIN
	DimProductSubcategory AS t3
	ON
	t2.ProductSubcategoryKey = t3.ProductSubcategoryKey
LEFT JOIN
	DimProductCategory AS t4
	ON
	t3.ProductCategoryKey = t4.ProductCategoryKey
GROUP BY
	t4.EnglishProductCategoryName
ORDER BY
	SUM(SalesAmount) DESC
