CREATE TABLE CustomerUserInfo(
CustUserID int IDENTITY (1,1) NOT NULL,
Username varchar (40) NOT NULL,
Password varchar (256) NOT NULL,
PRIMARY KEY (CustUserID));

CREATE TABLE EmployeeUserInfo(
EmployeeUserID int IDENTITY (1,1) NOT NULL,
Username varchar (40) NOT NULL,
Password varchar (256) NOT NULL,
PRIMARY KEY (EmployeeUserID));




INSERT INTO CustomerUserInfo (Username, Password) VALUES ('Jenny@jmu.edu', 'testpass');
INSERT INTO CustomerUserInfo (Username, Password) VALUES ('Tony@jmu.edu', 'testpass443');                        
INSERT INTO CustomerUserInfo (Username, Password) VALUES ('William@jmu.edu', 'password4'); 
INSERT INTO CustomerUserInfo (Username, Password) VALUES ('Kobe@jmu.edu', 'password9583'); 
INSERT INTO CustomerUserInfo (Username, Password) VALUES ('Jocab@jmu.edu', 'password533'); 
INSERT INTO CustomerUserInfo (Username, Password) VALUES ('Huang@jmu.edu', 'testpass123'); 
INSERT INTO CustomerUserInfo (Username, Password) VALUES ('Tran@jmu.edu', 'testpass789'); 
INSERT INTO CustomerUserInfo (Username, Password) VALUES ('Peter@jmu.edu', 'testpass763'); 
INSERT INTO CustomerUserInfo (Username, Password) VALUES ('Tom@jmu.edu', 'passwordtest4432'); 
INSERT INTO CustomerUserInfo (Username, Password) VALUES ('2020lyh@gmail.com', 'passwordt6437');
INSERT INTO CustomerUserInfo (Username, Password) VALUES ('Alec@jmu.edu', 'pass75jdfd');
INSERT INTO CustomerUserInfo (Username, Password) VALUES ('Pat@dukes.jmu.edu', 'pas123word');
INSERT INTO CustomerUserInfo (Username, Password) VALUES ('admin', 'password');

INSERT INTO EmployeeUserInfo (Username, Password) VALUES ('123@gmail.com', 'pas6684word');
INSERT INTO EmployeeUserInfo (Username, Password) VALUES ('123@gmail.com', 'pas6633word');
INSERT INTO EmployeeUserInfo (Username, Password) VALUES ('1234543@gmail.com', 'pas6word22');
INSERT INTO EmployeeUserInfo (Username, Password) VALUES ('123hgf@gmail.com', 'pas60ord03');
INSERT INTO EmployeeUserInfo (Username, Password) VALUES ('123ht@gmail.com', 'pas62ord63');
INSERT INTO EmployeeUserInfo (Username, Password) VALUES ('123qqq@gmail.com', 'wordpass27');
INSERT INTO EmployeeUserInfo (Username, Password) VALUES ('123ttt@gmail.com', 'wordpass29');
INSERT INTO EmployeeUserInfo (Username, Password) VALUES ('123ooo@gmail.com', 'wordpass20');
INSERT INTO EmployeeUserInfo (Username, Password) VALUES ('123ppp@gmail.com', 'wordpass21');
INSERT INTO EmployeeUserInfo (Username, Password) VALUES ('admin', 'password');