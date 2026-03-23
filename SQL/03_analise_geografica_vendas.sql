/*
	Analise: Desempenho de Vendas por Localizacao Geografica (Pais)
	Objetivo: Identificar quais paises possuem o maior volume de vendas e faturamento, auxiliando na tomada de decisao sobre expansao de mercado e estrategias de marketing regional
*/

USE AdventureWorksDW2022

SELECT
	t3.EnglishCountryRegionName AS NomePais,
	count(DISTINCT t1.SalesOrderNumber) AS TotalVenda,
	format(SUM(t1.SalesAmount),'C2') AS TotalFaturamento,
	format(SUM(t1.SalesAmount)/ count(DISTINCT t1.SalesOrderNumber), 'C2') AS TicketMedio
FROM
	FactInternetSales AS t1
LEFT JOIN
	DimCustomer AS t2
	ON
	t1.CustomerKey = t2.CustomerKey
LEFT JOIN
	DimGeography AS t3
	ON
	t2.GeographyKey = t3.GeographyKey
GROUP BY
	t3.EnglishCountryRegionName
ORDER BY
	SUM(t1.SalesAmount) DESC
	

