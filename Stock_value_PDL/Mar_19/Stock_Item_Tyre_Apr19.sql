EXEC SP_TYRE_STOCK_LOC_WISE_SUMMARY('01-May-2018', '31-May-2018', NULL, NULL, NULL, NULL);

EXEC SP_ITEM_STOCK_TYRE_REPORT('01-Apr-2019', '30-Apr-2019', NULL, NULL, NULL, NULL);


SELECT OP_DATE,F_DATE,T_DATE,LOC_CODE,LOCATION_DESC,BRAND_ID
,BRAND_NAME,BATERY_CAT_ID,ITEM_CATEGORY,ITEM_CODE
,ITEM_SHORT_DESC,LAST_THREE_MON_AVG_QTY
,PRV_YEAR_SAMAE_MON_QTY
,OP_RCVD_QT+OP_RT_QTY+OP_PR_QTY-OP_ISSUED_QTY-OP_GIFT_QTY-OP_RP_QTY-OP_ADJ OP_BAL
,RCVD_QTY
,PR_QTY
,IDT_QTY
,RT_QTY
,PR_QTY+RCVD_QTY+RT_QTY+OP_RCVD_QT+IDT_QTY+OP_RT_QTY+OP_PR_QTY-OP_ISSUED_QTY-OP_GIFT_QTY-OP_RP_QTY-OP_ADJ Total_Received
,ISSUED_QTY
,ADJ_ISSUED_QTY
,RP_QTY
,GIFT_QTY
,ISSUED_QTY+ADJ_ISSUED_QTY+RP_QTY+GIFT_QTY Total_Issued
,PR_QTY+OP_RCVD_QT+OP_RT_QTY+OP_PR_QTY-OP_ISSUED_QTY-OP_RP_QTY-OP_GIFT_QTY-OP_ADJ+RCVD_QTY+IDT_QTY+RT_QTY-ISSUED_QTY-GIFT_QTY-ADJ_ISSUED_QTY-RP_QTY BAL_QTY
FROM TEMP_ITEM_STOCK_BAT_FOR_NET
;



SELECT SUM(BAL_QTY) BAL_QTY
FROM
(
SELECT OP_DATE,F_DATE,T_DATE,LOC_CODE,LOCATION_DESC,BRAND_ID
,BRAND_NAME,BATERY_CAT_ID,ITEM_CATEGORY,ITEM_CODE
,ITEM_SHORT_DESC,LAST_THREE_MON_AVG_QTY
,PRV_YEAR_SAMAE_MON_QTY
,OP_RCVD_QT+OP_RT_QTY+OP_PR_QTY-OP_ISSUED_QTY-OP_GIFT_QTY-OP_RP_QTY-OP_ADJ OP_BAL
,RCVD_QTY
,PR_QTY
,IDT_QTY
,RT_QTY
,PR_QTY+RCVD_QTY+RT_QTY+OP_RCVD_QT+IDT_QTY+OP_RT_QTY+OP_PR_QTY-OP_ISSUED_QTY-OP_GIFT_QTY-OP_RP_QTY-OP_ADJ Total_Received
,ISSUED_QTY
,ADJ_ISSUED_QTY
,RP_QTY
,GIFT_QTY
,ISSUED_QTY+ADJ_ISSUED_QTY+RP_QTY+GIFT_QTY Total_Issued
,PR_QTY+OP_RCVD_QT+OP_RT_QTY+OP_PR_QTY-OP_ISSUED_QTY-OP_RP_QTY-OP_GIFT_QTY-OP_ADJ+RCVD_QTY+IDT_QTY+RT_QTY-ISSUED_QTY-GIFT_QTY-ADJ_ISSUED_QTY-RP_QTY BAL_QTY
FROM TEMP_ITEM_STOCK_BAT_FOR_NET
)
;



DELETE FROM STOCK_VALUE_TYRE_APR_19;

INSERT INTO STOCK_VALUE_TYRE_APR_19(ITEM_CODE,ITEM_SHORT_DESC, LOC_CODE, OP_QTY, PUR_QTY, SALES_QTY, SALES_RETURN_QTY, CLOSE_QTY)
SELECT ITEM_CODE,ITEM_SHORT_DESC,LOC_CODE
, OP_RCVD_QT+OP_RT_QTY+OP_PR_QTY-OP_ISSUED_QTY-OP_GIFT_QTY-OP_RP_QTY-OP_ADJ OP_BAL
, PR_QTY
, ISSUED_QTY
, RT_QTY
, OP_RCVD_QT+OP_RT_QTY+OP_PR_QTY-OP_ISSUED_QTY-OP_RP_QTY-OP_GIFT_QTY-OP_ADJ+RCVD_QTY+IDT_QTY+RT_QTY-ISSUED_QTY-GIFT_QTY-ADJ_ISSUED_QTY-RP_QTY BAL_QTY 
FROM TEMP_ITEM_STOCK_BAT_FOR_NET
;


MERGE INTO STOCK_VALUE_TYRE_APR_19
USING 
(
SELECT OP_DATE,F_DATE,T_DATE,LOC_CODE,LOCATION_DESC,BRAND_ID
,BRAND_NAME,BATERY_CAT_ID,ITEM_CATEGORY,ITEM_CODE
,ITEM_SHORT_DESC,LAST_THREE_MON_AVG_QTY
,PRV_YEAR_SAMAE_MON_QTY
,OP_RCVD_QT+OP_RT_QTY+OP_PR_QTY-OP_ISSUED_QTY-OP_GIFT_QTY-OP_RP_QTY-OP_ADJ OP_BAL
,RCVD_QTY
,PR_QTY
,IDT_QTY
,RT_QTY
,PR_QTY+RCVD_QTY+RT_QTY+OP_RCVD_QT+IDT_QTY+OP_RT_QTY+OP_PR_QTY-OP_ISSUED_QTY-OP_GIFT_QTY-OP_RP_QTY-OP_ADJ Total_Received
,ISSUED_QTY
,ADJ_ISSUED_QTY
,RP_QTY
,GIFT_QTY
,ISSUED_QTY+ADJ_ISSUED_QTY+RP_QTY+GIFT_QTY Total_Issued
,PR_QTY+OP_RCVD_QT+OP_RT_QTY+OP_PR_QTY-OP_ISSUED_QTY-OP_RP_QTY-OP_GIFT_QTY-OP_ADJ+RCVD_QTY+IDT_QTY+RT_QTY-ISSUED_QTY-GIFT_QTY-ADJ_ISSUED_QTY-RP_QTY BAL_QTY
FROM TEMP_ITEM_STOCK_BAT_FOR_NET
) PURC ON (STOCK_VALUE_TYRE_APR_19.ITEM_CODE = PURC.ITEM_CODE)
WHEN MATCHED THEN
UPDATE SET
   OP_QTY = PURC.OP_BAL
   --, PURCHASE_QTY = PURC.PR_QTY
   , SALES_QTY = PURC.ISSUED_QTY
   , SALES_RETURN_QTY = PURC.RT_QTY
   , CLOSE_QTY = PURC.BAL_QTY
;


MERGE INTO STOCK_VALUE_TYRE_APR_19
USING 
(
SELECT PUR1.*
, ROUND(PUR1.PURCHASE_VALUE / PUR1.PURCHASE_QTY) PURCHASE_RATE
FROM
(
SELECT PUR.ITEM_CODE, PUR.ITEM_SHORT_DESC, SUM(NVL(PUR.PURCHASE_QTY,0)) PURCHASE_QTY, SUM(NVL(PUR.PURCHASE_QTY,0) * NVL(PUR.UNIT_RATE,0)) PURCHASE_VALUE
FROM 
(
SELECT LP_PURCHASE_MASTER.PURCHASE_DATE , SALES_ITEM_MST.ITEM_CODE, SALES_ITEM_MST.ITEM_SHORT_DESC, LP_PURCHASE_DETAILS.PURCHASE_QTY, LP_PURCHASE_DETAILS.UNIT_RATE
FROM LP_PURCHASE_DETAILS
INNER JOIN LP_PURCHASE_MASTER ON LP_PURCHASE_DETAILS.PURCHASE_ID = LP_PURCHASE_MASTER.PURCHASE_ID
INNER JOIN SALES_ITEM_MST ON LP_PURCHASE_DETAILS.ITEM_ID = SALES_ITEM_MST.ITEM_ID
INNER JOIN BATERY_CATEGORY ON SALES_ITEM_MST.BATERY_CAT_ID = BATERY_CATEGORY.BATERY_CAT_ID
WHERE 1=1
--AND SALES_ITEM_MST.BATERY_CAT_ID <> '005'
AND LP_PURCHASE_MASTER.PURCHASE_DATE BETWEEN '01-Apr-2019' AND '30-Apr-2019'
AND SALES_ITEM_MST.ITEM_SEGMENT_ID	 = 6
--AND INVOICE_MST.LOC_CODE = '01'
) PUR
GROUP BY PUR.ITEM_CODE, PUR.ITEM_SHORT_DESC
) PUR1
) PURC ON (STOCK_VALUE_TYRE_APR_19.ITEM_CODE = PURC.ITEM_CODE)
WHEN MATCHED THEN
UPDATE SET
   PUR_QTY = PURC.PURCHASE_QTY
   , RATE_PUR = PURC.PURCHASE_RATE
   ;

   
MERGE INTO STOCK_VALUE_TYRE_APR_19
USING (SELECT * FROM STOCK_VALUE_TYRE_FEB_19)
ST ON (STOCK_VALUE_TYRE_APR_19.ITEM_CODE = ST.ITEM_CODE )
WHEN MATCHED THEN
UPDATE SET
    RATE_AVG_PREV = ST.RATE_AVG 
;
   
   
   
UPDATE STOCK_VALUE_TYRE_APR_19
  SET  OP_VALUE = OP_QTY * RATE_AVG_PREV
  , PUR_VALUE = PUR_QTY * RATE_PUR
;


SELECT *
FROM STOCK_VALUE_TYRE_APR_19
WHERE 1=1
AND OP_QTY + PUR_QTY = 0
;

UPDATE STOCK_VALUE_TYRE_APR_19
  SET  RATE_AVG =  ROUND((OP_VALUE + PUR_VALUE) /    (OP_QTY + PUR_QTY))
  WHERE 1=1  
  AND  OP_QTY + PUR_QTY > 0
;

UPDATE STOCK_VALUE_TYRE_APR_19
  SET  RATE_AVG =  RATE_AVG_PREV
  WHERE 1=1  
  AND  OP_QTY + PUR_QTY = 0
;


UPDATE STOCK_VALUE_TYRE_APR_19
  SET  RATE_PUR =  0
  WHERE 1=1  
  AND  OP_QTY + PUR_QTY = 0
;



UPDATE STOCK_VALUE_TYRE_APR_19
  SET  SALES_VALUE =  SALES_QTY * RATE_AVG
  , SALES_RETURN_VALUE =  SALES_RETURN_QTY * RATE_AVG_PREV
  , CLOSE_VALUE =  CLOSE_QTY * RATE_AVG
  WHERE 1=1  
;

SELECT *
FROM STOCK_VALUE_TYRE_APR_19
WHERE 1=1
AND OP_QTY + PUR_QTY = 0
;






SELECT SUM(OP_QTY) OP_QTY, SUM(OP_VALUE) OP_VALUE
, SUM(PUR_QTY) PUR_QTY, SUM(PUR_VALUE) PUR_VALUE
, SUM(SALES_QTY) SALES_QTY, SUM(SALES_VALUE) SALES_VALUE
, SUM(SALES_RETURN_QTY) SALES_RETURN_QTY
, SUM(CLOSE_QTY) CLOSE_QTY, SUM(CLOSE_VALUE) CLOSE_VALUE
FROM STOCK_VALUE_TYRE_APR_19
;


SELECT ITEM_SHORT_DESC
, RATE_AVG_PREV
, OP_QTY, OP_VALUE OP_VALUE
, RATE_PUR
, PUR_QTY PUR_QTY, PUR_VALUE
, RATE_AVG
, SALES_QTY, SALES_VALUE
, SALES_RETURN_QTY, SALES_RETURN_VALUE
, CLOSE_QTY, CLOSE_VALUE
FROM STOCK_VALUE_TYRE_APR_19
ORDER BY ITEM_SHORT_DESC ASC
;


