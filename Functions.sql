DELIMITER $$
CREATE FUNCTION get_members_by_Id(input_id int)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
DECLARE member_name VARCHAR(100) DEFAULT "";
SELECT name INTO member_name FROM members WHERE member_id = input_id;
RETURN member_name;
END $$


select get_members_by_Id(1);