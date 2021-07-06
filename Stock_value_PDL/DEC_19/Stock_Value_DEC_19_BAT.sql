--CREATE TABLE STOCK_VALUE_BAT_ITEM_071019
--AS Select * FROM STOCK_VALUE_BAT_ITEM;

EXEC SP_STOCK_VALUE_BAT_NET('201912');

SELECT ITM.ITEM_ID, ITM.ITEM_SHORT_DESC ITEM_NAME
, RATE_PREV RATE_NOV_19
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
AND BM.SVBM_MONTH_NO = '201912'
ORDER BY ITM.ITEM_SHORT_DESC
;
