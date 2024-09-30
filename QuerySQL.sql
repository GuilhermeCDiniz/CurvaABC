CREATE VIEW VW_CurvaABC AS
WITH 
-- 1. Resumo Vendas
ResumoVendas AS (
    SELECT 
        B.ProductID AS COD_PRODUTO,
        SUM(B.OrderQty) AS QTD_PEDIDO,
        SUM(B.LineTotal) AS TOTAL_ITEM
    FROM SalesLT.SalesOrderHeader AS A
    INNER JOIN SalesLT.SalesOrderDetail AS B
        ON A.SalesOrderID = B.SalesOrderID
    GROUP BY B.ProductID
),
-- 2. Percentual Faturamento
PercFaturamento AS ( 
    SELECT
        COD_PRODUTO,
        QTD_PEDIDO,
        TOTAL_ITEM,
        SUM(TOTAL_ITEM) OVER() AS TOTAL_ACUMULADO,
        TOTAL_ITEM / SUM(TOTAL_ITEM) OVER() * 100 AS PERCENTUAL
    FROM ResumoVendas
),
-- 3. Percentual Acumulado
CurvaABC AS (
    SELECT
        COD_PRODUTO,
        QTD_PEDIDO,
        TOTAL_ITEM,
        TOTAL_ACUMULADO,
        PERCENTUAL,
        SUM(PERCENTUAL) OVER(ORDER BY TOTAL_ITEM DESC) AS PERCENTUAL_ACUMULADO
    FROM PercFaturamento
)
SELECT 
    COD_PRODUTO,
    QTD_PEDIDO,
    TOTAL_ITEM,
    TOTAL_ACUMULADO,
    PERCENTUAL,
    CASE 
        WHEN PERCENTUAL_ACUMULADO <= 80 THEN 'A'
        WHEN PERCENTUAL_ACUMULADO <= 95 THEN 'B'
        ELSE 'C'
    END AS CURVA
FROM CurvaABC;
