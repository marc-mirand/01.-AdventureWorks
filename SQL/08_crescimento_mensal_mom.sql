/*
Analise: Crescimento Mensal de Vendas (Month-over-Month - MoM)
Objetivo: Calcular a variacao percentual do faturamento entre o mes atual e o mes anterior
*/

USE AdventureWorksDW2022

SELECT
	format(OrderDate, 'yyyy-MM') AS AnoMes,
	format(sum(SalesAmount), 'C2') AS FaturamentoAtual,
	format(lag(sum(SalesAmount)) OVER(ORDER BY format(OrderDate, 'yyyy-MM')), 'C2') AS FaturamentoAnterior, 
	format((sum(SalesAmount) - lag(sum(SalesAmount)) OVER(ORDER BY format(OrderDate, 'yyyy-MM'))) / lag(sum(SalesAmount)) OVER(ORDER BY format(OrderDate, 'yyyy-MM')) * 100, 'N2') + '%' AS CrescimentoMoM
FROM
	FactInternetSales
GROUP BY
	format(OrderDate, 'yyyy-MM')
ORDER BY
	format(OrderDate, 'yyyy-MM') ASC;
