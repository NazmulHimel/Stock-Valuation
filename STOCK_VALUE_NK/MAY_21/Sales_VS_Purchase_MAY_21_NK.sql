SELECT  AB.INVOICEmONTH,
ab.Batery_cat_descr, SUM(AB.ITEM_QNTY) ITEM_QNTY, SUM(AB.TotalSalesValue) TotalSalesValue, SUM(AB.TOTAL_PURCHASE_VALUE) TOTAL_PURCHASE_VALUE 
FROM
(
SELECT
INVOICE_MST.INVOICE_NO--, INVOICE_MST.INVOICE_DATE
,TO_CHAR(INVOICE_MST.INVOICE_DATE,'MM-yy') INVOICEmONTH
,cat.Batery_cat_descr
,  INVOICE_DTL.ITEM_CODE
, SALES_ITEM_MST.ITEM_SHORT_DESC
, ( INVOICE_DTL.ITEM_QNTY) ITEM_QNTY --,    INVOICE_DTL.ITEM_RATE
, (INVOICE_DTL.ITEM_QNTY * INVOICE_DTL.ITEM_RATE) TotalSalesValue
,ROUND(  NVL( INVOICE_DTL.ITEM_QNTY,0) * 
 case when  (select  MAX( NVL(dinv.item_rate,0))
From invoice_mst@sd157 minv 
INNER JOIN invoice_dtl@sd157 dinv on minv.invoice_no=dinv.invoice_no
where minv.LOC_CODE='01'
and minv.invoice_date between Last_Day(ADD_MONTHS(INVOICE_MST.INVOICE_DATE,-2))+1 and Last_Day(ADD_MONTHS(INVOICE_MST.INVOICE_DATE,0))
and trim( dinv.item_code)=trim(SALES_ITEM_MST.item_code_ps)
) >0 then  
 (select  MAX( NVL(dinv.item_rate,0))
From invoice_mst@sd157 minv 
INNER JOIN invoice_dtl@sd157 dinv on minv.invoice_no=dinv.invoice_no
where minv.LOC_CODE='01'
and minv.invoice_date between Last_Day(ADD_MONTHS(INVOICE_MST.INVOICE_DATE,-2))+1 and Last_Day(ADD_MONTHS(INVOICE_MST.INVOICE_DATE,0))
and trim( dinv.item_code)=trim(SALES_ITEM_MST.item_code_ps)
)
else
SALES_ITEM_MST.transfer_rate
END
,0)
TOTAL_PURCHASE_VALUE
FROM INVOICE_DTL
INNER JOIN INVOICE_MST ON INVOICE_DTL.INVOICE_NO = INVOICE_MST.INVOICE_NO
INNER JOIN DEALER_MST ON INVOICE_MST.DELEAR_ID = DEALER_MST.DEALER_ID
INNER JOIN SALES_ITEM_MST ON INVOICE_DTL.ITEM_CODE = SALES_ITEM_MST.ITEM_CODE
INNER JOIN SALES_ITEM_MST@sd157 item157   ON SALES_ITEM_MST.ITEM_CODE_PS = item157.ITEM_CODE
INNER JOIN batery_category@sd157 CAT ON item157.batery_cat_id=cat.batery_cat_id
WHERE 1=1
AND INVOICE_MST.LOC_CODE <> '01'
AND INVOICE_MST.INVOICE_DATE BETWEEN '01-MAY-2021' AND '31-MAY-2021'
--AND sales_item_mst.batery_cat_id NOT IN ('005')
order by TO_CHAR(INVOICE_MST.INVOICE_DATE,'MM-yy'),cat.Batery_cat_descr
) AB 
GROUP BY AB.INVOICEmONTH,ab.Batery_cat_descr
ORDER BY AB.INVOICEmONTH,ab.Batery_cat_descr
