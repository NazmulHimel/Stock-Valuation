
EXEC SP_STOCK_VALUE_IPS_NET ('202008',1);



SELECT ITM.ITEM_ID, ITM.ITEM_SHORT_DESC ITEM_NAME
, RATE_PREV RATE_MAY_20
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
AND BM.SVBM_MONTH_NO = '202008'
ORDER BY ITM.ITEM_SHORT_DESC
;

