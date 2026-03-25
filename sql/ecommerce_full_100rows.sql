-- ============================================================
-- M605 Advanced Databases
-- E-Commerce Platform — Full SQL File
-- 100 rows per table
-- ============================================================

CREATE SCHEMA IF NOT EXISTS ecommerce_platform;
USE ecommerce_platform;

-- ============================================================
-- SCHEMA CREATION
-- ============================================================

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(20),
    registration_date DATE NOT NULL,
    country VARCHAR(50) NOT NULL
);

CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(50),
    phone VARCHAR(20),
    country VARCHAR(50)
);

CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    stock INT NOT NULL DEFAULT 0 CHECK (stock >= 0),
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) DEFAULT 0 CHECK (total_amount >= 0),
    order_status VARCHAR(20) DEFAULT 'Pending',
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE
);

CREATE TABLE Order_Details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price_each DECIMAL(10,2) NOT NULL CHECK (price_each > 0),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_date DATE NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
    order_id INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE CASCADE
);

-- ============================================================
-- INDEXES
-- ============================================================

CREATE INDEX idx_customer_country    ON Customers(country);
CREATE INDEX idx_product_category    ON Products(category);
CREATE INDEX idx_order_date          ON Orders(order_date);
CREATE INDEX idx_order_customer      ON Orders(customer_id);
CREATE INDEX idx_orderdetails_product ON Order_Details(product_id);

-- ============================================================
-- CUSTOMERS (100 rows)
-- ============================================================
INSERT INTO Customers(first_name, last_name, email, phone_number, registration_date, country) VALUES
  ('James','Smith','james.smith0@email.com','3746317213','2022-02-21','USA'),
  ('Mary','Johnson','mary.johnson1@email.com','8479902459','2023-05-17','UK'),
  ('John','Williams','john.williams2@email.com','1958682846','2022-07-29','Canada'),
  ('Patricia','Brown','patricia.brown3@email.com','9963334018','2024-05-14','Germany'),
  ('Robert','Jones','robert.jones4@email.com','1136505587','2022-07-11','France'),
  ('Jennifer','Garcia','jennifer.garcia5@email.com','1939042955','2024-10-31','Italy'),
  ('Michael','Miller','michael.miller6@email.com','3585650756','2023-02-12','Spain'),
  ('Linda','Davis','linda.davis7@email.com','2801823908','2024-07-08','Netherlands'),
  ('William','Rodriguez','william.rodriguez8@email.com','7825844140','2022-01-14','Sweden'),
  ('Barbara','Martinez','barbara.martinez9@email.com','7110082321','2023-07-24','Ireland'),
  ('David','Hernandez','david.hernandez10@email.com','1667779376','2023-11-21','Australia'),
  ('Susan','Lopez','susan.lopez11@email.com','1438989805','2024-02-18','Japan'),
  ('Richard','Gonzalez','richard.gonzalez12@email.com','5710360983','2023-12-06','Brazil'),
  ('Jessica','Wilson','jessica.wilson13@email.com','7887950851','2022-03-30','India'),
  ('Joseph','Anderson','joseph.anderson14@email.com','8429141456','2022-09-13','Mexico'),
  ('Sarah','Thomas','sarah.thomas15@email.com','2625792787','2023-08-24','Portugal'),
  ('Thomas','Taylor','thomas.taylor16@email.com','8995970241','2023-01-29','Belgium'),
  ('Karen','Moore','karen.moore17@email.com','4026113008','2022-04-04','Switzerland'),
  ('Charles','Jackson','charles.jackson18@email.com','3840104345','2023-08-16','Austria'),
  ('Lisa','Martin','lisa.martin19@email.com','5231494220','2023-04-22','Denmark'),
  ('Christopher','Lee','christopher.lee20@email.com','4721519026','2024-02-18','USA'),
  ('Nancy','Perez','nancy.perez21@email.com','6488854841','2024-01-18','UK'),
  ('Daniel','Thompson','daniel.thompson22@email.com','5993561321','2023-12-29','Canada'),
  ('Betty','White','betty.white23@email.com','3783290795','2022-12-17','Germany'),
  ('Matthew','Harris','matthew.harris24@email.com','2051454923','2024-08-04','France'),
  ('Margaret','Sanchez','margaret.sanchez25@email.com','6924716023','2023-03-26','Italy'),
  ('Anthony','Clark','anthony.clark26@email.com','8235363119','2022-04-25','Spain'),
  ('Sandra','Ramirez','sandra.ramirez27@email.com','6649827836','2023-07-03','Netherlands'),
  ('Donald','Lewis','donald.lewis28@email.com','1284277889','2023-10-07','Sweden'),
  ('Ashley','Robinson','ashley.robinson29@email.com','7439149233','2024-07-28','Ireland'),
  ('Mark','Walker','mark.walker30@email.com','5908596099','2022-10-13','Australia'),
  ('Dorothy','Young','dorothy.young31@email.com','7805745017','2024-03-28','Japan'),
  ('Paul','Allen','paul.allen32@email.com','2554762903','2022-10-11','Brazil'),
  ('Kimberly','King','kimberly.king33@email.com','7483366056','2022-07-06','India'),
  ('Steven','Wright','steven.wright34@email.com','4246059658','2022-08-13','Mexico'),
  ('Emily','Scott','emily.scott35@email.com','8217611860','2022-05-11','Portugal'),
  ('Andrew','Torres','andrew.torres36@email.com','6947530309','2024-08-16','Belgium'),
  ('Donna','Nguyen','donna.nguyen37@email.com','7567496105','2022-01-24','Switzerland'),
  ('Kenneth','Hill','kenneth.hill38@email.com','8519962896','2023-11-28','Austria'),
  ('Michelle','Flores','michelle.flores39@email.com','5774080233','2024-06-09','Denmark'),
  ('Kevin','Green','kevin.green40@email.com','5974249674','2022-01-07','USA'),
  ('Carol','Adams','carol.adams41@email.com','4919706735','2023-09-04','UK'),
  ('Brian','Nelson','brian.nelson42@email.com','1854316681','2024-02-05','Canada'),
  ('Amanda','Baker','amanda.baker43@email.com','4274958945','2024-12-22','Germany'),
  ('George','Hall','george.hall44@email.com','4944899549','2023-10-26','France'),
  ('Melissa','Rivera','melissa.rivera45@email.com','3098545541','2022-08-18','Italy'),
  ('Timothy','Campbell','timothy.campbell46@email.com','9285415473','2023-09-22','Spain'),
  ('Deborah','Mitchell','deborah.mitchell47@email.com','2028439863','2023-05-09','Netherlands'),
  ('Ronald','Carter','ronald.carter48@email.com','5067116918','2022-06-25','Sweden'),
  ('Stephanie','Roberts','stephanie.roberts49@email.com','8438486479','2022-05-22','Ireland'),
  ('Edward','Gomez','edward.gomez50@email.com','1540137296','2024-08-31','Australia'),
  ('Rebecca','Phillips','rebecca.phillips51@email.com','6004182187','2024-12-16','Japan'),
  ('Jason','Evans','jason.evans52@email.com','6633778586','2024-02-04','Brazil'),
  ('Sharon','Turner','sharon.turner53@email.com','7517938612','2022-09-05','India'),
  ('Jeffrey','Diaz','jeffrey.diaz54@email.com','2064746525','2022-05-12','Mexico'),
  ('Laura','Parker','laura.parker55@email.com','2452066459','2023-04-17','Portugal'),
  ('Ryan','Cruz','ryan.cruz56@email.com','3527331058','2022-01-15','Belgium'),
  ('Cynthia','Edwards','cynthia.edwards57@email.com','9894847574','2022-05-01','Switzerland'),
  ('Jacob','Collins','jacob.collins58@email.com','1983297492','2022-03-06','Austria'),
  ('Kathleen','Reyes','kathleen.reyes59@email.com','8987073217','2022-05-26','Denmark'),
  ('Gary','Stewart','gary.stewart60@email.com','3208283728','2023-07-25','USA'),
  ('Amy','Morris','amy.morris61@email.com','8168204967','2023-03-15','UK'),
  ('Nicholas','Morales','nicholas.morales62@email.com','3315992115','2024-08-26','Canada'),
  ('Angela','Murphy','angela.murphy63@email.com','2748309234','2022-07-13','Germany'),
  ('Eric','Cook','eric.cook64@email.com','7146318035','2024-05-17','France'),
  ('Shirley','Rogers','shirley.rogers65@email.com','7060638140','2022-04-21','Italy'),
  ('Jonathan','Gutierrez','jonathan.gutierrez66@email.com','1422701550','2024-04-04','Spain'),
  ('Anna','Ortiz','anna.ortiz67@email.com','8422620843','2022-08-12','Netherlands'),
  ('Stephen','Morgan','stephen.morgan68@email.com','2067970820','2023-01-25','Sweden'),
  ('Brenda','Cooper','brenda.cooper69@email.com','7598297060','2022-10-15','Ireland'),
  ('Larry','Peterson','larry.peterson70@email.com','2811967841','2023-07-25','Australia'),
  ('Pamela','Bailey','pamela.bailey71@email.com','2986972437','2022-06-04','Japan'),
  ('Justin','Reed','justin.reed72@email.com','3363629219','2022-04-14','Brazil'),
  ('Emma','Kelly','emma.kelly73@email.com','2015242176','2024-04-12','India'),
  ('Scott','Howard','scott.howard74@email.com','7380780055','2023-03-14','Mexico'),
  ('Nicole','Ramos','nicole.ramos75@email.com','9008612465','2022-05-01','Portugal'),
  ('Brandon','Kim','brandon.kim76@email.com','6002078344','2022-01-05','Belgium'),
  ('Helen','Cox','helen.cox77@email.com','9526836552','2023-06-28','Switzerland'),
  ('Benjamin','Ward','benjamin.ward78@email.com','8667072205','2023-08-08','Austria'),
  ('Samantha','Richardson','samantha.richardson79@email.com','8380507338','2022-11-14','Denmark'),
  ('Samuel','Watson','samuel.watson80@email.com','6110572428','2023-03-22','USA'),
  ('Katherine','Brooks','katherine.brooks81@email.com','5160575046','2022-05-05','UK'),
  ('Raymond','Chavez','raymond.chavez82@email.com','8507497883','2022-04-28','Canada'),
  ('Christine','Wood','christine.wood83@email.com','9805294274','2024-09-03','Germany'),
  ('Gregory','James','gregory.james84@email.com','1676168421','2024-11-06','France'),
  ('Debra','Bennett','debra.bennett85@email.com','1798112150','2022-05-20','Italy'),
  ('Frank','Gray','frank.gray86@email.com','6305160342','2022-09-03','Spain'),
  ('Rachel','Mendoza','rachel.mendoza87@email.com','3446737272','2022-03-23','Netherlands'),
  ('Alexander','Ruiz','alexander.ruiz88@email.com','3660223333','2024-05-08','Sweden'),
  ('Carolyn','Hughes','carolyn.hughes89@email.com','2119980130','2023-10-06','Ireland'),
  ('Patrick','Price','patrick.price90@email.com','6320115677','2024-03-21','Australia'),
  ('Janet','Alvarez','janet.alvarez91@email.com','8067372072','2024-07-25','Japan'),
  ('Jack','Castillo','jack.castillo92@email.com','1311570307','2024-07-27','Brazil'),
  ('Catherine','Sanders','catherine.sanders93@email.com','1429416213','2023-03-13','India'),
  ('Dennis','Patel','dennis.patel94@email.com','7467725516','2022-09-29','Mexico'),
  ('Maria','Myers','maria.myers95@email.com','9303285822','2022-05-21','Portugal'),
  ('James','Long','james.long96@email.com','4776436931','2024-01-27','Belgium'),
  ('Mary','Ross','mary.ross97@email.com','2224011538','2024-06-16','Switzerland'),
  ('John','Foster','john.foster98@email.com','8316648259','2024-12-19','Austria'),
  ('Patricia','Jimenez','patricia.jimenez99@email.com','9623534576','2023-09-06','Denmark');

-- ============================================================
-- SUPPLIERS (100 rows)
-- ============================================================
INSERT INTO Suppliers(supplier_name, contact_name, phone, country) VALUES
  ('TechSupply','Hans Muller','5552737893','USA'),
  ('GadgetWorld','Laura White','5553253031','UK'),
  ('ElectroHub','Carlos Ruiz','5555437001','Canada'),
  ('SmartDevices','Anna Schmidt','5552936571','Germany'),
  ('DigitalPro','Mark Stone','5552795765','France'),
  ('FutureTech','Pierre Laurent','5553607983','Italy'),
  ('VisionElectronics','Marco Rossi','5555569244','Spain'),
  ('PrimeGadgets','John Walker','5555727085','Netherlands'),
  ('NextGenTech','Sara Lee','5554533779','Sweden'),
  ('GlobalTech','Tom Harris','5556752576','Ireland'),
  ('AlphaTech','Elena Ivanova','5554415796','Australia'),
  ('BetaDevices','Ravi Patel','5555428914','Japan'),
  ('GammaElec','Aiko Tanaka','5559479356','Brazil'),
  ('DeltaGadgets','Lucas Silva','5559196204','India'),
  ('EpsilonSupply','Sofia Costa','5555213115','Mexico'),
  ('ZetaTech','Omar Hassan','5551852264','Portugal'),
  ('EtaElectronics','Chloe Dubois','5552548511','Belgium'),
  ('ThetaDevices','Yuki Yamamoto','5558106422','Switzerland'),
  ('IotaSupply','Diego Fernandez','5555641923','Austria'),
  ('KappaGadgets','Nina Petrov','5551739653','Denmark'),
  ('LambdaTech','Hans Muller','5551059486','USA'),
  ('MuElectronics','Laura White','5556596150','UK'),
  ('NuSupply','Carlos Ruiz','5553194789','Canada'),
  ('XiGadgets','Anna Schmidt','5555394880','Germany'),
  ('OmicronTech','Mark Stone','5553710895','France'),
  ('PiDevices','Pierre Laurent','5558412769','Italy'),
  ('RhoElec','Marco Rossi','5558175395','Spain'),
  ('SigmaSupply','John Walker','5551162230','Netherlands'),
  ('TauGadgets','Sara Lee','5552876932','Sweden'),
  ('UpsilonTech','Tom Harris','5552262382','Ireland'),
  ('PhiElectronics','Elena Ivanova','5553500715','Australia'),
  ('ChiDevices','Ravi Patel','5551604451','Japan'),
  ('PsiSupply','Aiko Tanaka','5557194416','Brazil'),
  ('OmegaGadgets','Lucas Silva','5553484601','India'),
  ('AlphaOne','Sofia Costa','5558210624','Mexico'),
  ('BetaTwo','Omar Hassan','5553138181','Portugal'),
  ('GammaThree','Chloe Dubois','5551701771','Belgium'),
  ('DeltaFour','Yuki Yamamoto','5556171716','Switzerland'),
  ('EpsilonFive','Diego Fernandez','5557117837','Austria'),
  ('ZetaSix','Nina Petrov','5551669324','Denmark'),
  ('EtaSeven','Hans Muller','5557003042','USA'),
  ('ThetaEight','Laura White','5554524499','UK'),
  ('IotaNine','Carlos Ruiz','5555186414','Canada'),
  ('KappaTen','Anna Schmidt','5552724590','Germany'),
  ('LambdaEleven','Mark Stone','5556933742','France'),
  ('MuTwelve','Pierre Laurent','5557817881','Italy'),
  ('NuThirteen','Marco Rossi','5553592974','Spain'),
  ('XiFourteen','John Walker','5554971793','Netherlands'),
  ('OmicronFifteen','Sara Lee','5553726327','Sweden'),
  ('PiSixteen','Tom Harris','5553970445','Ireland'),
  ('RhoSeventeen','Elena Ivanova','5557917152','Australia'),
  ('SigmaEighteen','Ravi Patel','5551415846','Japan'),
  ('TauNineteen','Aiko Tanaka','5554009172','Brazil'),
  ('UpsilonTwenty','Lucas Silva','5556573147','India'),
  ('PhiTwentyone','Sofia Costa','5557907400','Mexico'),
  ('ChiTwentytwo','Omar Hassan','5555163555','Portugal'),
  ('PsiTwentythree','Chloe Dubois','5555476257','Belgium'),
  ('OmegaTwentyfour','Yuki Yamamoto','5553670896','Switzerland'),
  ('UltraTech','Diego Fernandez','5552813543','Austria'),
  ('HyperSupply','Nina Petrov','5557417985','Denmark'),
  ('MegaDevices','Hans Muller','5551649691','USA'),
  ('NanoElec','Laura White','5558896868','UK'),
  ('PicoGadgets','Carlos Ruiz','5554731818','Canada'),
  ('FemtoSupply','Anna Schmidt','5554348276','Germany'),
  ('AttoTech','Mark Stone','5558722606','France'),
  ('ZeptoDevices','Pierre Laurent','5556866294','Italy'),
  ('YoctoElec','Marco Rossi','5556120253','Spain'),
  ('TeraTech','John Walker','5554818418','Netherlands'),
  ('GigaSupply','Sara Lee','5554740036','Sweden'),
  ('MegaGadgets','Tom Harris','5551397023','Ireland'),
  ('KiloElec','Elena Ivanova','5554240180','Australia'),
  ('HectoTech','Ravi Patel','5557685149','Japan'),
  ('DecaDevices','Aiko Tanaka','5556507321','Brazil'),
  ('DeciSupply','Lucas Silva','5555674183','India'),
  ('CentiGadgets','Sofia Costa','5552164686','Mexico'),
  ('MilliElec','Omar Hassan','5555682940','Portugal'),
  ('MicroTech','Chloe Dubois','5556891254','Belgium'),
  ('NanoSupply','Yuki Yamamoto','5559546409','Switzerland'),
  ('PicoDevices','Diego Fernandez','5557705490','Austria'),
  ('FemtoGadgets','Nina Petrov','5559996207','Denmark'),
  ('AttoElec','Hans Muller','5556555772','USA'),
  ('ZeptoTech','Laura White','5551463060','UK'),
  ('YoctoSupply','Carlos Ruiz','5552935113','Canada'),
  ('SuperDevices','Anna Schmidt','5555382463','Germany'),
  ('HyperElec','Mark Stone','5553995870','France'),
  ('TurboTech','Pierre Laurent','5555453786','Italy'),
  ('SpeedGadgets','Marco Rossi','5551641849','Spain'),
  ('RapidSupply','John Walker','5552818692','Netherlands'),
  ('SwiftDevices','Sara Lee','5558290770','Sweden'),
  ('QuickElec','Tom Harris','5556799667','Ireland'),
  ('FastTech','Elena Ivanova','5556262632','Australia'),
  ('BriskGadgets','Ravi Patel','5558321474','Japan'),
  ('NimbleSupply','Aiko Tanaka','5559580255','Brazil'),
  ('AgileTech','Lucas Silva','5552940214','India'),
  ('LeanDevices','Sofia Costa','5557462506','Mexico'),
  ('SlimElec','Omar Hassan','5554188992','Portugal'),
  ('TrimGadgets','Chloe Dubois','5555273534','Belgium'),
  ('FitSupply','Yuki Yamamoto','5551744682','Switzerland'),
  ('CoreTech','Diego Fernandez','5558315831','Austria'),
  ('ApexDevices','Nina Petrov','5551028374','Denmark');

-- ============================================================
-- PRODUCTS (100 rows)
-- ============================================================
INSERT INTO Products(product_name, category, price, stock, supplier_id) VALUES
  ('Laptop','Electronics',1044.64,417,1),
  ('Smartphone','Accessories',1081.52,373,2),
  ('Headphones','Networking',1881.12,382,3),
  ('Tablet','Smart Home',1344.55,191,4),
  ('Smartwatch','Audio',868.28,490,5),
  ('Gaming Console','Photography',1331.83,174,6),
  ('Camera','Gaming',1250.08,344,7),
  ('Bluetooth Speaker','Office',1697.55,373,8),
  ('Monitor','Development',1801.09,264,9),
  ('Keyboard','Printing',625.48,214,10),
  ('Mouse','Electronics',659.1,361,11),
  ('Printer','Accessories',598.35,70,12),
  ('USB Hub','Networking',391.76,345,13),
  ('Webcam','Smart Home',1881.32,351,14),
  ('External SSD','Audio',1498.79,94,15),
  ('Graphics Card','Photography',1234.87,159,16),
  ('RAM Module','Gaming',818.09,431,17),
  ('CPU Cooler','Office',10.81,151,18),
  ('Mechanical Keyboard','Development',428.26,407,19),
  ('Gaming Mouse','Printing',1164.17,340,20),
  ('Curved Monitor','Electronics',651.28,231,21),
  ('4K Webcam','Accessories',889.9,114,22),
  ('Noise Cancelling Headphones','Networking',1027.24,411,23),
  ('Portable Charger','Smart Home',1803.35,412,24),
  ('Wireless Earbuds','Audio',1474.56,342,25),
  ('Smart Speaker','Photography',178.74,268,26),
  ('VR Headset','Gaming',1331.07,322,27),
  ('Drone','Office',677.02,424,28),
  ('Action Camera','Development',1904.48,125,29),
  ('E-Reader','Printing',1348.86,120,30),
  ('Smart TV','Electronics',1615.06,80,31),
  ('Projector','Accessories',58.61,130,32),
  ('NAS Drive','Networking',1968.03,317,33),
  ('Network Switch','Smart Home',1700.98,42,34),
  ('Wi-Fi Router','Audio',916.28,458,35),
  ('Cable Modem','Photography',1263.23,104,36),
  ('UPS Battery','Gaming',1439.51,201,37),
  ('LED Strip','Office',993.81,129,38),
  ('Smart Bulb','Development',303.67,357,39),
  ('Smart Plug','Printing',21.03,389,40),
  ('Fitness Tracker','Electronics',1722.28,458,41),
  ('GPS Watch','Accessories',222.11,222,42),
  ('Air Purifier','Networking',445.49,416,43),
  ('Robot Vacuum','Smart Home',1916.35,270,44),
  ('Smart Thermostat','Audio',934.45,290,45),
  ('Video Doorbell','Photography',505.9,439,46),
  ('Security Camera','Gaming',251.5,73,47),
  ('Smart Lock','Office',1604.82,346,48),
  ('Dash Cam','Development',1066.95,291,49),
  ('OBD Scanner','Printing',1194.95,491,50),
  ('Drawing Tablet','Electronics',1512.95,231,51),
  ('MIDI Keyboard','Accessories',1229.18,373,52),
  ('Audio Interface','Networking',1785.12,223,53),
  ('Studio Microphone','Smart Home',1662.83,285,54),
  ('Pop Filter','Audio',897.37,86,55),
  ('Boom Arm','Photography',1489.87,248,56),
  ('Condenser Mic','Gaming',905.64,389,57),
  ('Dynamic Mic','Office',502.01,331,58),
  ('Lavalier Mic','Development',561.85,403,59),
  ('Shock Mount','Printing',1047.39,325,60),
  ('Tripod','Electronics',486.1,230,61),
  ('Ring Light','Accessories',164.19,151,62),
  ('Softbox','Networking',476.64,176,63),
  ('Green Screen','Smart Home',646.22,281,64),
  ('Streaming Deck','Audio',170.35,82,65),
  ('Capture Card','Photography',470.21,360,66),
  ('HDMI Switch','Gaming',314.08,114,67),
  ('KVM Switch','Office',137.82,213,68),
  ('Docking Station','Development',668.45,243,69),
  ('USB-C Hub','Printing',837.39,110,70),
  ('Thunderbolt Hub','Electronics',1667.45,204,71),
  ('SD Card Reader','Accessories',1810.63,304,72),
  ('Card Wallet','Networking',1892.66,15,73),
  ('Phone Stand','Smart Home',1714.9,396,74),
  ('Laptop Stand','Audio',1155.62,249,75),
  ('Monitor Arm','Photography',21.73,185,76),
  ('Cable Management','Gaming',604.24,204,77),
  ('Desk Mat','Office',1708.36,493,78),
  ('Mouse Pad','Development',1673.1,280,79),
  ('Wrist Rest','Printing',1497.56,284,80),
  ('Ergonomic Chair','Electronics',1601.74,464,81),
  ('Standing Desk','Accessories',448.87,117,82),
  ('Monitor Light','Networking',553.14,253,83),
  ('Desk Fan','Smart Home',67.76,177,84),
  ('Mini PC','Audio',1341.06,413,85),
  ('Raspberry Pi','Photography',814.59,89,86),
  ('Arduino Kit','Gaming',1682.61,475,87),
  ('Soldering Kit','Office',263.98,323,88),
  ('Multimeter','Development',1072.91,469,89),
  ('Oscilloscope','Printing',794.1,293,90),
  ('Logic Analyzer','Electronics',1329.37,47,91),
  ('3D Printer','Accessories',1289.07,74,92),
  ('Filament Roll','Networking',1735.03,98,93),
  ('Resin Printer','Smart Home',110.07,199,94),
  ('Laser Engraver','Audio',661.43,237,95),
  ('CNC Router','Photography',660.42,394,96),
  ('Power Drill','Gaming',1760.48,147,97),
  ('Label Maker','Office',1506.5,430,98),
  ('Barcode Scanner','Development',848.91,432,99),
  ('Receipt Printer','Printing',172.99,14,100);

-- ============================================================
-- ORDERS (100 rows)
-- ============================================================
INSERT INTO Orders(order_date, total_amount, order_status, customer_id) VALUES
  ('2024-07-06',175.22,'Shipped',1),
  ('2023-12-25',688.18,'Delivered',2),
  ('2023-03-12',2348.07,'Processing',3),
  ('2024-10-29',139.97,'Pending',4),
  ('2023-02-01',2849.84,'Cancelled',5),
  ('2023-07-24',2520.9,'Shipped',6),
  ('2024-09-28',474.1,'Delivered',7),
  ('2023-05-10',1431.21,'Processing',8),
  ('2023-04-28',1700.63,'Pending',9),
  ('2023-08-12',1405.8,'Cancelled',10),
  ('2023-09-20',2305.36,'Shipped',11),
  ('2023-06-21',1825.56,'Delivered',12),
  ('2023-04-28',2337.82,'Processing',13),
  ('2023-06-17',2894.87,'Pending',14),
  ('2023-04-21',1744.48,'Cancelled',15),
  ('2023-11-16',1735.87,'Shipped',16),
  ('2024-01-20',1202.03,'Delivered',17),
  ('2023-07-23',246.47,'Processing',18),
  ('2024-12-08',2495.1,'Pending',19),
  ('2023-09-06',323.67,'Cancelled',20),
  ('2023-11-05',2553.87,'Shipped',21),
  ('2024-09-06',2420.47,'Delivered',22),
  ('2024-08-02',2352.25,'Processing',23),
  ('2023-12-22',1607.58,'Pending',24),
  ('2024-11-08',1124.3,'Cancelled',25),
  ('2024-06-02',1949.68,'Shipped',26),
  ('2023-01-13',2551.74,'Delivered',27),
  ('2024-05-16',334.51,'Processing',28),
  ('2024-01-06',1914.04,'Pending',29),
  ('2024-04-15',2127.78,'Cancelled',30),
  ('2024-03-21',544.89,'Shipped',31),
  ('2024-06-18',2897.11,'Delivered',32),
  ('2023-10-04',1855.42,'Processing',33),
  ('2024-07-05',2328.43,'Pending',34),
  ('2024-04-21',1318.01,'Cancelled',35),
  ('2024-08-29',819.82,'Shipped',36),
  ('2023-09-09',2495.58,'Delivered',37),
  ('2023-03-30',851.21,'Processing',38),
  ('2024-04-06',746.71,'Pending',39),
  ('2024-04-20',1718.15,'Cancelled',40),
  ('2024-11-15',1149.39,'Shipped',41),
  ('2023-01-30',1493.03,'Delivered',42),
  ('2023-11-29',561.88,'Processing',43),
  ('2023-08-06',1077.38,'Pending',44),
  ('2023-09-22',1034.21,'Cancelled',45),
  ('2024-09-02',2109.53,'Shipped',46),
  ('2023-10-10',1676.26,'Delivered',47),
  ('2024-06-13',2845.23,'Processing',48),
  ('2023-03-29',739.24,'Pending',49),
  ('2024-02-21',1475.96,'Cancelled',50),
  ('2023-09-04',2078.02,'Shipped',51),
  ('2024-10-23',2141.29,'Delivered',52),
  ('2024-04-03',2382.94,'Processing',53),
  ('2023-04-06',896.82,'Pending',54),
  ('2024-02-19',2081.53,'Cancelled',55),
  ('2023-11-10',1998.6,'Shipped',56),
  ('2024-01-13',1430.32,'Delivered',57),
  ('2024-06-27',1044.4,'Processing',58),
  ('2024-07-17',1005.76,'Pending',59),
  ('2024-12-20',1372.16,'Cancelled',60),
  ('2023-11-10',769.18,'Shipped',61),
  ('2023-05-04',2169.43,'Delivered',62),
  ('2023-11-20',376.27,'Processing',63),
  ('2024-07-02',2853.62,'Pending',64),
  ('2024-12-07',571.75,'Cancelled',65),
  ('2023-08-10',2221.04,'Shipped',66),
  ('2023-10-11',2179.26,'Delivered',67),
  ('2024-06-21',1798.44,'Processing',68),
  ('2023-04-13',2501.23,'Pending',69),
  ('2023-10-31',697.9,'Cancelled',70),
  ('2023-07-03',920.76,'Shipped',71),
  ('2024-12-26',1611.72,'Delivered',72),
  ('2023-10-08',155.64,'Processing',73),
  ('2023-02-25',1669.01,'Pending',74),
  ('2024-12-15',2833.39,'Cancelled',75),
  ('2024-10-15',2608.01,'Shipped',76),
  ('2024-05-17',325.71,'Delivered',77),
  ('2023-01-13',1730.71,'Processing',78),
  ('2024-04-25',1446.57,'Pending',79),
  ('2023-12-15',569.4,'Cancelled',80),
  ('2023-02-22',772.39,'Shipped',81),
  ('2024-05-04',359.98,'Delivered',82),
  ('2023-03-08',1214.11,'Processing',83),
  ('2023-03-17',1739.52,'Pending',84),
  ('2024-12-03',179.76,'Cancelled',85),
  ('2023-06-02',2437.2,'Shipped',86),
  ('2023-11-08',273.84,'Delivered',87),
  ('2023-09-12',372.99,'Processing',88),
  ('2024-03-02',1826.83,'Pending',89),
  ('2024-09-25',692.55,'Cancelled',90),
  ('2024-06-19',1153.53,'Shipped',91),
  ('2024-03-29',906.11,'Delivered',92),
  ('2024-08-25',2970.29,'Processing',93),
  ('2023-11-09',1714.52,'Pending',94),
  ('2023-03-03',1836.7,'Cancelled',95),
  ('2023-04-12',2843.82,'Shipped',96),
  ('2023-08-01',1884.03,'Delivered',97),
  ('2023-09-28',1988.08,'Processing',98),
  ('2023-06-10',734.8,'Pending',99),
  ('2024-07-19',243.69,'Cancelled',100);

-- ============================================================
-- ORDER_DETAILS (100 rows)
-- ============================================================
INSERT INTO Order_Details(order_id, product_id, quantity, price_each) VALUES
  (1,1,1,822.95),
  (2,2,10,945.13),
  (3,3,1,470.64),
  (4,4,5,1408.95),
  (5,5,8,151.65),
  (6,6,4,1848.58),
  (7,7,10,1325.75),
  (8,8,4,856.03),
  (9,9,9,457.37),
  (10,10,3,1817.74),
  (11,11,3,152.11),
  (12,12,3,1587.33),
  (13,13,10,1500.43),
  (14,14,10,1843.17),
  (15,15,8,257.46),
  (16,16,5,1402.47),
  (17,17,5,1005.94),
  (18,18,8,881.14),
  (19,19,10,89.32),
  (20,20,7,1471.72),
  (21,21,10,508.23),
  (22,22,2,465.56),
  (23,23,10,1178.37),
  (24,24,1,1999.15),
  (25,25,5,1156.73),
  (26,26,3,946.3),
  (27,27,8,1832.98),
  (28,28,3,1993.92),
  (29,29,7,1273.22),
  (30,30,8,1938.42),
  (31,31,8,702.44),
  (32,32,6,648.91),
  (33,33,2,1716.89),
  (34,34,6,829.17),
  (35,35,8,583.55),
  (36,36,7,1629.0),
  (37,37,9,83.03),
  (38,38,2,635.89),
  (39,39,6,240.68),
  (40,40,7,1731.17),
  (41,41,1,1318.74),
  (42,42,9,929.33),
  (43,43,1,383.29),
  (44,44,6,1249.04),
  (45,45,8,1254.56),
  (46,46,1,415.08),
  (47,47,9,270.72),
  (48,48,5,881.85),
  (49,49,8,251.64),
  (50,50,10,1600.63),
  (51,51,3,628.39),
  (52,52,1,1108.98),
  (53,53,2,457.15),
  (54,54,2,928.28),
  (55,55,2,1298.94),
  (56,56,3,1001.77),
  (57,57,5,1022.66),
  (58,58,5,836.83),
  (59,59,8,1960.69),
  (60,60,4,919.01),
  (61,61,3,773.34),
  (62,62,10,1021.4),
  (63,63,3,1729.41),
  (64,64,5,1547.62),
  (65,65,7,686.35),
  (66,66,9,541.67),
  (67,67,1,572.85),
  (68,68,5,1676.58),
  (69,69,10,1997.82),
  (70,70,8,1731.87),
  (71,71,8,1081.78),
  (72,72,6,671.56),
  (73,73,9,760.65),
  (74,74,6,1740.51),
  (75,75,4,1147.88),
  (76,76,4,1713.47),
  (77,77,7,96.86),
  (78,78,8,1413.4),
  (79,79,7,778.3),
  (80,80,3,995.7),
  (81,81,1,261.23),
  (82,82,10,670.67),
  (83,83,2,1749.64),
  (84,84,8,208.43),
  (85,85,8,40.54),
  (86,86,3,825.86),
  (87,87,3,158.91),
  (88,88,5,683.74),
  (89,89,7,1303.17),
  (90,90,6,1706.16),
  (91,91,9,766.22),
  (92,92,6,1257.33),
  (93,93,8,1746.04),
  (94,94,1,1238.74),
  (95,95,4,1266.01),
  (96,96,5,1994.88),
  (97,97,2,873.6),
  (98,98,2,1523.14),
  (99,99,2,892.92),
  (100,100,5,1807.81);

-- ============================================================
-- TRANSACTIONS (100 rows)
-- ============================================================
INSERT INTO Transactions(transaction_date, payment_method, amount, order_id) VALUES
  ('2023-02-17','Credit Card',986.64,1),
  ('2023-02-27','PayPal',894.24,2),
  ('2024-01-19','Debit Card',1303.45,3),
  ('2023-09-08','Bank Transfer',1602.88,4),
  ('2024-08-02','Crypto',2051.77,5),
  ('2023-07-04','Apple Pay',526.55,6),
  ('2023-03-22','Google Pay',1836.29,7),
  ('2024-01-27','Credit Card',1866.74,8),
  ('2023-09-04','PayPal',1503.05,9),
  ('2024-08-20','Debit Card',446.49,10),
  ('2024-04-17','Bank Transfer',1920.96,11),
  ('2024-04-15','Crypto',780.87,12),
  ('2023-01-10','Apple Pay',2698.75,13),
  ('2024-04-21','Google Pay',2705.6,14),
  ('2024-11-24','Credit Card',1648.86,15),
  ('2023-03-17','PayPal',1336.35,16),
  ('2023-12-20','Debit Card',2963.2,17),
  ('2023-11-03','Bank Transfer',1924.04,18),
  ('2024-03-10','Crypto',2077.13,19),
  ('2024-04-12','Apple Pay',2539.01,20),
  ('2023-07-23','Google Pay',2998.13,21),
  ('2024-05-09','Credit Card',337.83,22),
  ('2024-01-26','PayPal',1724.33,23),
  ('2024-08-11','Debit Card',901.7,24),
  ('2024-12-17','Bank Transfer',899.79,25),
  ('2024-11-05','Crypto',1199.5,26),
  ('2023-01-09','Apple Pay',1706.47,27),
  ('2024-12-03','Google Pay',2339.37,28),
  ('2023-02-20','Credit Card',2733.64,29),
  ('2024-05-23','PayPal',2501.86,30),
  ('2023-10-21','Debit Card',2331.71,31),
  ('2023-08-24','Bank Transfer',1829.05,32),
  ('2023-12-27','Crypto',672.63,33),
  ('2023-07-14','Apple Pay',1870.26,34),
  ('2024-11-25','Google Pay',2271.62,35),
  ('2024-11-06','Credit Card',2048.95,36),
  ('2023-05-21','PayPal',1892.18,37),
  ('2024-10-04','Debit Card',1946.1,38),
  ('2023-11-13','Bank Transfer',2370.06,39),
  ('2023-02-04','Crypto',1747.13,40),
  ('2023-05-15','Apple Pay',288.6,41),
  ('2023-10-30','Google Pay',993.62,42),
  ('2024-03-01','Credit Card',543.41,43),
  ('2023-05-16','PayPal',2363.81,44),
  ('2024-01-10','Debit Card',1601.94,45),
  ('2023-10-07','Bank Transfer',2494.81,46),
  ('2023-09-21','Crypto',2743.87,47),
  ('2024-05-08','Apple Pay',2902.8,48),
  ('2023-10-30','Google Pay',2244.75,49),
  ('2023-12-13','Credit Card',2416.61,50),
  ('2024-04-24','PayPal',2889.42,51),
  ('2023-05-25','Debit Card',2267.37,52),
  ('2023-08-20','Bank Transfer',2583.22,53),
  ('2024-11-21','Crypto',2940.23,54),
  ('2024-07-24','Apple Pay',1110.01,55),
  ('2024-02-09','Google Pay',61.48,56),
  ('2024-07-03','Credit Card',388.29,57),
  ('2024-01-13','PayPal',2025.03,58),
  ('2024-11-19','Debit Card',801.24,59),
  ('2024-01-26','Bank Transfer',2470.8,60),
  ('2024-01-16','Crypto',342.87,61),
  ('2023-08-28','Apple Pay',1425.0,62),
  ('2024-09-26','Google Pay',2655.02,63),
  ('2024-07-28','Credit Card',997.46,64),
  ('2024-09-16','PayPal',679.67,65),
  ('2023-03-06','Debit Card',1913.5,66),
  ('2024-04-20','Bank Transfer',2729.98,67),
  ('2023-11-06','Crypto',1954.73,68),
  ('2023-04-30','Apple Pay',436.54,69),
  ('2023-02-08','Google Pay',927.01,70),
  ('2024-05-19','Credit Card',366.04,71),
  ('2023-08-29','PayPal',2664.03,72),
  ('2023-05-19','Debit Card',1178.16,73),
  ('2024-01-15','Bank Transfer',2018.05,74),
  ('2024-12-14','Crypto',2839.0,75),
  ('2024-03-05','Apple Pay',1770.27,76),
  ('2023-06-08','Google Pay',2658.53,77),
  ('2024-11-01','Credit Card',315.08,78),
  ('2024-05-16','PayPal',1854.64,79),
  ('2023-10-14','Debit Card',117.49,80),
  ('2024-01-15','Bank Transfer',667.46,81),
  ('2024-03-31','Crypto',2852.65,82),
  ('2024-01-07','Apple Pay',316.08,83),
  ('2024-12-03','Google Pay',1114.66,84),
  ('2024-10-22','Credit Card',1088.85,85),
  ('2024-02-12','PayPal',842.13,86),
  ('2023-05-06','Debit Card',2848.05,87),
  ('2024-04-10','Bank Transfer',293.19,88),
  ('2023-08-06','Crypto',1932.28,89),
  ('2024-09-03','Apple Pay',2913.86,90),
  ('2023-02-21','Google Pay',2364.65,91),
  ('2023-09-07','Credit Card',2966.69,92),
  ('2024-08-01','PayPal',631.51,93),
  ('2024-07-21','Debit Card',637.33,94),
  ('2023-08-10','Bank Transfer',2442.9,95),
  ('2023-08-27','Crypto',999.11,96),
  ('2023-06-01','Apple Pay',2370.16,97),
  ('2024-09-02','Google Pay',28.45,98),
  ('2023-05-29','Credit Card',2962.83,99),
  ('2024-07-07','PayPal',766.95,100);

-- ============================================================
-- FUNCTIONAL QUERIES
-- ============================================================

-- 1. INNER JOIN – Orders with Customer Details
SELECT c.customer_id, c.first_name, c.last_name,
       o.order_id, o.order_date, o.total_amount
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;

-- 2. Total Spending Per Customer (Aggregation)
SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       SUM(od.quantity * od.price_each) AS total_spent
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
INNER JOIN Order_Details od ON o.order_id = od.order_id
GROUP BY c.customer_id, customer_name
ORDER BY total_spent DESC;

-- 3. Top 5 Best-Selling Products
SELECT p.product_name,
       SUM(od.quantity) AS total_sold
FROM Products p
INNER JOIN Order_Details od ON p.product_id = od.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 5;

-- 4. Customers Without Orders (LEFT JOIN)
SELECT c.customer_id, c.first_name, c.last_name, o.order_id
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 5. Revenue by Product Category
SELECT p.category,
       COUNT(od.order_detail_id) AS total_orders,
       SUM(od.quantity * od.price_each) AS revenue
FROM Products p
INNER JOIN Order_Details od ON p.product_id = od.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- 6. Orders by Status Count
SELECT order_status,
       COUNT(*) AS total_orders,
       SUM(total_amount) AS total_value
FROM Orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- ============================================================
-- STORED PROCEDURE – Place Order with Stock Check
-- ============================================================

DROP PROCEDURE IF EXISTS PlaceOrder;

DELIMITER //

CREATE PROCEDURE PlaceOrder(
    IN p_order_id INT,
    IN p_product_id INT,
    IN p_quantity INT,
    IN p_price DECIMAL(10,2)
)
BEGIN
    DECLARE available_stock INT DEFAULT 0;
    DECLARE order_exists INT DEFAULT 0;

    -- Check order exists
    SELECT COUNT(*) INTO order_exists
    FROM Orders WHERE order_id = p_order_id;

    -- Check stock
    SELECT stock INTO available_stock
    FROM Products WHERE product_id = p_product_id;

    -- Show what we found (great for video demo too!)
    SELECT available_stock AS current_stock,
           p_quantity      AS requested_qty,
           order_exists    AS order_found;

    IF order_exists = 0 THEN
        SELECT 'FAILED: order_id does not exist' AS result;

    ELSEIF available_stock >= p_quantity THEN
        START TRANSACTION;

        UPDATE Products
        SET stock = stock - p_quantity
        WHERE product_id = p_product_id;

        INSERT INTO Order_Details(order_id, product_id, quantity, price_each)
        VALUES(p_order_id, p_product_id, p_quantity, p_price);

        UPDATE Orders
        SET total_amount = total_amount + (p_quantity * p_price)
        WHERE order_id = p_order_id;

        COMMIT;
        SELECT 'SUCCESS: Order placed.' AS result;

    ELSE
        SELECT CONCAT('FAILED: Insufficient stock. Available: ',
                       available_stock) AS result;
    END IF;
END //

DELIMITER ;

CALL PlaceOrder(5, 17, 3, 800.00);

SELECT product_id, stock FROM Products WHERE product_id = 17;


-- ============================================================
-- TRIGGER – Auto-log new orders
-- ============================================================

CREATE TABLE IF NOT EXISTS Order_Log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    log_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TRIGGER IF EXISTS after_order_insert;

DELIMITER //

CREATE TRIGGER after_order_insert
AFTER INSERT ON Orders
FOR EACH ROW
BEGIN
    INSERT INTO Order_Log(order_id, customer_id, order_date, total_amount)
    VALUES (NEW.order_id, NEW.customer_id, NEW.order_date, NEW.total_amount);
END //

DELIMITER ;

INSERT INTO Orders(order_date, total_amount, order_status, customer_id)
VALUES ('2024-10-01', 450.00, 'Pending', 1);

SELECT * FROM Order_Log ORDER BY log_timestamp DESC LIMIT 3;



-- ============================================================
-- MANUAL TRANSACTION EXAMPLE
-- ============================================================

START TRANSACTION;

UPDATE Products
SET stock = stock - 2
WHERE product_id = 1;

INSERT INTO Order_Details(order_id, product_id, quantity, price_each)
VALUES (1, 1, 2, 1200.00);

COMMIT;
