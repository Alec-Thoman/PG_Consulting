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
--Intial Contact Table
CREATE TABLE InitialInfo(
[InitialInfoID] [int] IDENTITY(1,1) primary key,
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

CREATE TABLE Notes(
NotesID int primary key ,
NoteBody varchar(150),
InitialInfoID int FOREIGN KEY REFERENCES InitialInfo(InitialInfoID)
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
	InitialInfoID		int not null,
	ServiceID		int not null,
	Foreign key(InitialInfoID) ReFerences InitialInfo(InitialInfoID),
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
Date varchar(255),
InitialInfoID int,
BoxID int,
CrewID int,
TruckID int,
Foreign key(InitialInfoID) References InitialInfo(InitialInfoID),
Foreign key(BoxID) References Box(BoxID),
Foreign key(CrewID) References Crew(CrewID),
Foreign Key(TruckID) References Truck(TruckID)
);



--Move Assessment Tables 
CREATE TABLE MoveAssessment(
MoveID  int IDENTITY(1,1) primary key,
InitialInfoID int FOREIGN KEY REFERENCES InitialInfo(InitialInfoID),
);

CREATE TABLE Preliminary(
PreliminaryID Numeric(3)  IDENTITY(1,1) primary key,
DateCreated VARCHAR(50),
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

--Auction Assessment Tables

CREATE TABLE AuctionAssessment(
AuctionID  int IDENTITY(1,1) primary key,
InitialInfoID Int FOREIGN KEY REFERENCES InitialInfo(InitialInfoID),
);

CREATE TABLE Assessment(
AssessmentID int IDENTITY(1,1) primary key,
DateCreated VARCHAR(50),
ItemsSelling VARCHAR(50),
WhyService VARCHAR(50),
Deadline VARCHAR(50),
Scheduled VARCHAR(50),
AskedPhotos VARCHAR(50),
AskedItemList VARCHAR(50),
AdtlService VARCHAR(50),
AuctionID Int FOREIGN KEY REFERENCES AuctionAssessment(AuctionID),
);

CREATE TABLE OtherInfo (
OtherInfoID int IDENTITY(1,1) primary key,
HomeType VARCHAR(50),
TruckAccess VARCHAR(50),
LoadDoorDistance VARCHAR(50),
Steps VARCHAR(50),
SpecialEquip VARCHAR(50),
TruckType VARCHAR(50),
AuctionID Int FOREIGN KEY REFERENCES AuctionAssessment(AuctionID),
);

CREATE TABLE Boxes(
BoxesID int IDENTITY(1,1) primary key,
Small int,
Medium int,
Large int,
Art int,
SmallPad int,
LargePad int,
);

CREATE TABLE Fees(
FeesID int IDENTITY(1,1) primary key,
PickUp VARCHAR(50),
ConsignmentRate VARCHAR(50),
TrashFee VARCHAR(50),
AdditionalFee VARCHAR(50),
AuctionID int FOREIGN KEY REFERENCES AuctionAssessment(AuctionID),
);



SET IDENTITY_INSERT [dbo].[employee] ON 
GO
  insert [dbo].[employee] ([EmployeeID],[EmployeeName],[position],[cellnumber],[emailaddress]) values('1','Gogo','AuctionManager','5401234567','1234@gmail.com');
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
SET IDENTITY_INSERT [dbo].[InitialInfo] ON
GO

insert [dbo].[InitialInfo] ([InitialInfoID],[FirstName],[LastName],[PhoneType],[PhoneNumber],[Email],[PreferredContact], [InitialDate],[Deadline],[HearAboutUs],[RequestedService],[Street],[City],[State],[ZipCode])Values ('1', 'Jenny', 'Harper', 'Home Phone', '5407467845', 'Jenny@jmu.edu', 'Email', '01/05/2021', '01/30/2021', 'Through a Friend', 'Auction', '801 S Main St', 'Harrisonburg', 'VA', '22801');

insert [dbo].[InitialInfo] ([InitialInfoID],[FirstName],[LastName],[PhoneType],[PhoneNumber],[Email],[PreferredContact], [InitialDate],[Deadline],[HearAboutUs],[RequestedService],[Street],[City],[State],[ZipCode])Values ('2', 'Tony', 'Edwards', 'Home Phone', '5402548716', 'Tony@jmu.edu', 'Email', '02/15/2021', '03/30/2021', 'Facebook Ad', 'Move', '8910 Hollow Lane', 'Harrisonburg', 'VA', '22801');

insert [dbo].[InitialInfo] ([InitialInfoID],[FirstName],[LastName],[PhoneType],[PhoneNumber],[Email],[PreferredContact], [InitialDate],[Deadline],[HearAboutUs],[RequestedService],[Street],[City],[State],[ZipCode])Values ('3', 'William', 'Harris', 'Mobile Phone', '3029182930', 'William@jmu.edu', 'Text', '01/11/2021', '01/26/2021', 'Instagram Ad', 'Auction', '102 Downturn Drive', 'Harrisonburg', 'VA', '22801');

insert [dbo].[InitialInfo] ([InitialInfoID],[FirstName],[LastName],[PhoneType],[PhoneNumber],[Email],[PreferredContact], [InitialDate],[Deadline],[HearAboutUs],[RequestedService],[Street],[City],[State],[ZipCode])Values ('4', 'Kobe', 'Geoffery', 'Mobile Phone', '5401238767', 'Kobe@jmu.edu', 'Text', '12/11/2020', '01/15/2021', 'Flyer', 'Move', '50 Clark Blvd', 'Harrisonburg', 'VA', '22801');

insert [dbo].[InitialInfo] ([InitialInfoID],[FirstName],[LastName],[PhoneType],[PhoneNumber],[Email],[PreferredContact], [InitialDate],[Deadline],[HearAboutUs],[RequestedService],[Street],[City],[State],[ZipCode])Values ('5', 'Jocab', 'Arnolds', 'Home Phone', '5401238432', 'Jocab@jmu.edu', 'By Home Phone', '12/05/2020', '01/16/2021', 'Flyer', 'Move', '321 Rainbow Ave', 'Rockingham', 'VA', '22801');

insert [dbo].[InitialInfo] ([InitialInfoID],[FirstName],[LastName],[PhoneType],[PhoneNumber],[Email],[PreferredContact], [InitialDate],[Deadline],[HearAboutUs],[RequestedService],[Street],[City],[State],[ZipCode])Values ('6', 'Huang', 'Chen', 'Home Phone', '5401288475', 'Huang@jmu.edu', 'By Mobile Phone', '11/15/2020', '12/21/2021', 'Facebook', 'Auction', '981 Tether Blvd', 'Rockingham', 'VA', '28301');

insert [dbo].[InitialInfo] ([InitialInfoID],[FirstName],[LastName],[PhoneType],[PhoneNumber],[Email],[PreferredContact], [InitialDate],[Deadline],[HearAboutUs],[RequestedService],[Street],[City],[State],[ZipCode])Values ('7', 'Tran', 'Huang', 'Mobile Phone', '5401238111', 'Huang@jmu.edu', 'By Mobile Phone', '11/04/2020', '12/10/2021', 'Facebook', 'Auction', '651 Charles St', 'Rockingham', 'VA', '28301');

insert [dbo].[InitialInfo] ([InitialInfoID],[FirstName],[LastName],[PhoneType],[PhoneNumber],[Email],[PreferredContact], [InitialDate],[Deadline],[HearAboutUs],[RequestedService],[Street],[City],[State],[ZipCode])Values ('8', 'Peter', 'Rhee', 'Mobile Phone', '5401238111', 'Huang@jmu.edu', 'By Mobile Phone', '11/04/2020', '12/10/2021', 'Flyer', 'Move', '952 Sunny St', 'Rockingham', 'VA', '28501');

insert [dbo].[InitialInfo] ([InitialInfoID],[FirstName],[LastName],[PhoneType],[PhoneNumber],[Email],[PreferredContact], [InitialDate],[Deadline],[HearAboutUs],[RequestedService],[Street],[City],[State],[ZipCode])Values ('9', 'Tom', 'Roberts', 'Home Phone', '5401238333', 'Tom@jmu.edu', 'By Mobile Phone', '11/08/2020', '12/11/2021', 'Flyer', 'Move', '891 Galavan St', 'Gainesville', 'VA', '20112');


SET IDENTITY_INSERT [dbo].[InitialInfo] off
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
  
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketStatusNotes],[TicketBeginDate], [Address], [Deadline], [EmployeeID],[InitialInfoID],[ServiceID]) values('1','Completion', 'customer was very happy','01/01/2021', '1452 Bradley Drive Harrisonburg VA 22801', '02/05/2021','1','1','1');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketStatusNotes],[TicketBeginDate],[Address], [Deadline],[EmployeeID],[InitialInfoID],[ServiceID]) values('2','Completion','customer was very happy','01/02/2021', '101 Wish Lane Harrisonburg VA 22801', '02/10/2021','2','1','2');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketStatusNotes],[TicketBeginDate],[Address], [Deadline],[EmployeeID],[InitialInfoID],[ServiceID]) values('3','Completion','customer was very happy','01/03/2021', '530 Christy Lane Harrisonburg VA 22801', '02/03/2021','3','2','1');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketStatusNotes],[TicketBeginDate],[Address], [Deadline],[EmployeeID],[InitialInfoID],[ServiceID]) values('4','Completion','customer was very happy','01/04/2021', '753 Cricket Drive Waynesboro VA 22802', '02/12/2021','4','2','2');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketStatusNotes],[TicketBeginDate],[Address], [Deadline],[EmployeeID],[InitialInfoID],[ServiceID]) values('5','InitiatingContract','Hasnt responded to emails or calls','01/05/2021','8732 Green Drive Harrisonburg VA 22801', '02/09/2021','5','3','1');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketStatusNotes],[TicketBeginDate],[Address], [Deadline],[EmployeeID],[InitialInfoID],[ServiceID]) values('6','InitiatingContract','Waiting on payment','01/06/2021', '1523 Hollow Path Waynesboro VA 22802', '01/22/2021','6','4','1');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketStatusNotes],[TicketBeginDate],[Address], [Deadline],[EmployeeID],[InitialInfoID],[ServiceID]) values('7','InitiatingContract','Waiting on payment','01/07/2021', '202 Pantheon Lane Harrisonburg VA 22801', '01/30/2021','7','5','1');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketStatusNotes],[TicketBeginDate],[Address], [Deadline],[EmployeeID],[InitialInfoID],[ServiceID]) values('8','InitiatingContract','customer hasnt responded back','01/08/2021', '801 Champ Street Harrisonburg VA 22801', '02/04/2021','8','6','1');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketStatusNotes],[TicketBeginDate],[Address], [Deadline],[EmployeeID],[InitialInfoID],[ServiceID]) values('9','InitiatingContract','need to move items','01/09/2021', '924 Sleepy Street Harrisonburg VA 22801', '02/09/2021','9','7','2');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketStatusNotes],[TicketBeginDate],[Address], [Deadline],[EmployeeID],[InitialInfoID],[ServiceID]) values('10','InitiatingContract','Waiting on customers response','01/10/2021', '451 Demaskus Drive Harrisonburg VA 22801', '02/10/2021','1','8','2');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketStatusNotes],[TicketBeginDate],[Address], [Deadline],[EmployeeID],[InitialInfoID],[ServiceID]) values('11','InitiatingContract','Need to email for clarification','01/10/2021', '444 Lucky Ave Waynesboro VA 22804', '02/10/2021','2','9','2');
  
SET IDENTITY_INSERT [dbo].[serviceTicket] Off 
GO

SET IDENTITY_INSERT [dbo].[TicketHistory] ON 
GO 
  
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('1','Sign Contract','','01/02/2021','3','1');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('2','Moving','','01/20/2021','2','1');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('3','Completion','','02/10/2021','1','1');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('4','Sign Contract','','01/04/2021','6','2');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('5','Auction','','01/18/2021','6','2');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('6','Completion','','2/11/2021','6','2');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('7','Sign Contract','','01/06/2021','9','3');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('8','Moving','','01/12/2021','8','3');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('9','Completion','','02/09/2021','7','3');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('10','Sign Contract','','01/10/2021','8','4');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('11','Auction','','02/04/2021','8','4');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('12','Completion','','02/06/2021','8','4');
  insert [dbo].[TicketHistory] ([TicketHistoryID],[NoteTitle],[NoteBody],[ChangeDate],[EmployeeID],[serviceTicketID]) values('13','Sign Contract','','01/10/2021','6','5');

  
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
  
  
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[Control], [InitialStorageDate], [StorageID], [ServiceTicketID]) values('1','books','default','01/01/2019', '1', '1');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[Control], [InitialStorageDate], [StorageID], [ServiceTicketID]) values('2','chairs','default','01/07/2020', '1', '2');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[Control], [InitialStorageDate], [StorageID], [ServiceTicketID]) values('3','House','default', '01/09/2016', '1', '3');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[Control], [InitialStorageDate], [StorageID], [ServiceTicketID]) values('4','Bed','default', '03/06/2018', '2', '4');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[Control], [InitialStorageDate], [StorageID], [ServiceTicketID]) values('5','Mirror','default','08/08/2019', '2', '5');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[Control], [InitialStorageDate], [StorageID], [ServiceTicketID]) values('6','Car','default','02/05/2019', '3', '6');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[Control], [InitialStorageDate], [StorageID], [ServiceTicketID]) values('7','Paper box','default','08/01/2018', '3', '7');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[Control], [InitialStorageDate], [StorageID], [ServiceTicketID]) values('8','Desk','default','02/01/2021', '3', '8');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[Control], [InitialStorageDate], [StorageID], [ServiceTicketID]) values('9','Clothes','default','01/11/2021', '4', '9');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[Control], [InitialStorageDate], [StorageID], [ServiceTicketID]) values('10','Chairs','default','03/01/2021', '4', '10');
  
SET IDENTITY_INSERT [dbo].[Inventoryitem] Off 
GO 

SET IDENTITY_INSERT [dbo].[Equipment] ON 
GO  
  
  
  insert [dbo].[Equipment] ([EquipmentID],[Description],[Cost],[PurchaseDate]) values('1','Truck','50','02/11/2020');
  insert [dbo].[Equipment] ([EquipmentID],[Description],[Cost],[PurchaseDate]) values('2','Lift','20','02/13/2020');
  insert [dbo].[Equipment] ([EquipmentID],[Description],[Cost],[PurchaseDate]) values('3','Mini-fork','35','02/14/2020');
  
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

Create table AppraisalServiceOrder(
	[AppraisalServiceOrderID] [int] IDENTITY(1,1) primary key,
	Deadline varchar(10),
	AppraisalSize varchar(200),
	Inventory varchar(500)
);

Create table AppraisalPurpose(
	[AppraisalPurposeID] [int] IDENTITY(1,1) primary key,
	Purpose varchar(200),
	AppraisalServiceOrderID int,
	Foreign Key(AppraisalServiceOrderID) References AppraisalServiceOrder(AppraisalServiceOrderID)
);

Create table AppraisalServiceInvoice(
	[AppraisalServiceInvoiceID] [int] IDENTITY(1,1) primary key,
	ContactName varchar(100),
	AppraisalName varchar(100),
	SendAppraisalAddress varchar(300),
	AppraisalDate varchar(20),
	AppraisalCost varchar(20),
	PaymentSection varchar(700),
	AppraisalServiceOrderID int,
	Foreign Key(AppraisalServiceOrderID) References AppraisalServiceOrder(AppraisalServiceOrderID)
);

--USE [Lab3]
GO
/****** Object:  StoredProcedure [dbo].[sp_BatchInsert]    Script Date: 4/10/2021 9:24:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_BatchInsert] (@CrewMateName VARCHAR(100), @CrewID int) 
AS 
BEGIN 
            INSERT INTO CrewMate VALUES ( @CrewMateName, @CrewID); 
END

 -- inserts for appraisal report (test data)
 insert [dbo].AppraisalServiceOrder([Deadline],[AppraisalSize],[Inventory]) values ('07/04/2022', 'Small', 'One table');
 
 insert [dbo].AppraisalServiceInvoice([ContactName],[AppraisalName],[SendAppraisalAddress],[AppraisalDate],[AppraisalCost],[PaymentSection],[AppraisalServiceOrderID]) 
 values('Alec','Redwood Table','alec@gmail.com','03/12/2022','$500.00', 'Cleaning, Estimate fees', 1);

 insert [dbo].AppraisalServiceOrder([Deadline],[AppraisalSize],[Inventory]) values ('04/20/2021', 'Small', 'One table');
 
 insert [dbo].AppraisalServiceInvoice([ContactName],[AppraisalName],[SendAppraisalAddress],[AppraisalDate],[AppraisalCost],[PaymentSection],[AppraisalServiceOrderID]) 
 values('Brian','Antique Table','brian@gmail.com','04/21/2021','30.00', 'Cleaning, Estimate fees', 2);

 insert [dbo].AppraisalServiceOrder([Deadline],[AppraisalSize],[Inventory]) values ('05/01/2021', 'Small', 'One PC');
 
 insert [dbo].AppraisalServiceInvoice([ContactName],[AppraisalName],[SendAppraisalAddress],[AppraisalDate],[AppraisalCost],[PaymentSection],[AppraisalServiceOrderID]) 
 values('Briana','Windows 10 PC','briana@gmail.com','04/24/2021','$100.00', 'Minor PC upgrades needed', 3);

 insert [dbo].AppraisalServiceOrder([Deadline],[AppraisalSize],[Inventory]) values ('04/29/2021', 'Large', 'Three Shelves');
 
 insert [dbo].AppraisalServiceInvoice([ContactName],[AppraisalName],[SendAppraisalAddress],[AppraisalDate],[AppraisalCost],[PaymentSection],[AppraisalServiceOrderID]) 
 values('Jacob','Antique Shelf','jacob@gmail.com','08/12/2021','$350.00', 'Cleaning, Estimate fees', 4);

 -- inserts for move assessment report (test data)
 insert [dbo].MoveAssessment([InitialInfoID]) values (1);
 insert [dbo].MoveAssessment([InitialInfoID]) values (3);
 insert [dbo].MoveAssessment([InitialInfoID]) values (4);
 insert [dbo].MoveAssessment([InitialInfoID]) values (8);

 insert [dbo].Preliminary([DateCreated],[MoveOutDate],[MovingWindow],[MLSListing], [SendPhotos], [AddOn], [AuctionService], [Street], [City], [State], [ZipCode], [MoveID])
 values ('01/01/2021', '05/01/2021', '04/19/2021-05/03/2021', 'NA', ' ', 'NA', 'No', '1234 Duke Avenue', 'Harrisonburg', 'VA', '22801', 1);

 insert [dbo].Preliminary([DateCreated],[MoveOutDate],[MovingWindow],[MLSListing], [SendPhotos], [AddOn], [AuctionService], [Street], [City], [State], [ZipCode], [MoveID])
 values ('01/08/2021', '05/09/2021', '04/22/2021-05/12/2021', 'NA', ' ', 'NA', 'No', '1234 Chiefs Avenue', 'Dayton', 'VA', '22809', 2);

 insert [dbo].Preliminary([DateCreated],[MoveOutDate],[MovingWindow],[MLSListing], [SendPhotos], [AddOn], [AuctionService], [Street], [City], [State], [ZipCode], [MoveID])
 values ('02/01/2021', '04/30/2021', '04/27/2021-04/29/2021', 'NA', ' ', 'NA', 'No', '1234 UVA Avenue', 'Charlottesville', 'VA', '22843', 3);

 insert [dbo].Preliminary([DateCreated],[MoveOutDate],[MovingWindow],[MLSListing], [SendPhotos], [AddOn], [AuctionService], [Street], [City], [State], [ZipCode], [MoveID])
 values ('03/01/2021', '05/04/2021', '04/23/2021-05/19/2021', 'NA', ' ', 'NA', 'No', '1234 Liberty Avenue', 'Lynchburg', 'VA', '22301', 4);

 -- inserts for auction assessment report (test data)
 insert [dbo].AuctionAssessment([InitialInfoID]) values (2);
 insert [dbo].AuctionAssessment([InitialInfoID]) values (5);
 insert [dbo].AuctionAssessment([InitialInfoID]) values (6);
 insert [dbo].AuctionAssessment([InitialInfoID]) values (7);

 insert into [dbo].Assessment([DateCreated], [ItemsSelling], [WhyService], [Deadline], [Scheduled], [AskedPhotos], [AskedItemList], [AdtlService], [AuctionID])
 values ('04/29/2021', 'Replica truck, iPhone 11', 'Settling an Estate', 'NA', 'Pickup', 'No', 'No', 'NA', 1);

 insert into [dbo].Assessment([DateCreated], [ItemsSelling], [WhyService], [Deadline], [Scheduled], [AskedPhotos], [AskedItemList], [AdtlService], [AuctionID])
 values ('04/27/2021', 'Mustang GT', 'Getting rid of stuff', 'NA', 'Pickup', 'No', 'No', 'NA', 2);

 insert into [dbo].Assessment([DateCreated], [ItemsSelling], [WhyService], [Deadline], [Scheduled], [AskedPhotos], [AskedItemList], [AdtlService], [AuctionID])
 values ('06/09/2021', 'Macbook Computer', 'Getting rid of stuff', 'NA', 'Pickup', 'No', 'No', 'NA', 3);

 insert into [dbo].Assessment([DateCreated], [ItemsSelling], [WhyService], [Deadline], [Scheduled], [AskedPhotos], [AskedItemList], [AdtlService], [AuctionID])
 values ('04/25/2021', 'Signed NFL Jersey', 'Getting rid of stuff', 'NA', 'Pickup', 'No', 'No', 'NA', 4);

 -- inserts for auction look at report (test data)
 insert into [dbo].AuctionLookAtEvent([TruckAccess], [SuppliesNeeded], [Date], [InitialInfoID]) values ('Narrow driveway', 'Magnifying Glass', '04/20/2021', 1);
 insert into [dbo].AuctionLookAtEvent([TruckAccess], [SuppliesNeeded], [Date], [InitialInfoID]) values ('Easy access', 'Trailer', '07/01/2021', 4);
 insert into [dbo].AuctionLookAtEvent([TruckAccess], [SuppliesNeeded], [Date], [InitialInfoID]) values ('Not accessible; park in street', 'Gold tester device', '04/27/2021', 6);
 insert into [dbo].AuctionLookAtEvent([TruckAccess], [SuppliesNeeded], [Date], [InitialInfoID]) values ('Easy access', 'Hammer', '04/23/2021', 7);
 
 -- inserts for auction event report (test data)
 insert into [dbo].AuctionEvent([InventoryAssginDate],[EmployeeID], [ServiceTicketID], [ItemID]) values ('04/22/2021', 1, 1, 1);
 insert into [dbo].AuctionEvent([InventoryAssginDate],[EmployeeID], [ServiceTicketID], [ItemID]) values ('09/08/2021', 2, 2, 2);
 insert into [dbo].AuctionEvent([InventoryAssginDate],[EmployeeID], [ServiceTicketID], [ItemID]) values ('04/28/2021',3, 3, 3);
 insert into [dbo].AuctionEvent([InventoryAssginDate],[EmployeeID], [ServiceTicketID], [ItemID]) values ('06/20/2021',4,4,4);
