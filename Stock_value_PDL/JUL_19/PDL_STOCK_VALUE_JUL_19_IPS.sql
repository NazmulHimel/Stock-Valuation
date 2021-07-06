EXEC SP_STOCK_VALUE_IPS_NET ('201907',1);
SELECT * FROM STOCK_VALUE_IPS_ITEM WHERE 1=1 AND SVBM_ID = 10;
--DELETE FROM STOCK_VALUE_IPS_ITEM WHERE 1=1 AND SVBM_ID = 2;
--COMMIT;

SELECT ITM.ITEM_ID, ITM.ITEM_SHORT_DESC ITEM_NAME
, RATE_PREV RATE_JUN_18
, OPEN_QTY, OPEN_VALUE
, OPEN_QTY_DAMAGE
, OPEN_VALUE_DAMAGE
, PURCHASE_QTY
, PURCHASE_VALUE
, RATE_PURCHASE PURCHASE_RATE
, RATE_AVG
, SOLD_QTY, SOLD_VALUE
, SALES_RETURN_QTY, SALES_RETURN_VALUE
, REPLACE_QTY, REPLACE_VALUE
, CLOSE_QTY, CLOSE_VALUE
, CLOSE_QTY_DAMAGE
, CLOSE_VALUE_DAMAGE
FROM STOCK_VALUE_IPS_ITEM BI
INNER JOIN STOCK_VALUE_IPS_MST BM ON BI.SVBM_ID = BM.SVBM_ID
INNER JOIN SALES_ITEM_MST ITM ON BI.ITEM_CODE = ITM.ITEM_CODE
WHERE 1=1
AND BM.SVBM_MONTH_NO = '201907'
ORDER BY ITM.ITEM_SHORT_DESC
;

SELECT SUM(OPEN_QTY) OPEN_QTY
, SUM(OPEN_VALUE) OPEN_VALUE
, SUM(OPEN_QTY_DAMAGE) OPEN_QTY_DAMAGE
, SUM(OPEN_VALUE_DAMAGE) OPEN_VALUE_DAMAGE
, SUM(PURCHASE_QTY) PURCHASE_QTY
, SUM(PURCHASE_VALUE) PURCHASE_VALUE
, SUM(SOLD_QTY) SOLD_QTY
, SUM(SOLD_VALUE) SOLD_VALUE
, SUM(SALES_RETURN_QTY) SALES_RETURN_QTY
, SUM(SALES_RETURN_VALUE) SALES_RETURN_VALUE
, SUM(REPLACE_QTY) REPLACE_QTY
, SUM(REPLACE_VALUE) REPLACE_VALUE
, SUM(CLOSE_QTY) CLOSE_QTY
, SUM(CLOSE_VALUE) CLOSE_VALUE
, SUM(CLOSE_QTY_DAMAGE) CLOSE_QTY_DAMAGE
, SUM(CLOSE_VALUE_DAMAGE) CLOSE_VALUE_DAMAGE
FROM STOCK_VALUE_IPS_ITEM
WHERE 1=1
AND SVBM_ID in (17)
;