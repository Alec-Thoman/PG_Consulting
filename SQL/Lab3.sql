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
	TicketBeginDate  datetime,
	TicketStatus   char(30),
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

CREATE TABLE InventoryItem (
	[ItemID] [int] IDENTITY(1,1) primary key,
	ItemDescription 	char(30),
	Weight			float(10),
	SalesPrice       float(10),
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

SET IDENTITY_INSERT [dbo].[Service] OFF
GO  


SET IDENTITY_INSERT [dbo].[serviceTicket] ON 
GO
  
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketBeginDate],[EmployeeID],[CustomerID],[ServiceID]) values('1','Completion','1/1/2021','1','1','1');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketBeginDate],[EmployeeID],[CustomerID],[ServiceID]) values('2','Completion','1/2/2021','2','1','2');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketBeginDate],[EmployeeID],[CustomerID],[ServiceID]) values('3','Completion','1/3/2021','3','2','1');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketBeginDate],[EmployeeID],[CustomerID],[ServiceID]) values('4','Completion','1/4/2021','4','2','2');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketBeginDate],[EmployeeID],[CustomerID],[ServiceID]) values('5','InitiatingContract','1/5/2021','5','3','1');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketBeginDate],[EmployeeID],[CustomerID],[ServiceID]) values('6','InitiatingContract','1/6/2021','6','4','1');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketBeginDate],[EmployeeID],[CustomerID],[ServiceID]) values('7','InitiatingContract','1/7/2021','7','5','1');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketBeginDate],[EmployeeID],[CustomerID],[ServiceID]) values('8','InitiatingContract','1/8/2021','8','6','1');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketBeginDate],[EmployeeID],[CustomerID],[ServiceID]) values('9','InitiatingContract','1/9/2021','9','7','2');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketBeginDate],[EmployeeID],[CustomerID],[ServiceID]) values('10','InitiatingContract','1/10/2021','1','8','2');
  insert [dbo].[serviceTicket] ([ServiceTicketID],[TicketStatus],[TicketBeginDate],[EmployeeID],[CustomerID],[ServiceID]) values('11','InitiatingContract','1/10/2021','2','9','2');
  
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

SET IDENTITY_INSERT [dbo].[Inventoryitem] ON 
GO  
  
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[weight],[salesprice]) values('1','books','10','23');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[weight],[salesprice]) values('2','chairs','20','4');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[weight],[salesprice]) values('3','House','23','66');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[weight],[salesprice]) values('4','Bed','14','72');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[weight],[salesprice]) values('5','Mirror','6','12');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[weight],[salesprice]) values('6','Car','50','33');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[weight],[salesprice]) values('7','Paper box','10','23');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[weight],[salesprice]) values('8','Desk','10','11');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[weight],[salesprice]) values('9','Clothes','12','44');
  insert [dbo].[Inventoryitem] ([ItemID],[ItemDescription],[weight],[salesprice]) values('10','Chairs','11','87');
  
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

Alter Table Customer ADD ContactWay char(50);
Alter Table Customer ADD HearAbout  char(50);
Alter Table serviceTicket ADD Address char(50);
Alter Table serviceTicket ADD Deadline char(50);
  
  
  
  

 






