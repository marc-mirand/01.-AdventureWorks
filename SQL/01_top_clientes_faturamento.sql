/*
Analise: Top 10 Clientes por Faturamento (Total Gasto)
Objetivo: Identificar os clientes que mais geraram receita para a empresa no canal de vendas pela internet.
*/

USE AdventureWorksDW2022

SELECT TOP 10
	t1.CustomerKey AS IdCliente,
	CONCAT(t2.FirstName,' ',t2.LastName) AS NomeCliente,
	format(SUM(t1.SalesAmount), 'C2') AS TotalGasto
FROM
	FactInternetSales AS t1
LEFT JOIN
	DimCustomer AS t2
	ON
	t1.CustomerKey = t2.CustomerKey
GROUP BY
	t1.CustomerKey,
	CONCAT(t2.FirstName,' ',t2.LastName)
ORDER BY 
	SUM(t1.SalesAmount) DESC;

