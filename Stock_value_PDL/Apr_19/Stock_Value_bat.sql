
EXEC SP_ITEM_STOCK_P_BATTERY_NET('01-Feb-2019','28-Feb-2019');

EXEC SP_ITEM_STOCK_P_BATTERY_NET_CD('01-Feb-2019','28-Feb-2019');



EXEC SP_STOCK_VALUE_BAT_NET('201904');

SELECT ITM.ITEM_ID, ITM.ITEM_SHORT_DESC ITEM_NAME
, RATE_PREV RATE_MAR_19
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
AND BM.SVBM_MONTH_NO = '201904'
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
AND SVBM_ID = 28
;



---=======================================================================


SELECT ITM.ITEM_SHORT_DESC ITEM_NAME
, OPEN_QTY, OPEN_VALUE
, OPEN_QTY_P, OPEN_VALUE_P
, OPEN_QTY_SERVICE, OPEN_VALUE_SERVICE
, OPEN_QTY_SERVICE, OPEN_VALUE_SERVICE
, PURCHASE_QTY_P, PURCHASE_VALUE_P
, PURCHASE_RETURN_QTY, PURCHASE_RETURN_VALUE
, PURCHASE_RETURN_SC_QTY, PURCHASE_RETURN_SC_VALUE
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
AND BM.SVBM_MONTH_NO = '201902'
GROUP BY ITM.ITEM_SHORT_DESC
ORDER BY ITM.ITEM_SHORT_DESC
;



SELECT ITM.ITEM_ID, ITM.ITEM_SHORT_DESC ITEM_NAME
, RATE_PREV RATE_JAN_19
, OPEN_QTY, OPEN_VALUE
, OPEN_QTY_P, OPEN_VALUE_P
, OPEN_QTY_SERVICE, OPEN_VALUE_SERVICE
, OPEN_QTY_SERVICE, OPEN_VALUE_SERVICE
, RATE_PURCHASE PURCHASE_RATE
, PURCHASE_QTY_P, PURCHASE_VALUE_P
, PURCHASE_RETURN_QTY, PURCHASE_RETURN_VALUE
, PURCHASE_RETURN_SC_QTY, PURCHASE_RETURN_SC_VALUE
, RATE_AVG, RATE_AVG
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
AND BM.SVBM_MONTH_NO = '201902'
ORDER BY ITM.ITEM_SHORT_DESC
;






SELECT SVBM_ID, SVBM_DATE_FROM, SVBM_DATE_TO
FROM STOCK_VALUE_BAT_MST
WHERE 1=1
AND SVBM_MONTH_NO = '201902'
;


SELECT *
FROM STOCK_VALUE_BAT_ITEM
WHERE 1=1
AND SVBM_ID = 26
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
AND SVBM_ID = 28
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
AND SVBM_ID = 27
;

SELECT ITEM_CODE
FROM STOCK_VALUE_BAT_ITEM
WHERE 1=1
AND SVBM_ID = 26
GROUP BY ITEM_CODE
;


SELECT SALES_ITEM_MST.ITEM_CODE, SUM(RECEIVED_DTL.RCV_QTY) RCVD_QTY
FROM RECEIVED_DTL
INNER JOIN RECEIVED_MST ON RECEIVED_DTL.TRANS_ID = RECEIVED_MST.TRANS_ID
INNER JOIN SALES_ITEM_MST ON RECEIVED_DTL.ITEM_CODE = SALES_ITEM_MST.ITEM_CODE
WHERE (1=1)
AND SALES_ITEM_MST.ITEM_GROUP_ID = 1
AND RECEIVED_MST.RECEIVED_DATE BETWEEN '01-Feb-2019' AND '28-Feb-2019'
AND RECEIVED_MST.FROM_LOC = '00'
AND RECEIVED_MST.TO_LOC = '01'
AND RECEIVED_MST.TRANS_TYPE = 'I'
GROUP BY SALES_ITEM_MST.ITEM_CODE
ORDER BY SALES_ITEM_MST.ITEM_CODE
;



select   a.item_code     
        , sum(nvl(a.o_rp_qty,0)) o_rp_qty
        --, sum(nvl(a.o_rp_qty_amt,0)) o_rp_qty_amt
        , sum(nvl(a.o_fac_qty,0)) o_fac_qty
        --, sum(nvl(a.o_fac_qty_amt,0)) o_fac_qty_amt     
        , sum(nvl(a.rp_qty,0)) rp_qty
        --, sum(nvl(a.rp_qty_amt,0)) rp_qty_amt
        , sum(nvl(a.fac_qty,0)) fac_qty                    
        --, sum(nvl(a.fac_qty_amt,0)) fac_qty_amt
        , sum(nvl(a.open_qty,0)) + sum(nvl(a.o_rp_qty,0))-sum(nvl(a.o_fac_qty,0)) o_bal_qty
        --, sum(nvl(a.open_amt,0)) + sum(nvl(a.o_rp_qty_amt,0))-sum(nvl(a.o_fac_qty_amt,0)) o_bal_amt
        , sum(nvl(a.open_qty,0)) + sum(nvl(a.o_rp_qty,0))-sum(nvl(a.o_fac_qty,0))+sum(nvl(a.rp_qty,0))-sum(nvl(a.fac_qty,0)) close_qty
        --, sum(nvl(a.open_amt,0)) + sum(nvl(a.o_rp_qty_amt,0))-sum(nvl(a.o_fac_qty_amt,0))+sum(nvl(a.rp_qty_amt,0))-sum(nvl(a.fac_qty_amt,0)) close_amt
from
(
select  o.loc_code
        , o.batery_cat_id
        , o.item_code   
        , sum(nvl(o.open_qty,0)) open_qty 
        , sum(nvl(o.open_amt,0)) open_amt
        , 0 o_rp_qty
        , 0 o_rp_qty_amt
        , 0 o_fac_qty
        , 0 o_fac_qty_amt     
        , 0 rp_qty 
        , 0 rp_qty_amt
        , 0 fac_qty                    
        , 0 fac_qty_amt           
from    rpl_fac_cha_opening o        
        , sales_item_mst i
where   o.item_code = i.item_code  -- open qty   --- adjustment
and i.ITEM_GROUP_ID = 1
group by o.loc_code, o.batery_cat_id, o.item_code
union all
select  r.loc_code
        , i.batery_cat_id
        , i.item_code   
        , 0 open_qty
        , 0 open_amt     
        , 1 o_rp_qty        
        , i.transfer_rate        
        , 0 o_fac_qty
        , 0 o_fac_qty_amt     
        , 0 rp_qty 
        , 0 rp_qty_amt
        , 0 fac_qty                    
        , 0 fac_qty_amt           
from    battery_rpl_srv r       
        , sales_item_mst i
where   r.old_bty_type = i.item_code
and i.ITEM_GROUP_ID = 1
and     r.autho_status='A'       -- replace qty
and     r.battery_type='N'
and     to_char(r.rpl_srv_date,'rrrr') > '2013'
and     r.rpl_srv_date < '01-Feb-2019'
union all
select  m.loc_code
        , i.batery_cat_id
        , i.item_code
        , 0
        , 0
        , 0 
        , 0
        , 1                    
        , i.transfer_rate  
        , 0 
        , 0
        , 0                    
        , 0      
from    fact_challan_mst m
        , fact_challan_dtl f        
        , sales_item_mst i
where   m.challan_no = f.challan_no
and     f.item_code = i.item_code
and     m.auth_status='A'   -- factory challan
and     m.challan_type = 'F'
and     to_char(m.challan_date,'rrrr') > '2013'
and i.ITEM_GROUP_ID = 1
--and     m.challan_date between i.date_of_eff and i.date_of_exp
and     m.challan_date < '01-Feb-2019'
union all
select  r.loc_code
        , i.batery_cat_id
        , i.item_code   
        , 0
        , 0
        , 0 
        , 0
        , 0                    
        , 0
        , 1
        , i.transfer_rate
        , 0
        , 0                
from    battery_rpl_srv r        
        , sales_item_mst i
where   r.old_bty_type = i.item_code
and     r.autho_status='A'       -- replace qty
and     r.battery_type='N'
and     to_char(r.rpl_srv_date,'rrrr') > '2013'
and i.ITEM_GROUP_ID = 1
--and     r.rpl_srv_date between i.date_of_eff and i.date_of_exp
and     r.rpl_srv_date between '01-Feb-2019' and '28-Feb-2019'
union all
select  m.loc_code
        , i.batery_cat_id
        , i.item_code
        , 0
        , 0
        , 0 
        , 0
        , 0                    
        , 0
        , 0 
        , 0
        , 1                    
        , i.transfer_rate        
from    fact_challan_mst m
        , fact_challan_dtl f
        , sales_item_mst i
where   m.challan_no = f.challan_no
and     f.item_code = i.item_code
and     m.auth_status='A'   -- factory challan
and     m.challan_type = 'F'
and     to_char(m.challan_date,'rrrr') > '2013'
and i.ITEM_GROUP_ID = 1
--and     m.challan_date between i.date_of_eff and i.date_of_exp
and     m.challan_date between '01-Feb-2019' and '28-Feb-2019'
) a
group by    a.item_code
--order by    a.loc_code, a.batery_cat_id, item_short_desc
;