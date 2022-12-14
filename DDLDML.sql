#DDL SYNTAX SPREADSHEET 1:

create database GameMarket_FP_Kel6;
use GameMarket_FP_kel6;
CREATE TABLE User(
	U_ID char(4) NOT NULL,
	U_Nama varchar(255) not null,
	U_Password varchar(255) not null,
	U_Email varchar(255) not null,
	primary key(U_ID)
);

CREATE TABLE Developer(
	D_ID char(4) NOT NULL,
	D_NAMA varchar(255) not null,
	D_EMAIL varchar(255) not null,
	primary key(D_ID)
);

CREATE TABLE Game(
	G_ID char(4) NOT NULL,
	G_NAMA varchar(255) not null,
	G_DESKRIPSI text not null,
	G_TGLRILIS Date not null,
	G_HARGA decimal(10) not null,
	G_AGERATING varchar(7),
	G_SYSREQMINIMUM text not null,
	G_SYSREQREC text not null,
	Developer_D_ID char(4),
	primary key(G_ID),
	foreign key (Developer_D_ID ) references Developer(D_ID)
);

CREATE TABLE DLC (
	DLC_ID CHAR (6) NOT NULL,
	DLC_NAMA VARCHAR (255) NOT NULL,
	DLC_DESKRIPSI TEXT NOT NULL,
	DLC_HARGA DECIMAL (10) NOT NULL,
	DLC_SYSREQMIN TEXT NOT NULL,
	DLC_SYSREQREC TEXT NOT NULL,
	GAME_G_ID CHAR (4) NOT NULL,
	PRIMARY KEY (DLC_ID),
	FOREIGN KEY (GAME_G_ID) REFERENCES GAME (G_ID)
);

CREATE TABLE Bundle(
    	BU_ID CHAR (5) NOT NULL,
    	BU_NAMA VARCHAR(255) NOT NULL,
    	BU_HARGA DECIMAL(10) NOT NULL,
    	BU_DESKRIPSI TEXT NOT NULL,
    
    	PRIMARY KEY (BU_ID)
);

CREATE TABLE Transaksi(
    	TR_ID CHAR(5) NOT NULL,
    	TR_METODEBAYAR VARCHAR(255) NOT NULL,
    	TR_TGLBELI DATE NOT NULL,
    	USER_U_ID CHAR(4) NOT NULL,
    
    	PRIMARY KEY (TR_ID),
    	FOREIGN KEY (USER_U_ID) REFERENCES User(U_ID)
);

CREATE TABLE Bahasa_Audio (
BA_ID CHAR(5) NOT NULL,
BA_NAMA VARCHAR(255) NOT NULL,
	PRIMARY KEY (BA_ID)
);

CREATE TABLE Bahasa_Interface (
	BI_ID CHAR(5) NOT NULL,
BI_NAMA VARCHAR(255) NOT NULL,
	PRIMARY KEY (BI_ID)
);

CREATE TABLE Bahasa_Subtitle (
	BS_ID CHAR(5) NOT NULL,
BS_NAMA VARCHAR(255) NOT NULL,
	PRIMARY KEY (BS_ID)
);

CREATE TABLE Tags (
	T_ID CHAR(4) NOT NULL,
	T_NAMA VARCHAR(255) NOT NULL,
	PRIMARY KEY (T_ID)
);

CREATE TABLE OS (
	O_ID CHAR(5) NOT NULL,
	O_NAMA VARCHAR(255) NOT NULL,
	PRIMARY KEY (O_ID)
);
CREATE TABLE REVIEW (
	R_ID CHAR (4) NOT NULL,
	R_RATING VARCHAR (16),
	R_COMMENT TEXT,
	USER_U_ID CHAR (4) NOT NULL,
	GAME_G_ID CHAR (4),
	DLC_DLC_ID CHAR (6),
	PRIMARY KEY (R_ID),
	FOREIGN KEY (USER_U_ID) REFERENCES USER (U_ID),
	FOREIGN KEY (GAME_G_ID) REFERENCES GAME (G_ID),
	FOREIGN KEY (DLC_DLC_ID) REFERENCES DLC (DLC_ID)
);





#DDL SYNTAX SPREADSHEET 2:

CREATE TABLE Detail_User_Game(
	No INT NOT NULL,
	User_U_ID CHAR(4) NOT NULL,
	GAME_G_ID CHAR(4) NOT NULL,
	
	PRIMARY KEY (No),
	FOREIGN KEY (User_U_ID) REFERENCES User(U_ID),
	FOREIGN KEY (Game_G_ID) REFERENCES Game(G_ID)
);

CREATE TABLE Detail_User_DLC(
	No INT NOT NULL,
	User_U_ID CHAR(4) NOT NULL,
	DLC_DLC_ID CHAR(6) NOT NULL,
	
	PRIMARY KEY (No),
	FOREIGN KEY (User_U_ID) REFERENCES User(U_ID),
	FOREIGN KEY (DLC_DLC_ID) REFERENCES DLC(DLC_ID)
);

CREATE TABLE Detail_Transaksi_Game(
	NTG_ID CHAR(6) NOT NULL,
	Transaksi_TR_ID CHAR(5) NOT NULL,
	Game_G_ID CHAR(4) NOT NULL,

	PRIMARY KEY (NTG_ID),
	FOREIGN KEY (Transaksi_TR_ID) REFERENCES Transaksi(TR_ID),
	FOREIGN KEY (Game_G_ID) REFERENCES Game(G_ID)
);

CREATE TABLE Detail_Bundle_DLC(
	No int not null,
	Bundle_BU_ID  CHAR (5) NOT NULL,
	DLC_DLC_ID CHAR (6) NOT NULL,
	primary key (No),
	foreign key (Bundle_BU_ID  ) references Bundle(BU_ID),
	foreign key (DLC_DLC_ID ) references DLC(DLC_ID)
);

CREATE TABLE Detail_Game_Tags(
	No int not null,
	GAME_G_ID char(4) NOT NULL,
	TAGS_T_ID CHAR(4) NOT NULL,
	primary key (No),
	foreign key (GAME_G_ID   ) references Game(G_ID),
	foreign key (TAGS_T_ID  ) references Tags(T_ID)
);

CREATE TABLE Detail_Game_BA(
	No int not null,
	GAME_G_ID char(4) NOT NULL,
	Bahasa_Audio_BA_ID CHAR(5) NOT NULL,
	primary key (No),
	foreign key (GAME_G_ID) references Game(G_ID),
	foreign key (Bahasa_Audio_BA_ID) references Bahasa_Audio(BA_ID)
);

CREATE TABLE Detail_Transaksi_DLC(
	NTD_ID CHAR(6) NOT NULL,
   	TRANSAKSI_TR_ID CHAR(5) NOT NULL,
    	DLC_DLC_ID CHAR(6) NOT NULL,
    
   	PRIMARY KEY (NTD_ID),
    	FOREIGN KEY (TRANSAKSI_TR_ID) REFERENCES Transaksi(TR_ID),
    	FOREIGN KEY (DLC_DLC_ID) REFERENCES DLC(DLC_ID)
);

CREATE TABLE Detail_Transaksi_Bundle(
	NTB_ID CHAR(6) NOT NULL,
    	TRANSAKSI_TR_ID CHAR(5) NOT NULL,
    	BUNDLE_BU_ID CHAR(5) NOT NULL,
    
    	PRIMARY KEY (NTB_ID),
    	FOREIGN KEY (TRANSAKSI_TR_ID) REFERENCES Transaksi(TR_ID),
    	FOREIGN KEY (BUNDLE_BU_ID) REFERENCES Bundle(BU_ID)
);

CREATE TABLE Detail_Bundle_Game(
	No int NOT NULL,
    	BUNDLE_BU_ID CHAR(5) NOT NULL,
    	GAME_G_ID CHAR(4) NOT NULL,
    
    	PRIMARY KEY (No),
    	FOREIGN KEY (BUNDLE_BU_ID) REFERENCES Bundle(BU_ID),
    	FOREIGN KEY (GAME_G_ID) REFERENCES Game(G_ID)
);

CREATE TABLE DETAIL_GAME_BS (
	No INT NOT NULL,
	GAME_G_ID CHAR (4) NOT NULL,
	BAHASA_SUBTITLE_BS_ID CHAR (5) NOT NULL,
	PRIMARY KEY (No),
	FOREIGN KEY (GAME_G_ID) REFERENCES GAME (G_ID),
	FOREIGN KEY (BAHASA_SUBTITLE_BS_ID) REFERENCES BAHASA_SUBTITLE (BS_ID)
);

CREATE TABLE DETAIL_GAME_BI (
	No INT NOT NULL,
	GAME_G_ID CHAR (4) NOT NULL,
	BAHASA_INTERFACE_BI_ID CHAR (5) NOT NULL,
	PRIMARY KEY (No),
	FOREIGN KEY (GAME_G_ID) REFERENCES GAME (G_ID),
	FOREIGN KEY (BAHASA_INTERFACE_BI_ID) REFERENCES BAHASA_INTERFACE (BI_ID)
);

CREATE TABLE DETAIL_GAME_OS (
	No INT NOT NULL,
	GAME_G_ID CHAR (4) NOT NULL,
	OS_O_ID CHAR (5) NOT NULL,
	PRIMARY KEY (No),
	FOREIGN KEY (GAME_G_ID) REFERENCES GAME (G_ID),
	FOREIGN KEY (OS_O_ID) REFERENCES OS (O_ID)
);











#DML SYNTAX INSERT INTO Entitas Kuat:

#USER
insert into user(U_ID, U_nama, U_password, U_email) values ('U001','Budi','UPaSS001','Budi@gmail.com');
insert into user(U_ID, U_nama, U_password, U_email) values ('U002','Santo','UPaSS002','Santo@gmail.com');
insert into user(U_ID, U_nama, U_password, U_email) values ('U003','Abay','UPaSS003','Abay@gmail.com');
insert into user(U_ID, U_nama, U_password, U_email) values ('U004','Reno','UPaSS004','Reno@gmail.com');
insert into user(U_ID, U_nama, U_password, U_email) values ('U005','Carla','UPaSS005','Carla@gmail.com');
insert into user(U_ID, U_nama, U_password, U_email) values ('U006','Setyo','UPaSS006','Setyo@gmail.com');
insert into user(U_ID, U_nama, U_password, U_email) values ('U007','Masa','UPaSS007','Masa@gmail.com');
insert into user(U_ID, U_nama, U_password, U_email) values ('U008','Sasa','UPaSS008','Sasa@gmail.com');
insert into user(U_ID, U_nama, U_password, U_email) values ('U009','Rizal','UPaSS009','Rizal@gmail.com');
insert into user(U_ID, U_nama, U_password, U_email) values ('U010','Bocil22','UPaSS010','Bocil22@yahoo.com');
insert into user(U_ID, U_nama, U_password, U_email) values ('U011','Ayam','UPaSS011','Ayam@yahoo.com');
insert into user(U_ID, U_nama, U_password, U_email) values ('U012','Buah','UPaSS012','Buah@yahoo.com');
insert into user(U_ID, U_nama, U_password, U_email) values ('U013','SantoLoyo2','UPaSS013','SantoLoyo2@yahoo.com');
insert into user(U_ID, U_nama, U_password, U_email) values ('U014','Santi','UPaSS014','Santi@yahoo.com');
insert into user(U_ID, U_nama, U_password, U_email) values ('U015','Jali','UPaSS015','Jali@yahoo.com');
insert into user(U_ID, U_nama, U_password, U_email) values ('U016','Joko','UPaSS016','Joko@yahoo.com');
insert into user(U_ID, U_nama, U_password, U_email) values ('U017','Abass','UPaSS017','Abass@yahoo.com');
insert into user(U_ID, U_nama, U_password, U_email) values ('U018','De gea','UPaSS018','Degea@yahoo.com');
insert into user(U_ID, U_nama, U_password, U_email) values ('U019','Messi','UPaSS019','Messi@gmail.com');
insert into user(U_ID, U_nama, U_password, U_email) values ('U020','Ronaldo','UPaSS020','Ronaldo@gmail.com');




#Developer

insert into developer(D_ID, D_nama, D_email) values ('D001','EA','e.ea.com');
insert into developer(D_ID, D_nama, D_email) values ('D002','Gamers','Gamers.com');
insert into developer(D_ID, D_nama, D_email) values ('D003','Ubisoft','Ubisoft.com');
insert into developer(D_ID, D_nama, D_email) values ('D004','Rockstar Games','Rockstar Games.com');
insert into developer(D_ID, D_nama, D_email) values ('D005','Supercell','Supercell.com');
insert into developer(D_ID, D_nama, D_email) values ('D006','SQUARE-ENIX','SQUARE-ENIX.com');
insert into developer(D_ID, D_nama, D_email) values ('D007','Naughty Dog','Naughty Dog.com');
insert into developer(D_ID, D_nama, D_email) values ('D008','Nintendo','Nintendo.com');
insert into developer(D_ID, D_nama, D_email) values ('D009','Sony','Sony.com');
insert into developer(D_ID, D_nama, D_email) values ('D010','Blizzard','Blizzard.com');
insert into developer(D_ID, D_nama, D_email) values ('D011','Epic Games','Epic Games.com');
insert into developer(D_ID, D_nama, D_email) values ('D012','Gameloft','Gameloft.com');
insert into developer(D_ID, D_nama, D_email) values ('D013','Bungie Inc','Bungie Inc.com');
insert into developer(D_ID, D_nama, D_email) values ('D014','Konami','Konami.com');
insert into developer(D_ID, D_nama, D_email) values ('D015','Namco','Namco.com');
insert into developer(D_ID, D_nama, D_email) values ('D016','LucasArt','LucasArt.com');
insert into developer(D_ID, D_nama, D_email) values ('D017','Maxis','Maxis.com');
insert into developer(D_ID, D_nama, D_email) values ('D018','PopCap Game','PopCap Game.com');
insert into developer(D_ID, D_nama, D_email) values ('D019','Game House','Game House.com');
insert into developer(D_ID, D_nama, D_email) values ('D020','SquareSoft','SquareSoft.com');
insert into developer(D_ID, D_nama, D_email) values ('D021','Telltale Games','support@telltalegames.com');
insert into developer(D_ID, D_nama, D_email) values ('D022','CD PROJEKT RED','ir@cdprojekt.com');
insert into developer(D_ID, D_nama, D_email) values ('D023','Gearbox Software','support@gearbox.com');



#GAME

insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G001','CS GO','the most played online PC action game in the world','2012-08-22','80000','PEGI-18','OS: Windows® 7/Vista/XP
Processor: Intel® Core™ 2 Duo E6600 or AMD Phenom™ X3 8750 processor or better
Memory: 2 GB RAM
Graphics: Video card must be 256 MB or more and should be a DirectX 9-compatible with support for Pixel Shader 3.0
DirectX: Version 9.0c
Storage: 15 GB available space','CPU: Intel® Core™2 Duo Processor E6600 2.4 GHz or AMD Phenom™ X3 8750 2.4 GHz processor.
GPU: Any video card with 256 MB of VRAM or higher.
RAM: 2 GB of memory.
HDD: 15 GB of free space.
OS: Windows XP or higher operating system.
DirectX: 9.0c or higher.
Shader Model: 3.0 or higher.','D019');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G002','PUBG','Land on strategic locations, loot weapons and supplies, and survive','2017-12-21','80000','PEGI-16','OS: 64-bit Windows 7, Windows 8.1, Windows 10
Processor: Intel Core i5-4430 / AMD FX-6300
Memory: 8 GB RAM
Graphics: NVIDIA GeForce GTX 960 2GB / AMD Radeon R7 370 2GB
DirectX: Version 11
Network: Broadband Internet connection
Storage: 40 GB available space','OS: 64-bit Windows 7, Windows 8.1, Windows 10
Processor: Intel Core i5-6600K / AMD Ryzen 5 1600
Memory: 16 GB RAM
Graphics: NVIDIA GeForce GTX 1060 3GB / AMD Radeon RX 580 4GB
DirectX: Version 11
Network: Broadband Internet connection
Storage: 50 GB available space','D018');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G003','Rainbow six Siege','Master the art of destruction and gadgetry','2015-12-02','110000','PEGI-18','OS: Windows 8.1, Windows 10 (64bit versions required)
Processor: Intel Core i3 560 @ 3.3 GHz or AMD Phenom II X4 945 @ 3.0 GHz
Memory: 6 GB RAM
Graphics: NVIDIA GeForce GTX 460 or AMD Radeon HD 5870 (DirectX-11 compliant with 1GB of VRAM)
Network: Broadband Internet connection
Storage: 61 GB available space
Sound Card: DirectX® 9.0c compatible sound card with latest drivers','OS: Windows 8.1, Windows 10 (64bit versions required)
Processor: Intel Core i5-2500K @ 3.3 GHz or better or AMD FX-8120 @ 3.1 Ghz or better
Memory: 8 GB RAM
Graphics: NVIDIA GeForce GTX 670 (or GTX 760 / GTX 960) or AMD Radeon HD 7970 (or R9 280x [2GB VRAM] / R9 380 / Fury X)
Network: Broadband Internet connection
Storage: 61 GB available space
Sound Card: DirectX® 9.0c compatible sound card 5.1 with latest drivers','D003');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G004','Apex Legend','Hero shooter where legendary characters with powerful abilities team up to battle','2019-11-05','10000','PEGI-16','Requires a 64-bit processor and operating system OS: 64-bit Windows 7 Processor: AMD FX 4350 or Equivalent, Intel Core i3 6300 or Equivalent Memory: 6 GB RAM Graphics: AMD Radeon™ HD 7730, NVIDIA GeForce® GT 640 DirectX: Version 11 Network: Broadband Internet connection Storage: 56 GB available space Additional Notes: ~3.8GB for 1 localized language','Requires a 64-bit processor and operating system OS: 64-bit Windows 7 Processor: Ryzen 5 CPU or Equivalent Memory: 8 GB RAM Graphics: AMD Radeon™ R9 290, NVIDIA GeForce® GTX 970 DirectX: Version 11 Network: Broadband Internet connection Storage: 56 GB available space Additional Notes: ~3.8GB for 1 localized language','D004');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G005','PayDay 2','PAYDAY 2 is an action-packed, four-player co-op','2013-08-13','50000','PEGI-18','CPU: Info.
CPU SPEED: 2 GHz Intel Dual Core Processor.
RAM: 4 GB.
OS: Windows 7.
VIDEO CARD: NVIDIA GeForce 8800/ATI Radeon HD 2600 (512 MB VRAM)
PIXEL SHADER: 4.0.
VERTEX SHADER: 4.0.
SOUND CARD: Yes.','CPU: Info.
CPU SPEED: 2.3 GHz Intel Quad Core Processor.
RAM: 8 GB.
OS: Windows 10.
VIDEO CARD: NVIDIA GeForce GTX460/ATI Radeon HD 5850 (1GB VRAM)
PIXEL SHADER: 5.0.
VERTEX SHADER: 5.0.
SOUND CARD: Yes.','D015');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G006','Black Squad','Black Squad is a free-to-play military first-person-shooter','2019-07-26','23000','PEGI-16','OS: Windows 10 64bit
Processor: CORE2 DUO 2.2GHZ / AMD Athlon 64 X2 2.66GHz
Memory: 6 GB RAM
Graphics: NVIDIA GEFORCE 8600 OR GT630 / RADEON HD 6750
DirectX: Version 9.0
Network: Broadband Internet connection
Storage: 8 GB available space','OS: Windows 10 64bit
Processor: CORE i3-4170 / AMD FX-8300
Memory: 8 GB RAM
Graphics: NVIDIA GTX 760 or AMD Radeon HD 7950
DirectX: Version 9.0
Network: Broadband Internet connection
Storage: 8 GB available space','D016');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G007','Valorant','Valorant is a free multiplayer tactical POP video game developed and published by Riot Games, for Microsoft Windows','2020-06-02','10000','PEGI-18','CPU: Intel Core 2 Duo E8400 / AMD Athlon 200GE
RAM: 4 GB
OS: Windows 7/8/10 64-bit
VIDEO CARD: Intel HD 4000 / Radeon R5 200
PIXEL SHADER: 3.0
VERTEX SHADER: 3.0','CPU: Core i3-4150 / Ryzen 3 1200
RAM: 4 GB
OS: Windows 7/8/10 64-bit
VIDEO CARD: GeForce GT 730 / Radeon R7 240
PIXEL SHADER: 5.0
VERTEX SHADER: 5.0
DEDICATED VIDEO RAM: 1024 MB','D001');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G008','The Sims 4','Play with life and discover the possibilities.','2014-09-02','40000','PEGI-12','OS: 64 Bit Required. Windows 10
Processor: 3.3 GHz Intel Core i3-3220 (2 cores, 4 threads), AMD Ryzen 3 1200 3.1 GHz (4 cores) or better
Memory: 4 GB RAM
Graphics: 128 MB of Video RAM and support for Pixel Shader 3.0. Supported Video Cards: NVIDIA GeForce 6600 or better, ATI Radeon X1300 or better, Intel GMA X4500 or better
DirectX: Version 11
Network: Broadband Internet connection
Storage: 26 GB available space','OS: 64 Bit Windows 10
Processor: Intel core i5 (4 cores), AMD Ryzen 5 or better
Memory: 8 GB RAM
Graphics: 1 GB of Video RAM, NVIDIA GTX 650, AMD Radeon HD 7750, or better
DirectX: Version 11
Network: Broadband Internet connection
Storage: 51 GB available space','D013');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G009','Outlast 2','Outlast 2 introduces you to Sullivan Knoth and his followers','2013-09-04','100000','PEGI-18','OS: Windows Vista / 7 / 8 / 10, 64-bits
Processor: Intel Core i3-530
Memory: 4 GB RAM
Graphics: 1GB VRAM, NVIDIA Geforce GTX 260 / ATI Radeon HD 4870
DirectX: Version 10
Storage: 30 GB available space
Sound Card: DirectX Compatible','OS: Windows Vista / 7 / 8 / 10, 64-bits
Processor: Intel Core i5
Memory: 8 GB RAM
Graphics: 1.5GB VRAM, NVIDIA Geforce GTX 660 / ATI Radeon HD 7850
DirectX: Version 11
Storage: 30 GB available space
Sound Card: DirectX Compatible','D014');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G010','Pamali','Pamali is a horror video game from Indonesia released in 2018','2018-12-28','95000','PEGI-18','OS: Windows 7 64-bit
Processor: Intel(R) Core(TM) i5-7200U CPU @ 2.50Ghz
Memory: 4 GB RAM
Graphics: NVIDIA GeForce 940MX
DirectX: Version 11
Storage: 2 GB available space','OS: Windows 10 Pro 64-bit
Processor: Intel(R) Core(TM) i7-6700 CPU @ 3.40Ghz
Memory: 16 GB RAM
Graphics: NVIDIA GeForce GTX 970
DirectX: Version 12
Storage: 3 GB available space','D002');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G011','Mortal Kombat','Mortal Kombat X combines unparalleled, cinematic presentation with all new gameplay','2015-04-14','112000','PEGI-18','OS: 64-bit: Vista, Win 7, Win 8, Win 10
Processor: Intel Core i5-750, 2.67 GHz | AMD Phenom II X4 965, 3.4 GHz
Memory: 3 GB RAM
Graphics: NVIDIA GeForce GTX 460 | AMD Radeon HD 5850
DirectX: Version 11
Network: Broadband Internet connection
Storage: 36 GB available space','OS: 64-bit: Win 7, Win 8, Win 10
Processor: Intel Core i7-3770, 3.4 GHz | AMD FX-8350, 4.0 GHz
Memory: 8 GB RAM
Graphics: NVIDIA GeForce GTX 660 | AMD Radeon HD 7950
DirectX: Version 11
Network: Broadband Internet connection
Storage: 44 GB available space','D015');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G012','Monster Hunter','Welcome to a new world! Take on the role of a hunter and slay ferocious monsters','2018-08-09','300000','PEGI-16','OS: WINDOWS® 7, 8, 8.1, 10 (64-bit required)
Processor: Intel® Core™ i5 4460 or Core™ i3 9100F or AMD FX™-6300 or Ryzen™ 3 3200G
Memory: 8 GB RAM
Graphics: NVIDIA®GeForce®GTX 760 or GTX1050 or AMD Radeon™ R7 260x or RX 560
DirectX: Version 11
Network: Broadband Internet connection
Storage: 52 GB available space
Sound Card: DirectSound (DirectX® 9.0c or later)','OS: WINDOWS® 7, 8, 8.1, 10 (64-bit required)
Processor: Intel® Core™ i7 3770 or Core™ i3 8350 or Core™ i3 9350F / AMD Ryzen™ 5 1500X or Ryzen™ 5 3400G
Memory: 8 GB RAM
Graphics: NVIDIA® GeForce® GTX 1060 (VRAM 3GB) or GTX 1650 / AMD Radeon™ RX 480 or RX 570
DirectX: Version 11
Network: Broadband Internet connection
Storage: 52 GB available space
Sound Card: DirectSound (DirectX® 9.0c or later)','D015');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G013','GTA','The game allows the player to take on the role of a criminal who can roam freely around the big city.','2013-09-17','320000','PEGI-18','OS: Windows 10 64 Bit, Windows 8.1 64 Bit, Windows 8 64 Bit, Windows 7 64 Bit Service Pack 1
Processor: Intel Core 2 Quad CPU Q6600 @ 2.40GHz (4 CPUs) / AMD Phenom 9850 Quad-Core Processor (4 CPUs) @ 2.5GHz
Memory: 4 GB RAM
Graphics: NVIDIA 9800 GT 1GB / AMD HD 4870 1GB (DX 10, 10.1, 11)
Storage: 72 GB available space
Sound Card: 100% DirectX 10 compatible','OS: Windows 10 64 Bit, Windows 8.1 64 Bit, Windows 8 64 Bit, Windows 7 64 Bit Service Pack 1
Processor: Intel Core i5 3470 @ 3.2GHz (4 CPUs) / AMD X8 FX-8350 @ 4GHz (8 CPUs)
Memory: 8 GB RAM
Graphics: NVIDIA GTX 660 2GB / AMD HD 7870 2GB
Storage: 72 GB available space
Sound Card: 100% DirectX 10 compatible','D004');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G014','Overwatch 2','the game intends a shared environment for player-versus-player (PvP) modes while introducing persistent cooperative modes. A major change in PvP modes was to reduce team sizes from six to five.','2022-10-04','354000','PEGI-12','Operating system: Windows 10 64-bit
Processor: Intel Core i3 or AMD Phenom X3 8650
RAM: 6 GB RAM
Storage: 50 GB of free space available
Graphics card: NVIDIA GeForce GTX 600 Series, AMD Radeon HD 7000 Series
Display resolution: minimum 1024x768
Internet: Broadband Internet connection','Operating system: Windows 7 / Windows 8 / Windows 10 64-bit
Processor: Intel Core i5 or AMD Phenom II X3 or higher
RAM: 6 GB RAM
Storage: 50 GB of free space available
Graphics card: NVIDIA GeForce GTX 660 or AMD Radeon HD 7950 or higher
Screen resolution: minimum 1024 x 768
Internet: Broadband Internet connection','D009');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G015','Dota 2','Dota is deep, and constantly evolving,','2013-08-10','200000','PEGI-16','OS: Windows 7 or newer
Processor: Dual core from Intel or AMD at 2.8 GHz
Memory: 4 GB RAM
Graphics: NVIDIA GeForce 8600/9600GT, ATI/AMD Radeon HD2600/3600
DirectX: Version 9.0c
Network: Broadband Internet connection
Storage: 15 GB available space
Sound Card: DirectX Compatible','OS: Windows 7 or newer.
Processor: Dual core from Intel or AMD at 2.8 GHz.
Memory: 4 GB RAM.
Graphics: NVIDIA GeForce 8600/9600GT, ATI/AMD Radeon HD2600/3600.
DirectX: Version 9.0c.
Network: Broadband Internet connection.
Storage: 15 GB available space.
Sound Card: DirectX Compatible.','D019');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G016','Resident Evil 3','Jill Valentine is one of the last remaining people in Raccoon City','2020-04-03','559000','PEGI-18','OS: WINDOWS® 10 (64-BIT Required)
Processor: Intel® Core™ i5-4460 or AMD FX™-6300 or better
Memory: 8 GB RAM
Graphics: NVIDIA® GeForce® GTX 960 or AMD Radeon™ RX 460
DirectX: Version 12
Network: Broadband Internet connection
Storage: 45 GB available space','OS: WINDOWS® 10 (64-BIT Required)
Processor: Intel® Core™ i7-3770 or AMD FX™-9590 or better
Memory: 8 GB RAM
Graphics: NVIDIA® GeForce® GTX 1060 or AMD Radeon™ RX 480 with 3GB VRAM
DirectX: Version 12
Network: Broadband Internet connection
Storage: 45 GB available space','D016');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G017','Mortal Shell','Mortal Shell is a deep action-RPG that tests your sanity and resilience in a shattered world. As the remains of humanity wither and rot, zealous foes fester in the ruins. They spare no mercy, with survival demanding superior awareness, precision and instincts. Track down hidden sanctums of devout followers and discover your true purpose.','2021-08-08','125000','PEGI-16','OS: Windows 7 SP1 or newer
Processor: Intel Core i5-4590 or AMD FX 8350
Memory: 8 GB RAM
Graphics: NVIDIA GTX 970 or AMD Radeon R9 290
Storage: 12 GB available space','OS: Windows 10
Processor: Intel Core i7 or AMD Ryzen 7
Memory: 16 GB RAM
Graphics: NVIDIA GTX 1070 or AMD Radeon RX Vega 56
Storage: 12 GB available space','D016');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G018','The Forest','As the lone survivor of a passenger jet crash, you find yourself in a mysterious forest battling to stay alive','2018-04-30','30000','PEGI-18','OS: Windows 7
Processor: Intel Dual-Core 2.4 GHz
Memory: 4 GB RAM
Graphics: NVIDIA GeForce 8800GT
DirectX: Version 9.0
Storage: 5 GB available space
Sound Card: DirectX®-compatible','OS: Windows 7
Processor: Quad Core Processor
Memory: 4 GB RAM
Graphics: NVIDIA GeForce GTX 560
DirectX: Version 9.0
Storage: 5 GB available space
Sound Card: DirectX®-compatible','D006');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G019','Call Of Duty','Call of Duty®: Modern Warfare® II drops players into an unprecedented global conflict that features the return of the iconic Operators of Task Force 141. From small-scale, high-stakes infiltration tactical ops to highly classified missions, players will deploy alongside friends in a truly immersive experience. Infinity Ward brings fans state-of-the-art gameplay, with all-new gun handling, advanced AI system, a new Gunsmith and a suite of other gameplay and graphical innovations that elevate the franchise to new heights. Modern Warfare® II launches with a globe-trotting single-player campaign, immersive Multiplayer combat and a narrative-driven, co-op Special Ops experience. You also get access to Call of Duty®: Warzone™ 2.0, the all-new Battle Royale experience.','2022-10-28','895000','PEGI-18','OS: Windows® 10 64 Bit (latest update)
Processor: Intel® Core™ i3-6100 / Core™ i5-2500K or AMD Ryzen™ 3 1200
Memory: 8 GB RAM
Graphics: NVIDIA® GeForce® GTX 960 or AMD Radeon™ RX 470 - DirectX 12.0 compatible system
DirectX: Version 12
Network: Broadband Internet connection
Storage: 125 GB available space','OS: Windows® 10 64 Bit (latest update) or Windows® 11 64 Bit (latest update)
Processor: Intel® Core™ i5-6600K / Core™ i7-4770 or AMD Ryzen™ 5 1400
Memory: 12 GB RAM
Graphics: NVIDIA® GeForce® GTX 1060 or AMD Radeon™ RX 580 - DirectX 12.0 compatible system
DirectX: Version 12
Network: Broadband Internet connection
Storage: 125 GB available space','D020');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G020','Stray','Stray is a 2022 adventure game developed by BlueTwelve Studio and published by Annapurna Interactive.','2022-07-19','325000','PEGI-7','OS: Windows 10
Processor: Intel Core i5-2300 | AMD FX-6350
Memory: 8 GB RAM
Graphics: NVIDIA GeForce GTX 650 Ti, 2 GB | AMD Radeon R7 360, 2 GB
DirectX: Version 12
Storage: 10 GB available space','OS: Windows 10
Processor: Intel Core i5-8400 | AMD Ryzen 5 2600
Memory: 8 GB RAM
Graphics: NVIDIA GeForce GTX 780, 3 GB | AMD Radeon R9 290X, 4 GB
DirectX: Version 12
Storage: 10 GB available space','D004');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G021','The Walking Dead','Five-part game series set in the same universe as Robert Kirkmans award-winning comic book series. Play as Lee Everett, a convicted criminal, who has been given a second chance at life in a world devastated by the undead.','2012-04-25','96000','PEGI-18','OS: XP Service Pack 3, Processor: 2.0 GHz Pentium 4 or equivalent, Memory: 3 GB RAM, Hard Disk Space: 2 GB, Video Card: ATI or nVidia card with 512 MB RAM','OS: Windows 7, Processor: Core 2 Duo 2GHz or equivalent, Memory: 3 GB RAM, Hard Disk Space: 2 GB, Video Card: ATI or nVidia card with 1024 MB RAM','D021');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G022','The Walking Dead Season Two','The Walking Dead: Season Two continues the story of Clementine, a young girl orphaned by the undead apocalypse.','2013-12-18','96000','PEGI-18','OS: XP Service Pack 3, Processor: 2.0 GHz Pentium 4 or equivalent, Memory: 3 GB RAM, Hard Disk Space: 2 GB, Video Card: ATI or nVidia card with 512 MB RAM','OS: Windows 7, Processor: Core 2 Duo 2GHz or equivalent, Memory: 3 GB RAM, Hard Disk Space: 2 GB, Video Card: ATI or nVidia card with 1024 MB RAM','D021');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G023','The Walking Dead : Michonne','The Walking Dead: Michonne - A Telltale Miniseries stars the iconic, blade-wielding character from Robert Kirkmans best-selling comic books','2016-02-24','116000','PEGI-18','OS: XP Service Pack 3, Processor: 2.0 GHz Pentium 4 or equivalent, Memory: 3 GB RAM, Hard Disk Space: 2 GB, Video Card: ATI or nVidia card with 512 MB RAM','OS: Windows 7, Processor: Core 2 Duo 2GHz or equivalent, Memory: 3 GB RAM, Hard Disk Space: 2 GB, Video Card: ATI or nVidia card with 1024 MB RAM','D021');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G024','The Walking Dead : A New Frontier','As Javier, a young man determined to find the family taken from him, you meet a young girl who has experienced her own unimaginable loss. Her name is Clementine, and your fates are bound together in a story where every choice you make could be your last.','2016-12-21','96000','PEGI-18','OS: Windows 7, Processor: Intel Core 2 Duo 2.4GHz, Memory: 3 GB RAM, Graphics: Nvidia GTS 450+ with 1024MB+ VRAM (excluding GT)','OS: Windows 7, Processor: Intel Core 2 Duo 2.4GHz, Memory: 3 GB RAM, Graphics: Nvidia GTS 450+ with 1024MB+ VRAM (excluding GT)','D021');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G025','The Walking Dead : The Final Season','Clementine, now a fierce and capable survivor, has reached the final chapter in her journey. After years on the road facing threats both living and dead, a secluded school might finally be her chance for a home.','2018-08-14','109000','PEGI-18','OS: Windows 7, Processor: Intel Core 2 Duo 2.4GHz, Memory: 3 GB RAM, Graphics: Nvidia GTS 450+ with 1024MB+ VRAM (excluding GT)','OS: Windows 7, Processor: Intel Core 2 Duo 2.4GHz, Memory: 3 GB RAM, Graphics: Nvidia GTS 450+ with 1024MB+ VRAM (excluding GT)','D021');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G026','The Walking Dead : Saints & Sinners','Saints & Sinners is a game unlike any other in The Walking Dead universe. Every challenge you face and decision you make is driven by YOU.','2020-01-24','170000','PEGI-18','OS: Windows 10, Processor: Intel i5-4590 / AMD Ryzen 5 1500X or greater, Memory: 8 GB RAM, Graphics: NVIDIA GTX 1060 / AMD Radeon RX 480 or greater','OS: Windows 10, Processor: Intel i7 8700k / AMD Ryzen 7 1800X, Memory: 16 GB RAM, Graphics: NVIDIA GTX 1070 / AMD Radeon Vega 56','D021');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G027','The Witcher: Enhanced Edition Directors Cut','Become The Witcher, Geralt of Rivia, a legendary monster slayer caught in a web of intrigue woven by forces vying for control of the world.','2008-09-16','90000','PEGI-18','Microsoft® Windows® /XP/Vista, Processor:Intel Pentium 4 2.4 GHz or Athlon 64 +2800, Graphics:NVIDIA GeForce 6600 or ATI Radeon 9800 or better, Memory:1 GB RAM (2 GB RAM recommended)','Microsoft® Windows® /XP/Vista, Processor:Intel Pentium 4 2.4 GHz or Athlon 64 +2800, Graphics:NVIDIA GeForce 6600 or ATI Radeon 9800 or better, Memory:1 GB RAM (2 GB RAM recommended)','D022');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G028','The Witcher 2: Assassins of Kings Enhanced Edition','A time of untold chaos has come. Mighty forces clash behind the scenes in a struggle for power and influence. The Northern Kingdoms mobilize for war. But armies on the march are not enough to stop a bloody conspiracy.','2011-05-17','136000','PEGI-18','Windows XP/Vista/7, Processor: Intel 2.2 GHz Dual-Core or AMD 2.5 GHz Dual-Core, Memory: 1.5 GB (Win XP), 2GB (Win Vista/Win 7), Graphics: GeForce 8800 (512 MB) or Radeon HD3850 (512 MB)','Windows XP/Vista/7, Processor: Intel or AMD Quad-Core, Memory: 3 GB (Win XP), 4GB (Win Vista/Win 7), Graphics: GeForce 260 (1 GB) or Radeon HD 4850 (1 GB).','D022');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G029','The Witcher® 3: Wild Hunt','As war rages on throughout the Northern Realms, you take on the greatest contract of your life — tracking down the Child of Prophecy, a living weapon that can alter the shape of the world.','2015-05-18','360000','PEGI-18','64-bit Windows 7, 64-bit Windows 8 (8.1) or 64-bit Windows 10, Processor: Intel CPU Core i5-2500K 3.3GHz / AMD CPU Phenom II X4 940, Memory: 6 GB RAM, Graphics: Nvidia GPU GeForce GTX 660 / AMD GPU Radeon HD 7870','64-bit Windows 7, 64-bit Windows 8 (8.1) or 64-bit Windows 10, Processor: Intel CPU Core i7 3770 3.4 GHz / AMD CPU AMD FX-8350 4 GHz, Memory: 8 GB RAM, Graphics: Nvidia GPU GeForce GTX 770 / AMD GPU Radeon R9 290','D022');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G030','Borderlands 3','The original shooter-looter returns, packing bazillions of guns and an all-new mayhem-fueled adventure!','2020-03-13','555000','PEGI-18','OS: Windows 7/10 (latest service pack), Processor: AMD FX-8350 or Intel i5-3570, Memory: 6 GB RAM, Graphics: AMD Radeon™ HD 7970 or NVIDIA GeForce GTX 680 2 GB','OS: Windows 7/10 (latest service pack), Processor: AMD Ryzen™ 5 2600 (Intel i7-4770), Memory: 16 GB RAM, Graphics: AMD Radeon™ RX 590 or NVIDIA GeForce GTX 1060 6GB','D023');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G031','Battlefield 1','Best of E3 2016: Best Action Game and gamescom Best Action Game award for 2016.','2016-10-20','479000','PEGI-18','OS: 64-bit Windows 7, Windows 8.1 and Windows 10
Processor: Processor (AMD): AMD FX-6350 Processor (Intel): Intel Core i5 6600K
Memory: 8 GB RAM
Graphics: Graphics card (AMD): AMD Radeon™ HD 7850 2GB Graphics card (NVIDIA): NVIDIA GeForce® GTX 660 2GB
DirectX: Version 11
Network: Broadband Internet connection
Storage: 50 GB available space','OS: 64-bit Windows 10 or later
Processor: Processor (AMD): AMD FX 8350 Wraith Processor (Intel): Intel Core i7 4790 or equivalent
Memory: 16 GB RAM
Graphics: Graphics card (AMD): AMD Radeon™ RX 480 4GB Graphics card (NVIDIA): NVIDIA GeForce® GTX 1060 3GB
DirectX: Version 11
Network: Broadband Internet connection
Storage: 50 GB available space','D001');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G032','Battlefield 4','Revel in the glorious chaos of all-out war packed with rewarding, tactical challenges in an interactive environment.','2013-10-29','479000','PEGI-18','OS: Windows 8 32-bit
Processor: Processor (AMD): Athlon X2 2.8 GHz Processor (Intel): Core 2 Duo 2.4 GHz
Memory: 4 GB RAM
Graphics: Graphics card (AMD): AMD Radeon HD 3870 Graphics card (NVIDIA): Nvidia GeForce 8800 GT
Network: Broadband Internet connection
Storage: 30 GB available space','OS: Windows 8 64-bit
Processor: Processor (AMD): Six-core CPU Processor (Intel): Quad-core CPU
Memory: 8 GB RAM
Graphics: Graphics card (AMD): AMD Radeon HD 7870 Graphics card (Nvidia): NVIDIA GeForce GTX 660
Network: Broadband Internet connection
Storage: 30 GB available space','D001');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G033','Battlefield 5','This is the ultimate Battlefield V experience.conflict with the complete arsenal of weapons, vehicles, and gadgets plus the best customization content of Year 1 and 2','2018-11-09','569000','PEGI-18','OS: 64-bit Windows 7, Windows 8.1 and Windows 10
Processor: AMD FX-8350/ Core i5 6600K
Memory: 8 GB RAM
Graphics: NVIDIA GeForce® GTX 1050 / NVIDIA GeForce® GTX 660 2GB or AMD Radeon™ RX 560 / HD 7850 2GB
DirectX: Version 11
Storage: 50 GB available space','OS: 64-bit Windows 10 or later
Processor: AMD Ryzen 3 1300X/Intel Core i7 4790
Memory: 12 GB RAM
Graphics: NVIDIA GeForce® GTX 1060 6GB/AMD Radeon™ RX 580 8GB
DirectX: Version 11
Storage: 50 GB available space','D001');
insert into game(G_ID, G_Nama, G_Deskripsi, G_Tglrilis, G_Harga, G_Agerating, G_SYSREQMINIMUM, G_SYSREQREC, Developer_D_ID) values ('G034','Battlefield 2042','Call the shots in Season 3: Escalation. Battlefield 2042 is a first-person shooter that marks the return to the iconic all-out warfare of the franchise.','2021-11-19','659000','PEGI-18','OS: 64-bit Windows 10
Processor: AMD Ryzen 5 1600, Core i5 6600K
Memory: 8 GB RAM
Graphics: AMD Radeon RX 560,Nvidia GeForce GTX 1050 Ti
DirectX: Version 12
Network: Broadband Internet connection
Storage: 100 GB available space','OS: 64-bit Windows 10
Processor: AMD Ryzen 7 2700X, Intel Core i7 4790
Memory: 16 GB RAM
Graphics: AMD Radeon RX 6600 XT, Nvidia GeForce RTX 3060
DirectX: Version 12
Network: Broadband Internet connection
Storage: 100 GB available space','D001');

#DLC
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC001','Tom Clancys Rainbow Six® Siege - The Safari Weapon Skin','Purchase this DLC and unlock 5 premium weapon skins to customize your loadout in coveted gold and animal skins.','50000','OS: Windows 7, Windows 8.1, Windows 10 (64bit versions required)
Processor: Intel Core i3 560 @ 3.3 GHz or AMD Phenom II X4 945 @ 3.0 GHz
Memory: 6 GB RAM
Graphics: NVIDIA GeForce GTX 460 or AMD Radeon HD 5870 (DirectX-11 compliant with 1GB of VRAM)
Network: Broadband Internet connection
Storage: 30 GB available space
Sound Card: DirectX® 9.0c compatible sound card with latest drivers','OS: Windows 7 SP1, Windows 8.1, Windows 10 (64bit versions required)
Processor: Intel Core i5-2500K @ 3.3 GHz or better or AMD FX-8120 @ 3.1 Ghz or better
Memory: 8 GB RAM
Graphics: NVIDIA GeForce GTX 670 (or GTX 760 / GTX 960) or AMD Radeon HD 7970 (or R9 280x [2GB VRAM] / R9 380 / Fury X)
Network: Broadband Internet connection
Storage: 47 GB available space
Sound Card: DirectX® 9.0c compatible sound card 5.1 with latest drivers','G003');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC002','Tom Clancys Rainbow Six® Siege - Amethyst Weapon Skin','Forge your weapons in Amethyst. This skin can be applied on all the weapons that were released until the end of Season Four.','30000','OS: Windows 7, Windows 8.1, Windows 10 (64bit versions required)
Processor: Intel Core i3 560 @ 3.3 GHz or AMD Phenom II X4 945 @ 3.0 GHz
Memory: 6 GB RAM
Graphics: NVIDIA GeForce GTX 460 or AMD Radeon HD 5870 (DirectX-11 compliant with 1GB of VRAM)
Network: Broadband Internet connection','OS: Windows 7 SP1, Windows 8.1, Windows 10 (64bit versions required)
Processor: Intel Core i5-2500K @ 3.3 GHz or better or AMD FX-8120 @ 3.1 Ghz or better
Memory: 8 GB RAM
Graphics: NVIDIA GeForce GTX 670 (or GTX 760 / GTX 960) or AMD Radeon HD 7970 (or R9 280x [2GB VRAM] / R9 380 / Fury X)
Network: Broadband Internet connection
Storage: 47 GB available space
Sound Card: DirectX® 9.0c compatible sound card 5.1 with latest drivers','G003');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC003','Tom Clancys Rainbow Six® Siege - Emerald Weapon Skin','Forge your weapons in Emerald. This skin can be applied on all the weapons that were released until the end of Season Four.','30000','OS: Windows 7, Windows 8.1, Windows 10 (64bit versions required)
Processor: Intel Core i3 560 @ 3.3 GHz or AMD Phenom II X4 945 @ 3.0 GHz
Memory: 6 GB RAM
Graphics: NVIDIA GeForce GTX 460 or AMD Radeon HD 5870 (DirectX-11 compliant with 1GB of VRAM)
Network: Broadband Internet connection
Storage: 30 GB available space
Sound Card: DirectX® 9.0c compatible sound card with latest drivers','OS: Windows 7 SP1, Windows 8.1, Windows 10 (64bit versions required)
Processor: Intel Core i5-2500K @ 3.3 GHz or better or AMD FX-8120 @ 3.1 Ghz or better
Memory: 8 GB RAM
Graphics: NVIDIA GeForce GTX 670 (or GTX 760 / GTX 960) or AMD Radeon HD 7970 (or R9 280x [2GB VRAM] / R9 380 / Fury X)
Network: Broadband Internet connection
Storage: 47 GB available space
Sound Card: DirectX® 9.0c compatible sound card 5.1 with latest drivers','G003');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC004','Tom Clancys Rainbow Six® Siege - Cobalt Weapon Skin','Forge your weapons in Cobalt. This skin can be applied on all the weapons that were released until the end of Season Four.','30000','OS: Windows 7, Windows 8.1, Windows 10 (64bit versions required)
Processor: Intel Core i3 560 @ 3.3 GHz or AMD Phenom II X4 945 @ 3.0 GHz
Memory: 6 GB RAM
Graphics: NVIDIA GeForce GTX 460 or AMD Radeon HD 5870 (DirectX-11 compliant with 1GB of VRAM)
Network: Broadband Internet connection
Storage: 30 GB available space
Sound Card: DirectX® 9.0c compatible sound card with latest drivers','OS: Windows 7 SP1, Windows 8.1, Windows 10 (64bit versions required)
Processor: Intel Core i5-2500K @ 3.3 GHz or better or AMD FX-8120 @ 3.1 Ghz or better
Memory: 8 GB RAM
Graphics: NVIDIA GeForce GTX 670 (or GTX 760 / GTX 960) or AMD Radeon HD 7970 (or R9 280x [2GB VRAM] / R9 380 / Fury X)
Network: Broadband Internet connection
Storage: 47 GB available space
Sound Card: DirectX® 9.0c compatible sound card 5.1 with latest drivers','G003');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC005','Tom Clancys Rainbow Six® Siege - Platinum Weapon Skin','Forge your weapons in Platinum. This skin can be applied to any weapon in your loadout.','30000','OS: Windows 7, Windows 8.1, Windows 10 (64bit versions required)
Processor: Intel Core i3 560 @ 3.3 GHz or AMD Phenom II X4 945 @ 3.0 GHz
Memory: 6 GB RAM
Graphics: NVIDIA GeForce GTX 460 or AMD Radeon HD 5870 (DirectX-11 compliant with 1GB of VRAM)
Network: Broadband Internet connection
Storage: 30 GB available space
Sound Card: DirectX® 9.0c compatible sound card with latest drivers','OS: Windows 7 SP1, Windows 8.1, Windows 10 (64bit versions required)
Processor: Intel Core i5-2500K @ 3.3 GHz or better or AMD FX-8120 @ 3.1 Ghz or better
Memory: 8 GB RAM
Graphics: NVIDIA GeForce GTX 670 (or GTX 760 / GTX 960) or AMD Radeon HD 7970 (or R9 280x [2GB VRAM] / R9 380 / Fury X)
Network: Broadband Internet connection
Storage: 47 GB available space
Sound Card: DirectX® 9.0c compatible sound card 5.1 with latest drivers','G003');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC006','Tom Clancys Rainbow Six® Siege - Ruby Weapon Skin','Forge your weapons in Ruby. These skins can be applied on all the weapons that were released until the end of Season Four.','30000','OS: Windows 7, Windows 8.1, Windows 10 (64bit versions required)
Processor: Intel Core i3 560 @ 3.3 GHz or AMD Phenom II X4 945 @ 3.0 GHz
Memory: 6 GB RAM
Graphics: NVIDIA GeForce GTX 460 or AMD Radeon HD 5870 (DirectX-11 compliant with 1GB of VRAM)
Network: Broadband Internet connection
Sound Card: DirectX® 9.0c compatible sound card with latest drivers','OS: Windows 7 SP1, Windows 8.1, Windows 10 (64bit versions required)
Processor: Intel Core i5-2500K @ 3.3 GHz or better or AMD FX-8120 @ 3.1 Ghz or better
Memory: 8 GB RAM
Graphics: NVIDIA GeForce GTX 670 (or GTX 760 / GTX 960) or AMD Radeon HD 7970 (or R9 280x [2GB VRAM] / R9 380 / Fury X)
Network: Broadband Internet connection
Sound Card: DirectX® 9.0c compatible sound card 5.1 with latest drivers','G003');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC007','Tom Clancys Rainbow Six® Siege - Topaz Weapon Skin','Forge your weapons in Topaz. This skin can be applied to any weapon in your loadout.','30000','OS: Windows 7, Windows 8.1, Windows 10 (64bit versions required)
Processor: Intel Core i3 560 @ 3.3 GHz or AMD Phenom II X4 945 @ 3.0 GHz
Memory: 6 GB RAM
Graphics: NVIDIA GeForce GTX 460 or AMD Radeon HD 5870 (DirectX-11 compliant with 1GB of VRAM)
Network: Broadband Internet connection
Sound Card: DirectX® 9.0c compatible sound card with latest drivers','OS: Windows 7 SP1, Windows 8.1, Windows 10 (64bit versions required)
Processor: Intel Core i5-2500K @ 3.3 GHz or better or AMD FX-8120 @ 3.1 Ghz or better
Memory: 8 GB RAM
Graphics: NVIDIA GeForce GTX 670 (or GTX 760 / GTX 960) or AMD Radeon HD 7970 (or R9 280x [2GB VRAM] / R9 380 / Fury X)
Network: Broadband Internet connection
Sound Card: DirectX® 9.0c compatible sound card 5.1 with latest drivers','G003');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC008','Tom Clancys Rainbow Six® Siege - Cyan Weapon Skin','Forge your weapons in Cyan. This skin can be applied to any weapon in your loadout.','30000','OS: Windows 7, Windows 8.1, Windows 10 (64bit versions required)
Processor: Intel Core i3 560 @ 3.3 GHz or AMD Phenom II X4 945 @ 3.0 GHz
Memory: 6 GB RAM
Graphics: NVIDIA GeForce GTX 460 or AMD Radeon HD 5870 (DirectX-11 compliant with 1GB of VRAM)
Network: Broadband Internet connection
Sound Card: DirectX® 9.0c compatible sound card with latest drivers','OS: Windows 7 SP1, Windows 8.1, Windows 10 (64bit versions required)
Processor: Intel Core i5-2500K @ 3.3 GHz or better or AMD FX-8120 @ 3.1 Ghz or better
Memory: 8 GB RAM
Graphics: NVIDIA GeForce GTX 670 (or GTX 760 / GTX 960) or AMD Radeon HD 7970 (or R9 280x [2GB VRAM] / R9 380 / Fury X)
Network: Broadband Internet connection
Sound Card: DirectX® 9.0c compatible sound card 5.1 with latest drivers','G003');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC009','Apex Legends™ - Champion Edition','Ready to become an Apex Champion? The Champion Edition is the best way to drop into the Arena with everything you need to instantly make your mark.

The Champion Edition includes:
9 Legends Unlocked (all characters up to Season 7)
3 Exclusive Legendary Character Skins: Wraith, Revenant, and Crypto
3 Exclusive Legendary Weapon Skins: Triple Take, Flatline, and Sentinel
Exclusive Legendary Gun Charm
1,000 Apex Coins

This game includes optional in-game purchases of virtual currency that can be used to acquire virtual in-game items, including a random selection of virtual in-game items.','562000','OS: 64-bit Windows 7
Processor: AMD FX 4350 or Equivalent, Intel Core i3 6300 or Equivalent
Memory: 6 GB RAM
Graphics: AMD Radeon™ HD 7730, NVIDIA GeForce® GT 640
DirectX: Version 11
Network: Broadband Internet connection
Storage: 22 GB available space','OS: 64-bit Windows 7
Processor: Ryzen 5 CPU or Equivalent
Memory: 8 GB RAM
Graphics: AMD Radeon™ R9 290, NVIDIA GeForce® GTX 970
DirectX: Version 11
Network: Broadband Internet connection
Storage: 22 GB available space','G004');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC010','PAYDAY 2: Lost in Transit Heist','Picking up the bundle will net you a 44 % discount (may vary based on currency) for purchasing now.','52999','OS:Windows 7
Processor:2 GHz Intel Dual Core Processor
Memory:4 GB RAM
Graphics:Nvidia & AMD (512MB VRAM)
DirectX®:9.0c
Storage:83 GB available space
Sound:DirectX 9.0c compatible','OS:Windows 10
Processor:2.3 GHz Intel Quad Core Processor
Memory:8 GB RAM
Graphics:Nvidia & AMD (1GB VRAM)
DirectX®:9.0c
Storage:83 GB available space
Sound:DirectX 9.0c compatible','G005');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC011','PAYDAY 2: High Octane Tailor Pack','The Following is included in High Octane Tailor Pack:
2 Outfits with variations
6 Masks
2 Gloves
New outfits
The following outfits are included in High Octane Tailor Pack:
Road Rage - Biker Vest','25999','OS:Windows 7
Processor:2 GHz Intel Dual Core Processor
Memory:4 GB RAM
Graphics:Nvidia & AMD (512MB VRAM)
DirectX®:9.0c
Storage:83 GB available space
Sound:DirectX 9.0c compatible','OS:Windows 10
Processor:2.3 GHz Intel Quad Core Processor
Memory:8 GB RAM
Graphics:Nvidia & AMD (1GB VRAM)
DirectX®:9.0c
Storage:83 GB available space
Sound:DirectX 9.0c compatible','G005');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC012','Resident Evil 3 - Classic Costume Pack','Contains the classic Jill costume and classic Carlos hairstyle, based on the characters appearances in the original Resident Evil 3.','42000','Requires a 64-bit processor and operating system','Requires a 64-bit processor and operating system','G016');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC013','Resident Evil 3 - Special Soundtrack','24 haunting tracks from Resident Evil 3 and 21 spine-chilling tracks from Resident Evil Resistance combine to make a soundtrack befitting of survival horror.','262000','Storage: 488 MB available space','Storage (high-quality audio): Additional 613 MB available space','G016');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC014','Resident Evil 3 - All In Game Rewards Unlock','Instant unlock for the following rewards, which can also be unlocked through gameplay.','69000','OS: WINDOWS® 7, 8.1, 10 (64-BIT Required)','OS: WINDOWS® 10 (64-BIT Required)','G016');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC015','Stray - Original Soundtrack','Original Soundtrack for Stray by Yann van der Cruyssen. All tracks composed by Yann van der Cruyssen.','73000','Storage: 341 MB available space','Storage (high-quality audio): Additional 1910 MB available space','G020');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC016','Kombat Pack ','Kombat Pack grants early access to 4 upcoming playable characters and skin packs.','90000','OS: 64-bit: Vista, Win 7, Win 8, Win 10
Processor: Intel Core i5-750, 2.67 GHz | AMD Phenom II X4 965, 3.4 GHz
Memory: 3 GB RAM
Graphics: NVIDIA GeForce GTX 460 | AMD Radeon HD 5850
DirectX: Version 11
Network: Broadband Internet connection
Storage: 36 GB available space','OS: 64-bit: Win 7, Win 8, Win 10
Processor: Intel Core i7-3770, 3.4 GHz | AMD FX-8350, 4.0 GHz
Memory: 8 GB RAM
Graphics: NVIDIA GeForce GTX 660 | AMD Radeon HD 7950
DirectX: Version 11
Network: Broadband Internet connection
Storage: 44 GB available space','G011');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC017','Kombat Pack 2','Kombat Pack 2 grants access to 4 new playable characters, as well as previously released content including Goro, Kold War Skin Pack and 2 Klassic Fatality Packs.','136000','OS: 64-bit: Vista, Win 7, Win 8, Win 10
Processor: Intel Core i5-750, 2.67 GHz | AMD Phenom II X4 965, 3.4 GHz
Memory: 3 GB RAM
Graphics: NVIDIA GeForce GTX 460 | AMD Radeon HD 5850
DirectX: Version 11
Network: Broadband Internet connection
Storage: 36 GB available space','OS: 64-bit: Win 7, Win 8, Win 10
Processor: Intel Core i7-3770, 3.4 GHz | AMD FX-8350, 4.0 GHz
Memory: 8 GB RAM
Graphics: NVIDIA GeForce GTX 660 | AMD Radeon HD 7950
DirectX: Version 11
Network: Broadband Internet connection
Storage: 44 GB available space','G011');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC018','Dota 2 : The 2022 Battlepass','Featuring two parts loaded full of exclusive features and legendary rewards including all-new Immortals; Arcana items for Faceless Void and Razor, Personas for Phantom Assassin and Crystal Maiden a Prestige set for Primal Beast, and much more','91000','OS: Windows 7 or newer
Processor: Dual core from Intel or AMD at 2.8 GHz
Memory: 4 GB RAM
Graphics: NVIDIA GeForce 8600/9600GT, ATI/AMD Radeon HD2600/3600
DirectX: Version 9.0c
Network: Broadband Internet connection
Storage: 15 GB available space
Sound Card: DirectX Compatible','OS: Windows 7 or newer.
Processor: Dual core from Intel or AMD at 2.8 GHz.
Memory: 4 GB RAM.
Graphics: NVIDIA GeForce 8600/9600GT, ATI/AMD Radeon HD2600/3600.
DirectX: Version 9.0c.
Network: Broadband Internet connection.
Storage: 15 GB available space.
Sound Card: DirectX Compatible.','G015');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC019','Call of Duty®: Modern Warfare® II - Desert Rogue: Pro Pack','Get Call of Duty Points and in-game content for Call of Duty: Modern Warfare® II and Warzone™ 2.0.','272000','OS: Windows® 10 64 Bit (latest update)
Processor: Intel® Core™ i3-6100 / Core™ i5-2500K or AMD Ryzen™ 3 1200
Memory: 8 GB RAM
Graphics: NVIDIA® GeForce® GTX 960 or AMD Radeon™ RX 470 - DirectX 12.0 compatible system
DirectX: Version 12
Network: Broadband Internet connection
Storage: 125 GB available space','OS: Windows® 10 64 Bit (latest update) or Windows® 11 64 Bit (latest update)
Processor: Intel® Core™ i5-6600K / Core™ i7-4770 or AMD Ryzen™ 5 1400
Memory: 12 GB RAM
Graphics: NVIDIA® GeForce® GTX 1060 or AMD Radeon™ RX 580 - DirectX 12.0 compatible system
DirectX: Version 12
Network: Broadband Internet connection
Storage: 125 GB available space','G019');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC020','Monster Hunter World : Iceborne','Monster Hunter: Worlds adventures reach new heights in Monster Hunter World: Iceborne. With new monsters, new locales, new quests, new weapon combos, and so much more,','446000','OS: WINDOWS® 7, 8, 8.1, 10 (64-bit required)
Processor: Intel® Core™ i5 4460 or Core™ i3 9100F or AMD FX™-6300 or Ryzen™ 3 3200G
Memory: 8 GB RAM
Graphics: NVIDIA®GeForce®GTX 760 or GTX1050 or AMD Radeon™ R7 260x or RX 560
DirectX: Version 11
Network: Broadband Internet connection
Storage: 52 GB available space
Sound Card: DirectSound (DirectX® 9.0c or later)','OS: WINDOWS® 7, 8, 8.1, 10 (64-bit required)
Processor: Intel® Core™ i7 3770 or Core™ i3 8350 or Core™ i3 9350F / AMD Ryzen™ 5 1500X or Ryzen™ 5 3400G
Memory: 8 GB RAM
Graphics: NVIDIA® GeForce® GTX 1060 (VRAM 3GB) or GTX 1650 / AMD Radeon™ RX 480 or RX 570
DirectX: Version 11
Network: Broadband Internet connection
Storage: 52 GB available space
Sound Card: DirectSound (DirectX® 9.0c or later)','G012');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC021','PAYDAY 2 : Tijuana Music Pack ','with some of the epic tracks weve added throughout the Silk Road campaign. In addition to the music, this pack also contains a full outfit set celebrating in the style of the day of the dead, fitting into the Mexican theme.','33000','CPU : 2 GHz Intel Dual Core Processor. RAM: 4 GB. OS: Windows 7. VIDEO CARD: NVIDIA GeForce 8800/ATI Radeon HD 2600 (512 MB VRAM)','CPU : 2.3 GHz Intel Quad Core Processor. RAM: 8 GB. OS: Windows 10. VIDEO CARD: NVIDIA GeForce GTX460/ATI Radeon HD 5850 (1GB VRAM)','G005');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC022','PAYDAY 2 :  The McShay Weapon Pack 2','Our arsenal grows, Gemma is offering three new weapons, three exclusive sets along with plenty of mods for each.','33000','CPU : 2 GHz Intel Dual Core Processor. RAM: 4 GB. OS: Windows 7. VIDEO CARD: NVIDIA GeForce 8800/ATI Radeon HD 2600 (512 MB VRAM)','CPU : 2.3 GHz Intel Quad Core Processor. RAM: 8 GB. OS: Windows 10. VIDEO CARD: NVIDIA GeForce GTX460/ATI Radeon HD 5850 (1GB VRAM)','G005');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC023','The Walking Dead : 400 Days','Centered on a truck stop on a Georgia highway, this DLC episode for Season One of The Walking Dead by Telltale Games tells five linked stories of survival in the wake of the zombie apocalypse.','46000','OS: XP Service Pack 3, Processor: 2.0 GHz Pentium 4 or equivalent, Memory: 3 GB RAM, Hard Disk Space: 2 GB, Video Card: ATI or nVidia card with 512 MB RAM','OS: Windows 7, Processor: Core 2 Duo 2GHz or equivalent, Memory: 3 GB RAM, Hard Disk Space: 2 GB, Video Card: ATI or nVidia card with 1024 MB RAM','G021');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC024','The Sims™ 4 Cats & Dogs','Create a variety of cats and dogs, add them to your Sims homes to forever change their lives, and care for neighborhood pets as a veterinarian with The Sims™ 4 Cats & Dogs. ','240000','OS: 64 Bit Required. Windows 7 (SP1), Windows 8, Windows 8.1, or Windows 10; Processor: 3.3 GHz Intel Core i3-3220 (2 cores, 4 threads), AMD Ryzen 3 1200 3.1 GHz (4 cores); Memory: 4 GB RAM; Video Cards: NVIDIA GeForce 6600 or better, ATI Radeon X1300 ','OS: 64 Bit Windows 7, 8, 8.1, or 10; Processor: Intel core i5 (4 cores), AMD Ryzen 5 or better; Memory: 8 GB RAM; Graphics: 1 GB of Video RAM, NVIDIA GTX 650, AMD Radeon HD 7750,','G008');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC025','The Sims™ 4 City Living','Do your Sims long to leave the suburbs behind? Fulfill their dreams in the diverse city of San Myshuno, where they can discover exciting neighborhoods, move into a new apartment, check out fun festivals, and more.','240000','OS: 64 Bit Required. Windows 7 (SP1), Windows 8, Windows 8.1, or Windows 10; Processor: 3.3 GHz Intel Core i3-3220 (2 cores, 4 threads), AMD Ryzen 3 1200 3.1 GHz (4 cores); Memory: 4 GB RAM; Video Cards: NVIDIA GeForce 6600 or better, ATI Radeon X1300 ','OS: 64 Bit Windows 7, 8, 8.1, or 10; Processor: Intel core i5 (4 cores), AMD Ryzen 5 or better; Memory: 8 GB RAM; Graphics: 1 GB of Video RAM, NVIDIA GTX 650, AMD Radeon HD 7750,','G008');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC026','The Sims™ 4 Seasons','Add weather to your Sims lives to tell new stories, enjoy seasonal activities, and celebrate heartfelt holidays with The Sims™ 4 Seasons. Make the most out of the weather all year round, from crisp snowfalls to sweltering heat — every world is affected by seasons in unique ways.','240000','OS: 64 Bit Required. Windows 7 (SP1), Windows 8, Windows 8.1, or Windows 10; Processor: 3.3 GHz Intel Core i3-3220 (2 cores, 4 threads), AMD Ryzen 3 1200 3.1 GHz (4 cores); Memory: 4 GB RAM; Video Cards: NVIDIA GeForce 6600 or better, ATI Radeon X1300 ','OS: 64 Bit Windows 7, 8, 8.1, or 10; Processor: Intel core i5 (4 cores), AMD Ryzen 5 or better; Memory: 8 GB RAM; Graphics: 1 GB of Video RAM, NVIDIA GTX 650, AMD Radeon HD 7750,','G008');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC027','The Sims™ 4 Get To Work','You rule the workplace with The Sims™ 4 Get to Work. Actively control your Sims while theyre on the job, and determine whether theyre headed toward a big promotion or becoming the workplace menace.','240000','OS: 64 Bit Required. Windows 7 (SP1), Windows 8, Windows 8.1, or Windows 10; Processor: 3.3 GHz Intel Core i3-3220 (2 cores, 4 threads), AMD Ryzen 3 1200 3.1 GHz (4 cores); Memory: 4 GB RAM; Video Cards: NVIDIA GeForce 6600 or better, ATI Radeon X1300 ','OS: 64 Bit Windows 7, 8, 8.1, or 10; Processor: Intel core i5 (4 cores), AMD Ryzen 5 or better; Memory: 8 GB RAM; Graphics: 1 GB of Video RAM, NVIDIA GTX 650, AMD Radeon HD 7750,','G008');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC028','Pamali: The Tied Corpse','A new gravekeeper, Cecep, suddenly given the responsibility to take care of a certain burial, despite being a first-timer. However, during the burial, Cecep is left to make a key decision which would decide his fate','50000','OS: Windows 7 64-bit Processor: Intel(R) Core(TM) i5-7200U CPU @ 2.50Ghz Memory: 4 GB RAM Graphics: NVIDIA GeForce 940MX DirectX: Version 11 Storage: 2 GB available space','OS: Windows 10 Pro 64-bit Processor: Intel(R) Core(TM) i7-6700 CPU @ 3.40Ghz Memory: 16 GB RAM Graphics: NVIDIA GeForce GTX 970 DirectX: Version 12 Storage: 3 GB available space','G010');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC029','Pamali: The Little Devil','A young daughter named Putri needs to pay her father’s medical bills. Remembering that she has an inheritance from her unknown grandfather, she decides to pawn all valuable items there as a way to get quick money.','50000','OS: Windows 7 64-bit Processor: Intel(R) Core(TM) i5-7200U CPU @ 2.50Ghz Memory: 4 GB RAM Graphics: NVIDIA GeForce 940MX DirectX: Version 11 Storage: 2 GB available space','OS: Windows 10 Pro 64-bit Processor: Intel(R) Core(TM) i7-6700 CPU @ 3.40Ghz Memory: 16 GB RAM Graphics: NVIDIA GeForce GTX 970 DirectX: Version 12 Storage: 3 GB available space','G010');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC030','Pamali: The Hungry Witch','Kirana, a pregnant mother, stubbornly goes alone late at night despite her mother’s warnings. Once she gets home, she finds out that everything has changed. Now, not only her life but her unborn baby, are chased around by an immediate danger.','50000','OS: Windows 7 64-bit Processor: Intel(R) Core(TM) i5-7200U CPU @ 2.50Ghz Memory: 4 GB RAM Graphics: NVIDIA GeForce 940MX DirectX: Version 11 Storage: 2 GB available space','OS: Windows 10 Pro 64-bit Processor: Intel(R) Core(TM) i7-6700 CPU @ 3.40Ghz Memory: 16 GB RAM Graphics: NVIDIA GeForce GTX 970 DirectX: Version 12 Storage: 3 GB available space','G010');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC031','Borderlands 3: Moxxis Heist of the Handsome Jackpot','Ready for the biggest score of your loot-hunting career? Moxxi has just the job for you: a good old-fashioned heist.','219000','OS: Windows 7/10 (latest service pack), Processor: AMD FX-8350 or Intel i5-3570, Memory: 6 GB RAM, Graphics: AMD Radeon™ HD 7970 or NVIDIA GeForce GTX 680 2 GB','OS: Windows 7/10 (latest service pack), Processor: AMD Ryzen™ 5 2600 (Intel i7-4770), Memory: 16 GB RAM, Graphics: AMD Radeon™ RX 590 or NVIDIA GeForce GTX 1060 6GB','G030');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC032','Borderlands 3: Guns, Love, and Tentacles','The only thing more precious than loot is love. Its time for a joyous celebration now that Sir Alistair Hammerlock and Wainwright Jakobs have announced their upcoming nuptials.','219000','OS: Windows 7/10 (latest service pack), Processor: AMD FX-8350 or Intel i5-3570, Memory: 6 GB RAM, Graphics: AMD Radeon™ HD 7970 or NVIDIA GeForce GTX 680 2 GB','OS: Windows 7/10 (latest service pack), Processor: AMD Ryzen™ 5 2600 (Intel i7-4770), Memory: 16 GB RAM, Graphics: AMD Radeon™ RX 590 or NVIDIA GeForce GTX 1060 6GB','G030');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC033','Borderlands 3: Bounty of Blood','Welcome to Gehenna, a brutal frontier planet at the outskirts of space. Youve come to the humble town of Vestige in hopes of collecting a bounty on The Devil Riders, a violent gang of beast-riding mercenaries.','219000','OS: Windows 7/10 (latest service pack), Processor: AMD FX-8350 or Intel i5-3570, Memory: 6 GB RAM, Graphics: AMD Radeon™ HD 7970 or NVIDIA GeForce GTX 680 2 GB','OS: Windows 7/10 (latest service pack), Processor: AMD Ryzen™ 5 2600 (Intel i7-4770), Memory: 16 GB RAM, Graphics: AMD Radeon™ RX 590 or NVIDIA GeForce GTX 1060 6GB','G030');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC034','Borderlands 3: Psycho Krieg and the Fantastic Fustercluck','Bloodthirsty psychos are everywhere in the Borderlands, but what makes them so uniformly deranged? Brilliant scientist Patricia Tannis theorizes theyve all been driven insane by the knowledge of a mythical place shes dubbed Vaulthalla.','219000','OS: Windows 7/10 (latest service pack), Processor: AMD FX-8350 or Intel i5-3570, Memory: 6 GB RAM, Graphics: AMD Radeon™ HD 7970 or NVIDIA GeForce GTX 680 2 GB','OS: Windows 7/10 (latest service pack), Processor: AMD Ryzen™ 5 2600 (Intel i7-4770), Memory: 16 GB RAM, Graphics: AMD Radeon™ RX 590 or NVIDIA GeForce GTX 1060 6GB','G030');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC035','Borderlands 3: Amara Final Form Pack','The Multiverse Final Form Amara Cosmetic Pack imagines what Amara the Siren wouldve looked like if she never became a Vault Hunter!','150000','OS: Windows 7/10 (latest service pack), Processor: AMD FX-8350 or Intel i5-3570, Memory: 6 GB RAM, Graphics: AMD Radeon™ HD 7970 or NVIDIA GeForce GTX 680 2 GB','OS: Windows 7/10 (latest service pack), Processor: AMD Ryzen™ 5 2600 (Intel i7-4770), Memory: 16 GB RAM, Graphics: AMD Radeon™ RX 590 or NVIDIA GeForce GTX 1060 6GB','G030');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC036','Borderlands 3: Zane Final Form Pack','The Multiverse Final Form Zane Cosmetic Pack imagines what Zane the Operator wouldve looked like if he never became a Vault Hunter!','150000','OS: Windows 7/10 (latest service pack), Processor: AMD FX-8350 or Intel i5-3570, Memory: 6 GB RAM, Graphics: AMD Radeon™ HD 7970 or NVIDIA GeForce GTX 680 2 GB','OS: Windows 7/10 (latest service pack), Processor: AMD Ryzen™ 5 2600 (Intel i7-4770), Memory: 16 GB RAM, Graphics: AMD Radeon™ RX 590 or NVIDIA GeForce GTX 1060 6GB','G030');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC037','Borderlands 3: Moze Final Form Pack','The Multiverse Final Form Moze Cosmetic Pack imagines what Moze the Gunner wouldve looked like if she never became a Vault Hunter!','150000','OS: Windows 7/10 (latest service pack), Processor: AMD FX-8350 or Intel i5-3570, Memory: 6 GB RAM, Graphics: AMD Radeon™ HD 7970 or NVIDIA GeForce GTX 680 2 GB','OS: Windows 7/10 (latest service pack), Processor: AMD Ryzen™ 5 2600 (Intel i7-4770), Memory: 16 GB RAM, Graphics: AMD Radeon™ RX 590 or NVIDIA GeForce GTX 1060 6GB','G030');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC038','Borderlands 3: FL4K Final Form Pack','The Multiverse Final Form FL4K Cosmetic Pack imagines what FL4K the Beastmaster wouldve looked like if they never became a Vault Hunter!','150000','OS: Windows 7/10 (latest service pack), Processor: AMD FX-8350 or Intel i5-3570, Memory: 6 GB RAM, Graphics: AMD Radeon™ HD 7970 or NVIDIA GeForce GTX 680 2 GB','OS: Windows 7/10 (latest service pack), Processor: AMD Ryzen™ 5 2600 (Intel i7-4770), Memory: 16 GB RAM, Graphics: AMD Radeon™ RX 590 or NVIDIA GeForce GTX 1060 6GB','G030');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC039','Borderlands 3: Multiverse Disciples of the Vault Amara','The Multiverse Disciples of the Vault Amara Cosmetic Pack imagines what Amara the Siren wouldve looked like if she became a bandit and joined the Children of the Vault!','150000','OS: Windows 7/10 (latest service pack), Processor: AMD FX-8350 or Intel i5-3570, Memory: 6 GB RAM, Graphics: AMD Radeon™ HD 7970 or NVIDIA GeForce GTX 680 2 GB','OS: Windows 7/10 (latest service pack), Processor: AMD Ryzen™ 5 2600 (Intel i7-4770), Memory: 16 GB RAM, Graphics: AMD Radeon™ RX 590 or NVIDIA GeForce GTX 1060 6GB','G030');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC040','Borderlands 3: Multiverse Disciples of the Vault FL4K','The Multiverse Disciples of the Vault FL4K Cosmetic Pack imagines what FL4K the Beastmaster wouldve looked like if they became a bandit and joined the Children of the Vault!','150000','OS: Windows 7/10 (latest service pack), Processor: AMD FX-8350 or Intel i5-3570, Memory: 6 GB RAM, Graphics: AMD Radeon™ HD 7970 or NVIDIA GeForce GTX 680 2 GB','OS: Windows 7/10 (latest service pack), Processor: AMD Ryzen™ 5 2600 (Intel i7-4770), Memory: 16 GB RAM, Graphics: AMD Radeon™ RX 590 or NVIDIA GeForce GTX 1060 6GB','G030');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC041','Borderlands 3: Multiverse Disciples of the Vault Moze','The Multiverse Disciples of the Vault Moze Cosmetic Pack imagines what Moze the Gunner wouldve looked like if she became a bandit and joined the Children of the Vault!','150000','OS: Windows 7/10 (latest service pack), Processor: AMD FX-8350 or Intel i5-3570, Memory: 6 GB RAM, Graphics: AMD Radeon™ HD 7970 or NVIDIA GeForce GTX 680 2 GB','OS: Windows 7/10 (latest service pack), Processor: AMD Ryzen™ 5 2600 (Intel i7-4770), Memory: 16 GB RAM, Graphics: AMD Radeon™ RX 590 or NVIDIA GeForce GTX 1060 6GB','G030');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC042','Borderlands 3: Multiverse Disciples of the Vault Zane','The Multiverse Disciples of the Vault Zane Cosmetic Pack imagines what Zane the Operator wouldve looked like if he became a bandit and joined the Children of the Vault!','150000','OS: Windows 7/10 (latest service pack), Processor: AMD FX-8350 or Intel i5-3570, Memory: 6 GB RAM, Graphics: AMD Radeon™ HD 7970 or NVIDIA GeForce GTX 680 2 GB','OS: Windows 7/10 (latest service pack), Processor: AMD Ryzen™ 5 2600 (Intel i7-4770), Memory: 16 GB RAM, Graphics: AMD Radeon™ RX 590 or NVIDIA GeForce GTX 1060 6GB','G030');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC043','Borderlands 3: Designers Cut','Expand your Borderlands 3 experience with the Designers Cut add-on content, featuring the new Arms Race mode and an additional skill tree for every Vault Hunter when you own this DLC!','219000','OS: Windows 7/10 (latest service pack), Processor: AMD FX-8350 or Intel i5-3570, Memory: 6 GB RAM, Graphics: AMD Radeon™ HD 7970 or NVIDIA GeForce GTX 680 2 GB','OS: Windows 7/10 (latest service pack), Processor: AMD Ryzen™ 5 2600 (Intel i7-4770), Memory: 16 GB RAM, Graphics: AMD Radeon™ RX 590 or NVIDIA GeForce GTX 1060 6GB','G030');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC044','Borderlands 3: Directors Cut','Borderlands 3 gets even bigger with the Directors Cut add-on, featuring a raid boss encounter, additional story missions, behind-the-scenes extras, and three sets of themed collectibles!','219000','OS: Windows 7/10 (latest service pack), Processor: AMD FX-8350 or Intel i5-3570, Memory: 6 GB RAM, Graphics: AMD Radeon™ HD 7970 or NVIDIA GeForce GTX 680 2 GB','OS: Windows 7/10 (latest service pack), Processor: AMD Ryzen™ 5 2600 (Intel i7-4770), Memory: 16 GB RAM, Graphics: AMD Radeon™ RX 590 or NVIDIA GeForce GTX 1060 6GB','G030');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC045','Borderlands 3: Butt Stallion Cosmetic Pack','The Butt Stallion Cosmetic Pack includes the following content, for use in Borderlands 3: • Butt Stallion weapon skin • Butt Stallion weapon trinket • Butt Stallion grenade mod','150000','OS: Windows 7/10 (latest service pack), Processor: AMD FX-8350 or Intel i5-3570, Memory: 6 GB RAM, Graphics: AMD Radeon™ HD 7970 or NVIDIA GeForce GTX 680 2 GB','OS: Windows 7/10 (latest service pack), Processor: AMD Ryzen™ 5 2600 (Intel i7-4770), Memory: 16 GB RAM, Graphics: AMD Radeon™ RX 590 or NVIDIA GeForce GTX 1060 6GB','G030');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC046','Battlefield 1 Season pass','Unlock exclusive content with battlefield 1 season pass','150000','OS: 64-bit Windows 7, Windows 8.1 and Windows 10
Processor: Processor (AMD): AMD FX-6350 Processor (Intel): Intel Core i5 6600K
Memory: 8 GB RAM
Graphics: Graphics card (AMD): AMD Radeon™ HD 7850 2GB Graphics card (NVIDIA): NVIDIA GeForce® GTX 660 2GB
DirectX: Version 11
Network: Broadband Internet connection
Storage: 50 GB available space','OS: 64-bit Windows 10 or later
Processor: Processor (AMD): AMD FX 8350 Wraith Processor (Intel): Intel Core i7 4790 or equivalent
Memory: 16 GB RAM
Graphics: Graphics card (AMD): AMD Radeon™ RX 480 4GB Graphics card (NVIDIA): NVIDIA GeForce® GTX 1060 3GB
DirectX: Version 11
Network: Broadband Internet connection
Storage: 50 GB available space','G031');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC047','Battlefield 4 Season pass','Unlock exclusive content with battlefield 4 season pass','150000','OS: Windows 8 32-bit
Processor: Processor (AMD): Athlon X2 2.8 GHz Processor (Intel): Core 2 Duo 2.4 GHz
Memory: 4 GB RAM
Graphics: Graphics card (AMD): AMD Radeon HD 3870 Graphics card (NVIDIA): Nvidia GeForce 8800 GT
Network: Broadband Internet connection
Storage: 30 GB available space','OS: Windows 8 64-bit
Processor: Processor (AMD): Six-core CPU Processor (Intel): Quad-core CPU
Memory: 8 GB RAM
Graphics: Graphics card (AMD): AMD Radeon HD 7870 Graphics card (Nvidia): NVIDIA GeForce GTX 660
Network: Broadband Internet connection
Storage: 30 GB available space','G032');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC048','Battlefield 5 Season pass','Unlock exclusive content with battlefield 5 season pass','150000','OS: 64-bit Windows 7, Windows 8.1 and Windows 10
Processor: AMD FX-8350/ Core i5 6600K
Memory: 8 GB RAM
Graphics: NVIDIA GeForce® GTX 1050 / NVIDIA GeForce® GTX 660 2GB or AMD Radeon™ RX 560 / HD 7850 2GB
DirectX: Version 11
Storage: 50 GB available space','OS: 64-bit Windows 10 or later
Processor: AMD Ryzen 3 1300X/Intel Core i7 4790
Memory: 12 GB RAM
Graphics: NVIDIA GeForce® GTX 1060 6GB/AMD Radeon™ RX 580 8GB
DirectX: Version 11
Storage: 50 GB available space','G033');
insert into DLC(DLC_ID, DLC_NAMA, DLC_DESKRIPSI, DLC_HARGA, DLC_SYSREQMIN, DLC_SYSREQREC, GAME_G_ID) values ('DLC049','Battlefield 2042 Season pass','Unlock exclusive content with battlefield 2042 season pass','150000','OS: 64-bit Windows 10
Processor: AMD Ryzen 5 1600, Core i5 6600K
Memory: 8 GB RAM
Graphics: AMD Radeon RX 560,Nvidia GeForce GTX 1050 Ti
DirectX: Version 12
Network: Broadband Internet connection
Storage: 100 GB available space','OS: 64-bit Windows 10
Processor: AMD Ryzen 7 2700X, Intel Core i7 4790
Memory: 16 GB RAM
Graphics: AMD Radeon RX 6600 XT, Nvidia GeForce RTX 3060
DirectX: Version 12
Network: Broadband Internet connection
Storage: 100 GB available space','G034');



#BUNDLE
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU001','PAYDAY 2 : Lost In Transit Bundle','80000',"This bundle contains 4 DLCs: the High Octane Tailor Pack, the Tijuana Music Pack, the McShay Weapon Pack 2 and the Lost in Transit Heist.");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU002','THE WALKING DEAD – ULTIMATE BUNDLE','692000',"THE WALKING DEAD: THE ULTIMATE STEAM BUNDLE includes over 6 games that defined a generation in both narrative storytelling and now in VR Survival Combat.");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU003','THE SIMS™ 4 Complete DLC Bundle','718500',"This bundle contains 4 DLCs: The Sims 4 Cats & Dogs, City Living, Seasons, and Get to Work");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU004','THE WITCHER TRILOGY','527000',"This bundle contains 3 Witcher Games: The Witcher, The Witcher 2, The Witcher 3");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU005','PAMALI: COMPLETE THE COLLECTION BUNDLE','120000',"Get the full Indonesian narrative horror game experience with Pamali: Complete the Collection. This includes only the three DLCs of Pamali");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU006',"Tom Clancy's Rainbow Six® Siege SKIN PACKAGE I BUNDLE",'100000',"This bundle contain: The safari weapon skin, Amethyst weapon skin, and emerald weapon skin");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU007',"Tom Clancy's Rainbow Six® Siege SKIN PACKAGE II BUNDLE",'70000',"This bundle contain: Cobalt weapon skin, Platinum weapon skin, and Ruby weapon skin");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU008',"Tom Clancy's Rainbow Six® Siege SKIN PACKAGE III BUNDLE",'50000',"This bundle contain: Topaz weapon skin and Cyan weapon skin");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU009','BORDERLANDS 3 SEASON PASS BUNDLE','1182000',"Get two seasons' worth of Borderlands 3's premium add-on content in one glorious package with the Season Pass Bundle! Make more mayhem with additional story campaigns, a challenging raid boss, an extra skill tree for each Vault Hunter, kickin' cosmetic items, and more!");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU010','FPS complete BUNDLE','1000000',"This bundle contains some of the TOP FPS Games");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU011','Mortal Kombat Advanced Bundle','300000',"This bundle contains base game of Mortal Kombat, Kombat Pack, and Kombat Pack 2");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU012','The Sims™ 4 starter DLC bundle','400000',"This bundle contains The Sims™ 4 Cats & Dogs DLC and city living DLC");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU013','Stray complete edition bundle','250000',"This bundle contains base game of Stray and Stray - original Soundtrack DLC");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU014','Call of Duty complete edition bundle','1000000',"This bundle contains base game of call of duty and Call of Duty®: Modern Warfare® II - Desert Rogue: Pro Pack DLC");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU015',"'The' Games Bundle",'1000000',"This bundle contains games that start with the word 'The'");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU016','FPS Starter Bundle','80000',"This bundle contains base game of CS:GO and base game of valorant");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU017','FPS Intermediate Bundle','400000',"This bundle contains base game of CSGO, Valorant, and Overwatch");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU018','Resident Evil 3 Complete Edition','800000',"This bundle contains: RE 3 + 3 additional DLC's");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU019','GAME COLLECTOR BUNDLE','5000000',"This bundle contains every game on the market");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU020','FPS advanced Bundle','900000',"This bundle contains base game of CSGO, Valorant, Overwatch, and call of duty");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU021','Borderlands 3 : Multiverse Pass','500000',"This bundle contains: The Multiple Disciples DLC's");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU022','Borderlands 3 : Final Form Bundle','30000',"This bundle contains Borderlands 3: Amara Final Form Pack, Borderlands 3: Zane Final Form Pack, Borderlands 3: Moze Final Form Pack, Borderlands 3: FL4K Final Form Pack");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU023','GAME COLLECTOR DLC EDITION BUNDLE','6000000',"This bundle contains every DLC in the market");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU024','GAME COLLECTOR COMPLETE EDITION BUNDLE','10000000',"This bundle contains every base game and its DLC in the market");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU025','Battlefield 1 complete edition bundle','500000',"This bundle contains base game of Battlefield 1 and battlefield 1 season pass");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU026','Battlefield 4 complete edition bundle','500000',"This bundle contains base game of Battlefield 4 and battlefield 4 season pass");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU027','Battlefield 5 complete edition bundle','600000',"This bundle contains base game of Battlefield 5 and battlefield 5 season pass");
insert into Bundle(BU_ID, BU_NAMA, BU_HARGA, BU_DESKRIPSI) values ('BU028','Battlefield 2041 complete edition bundle','700000',"This bundle contains base game of Battlefield 2042 and battlefield 2042 season pass");

#TRANSAKSI
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR001','Steam wallet','2001-03-11','U001');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR002','Credit Card','2002-01-19','U002');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR003','Paypal','2002-04-02','U003');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR004','Gopay','2004-03-06','U004');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR005','Ovo','2004-04-30','U005');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR006','Steam wallet','2001-03-19','U001');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR007','Credit Card','2002-01-12','U001');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR008','Paypal','2002-04-17','U001');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR009','Gopay','2004-03-26','U002');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR010','Ovo','2004-04-30','U002');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR011','Steam wallet','2005-08-04','U002');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR012','Credit Card','2006-02-09','U003');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR013','Paypal','2007-08-15','U003');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR014','Gopay','2008-04-16','U003');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR015','Ovo','2009-12-31','U004');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR016','Steam wallet','2010-04-26','U004');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR017','Credit Card','2011-07-29','U004');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR018','Paypal','2013-03-20','U005');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR019','Gopay','2014-11-05','U005');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR020','Ovo','2015-07-08','U005');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR021','Steam wallet','2015-09-27','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR022','Credit Card','2016-03-31','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR023','Paypal','2016-05-08','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR024','Gopay','2017-01-22','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR025','Ovo','2017-02-09','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR026','Steam wallet','2018-08-17','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR027','Credit Card','2020-02-25','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR028','Paypal','2020-05-08','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR029','Gopay','2020-10-13','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR030','Ovo','2021-02-01','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR031','Steam wallet','2001-01-03','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR032','Credit Card','2001-05-13','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR033','Paypal','2001-07-26','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR034','Gopay','2001-10-17','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR035','Ovo','2003-07-13','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR036','Steam wallet','2004-04-13','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR037','Credit Card','2004-05-14','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR038','Paypal','2005-12-06','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR039','Gopay','2006-03-25','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR040','Steam wallet','2006-11-11','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR041','Credit Card','2007-01-21','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR042','Paypal','2007-05-13','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR043','Gopay','2007-08-12','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR044','Ovo','2008-05-21','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR045','Steam wallet','2009-01-10','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR046','Credit Card','2011-08-07','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR047','Paypal','2013-01-21','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR048','Gopay','2013-05-08','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR049','Ovo','2016-08-04','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR050','Steam wallet','2017-06-03','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR051','Credit Card','2017-07-19','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR052','Paypal','2018-03-05','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR053','Gopay','2018-04-13','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR054','Steam wallet','2021-04-15','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR055','Credit Card','2021-06-26','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR056','Paypal','2002-03-10','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR057','Gopay','2002-04-30','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR058','Ovo','2002-09-16','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR059','Steam wallet','2003-03-06','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR060','Credit Card','2003-12-04','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR061','Paypal','2004-07-24','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR062','Gopay','2005-01-23','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR063','Ovo','2007-06-15','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR064','Steam wallet','2007-08-16','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR065','Credit Card','2008-11-30','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR066','Paypal','2010-02-22','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR067','Gopay','2011-11-10','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR068','Steam wallet','2012-11-15','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR069','Credit Card','2013-05-04','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR070','Paypal','2014-09-08','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR071','Gopay','2015-03-10','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR072','Ovo','2015-05-31','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR073','Steam wallet','2016-09-30','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR074','Credit Card','2017-04-03','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR075','Paypal','2018-01-11','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR076','Gopay','2020-10-15','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR077','Ovo','2020-11-21','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR078','Steam wallet','2022-02-28','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR079','Credit Card','2022-08-07','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR080','Paypal','2022-09-05','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR081','Gopay','2001-06-01','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR082','Steam wallet','2002-09-02','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR083','Credit Card','2003-07-31','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR084','Paypal','2004-04-14','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR085','Gopay','2005-05-10','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR086','Ovo','2005-10-23','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR087','Steam wallet','2006-05-17','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR088','Credit Card','2008-05-25','U008');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR089','Paypal','2008-10-21','U009');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR090','Gopay','2009-08-04','U010');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR091','Ovo','2010-08-04','U011');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR092','Steam wallet','2011-02-10','U012');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR093','Credit Card','2012-07-29','U013');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR094','Paypal','2012-08-18','U014');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR095','Gopay','2013-06-09','U015');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR096','Steam wallet','2014-08-23','U016');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR097','Credit Card','2014-08-28','U017');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR098','Paypal','2015-09-17','U018');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR099','Gopay','2016-04-18','U019');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR100','Ovo','2016-04-30','U020');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR101','Steam wallet','2001-03-11','U001');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR102','Credit Card','2002-01-19','U002');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR103','Paypal','2002-04-02','U003');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR104','Gopay','2004-03-06','U004');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR105','Ovo','2004-04-30','U005');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR106','Steam wallet','2001-03-19','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR107','Credit Card','2002-01-12','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR108','Paypal','2002-04-17','U008');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR109','Gopay','2004-03-26','U009');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR110','Ovo','2004-04-30','U010');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR111','Steam wallet','2005-08-04','U011');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR112','Credit Card','2006-02-09','U012');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR113','Paypal','2007-08-15','U013');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR114','Gopay','2008-04-16','U014');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR115','Ovo','2009-12-31','U015');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR116','Steam wallet','2010-04-26','U016');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR117','Credit Card','2011-07-29','U017');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR118','Paypal','2013-03-20','U018');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR119','Gopay','2014-11-05','U019');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR120','Paypal','2015-07-08','U020');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR121','Gopay','2015-09-27','U001');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR122','Ovo','2016-03-31','U002');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR123','Steam wallet','2016-05-08','U003');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR124','Credit Card','2017-01-22','U004');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR125','Paypal','2017-02-09','U005');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR126','Gopay','2018-08-17','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR127','Steam wallet','2020-02-25','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR128','Credit Card','2020-05-08','U008');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR129','Paypal','2007-08-12','U009');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR130','Gopay','2008-05-21','U010');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR131','Ovo','2009-01-10','U011');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR132','Steam wallet','2011-08-07','U012');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR133','Credit Card','2013-01-21','U013');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR134','Paypal','2013-05-08','U014');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR135','Gopay','2016-08-04','U015');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR136','Ovo','2017-06-03','U016');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR137','Steam wallet','2017-07-19','U017');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR138','Credit Card','2018-03-05','U018');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR139','Paypal','2018-04-13','U019');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR140','Gopay','2021-04-15','U020');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR141','Steam wallet','2021-06-26','U001');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR142','Credit Card','2002-03-10','U002');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR143','Paypal','2002-04-30','U003');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR144','Gopay','2002-09-16','U004');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR145','Ovo','2003-03-06','U005');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR146','Steam wallet','2003-12-04','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR147','Credit Card','2004-07-24','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR148','Paypal','2005-01-23','U008');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR149','Gopay','2007-06-15','U009');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR150','Ovo','2007-08-16','U010');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR151','Steam wallet','2008-11-30','U011');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR152','Credit Card','2010-02-22','U012');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR153','Paypal','2011-11-10','U013');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR154','Gopay','2012-11-15','U014');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR155','Steam wallet','2013-05-04','U015');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR156','Credit Card','2014-09-08','U016');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR157','Paypal','2015-03-10','U017');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR158','Gopay','2015-05-31','U018');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR159','Ovo','2016-09-30','U019');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR160','Paypal','2017-04-03','U020');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR161','Gopay','2018-01-11','U001');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR162','Ovo','2020-10-15','U002');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR163','Steam wallet','2020-11-21','U003');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR164','Credit Card','2022-02-28','U004');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR165','Paypal','2022-08-07','U005');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR166','Gopay','2022-09-05','U006');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR167','Steam wallet','2001-06-01','U007');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR168','Credit Card','2002-09-02','U008');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR169','Paypal','2003-07-31','U009');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR170','Gopay','2004-04-14','U010');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR171','Ovo','2005-05-10','U011');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR172','Steam wallet','2005-10-23','U012');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR173','Credit Card','2006-05-17','U013');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR174','Paypal','2008-05-25','U014');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR175','Gopay','2008-10-21','U015');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR176','Ovo','2009-08-04','U016');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR177','Steam wallet','2010-08-04','U017');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR178','Credit Card','2011-02-10','U018');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR179','Paypal','2001-06-01','U019');
insert into Transaksi(TR_ID, TR_METODEBAYAR, TR_TGLBELI, USER_U_ID) values ('TR180','Gopay','2002-09-02','U020');

#Bahasa_Audio

insert into Bahasa_Audio(BA_ID, BA_NAMA) values ('BA001','Indonesian');
insert into Bahasa_Audio(BA_ID, BA_NAMA) values ('BA002','English');
insert into Bahasa_Audio(BA_ID, BA_NAMA) values ('BA003','Korean');
insert into Bahasa_Audio(BA_ID, BA_NAMA) values ('BA004','Japanese');
insert into Bahasa_Audio(BA_ID, BA_NAMA) values ('BA005','french');
insert into Bahasa_Audio(BA_ID, BA_NAMA) values ('BA006','Danish');
insert into Bahasa_Audio(BA_ID, BA_NAMA) values ('BA007','Dutch');
insert into Bahasa_Audio(BA_ID, BA_NAMA) values ('BA008','Italian');
insert into Bahasa_Audio(BA_ID, BA_NAMA) values ('BA009','Hungarian');
insert into Bahasa_Audio(BA_ID, BA_NAMA) values ('BA010','Norwegian');
insert into Bahasa_Audio(BA_ID, BA_NAMA) values ('BA011','Thai');
insert into Bahasa_Audio(BA_ID, BA_NAMA) values ('BA012','Russian');
insert into Bahasa_Audio(BA_ID, BA_NAMA) values ('BA013','Spanish');
insert into Bahasa_Audio(BA_ID, BA_NAMA) values ('BA014','Ukrainian');
insert into Bahasa_Audio(BA_ID, BA_NAMA) values ('BA015','Vietnamese');
insert into Bahasa_Audio(BA_ID, BA_NAMA) values ('BA016','Greek');
insert into Bahasa_Audio(BA_ID, BA_NAMA) values ('BA017','Turkish');
insert into Bahasa_Audio(BA_ID, BA_NAMA) values ('BA018','Swedish');
insert into Bahasa_Audio(BA_ID, BA_NAMA) values ('BA019','Portuguese');
insert into Bahasa_Audio(BA_ID, BA_NAMA) values ('BA020','Czech');

#Bahasa_Interface

insert into Bahasa_Interface(BI_ID, BI_NAMA) values ('BI001','Indonesian');
insert into Bahasa_Interface(BI_ID, BI_NAMA) values ('BI002','English');
insert into Bahasa_Interface(BI_ID, BI_NAMA) values ('BI003','Korean');
insert into Bahasa_Interface(BI_ID, BI_NAMA) values ('BI004','Japanese');
insert into Bahasa_Interface(BI_ID, BI_NAMA) values ('BI005','french');
insert into Bahasa_Interface(BI_ID, BI_NAMA) values ('BI006','Danish');
insert into Bahasa_Interface(BI_ID, BI_NAMA) values ('BI007','Dutch');
insert into Bahasa_Interface(BI_ID, BI_NAMA) values ('BI008','Italian');
insert into Bahasa_Interface(BI_ID, BI_NAMA) values ('BI009','Hungarian');
insert into Bahasa_Interface(BI_ID, BI_NAMA) values ('BI010','Norwegian');
insert into Bahasa_Interface(BI_ID, BI_NAMA) values ('BI011','Thai');
insert into Bahasa_Interface(BI_ID, BI_NAMA) values ('BI012','Russian');
insert into Bahasa_Interface(BI_ID, BI_NAMA) values ('BI013','Spanish');
insert into Bahasa_Interface(BI_ID, BI_NAMA) values ('BI014','Ukrainian');
insert into Bahasa_Interface(BI_ID, BI_NAMA) values ('BI015','Vietnamese');
insert into Bahasa_Interface(BI_ID, BI_NAMA) values ('BI016','Greek');
insert into Bahasa_Interface(BI_ID, BI_NAMA) values ('BI017','Turkish');
insert into Bahasa_Interface(BI_ID, BI_NAMA) values ('BI018','Swedish');
insert into Bahasa_Interface(BI_ID, BI_NAMA) values ('BI019','Portuguese');
insert into Bahasa_Interface(BI_ID, BI_NAMA) values ('BI020','Czech');

#Bahasa_Subtitle

insert into Bahasa_Subtitle(BS_ID, BS_NAMA) values ('BS001','Indonesian');
insert into Bahasa_Subtitle(BS_ID, BS_NAMA) values ('BS002','English');
insert into Bahasa_Subtitle(BS_ID, BS_NAMA) values ('BS003','Korean');
insert into Bahasa_Subtitle(BS_ID, BS_NAMA) values ('BS004','Japanese');
insert into Bahasa_Subtitle(BS_ID, BS_NAMA) values ('BS005','french');
insert into Bahasa_Subtitle(BS_ID, BS_NAMA) values ('BS006','Danish');
insert into Bahasa_Subtitle(BS_ID, BS_NAMA) values ('BS007','Dutch');
insert into Bahasa_Subtitle(BS_ID, BS_NAMA) values ('BS008','Italian');
insert into Bahasa_Subtitle(BS_ID, BS_NAMA) values ('BS009','Hungarian');
insert into Bahasa_Subtitle(BS_ID, BS_NAMA) values ('BS010','Norwegian');
insert into Bahasa_Subtitle(BS_ID, BS_NAMA) values ('BS011','Thai');
insert into Bahasa_Subtitle(BS_ID, BS_NAMA) values ('BS012','Russian');
insert into Bahasa_Subtitle(BS_ID, BS_NAMA) values ('BS013','Spanish');
insert into Bahasa_Subtitle(BS_ID, BS_NAMA) values ('BS014','Ukrainian');
insert into Bahasa_Subtitle(BS_ID, BS_NAMA) values ('BS015','Vietnamese');
insert into Bahasa_Subtitle(BS_ID, BS_NAMA) values ('BS016','Greek');
insert into Bahasa_Subtitle(BS_ID, BS_NAMA) values ('BS017','Turkish');
insert into Bahasa_Subtitle(BS_ID, BS_NAMA) values ('BS018','Swedish');
insert into Bahasa_Subtitle(BS_ID, BS_NAMA) values ('BS019','Portuguese');
insert into Bahasa_Subtitle(BS_ID, BS_NAMA) values ('BS020','Czech');

#Tags

insert into Tags(T_ID, T_NAMA) values ('T001','Action');
insert into Tags(T_ID, T_NAMA) values ('T002','Multiplayer');
insert into Tags(T_ID, T_NAMA) values ('T003','Competitive');
insert into Tags(T_ID, T_NAMA) values ('T004','Survival');
insert into Tags(T_ID, T_NAMA) values ('T005','Battle Royale');
insert into Tags(T_ID, T_NAMA) values ('T006','Shooter');
insert into Tags(T_ID, T_NAMA) values ('T007','Horror');
insert into Tags(T_ID, T_NAMA) values ('T008','Local & Party');
insert into Tags(T_ID, T_NAMA) values ('T009','Open World');
insert into Tags(T_ID, T_NAMA) values ('T010','Sports');
insert into Tags(T_ID, T_NAMA) values ('T011','Strategy');
insert into Tags(T_ID, T_NAMA) values ('T012','Moba');
insert into Tags(T_ID, T_NAMA) values ('T013','PvP');
insert into Tags(T_ID, T_NAMA) values ('T014','Simulation');
insert into Tags(T_ID, T_NAMA) values ('T015','Fantasy');
insert into Tags(T_ID, T_NAMA) values ('T016','Rpg');
insert into Tags(T_ID, T_NAMA) values ('T017','Tactical');
insert into Tags(T_ID, T_NAMA) values ('T018','Team-Based');
insert into Tags(T_ID, T_NAMA) values ('T019','MMORPG');
insert into Tags(T_ID, T_NAMA) values ('T020','Adventure');

#OS

insert into OS(O_ID, O_NAMA) values ('OS001','Windows 7');
insert into OS(O_ID, O_NAMA) values ('OS002','Windows 8');
insert into OS(O_ID, O_NAMA) values ('OS003','Windows 10');
insert into OS(O_ID, O_NAMA) values ('OS004','Windows 11');
insert into OS(O_ID, O_NAMA) values ('OS005','Linux');
insert into OS(O_ID, O_NAMA) values ('OS006','Windows XP');
insert into OS(O_ID, O_NAMA) values ('OS007','Windows Vista');
insert into OS(O_ID, O_NAMA) values ('OS008','MacOS');
insert into OS(O_ID, O_NAMA) values ('OS009','Windows 98');
insert into OS(O_ID, O_NAMA) values ('OS010','Windows 95');
insert into OS(O_ID, O_NAMA) values ('OS011','EulerOS');
insert into OS(O_ID, O_NAMA) values ('OS012','MS-DOS');
insert into OS(O_ID, O_NAMA) values ('OS013','DOS/V');
insert into OS(O_ID, O_NAMA) values ('OS014','KaiOS');
insert into OS(O_ID, O_NAMA) values ('OS015','MTS');
insert into OS(O_ID, O_NAMA) values ('OS016','SteamOS');
insert into OS(O_ID, O_NAMA) values ('OS017','Windows Azure');
insert into OS(O_ID, O_NAMA) values ('OS018','Tizen');
insert into OS(O_ID, O_NAMA) values ('OS019','OS/2 Warp 3');
insert into OS(O_ID, O_NAMA) values ('OS020','Windows NT 4.0');


#DML SYNTAX INSERT INTO Many to Many:

#Detail_User_Game
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (1,'U001','G001');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (2,'U001','G002');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (3,'U001','G003');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (4,'U001','G004');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (5,'U001','G005');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (6,'U001','G006');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (7,'U001','G007');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (8,'U001','G008');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (9,'U001','G009');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (10,'U001','G010');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (11,'U001','G011');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (12,'U001','G012');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (13,'U001','G013');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (14,'U001','G014');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (15,'U001','G015');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (16,'U001','G016');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (17,'U001','G017');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (18,'U001','G018');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (19,'U001','G019');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (20,'U001','G020');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (21,'U001','G021');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (22,'U001','G022');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (23,'U001','G023');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (24,'U001','G024');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (25,'U001','G025');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (26,'U001','G026');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (27,'U001','G027');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (28,'U001','G028');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (29,'U001','G029');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (30,'U001','G030');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (31,'U002','G001');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (32,'U002','G002');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (33,'U002','G003');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (34,'U002','G004');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (35,'U002','G005');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (36,'U002','G006');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (37,'U002','G007');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (38,'U002','G008');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (39,'U002','G009');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (40,'U002','G010');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (41,'U002','G011');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (42,'U002','G012');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (43,'U002','G013');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (44,'U002','G014');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (45,'U002','G015');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (46,'U002','G016');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (47,'U002','G017');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (48,'U002','G018');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (49,'U002','G019');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (50,'U002','G020');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (51,'U002','G021');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (52,'U002','G022');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (53,'U002','G023');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (54,'U002','G024');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (55,'U002','G025');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (56,'U002','G026');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (57,'U002','G027');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (58,'U002','G028');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (59,'U002','G029');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (60,'U002','G030');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (61,'U003','G001');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (62,'U003','G002');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (63,'U003','G003');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (64,'U003','G004');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (65,'U003','G005');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (66,'U003','G006');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (67,'U003','G007');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (68,'U003','G008');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (69,'U003','G009');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (70,'U003','G010');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (71,'U003','G011');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (72,'U003','G012');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (73,'U003','G013');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (74,'U003','G014');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (75,'U003','G015');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (76,'U003','G016');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (77,'U003','G017');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (78,'U003','G018');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (79,'U003','G019');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (80,'U003','G020');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (81,'U003','G021');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (82,'U003','G022');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (83,'U003','G023');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (84,'U003','G024');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (85,'U003','G025');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (86,'U003','G026');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (87,'U003','G027');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (88,'U003','G028');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (89,'U003','G029');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (90,'U003','G030');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (91,'U004','G001');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (92,'U004','G002');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (93,'U004','G003');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (94,'U004','G004');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (95,'U004','G005');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (96,'U004','G006');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (97,'U004','G007');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (98,'U004','G008');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (99,'U004','G009');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (100,'U004','G010');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (101,'U004','G011');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (102,'U004','G012');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (103,'U004','G013');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (104,'U004','G014');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (105,'U004','G015');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (106,'U004','G016');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (107,'U004','G017');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (108,'U004','G018');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (109,'U004','G019');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (110,'U004','G020');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (111,'U004','G021');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (112,'U004','G022');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (113,'U004','G023');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (114,'U004','G024');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (115,'U004','G025');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (116,'U004','G026');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (117,'U004','G027');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (118,'U004','G028');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (119,'U004','G029');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (120,'U004','G030');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (121,'U005','G001');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (122,'U005','G002');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (123,'U005','G003');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (124,'U005','G004');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (125,'U005','G005');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (126,'U005','G006');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (127,'U005','G007');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (128,'U005','G008');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (129,'U005','G009');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (130,'U005','G010');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (131,'U005','G011');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (132,'U005','G012');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (133,'U005','G013');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (134,'U005','G014');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (135,'U005','G015');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (136,'U005','G016');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (137,'U005','G017');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (138,'U005','G018');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (139,'U005','G019');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (140,'U005','G020');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (141,'U005','G021');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (142,'U005','G022');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (143,'U005','G023');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (144,'U005','G024');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (145,'U005','G025');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (146,'U005','G026');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (147,'U005','G027');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (148,'U005','G028');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (149,'U005','G029');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (150,'U005','G030');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (151,'U008','G001');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (152,'U009','G002');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (153,'U010','G003');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (154,'U011','G004');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (155,'U012','G005');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (156,'U013','G006');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (157,'U014','G007');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (158,'U015','G008');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (159,'U016','G009');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (160,'U017','G010');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (161,'U018','G001');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (162,'U019','G001');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (163,'U020','G001');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (164,'U007','G001');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (165,'U007','G002');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (166,'U007','G003');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (167,'U007','G004');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (168,'U007','G005');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (169,'U007','G006');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (170,'U007','G007');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (171,'U007','G008');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (172,'U007','G009');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (173,'U007','G010');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (174,'U007','G011');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (175,'U007','G012');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (176,'U007','G013');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (177,'U007','G014');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (178,'U007','G015');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (179,'U007','G016');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (180,'U007','G017');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (181,'U007','G018');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (182,'U007','G019');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (183,'U007','G020');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (184,'U007','G021');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (185,'U007','G022');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (186,'U007','G023');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (187,'U007','G024');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (188,'U007','G025');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (189,'U007','G026');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (190,'U007','G027');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (191,'U007','G028');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (192,'U007','G029');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (193,'U007','G030');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (194,'U006','G001');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (195,'U006','G002');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (196,'U006','G003');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (197,'U006','G004');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (198,'U006','G005');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (199,'U006','G006');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (200,'U006','G007');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (201,'U006','G008');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (202,'U006','G009');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (203,'U006','G010');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (204,'U006','G011');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (205,'U006','G012');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (206,'U006','G013');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (207,'U006','G014');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (208,'U006','G015');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (209,'U006','G016');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (210,'U006','G017');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (211,'U006','G018');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (212,'U006','G019');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (213,'U006','G020');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (214,'U006','G021');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (215,'U006','G022');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (216,'U006','G023');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (217,'U006','G024');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (218,'U006','G025');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (219,'U006','G026');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (220,'U006','G027');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (221,'U006','G028');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (222,'U006','G029');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (223,'U006','G030');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (224,'U020','G002');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (225,'U020','G003');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (226,'U020','G004');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (227,'U020','G005');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (228,'U020','G006');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (229,'U020','G007');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (230,'U020','G008');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (231,'U020','G009');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (232,'U020','G010');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (233,'U020','G011');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (234,'U020','G012');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (235,'U020','G013');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (236,'U020','G014');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (237,'U020','G015');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (238,'U020','G016');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (239,'U020','G017');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (240,'U020','G018');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (241,'U020','G019');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (242,'U020','G020');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (243,'U020','G021');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (244,'U020','G022');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (245,'U020','G023');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (246,'U020','G024');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (247,'U020','G025');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (248,'U020','G026');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (249,'U020','G027');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (250,'U020','G028');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (251,'U020','G029');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (252,'U020','G030');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (253,'U019','G002');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (254,'U019','G003');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (255,'U019','G004');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (256,'U019','G005');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (257,'U019','G006');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (258,'U019','G007');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (259,'U019','G008');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (260,'U019','G009');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (261,'U019','G010');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (262,'U019','G011');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (263,'U019','G012');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (264,'U019','G013');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (265,'U019','G014');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (266,'U019','G015');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (267,'U019','G016');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (268,'U019','G017');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (269,'U019','G018');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (270,'U019','G019');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (271,'U019','G020');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (272,'U019','G021');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (273,'U019','G022');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (274,'U019','G023');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (275,'U019','G024');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (276,'U019','G025');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (277,'U019','G026');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (278,'U019','G027');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (279,'U019','G028');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (280,'U019','G029');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (281,'U019','G030');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (282,'U018','G002');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (283,'U018','G003');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (284,'U018','G004');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (285,'U018','G005');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (286,'U018','G006');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (287,'U018','G007');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (288,'U018','G008');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (289,'U018','G009');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (290,'U018','G010');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (291,'U018','G011');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (292,'U018','G012');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (293,'U018','G013');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (294,'U018','G014');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (295,'U018','G015');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (296,'U018','G016');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (297,'U018','G017');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (298,'U018','G018');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (299,'U018','G019');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (300,'U018','G020');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (301,'U018','G021');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (302,'U018','G022');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (303,'U018','G023');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (304,'U018','G024');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (305,'U018','G025');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (306,'U018','G026');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (307,'U018','G027');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (308,'U018','G028');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (309,'U018','G029');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (310,'U018','G030');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (311,'U001','G031');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (312,'U002','G031');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (313,'U003','G031');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (314,'U004','G031');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (315,'U005','G031');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (316,'U006','G031');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (317,'U007','G031');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (318,'U008','G031');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (319,'U009','G031');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (320,'U010','G031');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (321,'U011','G031');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (322,'U012','G031');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (323,'U013','G031');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (324,'U014','G031');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (325,'U015','G031');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (326,'U016','G031');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (327,'U017','G031');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (328,'U018','G031');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (329,'U019','G031');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (330,'U020','G031');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (331,'U001','G032');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (332,'U002','G032');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (333,'U003','G032');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (334,'U004','G032');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (335,'U005','G032');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (336,'U006','G032');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (337,'U007','G032');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (338,'U008','G032');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (339,'U009','G032');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (340,'U010','G032');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (341,'U011','G032');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (342,'U012','G032');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (343,'U013','G032');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (344,'U014','G032');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (345,'U015','G032');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (346,'U016','G032');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (347,'U017','G032');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (348,'U018','G032');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (349,'U019','G032');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (350,'U020','G032');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (351,'U001','G033');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (352,'U002','G033');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (353,'U003','G033');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (354,'U004','G033');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (355,'U005','G033');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (356,'U006','G033');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (357,'U007','G033');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (358,'U008','G033');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (359,'U009','G033');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (360,'U010','G033');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (361,'U011','G033');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (362,'U012','G033');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (363,'U013','G033');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (364,'U014','G033');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (365,'U015','G033');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (366,'U016','G033');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (367,'U017','G033');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (368,'U018','G033');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (369,'U019','G033');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (370,'U020','G033');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (371,'U001','G034');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (372,'U002','G034');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (373,'U003','G034');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (374,'U004','G034');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (375,'U005','G034');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (376,'U006','G034');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (377,'U007','G034');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (378,'U008','G034');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (379,'U009','G034');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (380,'U010','G034');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (381,'U011','G034');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (382,'U012','G034');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (383,'U013','G034');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (384,'U014','G034');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (385,'U015','G034');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (386,'U016','G034');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (387,'U017','G034');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (388,'U018','G034');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (389,'U019','G034');
INSERT INTO Detail_User_Game(No, User_U_ID, Game_G_ID) VALUES (390,'U020','G034');
#Detail_User_DLC

INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (1,'U001','DLC001');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (2,'U001','DLC002');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (3,'U001','DLC003');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (4,'U001','DLC004');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (5,'U001','DLC005');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (6,'U001','DLC006');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (7,'U001','DLC007');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (8,'U001','DLC008');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (9,'U002','DLC001');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (10,'U002','DLC002');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (11,'U002','DLC003');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (12,'U002','DLC004');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (13,'U002','DLC005');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (14,'U002','DLC006');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (15,'U002','DLC007');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (16,'U002','DLC008');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (17,'U003','DLC001');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (18,'U003','DLC002');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (19,'U003','DLC003');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (20,'U003','DLC004');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (21,'U003','DLC005');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (22,'U003','DLC006');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (23,'U003','DLC007');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (24,'U003','DLC008');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (25,'U004','DLC001');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (26,'U004','DLC002');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (27,'U004','DLC003');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (28,'U004','DLC004');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (29,'U004','DLC005');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (30,'U004','DLC006');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (31,'U004','DLC007');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (32,'U004','DLC008');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (33,'U005','DLC001');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (34,'U005','DLC002');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (35,'U005','DLC003');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (36,'U005','DLC004');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (37,'U005','DLC005');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (38,'U005','DLC006');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (39,'U005','DLC007');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (40,'U005','DLC008');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (41,'U006','DLC001');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (42,'U006','DLC002');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (43,'U006','DLC003');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (44,'U006','DLC004');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (45,'U006','DLC005');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (46,'U006','DLC006');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (47,'U006','DLC007');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (48,'U006','DLC008');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (49,'U006','DLC009');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (50,'U006','DLC010');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (51,'U006','DLC011');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (52,'U006','DLC012');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (53,'U006','DLC013');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (54,'U006','DLC014');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (55,'U006','DLC015');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (56,'U006','DLC016');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (57,'U006','DLC017');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (58,'U006','DLC018');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (59,'U006','DLC019');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (60,'U006','DLC020');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (61,'U006','DLC021');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (62,'U006','DLC022');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (63,'U006','DLC023');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (64,'U006','DLC024');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (65,'U006','DLC025');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (66,'U006','DLC026');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (67,'U006','DLC027');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (68,'U006','DLC028');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (69,'U006','DLC029');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (70,'U006','DLC030');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (71,'U006','DLC031');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (72,'U006','DLC032');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (73,'U006','DLC033');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (74,'U006','DLC034');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (75,'U006','DLC035');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (76,'U006','DLC036');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (77,'U006','DLC037');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (78,'U006','DLC038');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (79,'U006','DLC039');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (80,'U006','DLC040');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (81,'U006','DLC041');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (82,'U006','DLC042');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (83,'U006','DLC043');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (84,'U006','DLC044');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (85,'U006','DLC045');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (86,'U007','DLC001');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (87,'U007','DLC002');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (88,'U007','DLC003');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (89,'U007','DLC004');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (90,'U007','DLC005');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (91,'U007','DLC006');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (92,'U007','DLC007');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (93,'U007','DLC008');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (94,'U007','DLC009');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (95,'U007','DLC010');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (96,'U007','DLC011');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (97,'U007','DLC012');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (98,'U007','DLC013');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (99,'U007','DLC014');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (100,'U007','DLC015');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (101,'U007','DLC016');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (102,'U007','DLC017');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (103,'U007','DLC018');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (104,'U007','DLC019');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (105,'U007','DLC020');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (106,'U001','DLC009');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (107,'U001','DLC010');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (108,'U001','DLC011');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (109,'U001','DLC012');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (110,'U001','DLC013');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (111,'U001','DLC014');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (112,'U001','DLC015');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (113,'U001','DLC016');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (114,'U001','DLC017');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (115,'U001','DLC018');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (116,'U001','DLC019');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (117,'U001','DLC020');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (118,'U001','DLC021');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (119,'U001','DLC022');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (120,'U001','DLC023');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (121,'U001','DLC024');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (122,'U001','DLC025');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (123,'U001','DLC026');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (124,'U001','DLC027');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (125,'U001','DLC028');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (126,'U001','DLC029');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (127,'U001','DLC030');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (128,'U001','DLC031');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (129,'U001','DLC032');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (130,'U001','DLC033');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (131,'U001','DLC034');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (132,'U001','DLC035');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (133,'U001','DLC036');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (134,'U001','DLC037');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (135,'U001','DLC038');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (136,'U001','DLC039');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (137,'U001','DLC040');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (138,'U001','DLC041');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (139,'U001','DLC042');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (140,'U001','DLC043');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (141,'U001','DLC046');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (142,'U002','DLC046');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (143,'U003','DLC046');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (144,'U004','DLC046');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (145,'U005','DLC046');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (146,'U006','DLC046');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (147,'U007','DLC046');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (148,'U008','DLC046');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (149,'U009','DLC046');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (150,'U010','DLC046');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (151,'U011','DLC046');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (152,'U012','DLC046');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (153,'U013','DLC046');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (154,'U014','DLC046');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (155,'U015','DLC046');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (156,'U016','DLC046');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (157,'U017','DLC046');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (158,'U018','DLC046');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (159,'U019','DLC046');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (160,'U020','DLC046');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (161,'U001','DLC047');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (162,'U002','DLC047');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (163,'U003','DLC047');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (164,'U004','DLC047');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (165,'U005','DLC047');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (166,'U006','DLC047');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (167,'U007','DLC047');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (168,'U008','DLC047');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (169,'U009','DLC047');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (170,'U010','DLC047');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (171,'U011','DLC047');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (172,'U012','DLC047');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (173,'U013','DLC047');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (174,'U014','DLC047');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (175,'U015','DLC047');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (176,'U016','DLC047');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (177,'U017','DLC047');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (178,'U018','DLC047');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (179,'U019','DLC047');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (180,'U020','DLC047');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (181,'U001','DLC048');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (182,'U002','DLC048');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (183,'U003','DLC048');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (184,'U004','DLC048');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (185,'U005','DLC048');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (186,'U006','DLC048');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (187,'U007','DLC048');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (188,'U008','DLC048');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (189,'U009','DLC048');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (190,'U010','DLC048');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (191,'U011','DLC048');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (192,'U012','DLC048');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (193,'U013','DLC048');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (194,'U014','DLC048');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (195,'U015','DLC048');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (196,'U016','DLC048');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (197,'U017','DLC048');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (198,'U018','DLC048');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (199,'U019','DLC048');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (200,'U020','DLC048');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (201,'U001','DLC049');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (202,'U002','DLC049');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (203,'U003','DLC049');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (204,'U004','DLC049');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (205,'U005','DLC049');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (206,'U006','DLC049');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (207,'U007','DLC049');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (208,'U008','DLC049');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (209,'U009','DLC049');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (210,'U010','DLC049');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (211,'U011','DLC049');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (212,'U012','DLC049');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (213,'U013','DLC049');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (214,'U014','DLC049');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (215,'U015','DLC049');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (216,'U016','DLC049');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (217,'U017','DLC049');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (218,'U018','DLC049');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (219,'U019','DLC049');
INSERT INTO Detail_User_DLC(No, User_U_ID, DLC_DLC_ID) VALUES (220,'U020','DLC049');

#Detail_Transaksi_Game

INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG001','TR088','G001');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG002','TR089','G002');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG003','TR090','G003');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG004','TR091','G004');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG005','TR092','G005');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG006','TR093','G006');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG007','TR094','G007');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG008','TR095','G008');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG009','TR096','G009');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG010','TR097','G010');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG011','TR098','G029');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG012','TR099','G001');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG013','TR100','G001');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG014','TR100','G002');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG015','TR100','G003');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG016','TR100','G004');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG017','TR100','G005');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG018','TR100','G006');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG019','TR100','G007');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG020','TR100','G008');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG021','TR100','G009');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG022','TR100','G010');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG023','TR100','G011');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG024','TR100','G012');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG025','TR100','G013');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG026','TR100','G014');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG027','TR100','G015');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG028','TR100','G016');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG029','TR100','G017');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG030','TR100','G018');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG031','TR100','G019');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG032','TR100','G020');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG033','TR100','G021');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG034','TR100','G022');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG035','TR100','G023');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG036','TR100','G024');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG037','TR100','G025');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG038','TR100','G026');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG039','TR100','G027');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG040','TR100','G028');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG041','TR100','G029');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG042','TR100','G030');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG043','TR099','G002');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG044','TR099','G003');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG045','TR099','G004');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG046','TR099','G005');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG047','TR099','G006');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG048','TR099','G007');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG049','TR099','G008');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG050','TR099','G009');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG051','TR099','G010');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG052','TR099','G011');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG053','TR099','G012');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG054','TR099','G013');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG055','TR099','G014');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG056','TR099','G015');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG057','TR099','G016');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG058','TR099','G017');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG059','TR099','G018');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG060','TR099','G019');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG061','TR099','G020');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG062','TR099','G021');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG063','TR099','G022');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG064','TR099','G023');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG065','TR099','G024');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG066','TR099','G025');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG067','TR099','G026');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG068','TR099','G027');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG069','TR099','G028');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG070','TR099','G029');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG071','TR099','G030');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG072','TR098','G030');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG073','TR098','G001');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG074','TR098','G002');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG075','TR098','G003');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG076','TR098','G004');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG077','TR098','G005');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG078','TR098','G006');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG079','TR098','G007');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG080','TR098','G008');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG081','TR098','G009');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG082','TR098','G010');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG083','TR098','G011');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG084','TR098','G012');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG085','TR098','G013');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG086','TR098','G014');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG087','TR098','G015');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG088','TR098','G016');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG089','TR098','G017');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG090','TR098','G018');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG091','TR098','G019');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG092','TR098','G020');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG093','TR098','G021');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG094','TR098','G022');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG095','TR098','G023');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG096','TR098','G024');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG097','TR098','G025');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG098','TR098','G026');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG099','TR098','G027');
INSERT INTO Detail_Transaksi_Game(NTG_ID, TRANSAKSI_TR_ID, GAME_G_ID) VALUES ('NTG100','TR098','G028');

#Detail_Transaksi_DLC
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD001','TR022','DLC001');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD002','TR023','DLC002');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD003','TR024','DLC003');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD004','TR025','DLC004');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD005','TR026','DLC005');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD006','TR027','DLC006');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD007','TR028','DLC007');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD008','TR029','DLC008');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD009','TR030','DLC009');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD010','TR031','DLC010');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD011','TR032','DLC011');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD012','TR033','DLC012');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD013','TR034','DLC013');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD014','TR035','DLC014');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD015','TR036','DLC015');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD016','TR037','DLC016');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD017','TR038','DLC017');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD018','TR039','DLC018');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD019','TR040','DLC019');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD020','TR041','DLC020');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD021','TR042','DLC021');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD022','TR043','DLC022');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD023','TR044','DLC023');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD024','TR045','DLC024');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD025','TR046','DLC025');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD026','TR047','DLC026');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD027','TR048','DLC027');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD028','TR049','DLC028');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD029','TR050','DLC029');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD030','TR051','DLC030');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD031','TR052','DLC031');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD032','TR053','DLC032');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD033','TR054','DLC033');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD034','TR055','DLC034');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD035','TR056','DLC035');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD036','TR057','DLC036');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD037','TR058','DLC037');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD038','TR059','DLC038');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD039','TR060','DLC039');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD040','TR061','DLC040');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD041','TR062','DLC041');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD042','TR063','DLC042');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD043','TR064','DLC043');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD044','TR065','DLC044');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD045','TR066','DLC045');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD046','TR068','DLC001');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD047','TR069','DLC002');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD048','TR070','DLC003');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD049','TR071','DLC004');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD050','TR072','DLC005');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD051','TR073','DLC006');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD052','TR074','DLC007');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD053','TR075','DLC008');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD054','TR076','DLC009');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD055','TR077','DLC010');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD056','TR078','DLC011');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD057','TR079','DLC012');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD058','TR080','DLC013');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD059','TR081','DLC014');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD060','TR082','DLC015');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD061','TR083','DLC016');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD062','TR084','DLC017');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD063','TR085','DLC018');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD064','TR086','DLC019');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD065','TR087','DLC020');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD066','TR001','DLC009');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD067','TR001','DLC010');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD068','TR001','DLC011');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD069','TR001','DLC012');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD070','TR001','DLC013');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD071','TR001','DLC014');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD072','TR001','DLC015');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD073','TR001','DLC016');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD074','TR001','DLC017');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD075','TR001','DLC018');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD076','TR001','DLC019');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD077','TR001','DLC020');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD078','TR001','DLC021');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD079','TR001','DLC022');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD080','TR001','DLC023');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD081','TR001','DLC024');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD082','TR001','DLC025');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD083','TR001','DLC026');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD084','TR001','DLC027');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD085','TR001','DLC028');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD086','TR001','DLC029');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD087','TR001','DLC030');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD088','TR001','DLC031');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD089','TR001','DLC032');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD090','TR001','DLC033');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD091','TR001','DLC034');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD092','TR001','DLC035');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD093','TR001','DLC036');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD094','TR001','DLC037');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD095','TR001','DLC038');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD096','TR001','DLC039');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD097','TR001','DLC040');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD098','TR001','DLC041');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD099','TR001','DLC042');
insert into Detail_Transaksi_DLC(NTD_ID, Transaksi_TR_ID, DLC_DLC_ID) values('NTD100','TR001','DLC043');

#Detail_Transaksi_Bundle
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB001','TR001','BU019');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB002','TR002','BU019');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB003','TR003','BU019');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB004','TR004','BU019');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB005','TR005','BU019');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB006','TR006','BU006');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB007','TR007','BU007');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB008','TR008','BU008');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB009','TR009','BU006');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB010','TR010','BU007');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB011','TR011','BU008');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB012','TR012','BU006');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB013','TR013','BU007');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB014','TR014','BU008');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB015','TR015','BU006');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB016','TR016','BU007');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB017','TR017','BU008');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB018','TR018','BU006');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB019','TR019','BU007');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB020','TR020','BU008');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB021','TR021','BU019');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB022','TR067','BU019');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB023','TR101','BU025');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB024','TR102','BU025');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB025','TR103','BU025');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB026','TR104','BU025');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB027','TR105','BU025');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB028','TR106','BU025');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB029','TR107','BU025');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB030','TR108','BU025');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB031','TR109','BU025');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB032','TR110','BU025');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB033','TR111','BU025');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB034','TR112','BU025');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB035','TR113','BU025');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB036','TR114','BU025');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB037','TR115','BU025');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB038','TR116','BU025');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB039','TR117','BU025');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB040','TR118','BU025');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB041','TR119','BU025');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB042','TR120','BU025');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB043','TR121','BU026');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB044','TR122','BU026');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB045','TR123','BU026');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB046','TR124','BU026');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB047','TR125','BU026');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB048','TR126','BU026');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB049','TR127','BU026');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB050','TR128','BU026');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB051','TR129','BU026');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB052','TR130','BU026');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB053','TR131','BU026');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB054','TR132','BU026');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB055','TR133','BU026');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB056','TR134','BU026');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB057','TR135','BU026');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB058','TR136','BU026');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB059','TR137','BU026');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB060','TR138','BU026');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB061','TR139','BU026');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB062','TR140','BU026');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB063','TR141','BU027');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB064','TR142','BU027');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB065','TR143','BU027');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB066','TR144','BU027');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB067','TR145','BU027');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB068','TR146','BU027');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB069','TR147','BU027');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB070','TR148','BU027');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB071','TR149','BU027');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB072','TR150','BU027');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB073','TR151','BU027');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB074','TR152','BU027');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB075','TR153','BU027');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB076','TR154','BU027');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB077','TR155','BU027');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB078','TR156','BU027');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB079','TR157','BU027');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB080','TR158','BU027');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB081','TR159','BU027');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB082','TR160','BU027');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB083','TR161','BU028');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB084','TR162','BU028');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB085','TR163','BU028');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB086','TR164','BU028');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB087','TR165','BU028');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB088','TR166','BU028');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB089','TR167','BU028');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB090','TR168','BU028');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB091','TR169','BU028');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB092','TR170','BU028');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB093','TR171','BU028');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB094','TR172','BU028');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB095','TR173','BU028');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB096','TR174','BU028');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB097','TR175','BU028');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB098','TR176','BU028');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB099','TR177','BU028');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB100','TR178','BU028');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB101','TR179','BU028');
insert into Detail_Transaksi_Bundle(NTB_ID, Transaksi_TR_ID, Bundle_BU_ID) values('NTB102','TR180','BU028');


#Detail_Bundle_Game
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('1','BU002','G021');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('2','BU002','G022');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('3','BU002','G023');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('4','BU002','G024');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('5','BU002','G025');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('6','BU002','G026');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('7','BU004','G027');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('8','BU004','G028');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('9','BU004','G029');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('10','BU010','G001');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('11','BU010','G002');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('12','BU010','G003');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('13','BU010','G004');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('14','BU010','G005');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('15','BU010','G006');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('16','BU010','G007');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('17','BU010','G014');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('18','BU010','G019');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('19','BU010','G030');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('20','BU011','G011');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('21','BU013','G020');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('22','BU014','G019');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('23','BU015','G021');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('24','BU015','G022');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('25','BU015','G023');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('26','BU015','G024');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('27','BU015','G025');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('28','BU015','G026');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('29','BU015','G027');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('30','BU015','G028');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('31','BU015','G029');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('32','BU016','G001');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('33','BU016','G007');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('34','BU017','G001');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('35','BU017','G007');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('36','BU017','G014');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('37','BU018','G016');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('38','BU019','G001');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('39','BU019','G002');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('40','BU019','G003');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('41','BU019','G004');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('42','BU019','G005');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('43','BU019','G006');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('44','BU019','G007');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('45','BU019','G008');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('46','BU019','G009');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('47','BU019','G010');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('48','BU019','G011');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('49','BU019','G012');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('50','BU019','G013');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('51','BU019','G014');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('52','BU019','G015');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('53','BU019','G016');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('54','BU019','G017');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('55','BU019','G018');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('56','BU019','G019');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('57','BU019','G020');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('58','BU019','G021');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('59','BU019','G022');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('60','BU019','G023');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('61','BU019','G024');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('62','BU019','G025');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('63','BU019','G026');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('64','BU019','G027');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('65','BU019','G028');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('66','BU019','G029');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('67','BU019','G030');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('68','BU020','G001');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('69','BU020','G007');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('70','BU020','G014');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('71','BU020','G019');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('72','BU024','G001');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('73','BU024','G002');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('74','BU024','G003');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('75','BU024','G004');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('76','BU024','G005');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('77','BU024','G006');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('78','BU024','G007');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('79','BU024','G008');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('80','BU024','G009');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('81','BU024','G010');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('82','BU024','G011');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('83','BU024','G012');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('84','BU024','G013');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('85','BU024','G014');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('86','BU024','G015');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('87','BU024','G016');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('88','BU024','G017');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('89','BU024','G018');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('90','BU024','G019');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('91','BU024','G020');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('92','BU024','G021');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('93','BU024','G022');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('94','BU024','G023');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('95','BU024','G024');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('96','BU024','G025');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('97','BU024','G026');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('98','BU024','G027');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('99','BU024','G028');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('100','BU024','G029');
insert into Detail_Bundle_Game(No, BUNDLE_BU_ID, GAME_G_ID) values('101','BU024','G030');


#Detail_Bundle_DLC
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('1','BU001','DLC010'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('2','BU001','DLC011');
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('3','BU001','DLC021');
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('4','BU001','DLC022'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('5','BU002','DLC023'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('6','BU003','DLC024'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('7','BU003','DLC025'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('8','BU003','DLC026'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('9','BU003','DLC027'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('10','BU005','DLC028'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('11','BU005','DLC029'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('12','BU005','DLC030'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('13','BU006','DLC001'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('14','BU006','DLC002'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('15','BU006','DLC003'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('16','BU007','DLC004'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('17','BU007','DLC005'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('18','BU007','DLC006'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('19','BU008','DLC007'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('20','BU008','DLC008'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('21','BU009','DLC031'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('22','BU009','DLC032'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('23','BU009','DLC033'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('24','BU009','DLC034'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('25','BU009','DLC035'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('26','BU009','DLC036'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('27','BU009','DLC037'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('28','BU009','DLC038'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('29','BU009','DLC039'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('30','BU009','DLC040'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('31','BU009','DLC041'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('32','BU009','DLC042'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('33','BU009','DLC043'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('34','BU009','DLC044'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('35','BU009','DLC045'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('36','BU011','DLC016'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('37','BU011','DLC017'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('38','BU012','DLC024'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('39','BU012','DLC025'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('40','BU013','DLC015'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('41','BU014','DLC019'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('42','BU018','DLC012'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('43','BU018','DLC013'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('44','BU018','DLC014'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('45','BU021','DLC039'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('46','BU021','DLC040'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('47','BU021','DLC041'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('48','BU021','DLC042'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('49','BU022','DLC035'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('50','BU022','DLC036');
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('51','BU022','DLC037'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('52','BU022','DLC038'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('53','BU023','DLC001'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('54','BU023','DLC002'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('55','BU023','DLC003'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('56','BU023','DLC004'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('57','BU023','DLC005'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('58','BU023','DLC006'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('59','BU023','DLC007'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('60','BU023','DLC008'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('61','BU023','DLC009'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('62','BU023','DLC010'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('63','BU023','DLC011'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('64','BU023','DLC012'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('65','BU023','DLC013'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('66','BU023','DLC014'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('67','BU023','DLC015'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('68','BU023','DLC016'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('69','BU023','DLC017'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('70','BU023','DLC018'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('71','BU023','DLC019'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('72','BU023','DLC020'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('73','BU023','DLC021'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('74','BU023','DLC022'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('75','BU023','DLC023'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('76','BU023','DLC024'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('77','BU023','DLC025'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('78','BU023','DLC026'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('79','BU023','DLC027'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('80','BU023','DLC028'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('81','BU023','DLC029'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('82','BU023','DLC030'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('83','BU023','DLC031'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('84','BU023','DLC032'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('85','BU023','DLC033'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('86','BU023','DLC034'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('87','BU023','DLC035'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('88','BU023','DLC036'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('89','BU023','DLC037'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('90','BU023','DLC038'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('91','BU023','DLC039'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('92','BU023','DLC040'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('93','BU023','DLC041'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('94','BU023','DLC042'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('95','BU023','DLC043'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('96','BU023','DLC044'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('97','BU023','DLC045'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('98','BU024','DLC001'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('99','BU024','DLC002'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('100','BU024','DLC003'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('101','BU024','DLC004'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('102','BU024','DLC005'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('103','BU024','DLC006'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('104','BU024','DLC007'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('105','BU024','DLC008'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('106','BU024','DLC009'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('107','BU024','DLC010'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('108','BU024','DLC011');
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('109','BU024','DLC012'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('110','BU024','DLC013'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('111','BU024','DLC014'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('112','BU024','DLC015'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('113','BU024','DLC016'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('114','BU024','DLC017'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('115','BU024','DLC018'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('116','BU024','DLC019'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('117','BU024','DLC020'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('118','BU024','DLC021'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('119','BU024','DLC022'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('120','BU024','DLC023'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('121','BU024','DLC024'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('122','BU024','DLC025'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('123','BU024','DLC026'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('124','BU024','DLC027'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('125','BU024','DLC028'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('126','BU024','DLC029'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('127','BU024','DLC030'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('128','BU024','DLC031'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('129','BU024','DLC032'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('130','BU024','DLC033'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('131','BU024','DLC034'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('132','BU024','DLC035'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('133','BU024','DLC036'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('134','BU024','DLC037'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('135','BU024','DLC038'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('136','BU024','DLC039'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('137','BU024','DLC040'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('138','BU024','DLC041'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('139','BU024','DLC042'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('140','BU024','DLC043'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('141','BU024','DLC044'); 
insert into Detail_Bundle_DLC(No, Bundle_BU_ID, DLC_DLC_ID) values ('142','BU024','DLC045');


#Detail_Game_Tags
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('1','G001','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('2','G001','T002'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('3','G001','T003'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('4','G001','T005'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('5','G001','T006'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('6','G001','T008'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('7','G001','T013'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('8','G001','T018'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('9','G002','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('10','G002','T002'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('11','G002','T003'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('12','G002','T004'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('13','G002','T005'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('14','G002','T006'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('15','G002','T013'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('16','G002','T018'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('17','G003','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('18','G003','T002'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('19','G003','T003'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('20','G003','T006'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('21','G003','T013'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('22','G003','T017'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('23','G003','T018'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('24','G004','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('25','G004','T002'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('26','G004','T003'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('27','G004','T004'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('28','G004','T005'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('29','G004','T006'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('30','G004','T013'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('31','G004','T017'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('32','G004','T018'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('33','G005','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('34','G005','T002'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('35','G005','T006'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('36','G005','T017'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('37','G006','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('38','G006','T002'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('39','G006','T006'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('40','G006','T009'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('41','G006','T011'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('42','G006','T013'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('43','G006','T017'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('44','G006','T018'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('45','G006','T020'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('46','G007','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('47','G007','T002'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('48','G007','T003'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('49','G007','T006'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('50','G007','T013'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('51','G007','T017'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('52','G007','T018'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('53','G008','T014'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('54','G008','T015'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('55','G008','T020'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('56','G009','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('57','G009','T002'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('58','G009','T004'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('59','G009','T007'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('60','G009','T020'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('61','G010','T007'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('62','G010','T020'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('63','G011','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('64','G011','T002'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('65','G011','T003'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('66','G011','T007'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('67','G011','T008'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('68','G011','T013'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('69','G011','T015'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('70','G012','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('71','G012','T002'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('72','G012','T009'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('73','G012','T015'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('74','G012','T016'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('75','G012','T019'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('76','G012','T020'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('77','G013','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('78','G013','T002'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('79','G013','T006'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('80','G013','T009'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('81','G013','T020'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('82','G014','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('83','G014','T002'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('84','G014','T003'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('85','G014','T006'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('86','G014','T013'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('87','G014','T017'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('88','G014','T018'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('89','G015','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('90','G015','T002'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('91','G015','T003'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('92','G015','T011'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('93','G015','T012'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('94','G015','T013'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('95','G015','T014'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('96','G015','T015'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('97','G015','T016'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('98','G015','T018'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('99','G016','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('100','G016','T004'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('101','G016','T006'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('102','G016','T007'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('103','G017','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('104','G017','T015'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('105','G017','T016'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('106','G018','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('107','G018','T004'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('108','G018','T007'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('109','G018','T009'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('110','G018','T020'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('111','G019','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('112','G019','T002'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('113','G019','T003'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('114','G019','T006'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('115','G020','T009'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('116','G020','T011'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('117','G020','T015'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('118','G020','T020'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('119','G021','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('120','G021','T004'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('121','G021','T006'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('122','G021','T007'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('123','G022','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('124','G022','T004'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('125','G022','T006'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('126','G022','T007'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('127','G023','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('128','G023','T004'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('129','G023','T006'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('130','G023','T007'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('131','G024','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('132','G024','T004'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('133','G024','T006'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('134','G024','T007'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('135','G025','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('136','G025','T004'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('137','G025','T006'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('138','G025','T007'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('139','G026','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('140','G026','T004'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('141','G026','T006'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('142','G026','T007'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('143','G027','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('144','G027','T009'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('145','G027','T015'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('146','G027','T020'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('147','G028','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('148','G028','T009'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('149','G028','T015'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('150','G028','T020'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('151','G029','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('152','G029','T009'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('153','G029','T015'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('154','G029','T020'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('155','G030','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('156','G030','T002'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('157','G030','T006'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('158','G030','T009'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('159','G030','T015'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('160','G031','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('161','G031','T002'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('162','G031','T006'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('163','G031','T017'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('164','G032','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('165','G032','T002'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('166','G032','T006'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('167','G032','T017'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('168','G033','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('169','G033','T002'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('170','G033','T006'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('171','G033','T017'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('172','G034','T001'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('173','G034','T002'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('174','G034','T006'); 
insert into Detail_Game_Tags(No, Game_G_ID, TAGS_T_ID) values ('175','G034','T017');



#Detail_Game_BA
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('1','G001','BA002'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('2','G002','BA002'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('3','G003','BA002'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('4','G004','BA002'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('5','G005','BA002');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('6','G006','BA002'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('7','G007','BA002'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('8','G008','BA002'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('9','G009','BA002');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('10','G010','BA002');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('11','G011','BA002'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('12','G012','BA002');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('13','G013','BA002');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('14','G014','BA002'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('15','G015','BA002');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('16','G016','BA002');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('17','G017','BA002');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('18','G018','BA002');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('19','G019','BA002');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('20','G020','BA002');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('21','G021','BA002'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('22','G022','BA002');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('23','G023','BA002');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('24','G024','BA002');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('25','G025','BA002');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('26','G026','BA002');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('27','G027','BA002');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('28','G028','BA002');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('29','G029','BA002');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('30','G030','BA002'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('31','G001','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('32','G002','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('33','G003','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('34','G004','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('35','G005','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('36','G006','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('37','G007','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('38','G008','BA004'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('39','G009','BA004'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('40','G010','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('41','G011','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('42','G012','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('43','G013','BA004'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('44','G014','BA004'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('45','G015','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('46','G016','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('47','G017','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('48','G018','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('49','G019','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('50','G020','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('51','G021','BA004'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('52','G022','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('53','G023','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('54','G024','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('55','G025','BA004'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('56','G026','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('57','G027','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('58','G028','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('59','G029','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('60','G030','BA004');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('61','G001','BA001');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('62','G002','BA001');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('63','G003','BA001');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('64','G004','BA001');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('65','G005','BA001'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('66','G006','BA001'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('67','G007','BA001');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('68','G008','BA001');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('69','G009','BA001');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('70','G010','BA001'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('71','G001','BA003'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('72','G002','BA005');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('73','G003','BA006');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('74','G004','BA007');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('75','G005','BA008');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('76','G006','BA009');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('77','G007','BA010');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('78','G008','BA011');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('79','G009','BA012');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('80','G010','BA013');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('81','G011','BA014'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('82','G012','BA015');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('83','G013','BA016');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('84','G014','BA017');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('85','G015','BA018');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('86','G016','BA019');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('87','G017','BA020');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('88','G018','BA003');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('89','G019','BA005');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('90','G020','BA006');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('91','G021','BA007');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('92','G022','BA008');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('93','G023','BA009');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('94','G024','BA010');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('95','G025','BA011');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('96','G026','BA012');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('97','G027','BA013'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('98','G028','BA014');
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('99','G029','BA015'); 
insert into Detail_Game_BA(No, Game_G_ID, Bahasa_Audio_BA_ID) values ('100','G030','BA016');


#Detail_Game_BS
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('1','G001','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('2','G002','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('3','G003','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('4','G004','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('5','G005','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('6','G006','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('7','G007','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('8','G008','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('9','G009','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('10','G010','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('11','G011','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('12','G012','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('13','G013','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('14','G014','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('15','G015','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('16','G016','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('17','G017','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('18','G018','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('19','G019','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('20','G020','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('21','G021','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('22','G022','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('23','G023','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('24','G024','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('25','G025','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('26','G026','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('27','G027','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('28','G028','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('29','G029','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('30','G030','BS002');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('31','G001','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('32','G002','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('33','G003','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('34','G004','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('35','G005','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('36','G006','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('37','G007','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('38','G008','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('39','G009','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('40','G010','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('41','G011','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('42','G012','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('43','G013','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('44','G014','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('45','G015','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('46','G016','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('47','G017','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('48','G018','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('49','G019','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('50','G020','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('51','G021','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('52','G022','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('53','G023','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('54','G024','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('55','G025','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('56','G026','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('57','G027','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('58','G028','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('59','G029','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('60','G030','BS004');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('61','G001','BS001');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('62','G002','BS001');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('63','G003','BS001');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('64','G004','BS001');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('65','G005','BS001');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('66','G006','BS001');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('67','G007','BS001');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('68','G008','BS001');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('69','G009','BS001');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('70','G010','BS001');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('71','G001','BS003');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('72','G002','BS005');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('73','G003','BS006');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('74','G004','BS007');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('75','G005','BS008');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('76','G006','BS009');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('77','G007','BS010');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('78','G008','BS011');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('79','G009','BS012');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('80','G010','BS013');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('81','G011','BS014');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('82','G012','BS015');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('83','G013','BS016');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('84','G014','BS017');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('85','G015','BS018');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('86','G016','BS019');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('87','G017','BS020');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('88','G018','BS003');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('89','G019','BS005');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('90','G020','BS006');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('91','G021','BS007');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('92','G022','BS008');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('93','G023','BS009');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('94','G024','BS010');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('95','G025','BS011');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('96','G026','BS012');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('97','G027','BS013');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('98','G028','BS014');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('99','G029','BS015');
insert into Detail_Game_BS(No, Game_G_ID, Bahasa_Subtitle_BS_ID) values ('100','G030','BS016');

#Detail_Game_BI
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('1','G001','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('2','G002','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('3','G003','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('4','G004','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('5','G005','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('6','G006','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('7','G007','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('8','G008','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('9','G009','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('10','G010','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('11','G011','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('12','G012','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('13','G013','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('14','G014','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('15','G015','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('16','G016','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('17','G017','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('18','G018','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('19','G019','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('20','G020','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('21','G021','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('22','G022','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('23','G023','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('24','G024','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('25','G025','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('26','G026','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('27','G027','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('28','G028','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('29','G029','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('30','G030','BI002');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('31','G001','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('32','G002','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('33','G003','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('34','G004','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('35','G005','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('36','G006','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('37','G007','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('38','G008','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('39','G009','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('40','G010','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('41','G011','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('42','G012','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('43','G013','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('44','G014','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('45','G015','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('46','G016','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('47','G017','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('48','G018','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('49','G019','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('50','G020','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('51','G021','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('52','G022','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('53','G023','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('54','G024','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('55','G025','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('56','G026','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('57','G027','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('58','G028','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('59','G029','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('60','G030','BI004');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('61','G001','BI001');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('62','G002','BI001');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('63','G003','BI001');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('64','G004','BI001');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('65','G005','BI001');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('66','G006','BI001');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('67','G007','BI001');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('68','G008','BI001');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('69','G009','BI001');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('70','G010','BI001');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('71','G001','BI003');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('72','G002','BI005');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('73','G003','BI006');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('74','G004','BI007');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('75','G005','BI008');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('76','G006','BI009');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('77','G007','BI010');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('78','G008','BI011');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('79','G009','BI012');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('80','G010','BI013');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('81','G011','BI014');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('82','G012','BI015');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('83','G013','BI016');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('84','G014','BI017');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('85','G015','BI018');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('86','G016','BI019');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('87','G017','BI020');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('88','G018','BI003');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('89','G019','BI005');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('90','G020','BI006');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('91','G021','BI007');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('92','G022','BI008');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('93','G023','BI009');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('94','G024','BI010');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('95','G025','BI011');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('96','G026','BI012');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('97','G027','BI013');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('98','G028','BI014');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('99','G029','BI015');
insert into Detail_Game_BI(No, Game_G_ID, Bahasa_Interface_BI_ID) values ('100','G030','BI016');

#Detail_Game_OS
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('1','G001','OS001');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('2','G002','OS001');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('3','G003','OS001');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('4','G004','OS001');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('5','G005','OS001');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('6','G006','OS001');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('7','G007','OS004');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('8','G008','OS005');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('9','G009','OS006');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('10','G010','OS007');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('11','G011','OS020');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('12','G012','OS020');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('13','G013','OS018');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('14','G014','OS019');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('15','G015','OS001');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('16','G016','OS008');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('17','G017','OS009');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('18','G018','OS010');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('19','G019','OS011');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('20','G020','OS012');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('21','G021','OS013');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('22','G022','OS014');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('23','G023','OS015');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('24','G024','OS016');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('25','G025','OS017');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('26','G026','OS002');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('27','G027','OS003');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('28','G028','OS004');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('29','G029','OS005');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('30','G030','OS006');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('31','G001','OS005');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('32','G002','OS005');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('33','G003','OS005');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('34','G004','OS005');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('35','G005','OS005');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('36','G006','OS005');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('37','G007','OS005');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('38','G008','OS007');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('39','G009','OS007');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('40','G010','OS008');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('41','G011','OS007');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('42','G012','OS007');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('43','G013','OS007');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('44','G014','OS007');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('45','G015','OS007');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('46','G016','OS009');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('47','G017','OS010');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('48','G018','OS011');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('49','G019','OS012');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('50','G020','OS013');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('51','G021','OS014');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('52','G022','OS015');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('53','G023','OS016');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('54','G024','OS017');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('55','G025','OS018');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('56','G026','OS018');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('57','G027','OS018');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('58','G028','OS018');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('59','G029','OS018');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('60','G030','OS018');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('61','G001','OS019');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('62','G002','OS019');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('63','G003','OS019');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('64','G004','OS019');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('65','G005','OS019');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('66','G006','OS019');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('67','G007','OS019');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('68','G008','OS019');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('69','G009','OS019');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('70','G010','OS019');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('71','G011','OS019');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('72','G012','OS019');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('73','G013','OS019');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('74','G014','OS001');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('75','G015','OS002');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('76','G016','OS003');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('77','G017','OS004');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('78','G018','OS005');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('79','G019','OS006');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('80','G020','OS007');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('81','G021','OS008');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('82','G022','OS009');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('83','G023','OS010');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('84','G024','OS011');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('85','G025','OS012');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('86','G026','OS013');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('87','G027','OS014');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('88','G028','OS015');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('89','G029','OS016');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('90','G030','OS017');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('91','G001','OS004');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('92','G002','OS004');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('93','G003','OS004');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('94','G004','OS004');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('95','G005','OS004');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('96','G006','OS004');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('97','G007','OS006');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('98','G008','OS006');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('99','G009','OS020');       
insert into Detail_Game_OS(No, Game_G_ID, OS_O_ID) values ('100','G010','OS020');  
