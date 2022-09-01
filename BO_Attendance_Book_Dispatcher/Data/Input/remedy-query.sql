SELECT Submitter as USERNAME, MSISDN,
(dateadd(second, ( create_date + 7200), 'Jan 1, 1970')) AS {4}
FROM VODA_SYS_Customer_Care_Req3388
WHERE (dateadd(second, ( create_date + 7200), 'Jan 1, 1970')) BETWEEN '{1}' AND '{2}'
AND ITEM = '{3}'
AND Last_Modified_By in {0};