#check ngay khoi hanh
delimiter $$
create trigger before_date_of_journey 
	before update on ticket
    for each row
begin
    if new.date_of_journey <= curdate() then
		signal sqlstate '45000' set message_text = 'Ngay khoi hanh phai lon hon ngay hien tai';
	end if;
end$$
delimiter ;
-- delimiter $$
-- create trigger before_date_of_journey 
-- 	before insert on ticket
--     for each row
-- begin
--     if new.date_of_journey <= curdate() then
-- 		signal sqlstate '45000' set message_text = 'Ngay khoi hanh phai lon hon ngay hien tai';
-- 	end if;
-- end$$
-- delimiter ;

#check gmail
delimiter $$
create trigger check_valid_email
	before update on account
    for each row
begin
	if new.Email_Id not like '%@gmail.com' then
		signal sqlstate '45000' set message_text = 'email khong hop le';
	end if;
end$$
delimiter ;
-- delimiter $$
-- create trigger check_valid_email
-- 	before insert on account
--     for each row
-- begin
-- 	if new.Email_Id not like '%@gmail.com' then
-- 		signal sqlstate '45000' set message_text = 'email khong hop le';
-- 	end if;
-- end$$
-- delimiter ;

#check sdt
delimiter $$
create trigger check_valid_phone
	before update on contact
    for each row
begin
	if new.Phone_No not like '0%' and length(new.Phone_No) != 10 then
		signal sqlstate '45000' set message_text = 'So dien thoai khong hop le';
	end if;
end$$
delimiter ;
-- delimiter $$
-- create trigger check_valid_phone
-- 	before insert on contact
--     for each row
-- begin
-- 	if new.Phone_No not like '0%' and length(new.Phone_No) != 10 then
-- 		signal sqlstate '45000' set message_text = 'So dien thoai khong hop le';
-- 	end if;
-- end$$
-- delimiter ;

#kiem tra thoi gian den va di
delimiter $$
create trigger check_arrival_departure
	before update on stoppage
    for each row
begin
	if new.Arrival_Time >= new.Departure_Time then
		signal sqlstate '45000' set message_text = 'Thoi gian khong hop le';
	end if;
end$$
delimiter ;
-- delimiter $$
-- create trigger check_arrival_departure
-- 	before insert on stoppage
--     for each row
-- begin
-- 	if new.Arrival_Time >= new.Departure_Time then
-- 		signal sqlstate '45000' set message_text = 'Thoi gian khong hop le';
-- 	end if;
-- end$$
-- delimiter ;

#them cho moi khi ve huy
delimiter $$
create trigger cancel
	before delete on ticket
    for each row
begin
	set @train = old.Train_No;
    set @ticket = old.Ticket_No;
    set @class = (select class from passenger where Ticket_No = @ticket);
    if @class = 'Sleeper' then 
		update train
        set Seat_Sleeper = Seat_Sleeper + 1
        where Train_No = @train;
	elseif @class = 'First Class AC' then 
		update train
        set Seat_First_Class_AC = Seat_First_Class_AC + 1
        where Train_No = @train;
	elseif @class = 'Second Class AC' then 
		update train
        set Seat_Second_Class_AC = Seat_Second_Class_AC + 1
        where Train_No = @train;
	elseif @class = 'Third Class AC' then 
		update train
        set Seat_Third_Class_AC = Seat_Third_Class_AC + 1
        where Train_No = @train;
	end if;
end $$
delimiter ;
	
#giam cho moi khi dat ve
delimiter $$
create trigger add_ticket
	after insert on ticket
    for each row
begin
	set @train = new.Train_No;
    set @ticket = new.Ticket_No;
    set @class = (select class from passenger where Ticket_No = @ticket);
    if @class = 'Sleeper' then 
		update train
        set Seat_Sleeper = Seat_Sleeper - 1
        where Train_No = @train;
	elseif @class = 'First Class AC' then 
		update train
        set Seat_First_Class_AC = Seat_First_Class_AC - 1
        where Train_No = @train;
	elseif @class = 'Second Class AC' then 
		update train
        set Seat_Second_Class_AC = Seat_Second_Class_AC - 1
        where Train_No = @train;
	elseif @class = 'Third Class AC' then 
		update train
        set Seat_Third_Class_AC = Seat_Third_Class_AC - 1
        where Train_No = @train;
	end if;
end $$
delimiter ;