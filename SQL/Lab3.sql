CREATE TABLE employee(
	[EmployeeID] [int] IDENTITY(1,1) primary key,
	EmployeeName		CHAR(30),	
	Position			CHAR(30),
	CellNumber			char(30),
	EmailAddress		char(30),
);

CREATE TABLE  Customer(
	[CustomerID] [int] IDENTITY(1,1) primary key,
	CustomerName		CHAR(30),
	PhoneNumber			CHAR(15),
	EmailAddress		CHAR(30),
	CustomerAddress 	CHAR(50),
);

CREATE TABLE Service (
        [ServiceID] [int] IDENTITY(1,1) primary key,
	ServiceType				CHAR(15),
	ServiceDescription		CHAR(50)
	
);

CREATE TABLE serviceTicket (
	[ServiceTicketID] [int] IDENTITY(1,1) primary key,
	TicketBeginDate  char(10),
	TicketStatus   char(30),
	TicketStatusNotes char(100),
	Address char(50),
	Deadline char(50),
	EmployeeID		int not null,
	CustomerID		int not null,
	ServiceID		int not null,
	Foreign key(CustomerID) ReFerences Customer(CustomerID),
	Foreign key(ServiceID) ReFerences Service(ServiceID),
	Foreign key(EmployeeID) ReFerences Employee(EmployeeID)
);

CREATE TABLE TicketHistory (
	[TicketHistoryID] [int] IDENTITY(1,1) primary key,
	NoteTitle			char(20),
	NoteBody			char(200),
	ChangeDate 	    date,
	EmployeeID		int not null,
	ServiceTicketID			int not null,
	Foreign key(EmployeeID) ReFerences Employee(EmployeeID),
	Foreign key(ServiceTicketID) ReFerences ServiceTicket(ServiceTicketID)
	
);	

CREATE TABLE Storage(
[StorageID] [int] IDENTITY(1,1) primary key,
Location VARCHAR(50),
);

CREATE TABLE InventoryItem (
	[ItemID] [int] IDENTITY(1,1) primary key,
	ItemDescription 	char(50),
	Control char(10),
	InitialStorageDate char(10),
	StorageID               int not null,
	ServiceTicketID         int not null,
	Foreign key(StorageID) ReFerences Storage(StorageID),
	Foreign key(ServiceTicketID) ReFerences serviceTicket(ServiceTicketID)
); 

CREATE TABLE Equipment (
	[EquipmentID] [int] IDENTITY(1,1) primary key,
	Description 	char(30),
	Cost			float(10),
	PurchaseDate       date
); 

CREATE TABLE EquipmentService (
	[EquipmentServiceID] [int] IDENTITY(1,1) primary key,
	ServiceTicketID		int not null,
	EquipmentID		int not null,
	Foreign key(ServiceTicketID) ReFerences ServiceTicket(ServiceTicketID),
	Foreign key(EquipmentID) ReFerences Equipment(EquipmentID)
); 

CREATE TABLE InventoryService (
	[InventoryServiceID] [int] IDENTITY(1,1) primary key,
	ServiceTicketID		int not null,
	ItemID		int not null,
	Foreign key(serviceTicketID) ReFerences serviceTicket(serviceTicketID),
	Foreign key(ItemID) ReFerences InventoryItem(ItemID)
); 

CREATE TABLE AuctionEvent(
[AuctionEventID] [int] IDENTITY(1,1) primary key,
	InventoryAssginDate Date,
	EmployeeID		int not null,
	ServiceTicketID		int not null,
	ItemID          int not null,
	Foreign key(ServiceTicketID) ReFerences ServiceTicket(ServiceTicketID),
	Foreign key(EmployeeID) ReFerences Employee(EmployeeID),
	Foreign key(ItemID) ReFerences InventoryItem(ItemID)
	
	
)

CREATE TABLE ClientStatus (
	[ClientStatusID] [int] IDENTITY(1,1) primary key,
	CustomerName		char(30),
	Status          char(30),
); 

-- Next 4 creates are for AuctionLookAtEvent
Create Table Box (
BoxID int IDENTITY(1,1) primary key,
Small int,
Medium int,
Large int,
Art int,
SmallPads int,
LargePads int
);

Create Table Crew (
CrewID int IDENTITY(1,1) primary key,
CrewName varchar(255)
);

Create Table CrewMate (
CrewMateID int IDENTITY(1,1) primary key,
CrewMateName varchar(255),
CrewID int,
Foreign key(CrewID) References Crew(CrewID)
);

Create Table Truck (
TruckID int IDENTITY(1,1) primary key,
Truck2015 int,
Truck2011 int,
Cube int,
EnclosedTrailer int,
OpenTrailer int,
Van int
);

CREATE TABLE AuctionLookAtEvent (
AuctionLookAtID [int] IDENTITY(1,1) primary key,
TruckAccess				varchar(255),
SuppliesNeeded		varchar(255),
BoxID int,
CrewID int,
TruckID int,
Foreign key(BoxID) References Box(BoxID),
Foreign key(CrewID) References Crew(CrewID),
Foreign Key(TruckID) References Truck(TruckID)
);

--Intial Contact Table
CREATE TABLE InitialInfo(
InitialInfoID Numeric(3) primary key,
FirstName VARCHAR(50),
LastName VARCHAR(50),
PhoneType VARCHAR(50),
PhoneNumber VARCHAR(50),
Email VARCHAR(50),
PreferredContact VARCHAR(50),
InitialDate VARCHAR(50),
Deadline VARCHAR(50),
HearAboutUs VARCHAR(50),
RequestedService VARCHAR(50),
Street VARCHAR(50),
City VARCHAR(50),
State VARCHAR(50),
ZipCode Numeric(10),
);

--Move Assessment Tables 
CREATE TABLE MoveAssessment(
MoveID  int IDENTITY(1,1) primary key,
CustomerID int FOREIGN KEY REFERENCES Customer(CustomerID),
);

CREATE TABLE Preliminary(
PreliminaryID Numeric(3)  IDENTITY(1,1) primary key,
MoveOutDate VARCHAR(50),
MovingWindow VARCHAR(50),
MLSListing VARCHAR(50),
SendPhotos VARCHAR(50),
AddOn VARCHAR(50),
AuctionService VARCHAR(50),
Street VARCHAR(50),
City VARCHAR(50),
State VARCHAR(50),
ZipCode VARCHAR(10),
MoveID int FOREIGN KEY REFERENCES MoveAssessment(MoveID),
);

CREATE TABLE Room(
RoomID Numeric(3)  IDENTITY(1,1) primary key,
RoomType VARCHAR(50),
Furniture VARCHAR(100),
FloorLevel VARCHAR(50),
MoveID int FOREIGN KEY REFERENCES MoveAssessment(MoveID),
);

CREATE TABLE BoxSize(
BoxSizeID Numeric(3) primary key,
Small int,
Medium int,
Large int,
Art int,
Wardrobe int,
);

CREATE TABLE SpecificInfo(
SpecificInfoID Numeric(3)  IDENTITY(1,1) primary key,
HomeType VARCHAR(50),
TruckAccess VARCHAR(50),
LoadDoorDistance VARCHAR(50),
Steps VARCHAR(50),
SpecialEquip VARCHAR(50),
TruckType VARCHAR(50),
MoveID int FOREIGN KEY REFERENCES MoveAssessment(MoveID),
);

CREATE TABLE Cost(
CostID Numeric(3) IDENTITY(1,1) primary key,
MoveEst VARCHAR(50),
FixedRate VARCHAR(50),
ParkFee VARCHAR(50),
MoveID int FOREIGN KEY REFERENCES MoveAssessment(MoveID),
);



SET IDENTITY_INSERT [dbo].[employee] ON 
GO

  insert [dbo].[employee] ([EmployeeID],[EmployeeName],[position],[cellnumber],[emailaddress]) values('1','Gogo','AuctionManager','5401234567','123@gmail.com');
  insert [dbo].[employee] ([EmployeeID],[EmployeeName],[position],[cellnumber],[emailaddress]) values('2','Messi','MoveManager','5401234567','123@gmail.com');
  insert [dbo].[employee] ([EmployeeID],[EmployeeName],[position],[cellnumber],[emailaddress]) values('3','Catty','AuctionManager','5401234567','1234543@gmail.com');
  insert [dbo].[employee] ([EmployeeID],[EmployeeName],[position],[cellnumber],[emailaddress]) values('4','Cindy','clerk','5401234567','123hgf@gmail.com');
  insert [dbo].[employee] ([EmployeeID],[EmployeeName],[position],[cellnumber],[emailaddress]) values('5','Eric','AuctionManager','5401234567','123ht@gmail.com');
  insert [dbo].[employee] ([EmployeeID],[EmployeeName],[position],[cellnumber],[emailaddress]) values('6','Adam','MovingManager','5401234567','123qqq@gmail.com');
  insert [dbo].[employee] ([EmployeeID],[EmployeeName],[position],[cellnumber],[emailaddress]) values('7','Rui','AuctionManager','5401234567','123ttt@gmail.com');
  insert [dbo].[employee] ([EmployeeID],[EmployeeName],[position],[cellnumber],[emailaddress]) values('8','Bqxxxx','clerk','5401234567','123ooo@gmail.com');
  insert [dbo].[employee] ([EmployeeID],[EmployeeName],[position],[cellnumber],[emailaddress]) values('9','Sam','clerk','5401234567','123ppp@gmail.com');
 
SET IDENTITY_INSERT [dbo].[employee] OFF
GO 

  
SET IDENTITY_INSERT [dbo].[Customer] ON
GO

  insert [dbo].[Customer] ([CustomerID],[CustomerName],[PhoneNumber],[EmailAddress],[CustomerAddress])Values ('1', 'Jenny', '5407467845', 'Jenny@jmu.edu', '801 S Main St' );
  insert [dbo].[Customer] ([CustomerID],[CustomerName],[PhoneNumber],[EmailAddress],[CustomerAddress])VALUES ('2', 'Tony', '5402548716',  'Tony@jmu.edu', '802 S Main St' );
  insert [dbo].[Customer] ([CustomerID],[CustomerName],[PhoneNumber],[EmailAddress],[CustomerAddress])Values ('3', 'William', '5401238434', 'William@jmu.edu', '803 S Main St' );
  insert [dbo].[Customer] ([CustomerID],[CustomerName],[PhoneNumber],[EmailAddress],[CustomerAddress])Values ('4', 'Kobe', '5401238767', 'Kobe@jmu.edu', '804 S Main St' );
  insert [dbo].[Customer] ([CustomerID],[CustomerName],[PhoneNumber],[EmailAddress],[CustomerAddress])Values ('5', 'Jocab', '5401238432', 'Jocab@jmu.edu', '805 S Main St' );
  insert [dbo].[Customer] ([CustomerID],[CustomerName],[PhoneNumber],[EmailAddress],[CustomerAddress])Values ('6', 'Huang', '5401288475', 'Huang@jmu.edu', '806 S Main St' );
  insert [dbo].[Customer] ([CustomerID],[CustomerName],[PhoneNumber],[EmailAddress],[CustomerAddress])Values ('7', 'Tran', '5401238111', 'Tran@jmu.edu', '807 S Main St' );
  insert [dbo].[Customer] ([CustomerID],[CustomerName],[PhoneNumber],[EmailAddress],[CustomerAddress])Values ('8', 'Peter', '5401238222', 'Peter@jmu.edu', '808 S Main St' );
  insert [dbo].[Customer] ([CustomerID],[CustomerName],[PhoneNumber],[EmailAddress],[CustomerAddress])Values ('9', 'Tom', '5401238333', 'Tom@jmu.edu', '809 S Main St' );
  
SET IDENTITY_INSERT [dbo].[Customer] off
GO

  
SET IDENTITY_INSERT [dbo].[Service] ON 
GO  
  insert [dbo].[Service] ([ServiceID],[ServiceType],[ServiceDescription]) Values('1','Auction','Sell items');
  insert [dbo].[Service] ([ServiceID],[ServiceType],[ServiceDescription]) Values('2','Move','Move items');
  insert [dbo].[Service] ([ServiceID],[ServiceType],[ServiceDescription]) Values('3','Appraisal','Appraise items');

SET IDENTITY_INSERT [dbo].[Service] OFF
GO  


SET IDENTITY_INSERT [dbo].[serviceTicket] ON 
GO
  
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketStatusNotes],[TicketBeginDate], [Address], [Deadline], [EmployeeID],[CustomerID],[ServiceID]) values('1','Completion', 'customer was very happy','1/1/2021', '1452 Bradley Drive Harrisonburg VA 22801', '2/5/2021','1','1','1');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketStatusNotes],[TicketBeginDate],[Address], [Deadline],[EmployeeID],[CustomerID],[ServiceID]) values('2','Completion','customer was very happy','1/2/2021', '101 Wish Lane Harrisonburg VA 22801', '2/10/2021','2','1','2');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketStatusNotes],[TicketBeginDate],[Address], [Deadline],[EmployeeID],[CustomerID],[ServiceID]) values('3','Completion','customer was very happy','1/3/2021', '530 Christy Lane Harrisonburg VA 22801', '2/3/2021','3','2','1');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketStatusNotes],[TicketBeginDate],[Address], [Deadline],[EmployeeID],[CustomerID],[ServiceID]) values('4','Completion','customer was very happy','1/4/2021', '753 Cricket Drive Waynesboro VA 22802', '2/12/2021','4','2','2');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketStatusNotes],[TicketBeginDate],[Address], [Deadline],[EmployeeID],[CustomerID],[ServiceID]) values('5','InitiatingContract','Hasnt responded to emails or calls','1/5/2021','8732 Green Drive Harrisonburg VA 22801', '2/9/2021','5','3','1');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketStatusNotes],[TicketBeginDate],[Address], [Deadline],[EmployeeID],[CustomerID],[ServiceID]) values('6','InitiatingContract','Waiting on payment','1/6/2021', '1523 Hollow Path Waynesboro VA 22802', '1/22/2021','6','4','1');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketStatusNotes],[TicketBeginDate],[Address], [Deadline],[EmployeeID],[CustomerID],[ServiceID]) values('7','InitiatingContract','Waiting on payment','1/7/2021', '202 Pantheon Lane Harrisonburg VA 22801', '1/30/2021','7','5','1');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketStatusNotes],[TicketBeginDate],[Address], [Deadline],[EmployeeID],[CustomerID],[ServiceID]) values('8','InitiatingContract','customer hasnt responded back','1/8/2021', '801 Champ Street Harrisonburg VA 22801', '2/4/2021','8','6','1');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketStatusNotes],[TicketBeginDate],[Address], [Deadline],[EmployeeID],[CustomerID],[ServiceID]) values('9','InitiatingContract','need to move items','1/9/2021', '924 Sleepy Street Harrisonburg VA 22801', '2/9/2021','9','7','2');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketStatusNotes],[TicketBeginDate],[Address], [Deadline],[EmployeeID],[CustomerID],[ServiceID]) values('10','InitiatingContract','Waiting on customers response','1/10/2021', '451 Demaskus Drive Harrisonburg VA 22801', '2/10/2021','1','8','2');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketStatusNotes],[TicketBeginDate],[Address], [Deadline],[EmployeeID],[CustomerID],[ServiceID]) values('11','InitiatingContract','Need to email for clarification','1/10/2021', '444 Lucky Ave Waynesboro VA 22804', '2/10/2021','2','9','2');
  
SET IDENTITY_INSERT [dbo].[serviceTicket] Off 
GO

SET IDENTITY_INSERT [dbo].[TicketHistory] ON 
GO 
  
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('1','Sign Contract','','1/2/2021','3','1');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('2','Moving','','1/20/2021','2','1');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('3','Completion','','2/10/2021','1','1');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('4','Sign Contract','','1/4/2021','6','2');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('5','Auction','','1/18/2021','6','2');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('6','Completion','','2/11/2021','6','2');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('7','Sign Contract','','1/6/2021','9','3');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('8','Moving','','1/12/2021','8','3');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('9','Completion','','2/9/2021','7','3');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('10','Sign Contract','','1/10/2021','8','4');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('11','Auction','','2/4/2021','8','4');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('12','Completion','','2/6/2021','8','4');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('13','Sign Contract','','1/10/2021','6','5');

  
SET IDENTITY_INSERT [dbo].[TicketHistory] Off 
GO  

SET IDENTITY_INSERT [dbo].[Storage] ON 
GO  
  insert [dbo].[Storage] ([StorageID],[Location]) Values('1','Unit 1');
  insert [dbo].[Storage] ([StorageID],[Location]) Values('2','Unit 2');
  insert [dbo].[Storage] ([StorageID],[Location]) Values('3','Unit 3');
  insert [dbo].[Storage] ([StorageID],[Location]) Values('4','Unit 4');
  

SET IDENTITY_INSERT [dbo].[Storage] OFF
GO  

SET IDENTITY_INSERT [dbo].[Inventoryitem] ON 
GO  
  
  
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[Control], [InitialStorageDate], [StorageID], [ServiceTicketID]) values('1','books','default','2019-01-01', '1', '1');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[Control], [InitialStorageDate], [StorageID], [ServiceTicketID]) values('2','chairs','default','2020-01-07', '1', '2');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[Control], [InitialStorageDate], [StorageID], [ServiceTicketID]) values('3','House','default', '2016-09-01', '1', '3');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[Control], [InitialStorageDate], [StorageID], [ServiceTicketID]) values('4','Bed','default', '2018-03-06', '2', '4');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[Control], [InitialStorageDate], [StorageID], [ServiceTicketID]) values('5','Mirror','default','2019-08-08', '2', '5');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[Control], [InitialStorageDate], [StorageID], [ServiceTicketID]) values('6','Car','default','2020-02-05', '3', '6');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[Control], [InitialStorageDate], [StorageID], [ServiceTicketID]) values('7','Paper box','default','2019-08-01', '3', '7');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[Control], [InitialStorageDate], [StorageID], [ServiceTicketID]) values('8','Desk','default','2021-02-01', '3', '8');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[Control], [InitialStorageDate], [StorageID], [ServiceTicketID]) values('9','Clothes','default','2014-01-11', '4', '9');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[Control], [InitialStorageDate], [StorageID], [ServiceTicketID]) values('10','Chairs','default','2010-06-01', '4', '10');
  
SET IDENTITY_INSERT [dbo].[Inventoryitem] Off 
GO 

SET IDENTITY_INSERT [dbo].[Equipment] ON 
GO  
  
  
  insert [dbo].[Equipment] ([EquipmentID],[Description],[Cost],[PurchaseDate]) values('1','Truck','50','2/11/2020');
  insert [dbo].[Equipment] ([EquipmentID],[Description],[Cost],[PurchaseDate]) values('2','Lift','20','2/13/2020');
  insert [dbo].[Equipment] ([EquipmentID],[Description],[Cost],[PurchaseDate]) values('3','Mini-fork','35','2/14/2020');
  
SET IDENTITY_INSERT [dbo].[Equipment] Off 
GO

SET IDENTITY_INSERT [dbo].[EquipmentService] ON 
GO  
  
  insert [dbo].[EquipmentService] ([EquipmentServiceID],[ServiceTicketID],[EquipmentID]) values('1','1','1');
  insert [dbo].[EquipmentService] ([EquipmentServiceID],[ServiceTicketID],[EquipmentID]) values('2','2','2');
  insert [dbo].[EquipmentService] ([EquipmentServiceID],[ServiceTicketID],[EquipmentID]) values('3','3','3');
  insert [dbo].[EquipmentService] ([EquipmentServiceID],[ServiceTicketID],[EquipmentID]) values('4','4','1');
  insert [dbo].[EquipmentService] ([EquipmentServiceID],[ServiceTicketID],[EquipmentID]) values('5','5','1');
  insert [dbo].[EquipmentService] ([EquipmentServiceID],[ServiceTicketID],[EquipmentID]) values('6','6','1');
  insert [dbo].[EquipmentService] ([EquipmentServiceID],[ServiceTicketID],[EquipmentID]) values('7','7','1');
  insert [dbo].[EquipmentService] ([EquipmentServiceID],[ServiceTicketID],[EquipmentID]) values('8','8','2');
  insert [dbo].[EquipmentService] ([EquipmentServiceID],[ServiceTicketID],[EquipmentID]) values('9','9','2');
  insert [dbo].[EquipmentService] ([EquipmentServiceID],[ServiceTicketID],[EquipmentID]) values('10','10','2');
  insert [dbo].[EquipmentService] ([EquipmentServiceID],[ServiceTicketID],[EquipmentID]) values('11','11','3');
 
  

SET IDENTITY_INSERT [dbo].[EquipmentService] Off
Go  

SET IDENTITY_INSERT [dbo].[InventoryService] ON 
GO  
  
  insert [dbo].[InventoryService] ([InventoryServiceID],[ServiceTicketID],[ItemID]) values('1','1','1');
  insert [dbo].[InventoryService] ([InventoryServiceID],[ServiceTicketID],[ItemID]) values('2','2','2');
  insert [dbo].[InventoryService] ([InventoryServiceID],[ServiceTicketID],[ItemID]) values('3','3','3');
  insert [dbo].[InventoryService] ([InventoryServiceID],[ServiceTicketID],[ItemID]) values('4','4','4');
  insert [dbo].[InventoryService] ([InventoryServiceID],[ServiceTicketID],[ItemID]) values('5','5','5');
  insert [dbo].[InventoryService] ([InventoryServiceID],[ServiceTicketID],[ItemID]) values('6','6','6');
  insert [dbo].[InventoryService] ([InventoryServiceID],[ServiceTicketID],[ItemID]) values('7','7','7');
  insert [dbo].[InventoryService] ([InventoryServiceID],[ServiceTicketID],[ItemID]) values('8','8','8');
  insert [dbo].[InventoryService] ([InventoryServiceID],[ServiceTicketID],[ItemID]) values('9','9','9');
  insert [dbo].[InventoryService] ([InventoryServiceID],[ServiceTicketID],[ItemID]) values('10','10','10');
  

SET IDENTITY_INSERT [dbo].[InventoryService] Off
Go  

SET IDENTITY_INSERT [dbo].[ClientStatus] ON 
GO  
  
  insert [dbo].[ClientStatus] ([ClientStatusID],[CustomerName],[Status]) values('1','Jenny','Waiting for call back');
  insert [dbo].[ClientStatus] ([ClientStatusID],[CustomerName],[Status]) values('2','Tony','Waiting on payment');
  insert [dbo].[ClientStatus] ([ClientStatusID],[CustomerName],[Status]) values('3','William','Waiting Event occur');
  insert [dbo].[ClientStatus] ([ClientStatusID],[CustomerName],[Status]) values('4','Kobe','Waiting for call back');

SET IDENTITY_INSERT [dbo].[ClientStatus] Off
Go  

Alter Table Customer ADD ContactWay char(50);
Alter Table Customer ADD HearAbout  char(50);

insert [dbo].[Crew] ([CrewName]) values('Team1');
insert [dbo].[Crew] ([CrewName]) values('Team2');
insert [dbo].[Crew] ([CrewName]) values('Team3');
insert [dbo].[Crew] ([CrewName]) values('Team4');
insert [dbo].[Crew] ([CrewName]) values('Team5');
insert [dbo].[Crew] ([CrewName]) values('Team6');
insert [dbo].[Crew] ([CrewName]) values('Team7');
insert [dbo].[Crew] ([CrewName]) values('Team8');
insert [dbo].[Crew] ([CrewName]) values('Team9');
insert [dbo].[Crew] ([CrewName]) values('Team10');
