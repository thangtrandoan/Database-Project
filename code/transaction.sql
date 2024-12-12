-- File: transaction.sql

-- 1. Đặt vé mới và cập nhật hành khách
START TRANSACTION;

-- Thêm một vé mới vào bảng Ticket
INSERT INTO Ticket (Coach, Seat_No, Date_of_Journey, Username, Train_No)
VALUES ('D1', '40', '2024-12-17', 'nguoidung5', 202);

-- Giả sử Ticket_No vừa thêm là 8 (lấy bằng LAST_INSERT_ID())
-- Thêm một hành khách tương ứng vào bảng Passenger
INSERT INTO Passenger (First_Name, Last_Name, Gender, Phone_No, Ticket_No, Age, Class)
VALUES ('Nguyễn Văn', 'Hùng', 'Nam', '0912345678', LAST_INSERT_ID(), 25, 'Second Class AC');

-- Kiểm tra lỗi và quyết định commit hay rollback
ROLLBACK;

-- Kết thúc giao dịch

-- 2. Xóa một vé và các dữ liệu liên quan
START TRANSACTION;

-- Xóa hành khách liên quan trong bảng Passenger
DELETE FROM Passenger WHERE Ticket_No = 19;

-- Xóa vé khỏi bảng Ticket
DELETE FROM Ticket WHERE Ticket_No = 19;

-- Kiểm tra lỗi và quyết định commit hay rollback
ROLLBACK;

-- Kết thúc giao dịch

-- 3. Thay đổi thông tin tàu và các điểm dừng liên quan
START TRANSACTION;

-- Cập nhật thông tin tàu trong bảng Train
UPDATE Train
SET Name = 'Tàu SE1 Mới'
WHERE Train_No = 202;

-- Cập nhật các điểm dừng trong bảng Stoppage
UPDATE Stoppage
SET Arrival_Time = '12:00:00', Departure_Time = '12:15:00'
WHERE Train_No = 202 AND Station_Code = 'ST01';

-- Kiểm tra lỗi và quyết định commit hay rollback
ROLLBACK;

-- Kết thúc giao dịch

-- 4. Cập nhật lịch trình hành trình
START TRANSACTION;

-- Cập nhật thời gian đến tại ga tàu trong bảng Stoppage
UPDATE Stoppage
SET Arrival_Time = '14:30:00'
WHERE Train_No = 202 AND Station_Code = 'ST02';

-- Kiểm tra lỗi và quyết định commit hay rollback
ROLLBACK;

-- Kết thúc giao dịch

-- 5. Thêm thông tin tài khoản người dùng và liên hệ
START TRANSACTION;

-- Thêm một tài khoản mới vào bảng Account
INSERT INTO Account (Username, Password, Email_Id, Address)
VALUES ('nguoidung8', 'password123', 'nguoidung8@example.com', 'abxchjsdf');

-- Thêm thông tin liên hệ vào bảng Contact
INSERT INTO Contact (Username, Phone_No)
VALUES ('nguoidung8', '0987654321');

-- Kiểm tra lỗi và quyết định commit hay rollback
ROLLBACK;

-- Kết thúc giao dịch
