
SELECT i.Submitter as USERNAME, i.MSISDN,
(dateadd(second, ( i.create_date + 7200), 'Jan 1, 1970')) AS TIME_IN,
(dateadd(second, ( o.create_date + 7200), 'Jan 1, 1970')) AS TIME_OUT

FROM VODA_SYS_Customer_Care_Req3388 i

Inner Join VODA_SYS_Customer_Care_Req3388 o on i.Submitter = o.Submitter

WHERE (dateadd(second, ( i.create_date + 7200), 'Jan 1, 1970'))  BETWEEN  '{1}' AND '{2}'
AND (dateadd(second, ( o.create_date + 7200), 'Jan 1, 1970'))  BETWEEN  '{1}' AND '{2}'
AND  i.ITEM  = 'Time in'
AND  o.ITEM  = 'Time out'
AND  i.Last_Modified_By in {0};
-- AND  o.Last_Modified_By in {0};



