-- Dữ liệu mẫu cho bảng Account (Tài khoản)
INSERT INTO Account (Username, Password, Email_Id, Address)
VALUES
('nguoidung1', 'matkhau1', 'nguoidung1@gmail.com', 'Số 1, P. Hoàn Kiếm'),
('nguoidung2', 'matkhau2', 'nguoidung2@gmail.com', 'Số 2, TP. Vinh'),
('nguoidung3', 'matkhau3', 'nguoidung3@gmail.com', 'Số 3, Q. Hải Châu'),
('nguoidung4', 'matkhau4', 'nguoidung4@gmail.com', 'Số 4, Q. Tân Bình'),
('nguoidung5', 'matkhau5', 'nguoidung5@gmail.com', 'Số 5, P. Đông Hà'),
('nguoidung6', 'matkhau6', 'nguoidung6@gmail.com', 'Số 6, TP. Huế'),
('nguoidung7', 'matkhau7', 'nguoidung7@gmail.com', 'Số 7, Q. Bình Thạnh');

-- Dữ liệu mẫu cho bảng Contact (Liên hệ)
INSERT INTO Contact (Username, Phone_No)
VALUES
('nguoidung1', '0901234567'),
('nguoidung2', '0902345678'),
('nguoidung3', '0903456789'),
('nguoidung4', '0904567890'),
('nguoidung5', '0905678901'),
('nguoidung6', '0906789012'),
('nguoidung7', '0907890123');

-- Dữ liệu mẫu cho bảng Station (Ga tàu)
INSERT INTO Station (Station_Code, Station_Name)
VALUES
('G001', 'Ga Hà Nội'),
('G002', 'Ga Thanh Hóa'),
('G004', 'Ga Vinh'),
('G005', 'Ga Đồng Hới'),
('G006', 'Ga Huế'),
('G007', 'Ga Đà Nẵng');

-- Dữ liệu mẫu cho bảng Train (Tàu)
INSERT INTO Train (Train_No, Name, Seat_Sleeper, Seat_First_Class_AC, Seat_Second_Class_AC, Seat_Third_Class_AC, Wifi, Food, Run_On_Sunday, Run_On_Monday, Run_On_Tuesday, Run_On_Wednesday, Run_On_Thursday, Run_On_Friday, Run_On_Saturday)
VALUES
(201, 'SE1', 100, 50, 70, 120, 'Có', 'Có', 'Có', 'Không', 'Có', 'Có', 'Không', 'Có', 'Không'),
(202, 'SE2', 120, 60, 80, 140, 'Không', 'Có', 'Không', 'Có', 'Có', 'Không', 'Có', 'Có', 'Có'),
(203, 'TN1', 80, 30, 60, 100, 'Không', 'Không', 'Có', 'Có', 'Không', 'Không', 'Có', 'Có', 'Không'),
(204, 'TN2', 90, 35, 70, 110, 'Có', 'Không', 'Không', 'Có', 'Có', 'Có', 'Có', 'Không', 'Có'),
(205, 'SN1', 50, 20, 40, 70, 'Không', 'Không', 'Có', 'Có', 'Có', 'Có', 'Có', 'Có', 'Có'),
(206, 'SN2', 60, 25, 50, 80, 'Có', 'Có', 'Có', 'Không', 'Có', 'Không', 'Có', 'Có', 'Có'),
(207, 'SE3', 140, 70, 100, 150, 'Có', 'Có', 'Có', 'Có', 'Có', 'Không', 'Có', 'Không', 'Có');

-- Dữ liệu mẫu cho bảng Ticket (Vé)
INSERT INTO Ticket (Ticket_No, Coach, Seat_No, Date_of_Journey, Username, Train_No)
VALUES
('1', 'A1', 5, '2024-12-10', 'nguoidung1', 201),
('2', 'A2', 10, '2024-12-11', 'nguoidung2', 202),
('3', 'A3', 15, '2024-12-12', 'nguoidung3', 203),
('4', 'B1', 20, '2024-12-13', 'nguoidung4', 204),
('5', 'B2', 25, '2024-12-14', 'nguoidung5', 205),
('6', 'B3', 30, '2024-12-15', 'nguoidung6', 206),
('7', 'C1', 35, '2024-12-16', 'nguoidung7', 207);

-- Dữ liệu mẫu cho bảng Passenger (Hành khách)
INSERT INTO Passenger (First_Name, Last_Name, Gender, Phone_No, Ticket_No, Age, Class)
VALUES
('Nguyễn Hồng', 'Phúc', 'Nam', '0901234567', 1, 19, 'Second Class AC'),
('Trần Doãn', 'Thắng', 'Nam', '0902345678', 2, 19, 'First Class AC'),
('Nguyễn Phương', 'Nam', 'Nam', '0903456789', 3, 19, 'Third Class AC'),
('Nguyễn Đình', 'Quyền', 'Nữ', '0904567890', 4, 19, 'Third Class AC'),
('Hoàng Văn', 'E', 'Nam', '0905678901', 5, 36, 'Sleeper'),
('Vũ Thị', 'F', 'Nữ', '0906789012', 6, 33, 'First Class AC'),
('Đặng Hoàng', 'G', 'Nam', '0907890123', 7, 41, 'Sleeper');


-- Dữ liệu mẫu cho bảng Stoppage (Điểm dừng)
INSERT INTO Stoppage (Train_No, Station_Code, Arrival_Time, Departure_Time)
VALUES
(201, 'G001', '06:30', '06:45'),
(201, 'G002', '09:00', '09:15'),
(202, 'G004', '14:00', '14:15'),
(203, 'G005', '16:30', '16:45'),
(204, 'G006', '18:30', '18:45'),
(205, 'G007', '20:00', '20:15');


