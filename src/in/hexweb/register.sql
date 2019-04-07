DELIMITER $$
create procedure register(IN id int,IN d1 VARCHAR(20),IN d2 VARCHAR(20))
  BEGIN
    SELECT
           ( select farmer_id from farmer_info
             where farmer_id=id)  as ids,
           ( select farmer_name from farmer_info
               where farmer_id=id)  as name,
#            ( select farmer_id from daily_register) as Fn
           (select sum(qty) as Qty from daily_register where Date>=d1 and Date<=d2 and farmer_id=id) as qty,
           (select SUM(DailyAmount) from daily_register where Date>=d1 and Date<=d2 and farmer_id=id)  as Amount
    ;
  END$$
DELIMITER ;