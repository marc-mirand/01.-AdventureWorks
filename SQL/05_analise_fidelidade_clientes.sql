/*
	Analise: Perfil de Compra e Fidelidade do Cliente
	Objetivo: Identificar o comportamento de compra dos clientes, calculando o Ticket Medio e a Frequencia de Compra (Maior que 1 compra)
*/

USE AdventureWorksDW2022

SELECT
	t1.CustomerKey As IdCliente,
	concat(t2.FirstName, ' ', t2.LastName) AS ClienteNome,
	count(DISTINCT SalesOrderNumber) AS TotalCompras,
	format(sum(SalesAmount) ,'C2') AS TotalFaturamento,
	format(sum(SalesAmount)/count(DISTINCT SalesOrderNumber), 'C2') AS TicketMedio	
FROM
	FactInternetSales AS t1
LEFT JOIN
	 DimCustomer AS t2
	 ON
	 t1.CustomerKey = t2.CustomerKey
GROUP BY
	t1.CustomerKey,
	concat(t2.FirstName, ' ', t2.LastName)
HAVING
	count(DISTINCT SalesOrderNumber) > 1
ORDER BY 
	sum(SalesAmount) DESC;
	
