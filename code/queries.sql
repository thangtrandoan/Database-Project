use quanlydatvetau ;

/* 1- Tên của các tàu dừng tại Ga Hà Nội */
select t.Name
from train t
inner join stoppage sp on t.Train_No = sp.Train_No 
inner join station st on sp.Station_Code = st.Station_Code
where st.Station_Name = "Ga Hà Nội" ;

/* 2- Thông tin về các hành khách trên tàu SE1 */
select p.*
from passenger p
inner join ticket tk on p.Ticket_No = tk.Ticket_No
inner join train t on tk.Train_No = t.Train_No
where t.Name = "SE1" ;

/* 3- Thông tin các tài khoản và mã vé tương ứng tài khoản đó đặt, kể cả khi không đặt vé nào */
select a.*, tk.Ticket_No
from account a
left outer join ticket tk on a.Username = tk.Username ;

/* 4- Số hiệu, tên tàu và số ga (trong danh sách 6 ga) mà nó đến, kể cả khi không có */
select t.Train_No, t.Name, count(sp.Station_Code) as Number_of_Destinations
from train t
left outer join stoppage sp on t.Train_No = sp.Train_No
group by t.Train_No ;

/* 5- Họ tên các hành khách có chuyến tàu vào ngày 13-12-2024 */
select concat(p.First_Name, " ", p.Last_Name) as Full_Name 
from passenger p
where p.Ticket_No in 
	(select t.Ticket_No from ticket t where t.Date_of_Journey = "2024-12-13") ;
    
/* 6- Số điện thoại của tài khoản đặt vé đi tàu TN2 */
select c.Phone_No from contact c where c.Username in
	(select t.Username from ticket t where t.Train_No in 
		(select tr.Train_No from train tr where tr.Name = "TN2"));
        
/* 7- Mã vé của các vé vào con tàu có sức chứa > 300 */
select Ticket_No, Total_Seat
from (select tk.Ticket_No, (t.Seat_Sleeper + t.Seat_First_Class_AC 
			+ t.Seat_Second_Class_AC + t.Seat_Third_Class_AC) as Total_Seat
		from ticket tk
        inner join train t on tk.Train_No = t.Train_No) as SeatTicket
where Total_Seat > 300 ;

/* 8- Mã vẽ của các vé có chủ sở hữu trong họ và tên có chữ 't' */
select Ticket_No, Full_Name
from (select tk.Ticket_No, concat(p.First_Name, " ", p.Last_Name) as Full_Name
		from ticket tk
        inner join passenger p on tk.Ticket_No = p.Ticket_No) as Ticket_Owner
where Full_Name like "%t%" ;

/* 9- Tổng số người trên các chuyến tàu có Wifi */
select count(p.Passenger_Id) as Number_of_POWCT
from passenger p
inner join ticket tk on p.Ticket_No = tk.Ticket_No
inner join train t on tk.Train_No = t.Train_No
where t.Wifi = "Có" ;

/* 10- Số hành khách đến các ga */
select st.Station_Name, count(p.Passenger_Id) as Number_of_P
from station st
inner join stoppage sp on st.Station_Code = sp.Station_Code
inner join train t on sp.Train_No = t.Train_No 
inner join ticket tk on t.Train_No = tk.Train_No
inner join passenger p on tk.Ticket_No = p.Ticket_No
group by st.Station_Code ;            