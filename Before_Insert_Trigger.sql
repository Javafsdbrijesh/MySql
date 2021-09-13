create table WorkStation(
id int auto_increment primary key,
name varchar(100) not null,
capacity int not null
);

select * from WorkStation;

create table WorkStationCapacity(
totalCapacity int not null
);

select * from WorkStationCapacity;

DELIMITER $$
create trigger before_insert_workstation
before insert
on WorkStation for each row
begin
	declare rowcount int;
    select count(*) 
    into rowcount 
    from WorkStationCapacity;    
    
    if rowcount > 0 then 
		update WorkStationCapacity 
        set totalCapacity = totalCapacity + new.capacity;
    else 
		insert into WorkStationCapacity (totalCapacity)
        values(new.capacity);
     end if;
end $$

insert into WorkStation (name, capacity) values ('Pravalika Work Station', 100);

show triggers;
drop trigger after_member_insert;