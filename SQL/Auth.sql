USE [AUTH]
GO
CREATE TABLE CustomerUserInfo(
CustUserID int IDENTITY (1,1) NOT NULL,
Username varchar(30) NOT NULL,
Password varchar(256) NOT NULL, 
PRIMARY KEY (CustUserID)
);

CREATE TABLE EmployeeUserInfo(
EmployeeUserID int IDENTITY (1,1) NOT NULL,
Username varchar(30) NOT NULL,
Password varchar(256) NOT NULL, 
PRIMARY KEY (EmployeeUserID)
);

INSERT INTO CustomerUserInfo (Username, Password)
VALUES ('jenny@jmu.edu', '1000:OGcX/1H4sNEGgQ2Kc3HBKsYIkB6mtQuB:IjNrn/Ujci44gqU+5u2HsHNCltY=');


INSERT INTO EmployeeUserInfo (Username, Password)
VALUES ('admin', '1000:By3zNdPhrFT+OL4BWQTXiNYVN7WSH6LS:AQctTDusLNPas9ENO/N37Pa1wKM=');
GO
CREATE PROCEDURE JeremyEzellLab3

@UserName AS NVARCHAR(50)

AS
BEGIN

	SET NOCOUNT ON;

	SELECT Password 
	FROM EmployeeUserInfo
	WHERE Username =@UserName;

END
