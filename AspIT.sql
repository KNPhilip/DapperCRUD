USE master;
GO
DROP DATABASE IF EXISTS [AspIT];
GO
CREATE DATABASE [AspIT];
GO
USE [AspIT];
GO

CREATE TABLE Employees
(
	[Id] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	[FirstName] NVARCHAR(50),
	[LastName] NVARCHAR(50),
	[NickName] NVARCHAR(4),
	[Title] NVARCHAR(50),
	[Mail] NVARCHAR(100),
	[Phone] NVARCHAR(50),
	[SchoolId] INT,
	[IsEmployee] BIT,
	[BirthDate] DATE,
	[DateHired] DATE,
	[DateLastUpdated] DATETIME,
	[DateDismissed] DATE
);

CREATE TABLE Schools
(
	[Id] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	[Name] NVARCHAR(50),
	[Website] NVARCHAR(250),
	[Facebook] NVARCHAR(250),
	[DepartmentManagerId] INT,
	[IsDeleted] BIT,
	[Latitude] NVARCHAR(250),
	[Longitude] NVARCHAR(250)
);

CREATE TABLE Notes
(
	[Id] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	[Text] NVARCHAR(4000),
	[EmployeeId] INT,
	[DateCreated] DATETIME
);

INSERT INTO Schools ([Name], [Website], [Facebook], [DepartmentManagerId], [IsDeleted], [Latitude], [Longitude])
	VALUES ('AspIT Nordjylland', 'https://aspit.dk/afdelinger/aspit-nordjylland/', 'https://www.facebook.com/aspitnordjylland', 8, 0, NULL, NULL);
INSERT INTO Schools ([Name], [Website], [Facebook], [DepartmentManagerId], [IsDeleted], [Latitude], [Longitude])
	VALUES ('AspIT Østjylland', 'https://aspit.dk/afdelinger/aspit-oestjylland/', 'https://www.facebook.com/aspitoestjylland', 14, 0, NULL, NULL);
INSERT INTO Schools ([Name], [Website], [Facebook], [DepartmentManagerId], [IsDeleted], [Latitude], [Longitude])
	VALUES ('AspIT Trekanten', 'https://aspit.dk/afdelinger/aspit-trekanten/', 'https://www.facebook.com/profile.php?id=100056493563107', 1, 0, NULL, NULL);
INSERT INTO Schools ([Name], [Website], [Facebook], [DepartmentManagerId], [IsDeleted], [Latitude], [Longitude])
	VALUES ('AspIT Sønderjylland', 'https://aspit.dk/afdelinger/aspit-soenderjylland/', 'https://www.facebook.com/AspitSonderjylland', 22, 0, NULL, NULL);
INSERT INTO Schools ([Name], [Website], [Facebook], [DepartmentManagerId], [IsDeleted], [Latitude], [Longitude])
	VALUES ('AspIT Storkøbenhavn', 'https://aspit.dk/afdelinger/aspit-storkoebenhavn/', 'https://www.facebook.com/AspIT.Storkobenhavn', 30, 0, NULL, NULL);
INSERT INTO Schools ([Name], [Website], [Facebook], [DepartmentManagerId], [IsDeleted], [Latitude], [Longitude])
	VALUES ('AspIT Midtjylland', 'https://aspit.dk/afdelinger/aspit-midtjylland/', 'https://www.facebook.com/aspitmidtjylland', 46, 0, NULL, NULL);
INSERT INTO Schools ([Name], [Website], [Facebook], [DepartmentManagerId], [IsDeleted], [Latitude], [Longitude])
	VALUES ('AspIT Esbjerg', 'https://aspit.dk/afdelinger/aspit-esbjerg/', 'https://www.facebook.com/aspitesbjerg', 47, 0, NULL, NULL);
INSERT INTO Schools ([Name], [Website], [Facebook], [DepartmentManagerId], [IsDeleted], [Latitude], [Longitude])
	VALUES ('AspIT Sjælland', 'https://aspit.dk/afdelinger/aspit-sjaelland/', 'https://www.facebook.com/aspitsjaelland', 64, 0, NULL, NULL);
INSERT INTO Schools ([Name], [Website], [Facebook], [DepartmentManagerId], [IsDeleted], [Latitude], [Longitude])
	VALUES ('AspIT Fyn', 'https://aspit.dk/afdelinger/aspit-fyn/', 'https://www.facebook.com/AspitFyn', 64, 0, NULL, NULL);
INSERT INTO Schools ([Name], [Website], [IsDeleted], [Latitude], [Longitude])
	VALUES ('AspIN', 'https://www.aspin.dk', 0, NULL, NULL);
INSERT INTO Schools ([Name], [IsDeleted])
	VALUES ('AspIT Bornholm', 1);

ALTER TABLE Employees ADD CONSTRAINT FK_Employees_Schools FOREIGN KEY(SchoolId) REFERENCES Schools(Id);
-- ALTER TABLE Schools ADD CONSTRAINT FK_Schools_Employees FOREIGN KEY(DepartmentManagerId) REFERENCES Employees(Id);
ALTER TABLE Notes ADD CONSTRAINT FK_Notes_Employees FOREIGN KEY(EmployeeId) REFERENCES Employees(Id);

INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Ole', 'Bay Jansen', 'OJE', 'Uddannelseschef', 'oje@aspit.dk', '+45 72 16 27 99', 3, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Henrik', 'Stephansen', 'HENS', 'Praktik- og jobvejleder', 'hens@aspit.dk', '+45 72 16 26 85', 3, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Jesper', 'Lade Mathiesen', 'JEMA', 'Specialpædagogisk vejleder', 'jema@aspit.dk', '+45 72 16 28 56', 3, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Kenneth', 'Hougaard Sørensen', 'KESO', 'Lærer', 'keso@aspit.dk', 3, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Mads', 'Mikkel Rasmussen', 'MARA', 'Lærer', 'mara@aspit.dk', 3, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Dea', 'Gram', 'DEGR', 'Lærer', 'degr@aspin.dk', 10, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Jan', 'Lindgaard Pedersen', 'JALI', 'Lærer', 'jape@aspin.dk', 10, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired], [DateDismissed])
	VALUES ('Mette', 'Buus Pedersen', 'MEPE', 'Afdelingsleder', 'mepe@aspit.dk', '+45 72 16 27 26', 1, 1, '1993-03-05', '2010-03-05', '2023-06-30');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired], [DateDismissed])
	VALUES ('Lise', 'Brøchner Rasmussen', 'LIRA', 'Praktik- og jobvejleder', 'lira@aspit.dk', '+45 72 16 27 44', 1, 1, '1993-03-05', '2010-03-05', '2023-06-30');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired], [DateDismissed])
	VALUES ('Nils-Asbjørn', 'Frederiksen', 'NIFR', 'Lærer', 'nifr@aspit.dk', 1, 1, '1993-03-05', '2010-03-05', '2023-06-30');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired], [DateDismissed])
	VALUES ('Lone', 'K. Vinther', 'LOVI', 'Specialpædagogisk vejleder', 'lovi@aspit.dk', '+45 72 16 28 66', 1, 1, '1993-03-05', '2010-03-05', '2023-06-30');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired], [DateDismissed])
	VALUES ('Hannibal', 'Hansen', 'HAHA', 'Lærer', 'haha@aspit.dk', 1, 1, '1993-03-05', '2010-03-05', '2023-06-30');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired], [DateDismissed])
	VALUES ('Anni', 'Christiansen', 'ANCH', 'Kantinemedhjælper', 'anch@aspit.dk', 1, 1, '1993-03-05', '2010-03-05', '2023-06-30');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Anders', 'S. Lind', 'ANLI', 'Afdelingsleder', 'anli@aspit.dk', '+45 72 16 27 25', 2, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Trine', 'Joensen Schmidt', 'TRSC', 'Specialpædagogisk vejleder', 'trsc@aspit.dk', '+45 72 16 26 92', 2, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Liselotte', 'Bay Jensen', 'LIJE', 'Kvalitets- og udviklingsansvarlig', 'lije@aspit.dk', '+45 72 16 26 88', 2, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Christina', 'Aviaja Thomsen', 'CHTH', 'Praktik- og jobvejleder', 'chth@aspit.dk', '+45 72 16 26 90', 2, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Torben', 'Colding', 'TOCO', 'Lærer', 'toco@aspit.dk', 2, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Henning', 'Larsen', 'HELA', 'Lærer', 'hela@aspit.dk', 2, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Claus', 'Schneider', 'CLSC', 'Lærer', 'clsc@aspit.dk', 2, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Anna', 'Cecilia Boye Leitao', 'ANLE', 'Servicemedarbejder', 'anle@aspit.dk', 2, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Andrea', 'Schütz Steffensen', 'ANST', 'Afdelingsleder', 'anle@aspit.dk', '+45 72 16 27 16', 4, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Linda', 'Domino Thomas', 'IDTH', 'Specialpædagogisk vejleder', 'idth@aspit.dk', '+45 72 16 27 03', 4, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Janni', 'Pedersen', 'JAPE', 'Jobforløbsvejleder', 'jape@aspit.dk', '+45 72 16 28 64', 4, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Ulf', 'Skaaning', 'ULSK', 'Lærer', 'ulsk@aspit.dk', 4, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Ronni', 'Heuckendorff Hansen', 'ROHA', 'Lærer', 'roha@aspit.dk', 4, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Jens', 'Clausen', 'JECL', 'Lærer', 'jecl@aspit.dk', 4, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Hanne', 'Lund', 'HALU', 'Lærer', 'halu@aspit.dk', 4, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Rikke', 'Rosenberg', 'RIRO', 'Lærer', 'riro@aspit.dk', 4, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Sidsel', 'Lynggaard Sørensen', 'SISO', 'Afdelingsleder', 'siso@aspit.dk', '+45 72 16 28 00', 5, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Jesper', 'Borch Torstensson', 'JETO', 'Specialpædagogisk vejleder', 'jeto@aspit.dk', '+45 72 16 27 37', 5, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Stine', 'Thoustrup Svendsen', 'STSV', 'Praktik- og jobvejleder', 'stsv@aspit.dk', '+45 72 16 28 59', 5, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Carsten', 'Scheibelein', 'CASC', 'Praktik- og jobvejleder', 'casc@aspit.dk', '+45 72 16 28 39', 5, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Uli', 'Scheuss', 'ULSC', 'Lærer', 'ulsc@aspit.dk', 5, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Patrick', 'Wulff Holst', 'PAHO', 'Lærer', 'paho@aspit.dk', 5, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Steen', 'Larsen', 'STLA', 'Lærer', 'stla@aspit.dk', 5, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Klement', 'Baastrup Johansen', 'KLBA', 'Lærer', 'klba@aspit.dk', 5, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Jan', 'Jeppesen', 'JAJE', 'Lærer', 'jaje@aspit.dk', 5, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Sanne', 'Odgaard', 'SAOD', 'Kantinemedhjælper', 'saod@aspit.dk', 5, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Flemming', 'Graversen', 'FLGR', 'Lærer', 'flgr@skivecollege.dk', 6, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Rasmus', 'Brønd', 'RABR', 'Lærer', 'rabr@skivecollege.dk', 6, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Maibritt', 'Rittermann', 'MARI', 'Lærer', 'mari@skivecollege.dk', 6, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Charlotte', 'V. Thomasen', 'CHTH', 'Pædagogisk vejleder', 'cv@skivecollege.dk', '+45 23 40 42 21', 6, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Lise', 'Møller Pedersen', 'LIPE', 'Specialpædagogisk vejleder', 'lm@skivecollege.dk', '+45 40 37 20 96', 6, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Ole', 'Faarkkrog-Søgaard', 'OLFA', 'Praktik- og jobvejleder', 'olfs@skivecollege.dk', 6, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Helle', 'Holtemann', 'HEHO', 'Uddannelsesleder', 'hh@skivecollege.dk', '+45 92 72 82 29', 6, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Gitte', 'Drewsen', 'GIDR', 'Teamleder', 'gd@rybners.dk', '+45 61 20 76 16', 7, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Nadia', 'Kirkegaard Jørgensen', 'NAKI', 'Specialpædagogisk vejleder', 'nkj@rybners.dk', '+45 20 90 17 64', 7, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Kristian', 'Gildsig Poulsen', 'KRPO', 'Lærer', 'krpo@rybners.dk', 7, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Rasmus', 'Hein Midjord', 'RAMI', 'Lærer', 'rami@rybners.dk', 7, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Teodora', 'Mihaela Grindeanu', 'TEMI', 'Lærer', 'temi@rybners.dk', 7, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Anette', 'Lægsgaard', 'ANLA', 'Specialpædagogisk vejleder', 'anla@tietgen.dk', 8, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Emil', 'Wibe Lolk', 'EMLO', 'Lærer', 'emlo@tietgen.dk', 8, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Jeppe', 'Kjeldsen', 'JEKJ', 'Lærer', 'jekj@tietgen.dk', 8, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Niels', 'Petersen', 'NIPE', 'Lærer', 'nipe@tietgen.dk', 8, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Ulrik', 'Pagels', 'ULPA', 'Lærer', 'ulpa@tietgen.dk', 8, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Sverre', 'Kjørup Carlsson', 'SVCA', 'Lærer', 'svca@tietgen.dk', 8, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Michael', 'Rosengreen Bach', 'MIRO', 'Lærer', 'miro@tietgen.dk', 8, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Gitte', 'Sundin', 'GISU', 'Specialpædagogisk vejleder', 'gisu@tietgen.dk', 8, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Vivi', 'B. Haugaard', 'VIHA', 'Lærer', 'viha@tietgen.dk', 8, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Mikkel', 'Vitus Nielsen', 'MIVI', 'Praktik- og jobvejleder', 'mivi@tietgen.dk', 8, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Kim', 'T. Larsen', 'KILA', 'Uddannelseschef', 'kila@tietgen.dk', 8, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Tina', 'Østergaard', 'TIOE', 'Praktikkonsulent', 'tkoe@tietgen.dk', '+45 20 75 99 57', 8, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Kimmie', 'Falk', 'KIFA', 'Uddannelsesleder', 'kifa@tietgen.dk', '+45 20 31 30 38', 8, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Marianne', 'Nielsen', 'MAIE', 'Sekretær', 'maie@tietgen.dk', '+45 65 45 25 02', 8, 1, '1993-03-05', '2010-03-05');
INSERT INTO Employees ([FirstName], [LastName], [Nickname], [Title], [Mail], [Phone], [SchoolId], [IsEmployee], [BirthDate], [DateHired])
	VALUES ('Henrik', 'Sand Millennium', 'HEMI', 'Praktik- og jobvejleder', 'hemi@tietgen.dk', '+45 28 14 04 42', 8, 1, '1993-03-05', '2010-03-05');