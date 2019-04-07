DELIMITER $$
create procedure daily(IN id int, IN fat float, IN snf float)
  BEGIN
    SELECT
           ( select farmer_name from farmer_info
             where farmer_id=id)  as name  ,
           ( select MilkRate from rate_chart where rate_chart.Snf=snf and rate_chart.Fat=fat) as Rate
    ;
  END$$
DELIMITER ;