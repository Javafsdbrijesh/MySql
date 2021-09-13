CREATE TABLE member (
    id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255),
    birthDate DATE,
    PRIMARY KEY (id)
);

CREATE TABLE reminders (
    id INT AUTO_INCREMENT,
    memberId INT,
    message VARCHAR(255) NOT NULL,
    PRIMARY KEY (id , memberId)
);

DELIMITER $$
create trigger after_member_insert
after insert
on member for each row
begin
	if new.birthDate is null then
    insert into reminders (memberId, message)
    values(new.id, concat('Hi  ', new.name, '  please update your date of birth'));
    end if;
end $$

show triggers;
drop trigger after_member_insert;

insert into member (name, email, birthDate) values ('Shruti', 'Shruti@lnt', null);