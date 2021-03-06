--CREATE TABLE STOCK_VALUE_BAT_ITEM_070919
--AS Select * FROM STOCK_VALUE_BAT_ITEM;

EXEC SP_STOCK_VALUE_BAT_NET('201908');

SELECT ITM.ITEM_ID, ITM.ITEM_SHORT_DESC ITEM_NAME
, RATE_PREV RATE_JUL_19
, OPEN_QTY, OPEN_VALUE
, OPEN_QTY_P, OPEN_VALUE_P
, OPEN_QTY_SERVICE, OPEN_VALUE_SERVICE
, RATE_PURCHASE PURCHASE_RATE
, PURCHASE_QTY_P, PURCHASE_VALUE_P
, PURCHASE_RETURN_QTY, PURCHASE_RETURN_VALUE
, PURCHASE_RETURN_SC_QTY, PURCHASE_RETURN_SC_VALUE
, RATE_AVG
, SOLD_QTY, SOLD_VALUE
, SALES_RETURN_QTY, SALES_RETURN_VALUE
, REPLACE_QTY, REPLACE_VALUE
, REPLACE_QTY_P, REPLACE_VALUE_P
, CLOSE_QTY, CLOSE_VALUE
, CLOSE_QTY_P, CLOSE_VALUE_P
, CLOSE_QTY_SERVICE, CLOSE_VALUE_SERVICE
FROM STOCK_VALUE_BAT_ITEM BI
INNER JOIN STOCK_VALUE_BAT_MST BM ON BI.SVBM_ID = BM.SVBM_ID
INNER JOIN SALES_ITEM_MST ITM ON BI.ITEM_CODE = ITM.ITEM_CODE
WHERE 1=1
AND BM.SVBM_MONTH_NO = '201908'
ORDER BY ITM.ITEM_SHORT_DESC
;

SELECT SUM(OPEN_QTY) OPEN_QTY
, SUM(OPEN_VALUE) OPEN_VALUE
, SUM(OPEN_QTY_P) OPEN_QTY_P
, SUM(OPEN_VALUE_P) OPEN_VALUE_P
, SUM(OPEN_QTY_SERVICE) OPEN_QTY_SERVICE
, SUM(OPEN_VALUE_SERVICE) OPEN_VALUE_SERVICE
, SUM(PURCHASE_QTY) PURCHASE_QTY
, SUM(PURCHASE_VALUE) PURCHASE_VALUE
, SUM(PURCHASE_QTY_P) PURCHASE_QTY_P
, SUM(PURCHASE_VALUE_P) PURCHASE_VALUE_P
, SUM(PURCHASE_RETURN_QTY) PURCHASE_RETURN_QTY
, SUM(PURCHASE_RETURN_VALUE) PURCHASE_RETURN_VALUE
, SUM(PURCHASE_RETURN_SC_QTY) PURCHASE_RETURN_SC_QTY
, SUM(PURCHASE_RETURN_SC_VALUE) PURCHASE_RETURN_SC_VALUE
, SUM(SOLD_QTY) SOLD_QTY
, SUM(SOLD_VALUE) SOLD_VALUE
, SUM(SALES_RETURN_QTY) SALES_RETURN_QTY
, SUM(SALES_RETURN_VALUE) SALES_RETURN_VALUE
, SUM(REPLACE_QTY) REPLACE_QTY
, SUM(REPLACE_VALUE) REPLACE_VALUE
, SUM(REPLACE_QTY_P) REPLACE_QTY_P
, SUM(REPLACE_VALUE_P) REPLACE_VALUE_P
, SUM(CLOSE_QTY) CLOSE_QTY
, SUM(CLOSE_VALUE) CLOSE_VALUE
, SUM(CLOSE_QTY_P) CLOSE_QTY_P
, SUM(CLOSE_VALUE_P) CLOSE_VALUE_P
, SUM(CLOSE_QTY_SERVICE) CLOSE_QTY_SERVICE
, SUM(CLOSE_VALUE_SERVICE) CLOSE_VALUE_SERVICE
FROM STOCK_VALUE_BAT_ITEM
WHERE 1=1
AND SVBM_ID in (31)
;
