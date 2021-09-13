INSERT INTO members(name)
VALUES('John'),('Jane'),('Mary'),('David'),('Amelia');

INSERT INTO committees(name)
VALUES('John'),('Mary'),('Amelia'),('Joe');



select 
	m.member_id,
    m.name AS member,
    c.committee_id,
    c.name AS committee
from
	members m
inner join committees c USING(name);

Select 
	m.member_id,
    m.name As member,
    c.committee_id,
    c.name As committee
from
	members m
left join committees c USING(name);

Select 
	m.member_id,
    m.name As member,
    c.committee_id,
    c.name As committee
from
	members m
right join committees c ON c.name = m.name;

Select 
	m.member_id,
    m.name As member,
    c.committee_id,
    c.name As committee
from
	members m
cross join committees c;


DELIMITER $$
CREATE TRIGGER before_insert_new_members
	BEFORE INSERT ON member FOR EACH ROW
    BEGIN
     IF members.member_id >5 THEN INSERT INTO members VALUES(7, "Testing Trigger");
     END IF;
    END $$
    
show triggers;
drop trigger after_members_insert

insert into members values (6, 'SIxth Member');

DELIMITER $$
CREATE TRIGGER after_members_insert
AFTER INSERT
ON members FOR EACH ROW
BEGIN
    IF new.name IS NoT NULL THEN
        INSERT INTO committees(committee_id, name)
        VALUES(6, 'hi');
    END IF;
END$$

DELIMITER ;