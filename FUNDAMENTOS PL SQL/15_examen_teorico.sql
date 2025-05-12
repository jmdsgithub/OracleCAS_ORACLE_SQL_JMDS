DECLARE
    cursor x IS
    select empid, last_name from employes
    where dpid=30;
BEGIN
    for emprecord in X
    