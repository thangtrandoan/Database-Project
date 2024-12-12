-- File: Procedure.sql

-- Thêm tài khoản mới
DELIMITER $$
CREATE PROCEDURE AddAccount(
    IN p_Username VARCHAR(15),
    IN p_Password VARCHAR(20),
    IN p_Email_Id VARCHAR(35),
    IN p_Address VARCHAR(50)
)
BEGIN
    INSERT INTO Account (Username, Password, Email_Id, Address)
    VALUES (p_Username, p_Password, p_Email_Id, p_Address);
END$$
DELIMITER ;

-- Cập nhật thông tin tàu
DELIMITER $$
CREATE PROCEDURE UpdateTrain(
    IN p_Train_No INT,
    IN p_Name VARCHAR(25),
    IN p_Seat_Sleeper INT,
    IN p_Seat_First_Class_AC INT,
    IN p_Seat_Second_Class_AC INT,
    IN p_Seat_Third_Class_AC INT,
    IN p_Wifi CHAR(6),
    IN p_Food CHAR(6),
    IN p_Run_On_Sunday CHAR(6),
    IN p_Run_On_Monday CHAR(6),
    IN p_Run_On_Tuesday CHAR(6),
    IN p_Run_On_Wednesday CHAR(6),
    IN p_Run_On_Thursday CHAR(6),
    IN p_Run_On_Friday CHAR(6),
    IN p_Run_On_Saturday CHAR(6)
)
BEGIN
    UPDATE Train
    SET Name = p_Name,
        Seat_Sleeper = p_Seat_Sleeper,
        Seat_First_Class_AC = p_Seat_First_Class_AC,
        Seat_Second_Class_AC = p_Seat_Second_Class_AC,
        Seat_Third_Class_AC = p_Seat_Third_Class_AC,
        Wifi = p_Wifi,
        Food = p_Food,
        Run_On_Sunday = p_Run_On_Sunday,
        Run_On_Monday = p_Run_On_Monday,
        Run_On_Tuesday = p_Run_On_Tuesday,
        Run_On_Wednesday = p_Run_On_Wednesday,
        Run_On_Thursday = p_Run_On_Thursday,
        Run_On_Friday = p_Run_On_Friday,
        Run_On_Saturday = p_Run_On_Saturday
    WHERE Train_No = p_Train_No;
END$$
DELIMITER ;

-- Đặt vé mới
DELIMITER $$
CREATE PROCEDURE BookTicket(
    IN p_Coach VARCHAR(2),
    IN p_Seat_No CHAR(2),
    IN p_Date_of_Journey DATE,
    IN p_Username VARCHAR(15),
    IN p_Train_No INT,
    IN p_First_Name VARCHAR(20),
    IN p_Last_Name VARCHAR(20),
    IN p_Gender CHAR(10),
    IN p_Phone_No CHAR(10),
    IN p_Age INT,
    IN p_Class VARCHAR(20)
)
BEGIN
    START TRANSACTION;
    -- Thêm vé mới
    INSERT INTO Ticket (Coach, Seat_No, Date_of_Journey, Username, Train_No)
    VALUES (p_Coach, p_Seat_No, p_Date_of_Journey, p_Username, p_Train_No);
    
    -- Lấy Ticket_No vừa thêm
    SET @Ticket_No = LAST_INSERT_ID();
    
    -- Thêm hành khách tương ứng
    INSERT INTO Passenger (First_Name, Last_Name, Gender, Phone_No, Ticket_No, Age, Class)
    VALUES (p_First_Name, p_Last_Name, p_Gender, p_Phone_No, @Ticket_No, p_Age, p_Class);
    
    COMMIT;
END$$
DELIMITER ;

-- Hủy vé
DELIMITER $$
CREATE PROCEDURE CancelTicket(
    IN p_Ticket_No INT
)
BEGIN
    START TRANSACTION;
    -- Xóa hành khách liên quan
    DELETE FROM Passenger WHERE Ticket_No = p_Ticket_No;
    
    -- Xóa vé
    DELETE FROM Ticket WHERE Ticket_No = p_Ticket_No;
    
    COMMIT;
END$$
DELIMITER ;