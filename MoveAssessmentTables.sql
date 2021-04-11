
CREATE TABLE MoveAssessment(
MoveID Numeric(3) primary key,
InitialInfoID Numeric(3) FOREIGN KEY REFERENCES InitialInfo(InitialInfoID),
);

CREATE TABLE Preliminary(
PreliminaryID Numeric(3) primary key,
MoveOutDate VARCHAR(50),
MovingWindow VARCHAR(50),
MLSListing? VARCHAR(50),
SendPhotos? VARCHAR(50),
AddOn? VARCHAR(50),
AuctionService? VARCHAR(50),
Street VARCHAR(50),
City VARCHAR(50),
State VARCHAR(50),
ZipCode Numeric(10),
MoveID Numeric(3) FOREIGN KEY REFERENCES MoveAssessment(MoveID),
);

CREATE TABLE Room(
RoomID Numeric(3) primary key,
RoomType VARCHAR(50),
Furniture VARCHAR(100),
FloorLevel VARCHAR(50),
BoxSizeID Numeric(3) FOREIGN KEY REFERENCES BoxSize(BoxSizeID),
MoveID Numeric(3) FOREIGN KEY REFERENCES MoveAssessment(MoveID),
);

CREATE TABLE BoxSize(
BoxSizeID Numeric(3) primary key,
Small int(3),
Medium int(3),
Large int(3),
Art int(3),
Wardrobe int(3),
);

CREATE TABLE SpecificInfo(
SpecificInfoID Numeric(3) primary key,
HomeType VARCHAR(50),
TruckAccess VARCHAR(50),
LoadDoorDistance VARCHAR(50),
Steps? VARCHAR(50),
SpecialEquip VARCHAR(50),
TruckType VARCHAR(50),
MoveID Numeric(3) FOREIGN KEY REFERENCES MoveAssessment(MoveID),
);

CREATE TABLE Cost(
CostID Numeric(3) primary key,
MoveEst VARCHAR(50),
FixedRate VARCHAR(50),
ParkFee VARCHAR(50),
MoveID Numeric(3) FOREIGN KEY REFERENCES MoveAssessment(MoveID),
);

