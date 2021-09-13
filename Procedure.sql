DELIMITER $$
CREATE PROCEDURE select_member (IN id int)
BEGIN
	SELECT name from members where member_id = id;
END $$

CALL select_member(4);