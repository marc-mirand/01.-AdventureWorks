/*
	Analise: Evolucao Mensal de Vendas (Time Series)
	Objetivo: Identificar a tendencia de vendas ao longo de meses e anos, permitindo visualizar a sazonalidade e o crescimento histórico do faturamento da empresa.
*/
USE AdventureWorksDW2022

SELECT
	CONCAT(YEAR(OrderDate),'.',format(MONTH(OrderDate), '00')) AS AnoMes,
	format(SUM(SalesAmount), 'C2') AS TotalFaturamento
FROM
	FactInternetSales
GROUP BY 
	CONCAT(YEAR(OrderDate),'.',format(MONTH(OrderDate), '00'))
ORDER BY 
	CONCAT(YEAR(OrderDate),'.',format(MONTH(OrderDate), '00'));

