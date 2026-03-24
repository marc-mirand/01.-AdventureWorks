/*
Analise: Participação Percentual por Categoria (Market Share Interno)
Objetivo: Identificar a representatividade de cada categoria no faturamento total da empresa. Isso permite entender quais categorias sustentam o negócio e quais são nichos menores.
*/

USE AdventureWorksDW2022

SELECT
	t4.EnglishProductCategoryName AS NomeCategoria,
	format(sum(t1.SalesAmount), 'C2') AS TotalFaturamento,
	FORMAT(
        (SUM(t1.SalesAmount) / SUM(SUM(t1.SalesAmount)) OVER()) * 100
    , 'N2') + '%' AS ParticipacaoVendas,
	rank() OVER(ORDER BY sum(t1.SalesAmount) DESC) AS RankCategoria
FROM 
	FactInternetSales AS t1
LEFT JOIN 
	DimProduct AS t2
	ON 
	t1.ProductKey = t2.ProductKey
LEFT JOIN
	DimProductSubcategory AS t3
	ON
	t2.ProductSubcategoryKey =t3.ProductSubcategoryKey
LEFT JOIN
	DimProductCategory AS t4
	ON
	t3.ProductCategoryKey = t4.ProductCategoryKey
GROUP BY 
	t4.EnglishProductCategoryName;
