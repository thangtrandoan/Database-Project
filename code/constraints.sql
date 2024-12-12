-- Thêm khóa ngoại vào bảng Contact
ALTER TABLE Contact
ADD CONSTRAINT Contact_fk_Username
FOREIGN KEY (Username) REFERENCES Account (Username)
ON DELETE CASCADE;

-- Thêm khóa ngoại vào bảng Ticket
ALTER TABLE Ticket
ADD CONSTRAINT Ticket_fk_Username
FOREIGN KEY (Username) REFERENCES Account (Username)
ON DELETE CASCADE,
ADD CONSTRAINT Ticket_fk_Train_No
FOREIGN KEY (Train_No) REFERENCES Train (Train_No)
ON UPDATE CASCADE;

-- Thêm khóa ngoại vào bảng Passenger
ALTER TABLE Passenger
ADD CONSTRAINT Passenger_fk_Ticket_No
FOREIGN KEY (Ticket_No) REFERENCES Ticket (Ticket_No)
ON DELETE CASCADE;

-- Thêm khóa ngoại vào bảng Stoppage
ALTER TABLE Stoppage
ADD CONSTRAINT Stoppage_fk_Train_No
FOREIGN KEY (Train_No) REFERENCES Train (Train_No)
ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT Stoppage_fk_Station_Code
FOREIGN KEY (Station_Code) REFERENCES Station (Station_Code)
ON DELETE CASCADE ON UPDATE CASCADE;
