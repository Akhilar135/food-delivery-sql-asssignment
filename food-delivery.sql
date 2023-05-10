CREATE schema sql_food_delivery;
USE sql_food_delivery;
Create table Customers (
  customer_Id int(5) AUTO_INCREMENT,
  customer_Name varchar(20) NOT NULL,
  customer_Phone char(10) NOT NULL, 
  customer_city  varchar(15),
  primary key (customer_Id)
);

INSERT INTO Customers VALUES('1','Akhila','6238086071','Mavelikara');
INSERT INTO Customers VALUES('2','Aparna','6238896071','Trivandrum');
INSERT INTO Customers VALUES('3','Ananthu','6708086071','Kochi');
INSERT INTO Customers VALUES('4','Karthik','9338086071','Alappuzha');
INSERT INTO Customers VALUES('5','Rahul','7658086071','Kakanad');

Create table partner (
  partner_Id int(5) AUTO_INCREMENT,
  partner_Name varchar(25) NOT NULL,
  partner_Phone char(10) NOT NULL, 
  partner_status varchar(20),
  primary key (partner_Id)
);
INSERT INTO partner VALUES('11','Manjima','6238086091','Delivered');
INSERT INTO partner VALUES('22','Appu','6238896073','Delivered');
INSERT INTO partner VALUES('33','Akhil','6708086077','On Delivered');
INSERT INTO partner VALUES('44','Kavya','9338086075','On Delivery');
INSERT INTO partner VALUES('55','Sruthy','7658086074','Delivered');

Create table orders (
  order_Id int(5) AUTO_INCREMENT,
   customer_Id int(5) NOT NULL,
   restaurant_Id int(5) NOT NULL,
   partner_Id int(5),
   order_date date NOT NULL,
  order_price int(10), 
  order_quantity int(5),
primary key (order_Id),
FOREIGN KEY (customer_Id) REFERENCES Customers (customer_Id),
FOREIGN KEY (restaurant_Id) REFERENCES restaurants(restaurant_Id),
FOREIGN KEY (partner_Id) REFERENCES partner(partner_Id)
);


INSERT INTO orders VALUES('1','2','4','22','2023-01-01','150','1');
INSERT INTO orders VALUES('2','5','3','11','2023-01-02','100','1');
INSERT INTO orders VALUES('3','4','1','33','2023-01-03','100','1');
INSERT INTO orders VALUES('4','3','2','44','2023-01-04','140','1');
INSERT INTO orders VALUES('5','1','5','55','2023-01-05','120','1');

Create table restaurants (
  restaurant_Id int(5) AUTO_INCREMENT,
  restaurant_Name varchar(25),
  restaurant_City varchar(25),
  restaurant_Type varchar(25),
  food_Id int(5),
  FOREIGN KEY (food_Id) REFERENCES food(food_Id),
  primary key(restaurant_Id));
  
 
INSERT INTO restaurants VALUES('1','Aaryas','Kochi','Veg','102');
INSERT INTO restaurants VALUES('2','Rameez','Trivandrum','Non veg','101');
INSERT INTO restaurants VALUES('3','Lunch box','Mavelikara','Non veg','103');
INSERT INTO restaurants VALUES('4','Cricket shacks','Alappuzha','Non veg','105');
INSERT INTO restaurants VALUES('5','Teracce','Kakanad','Non veg','104');
  
  Create table food (
  food_Id int(5) AUTO_INCREMENT,
  food_Name varchar(25),
  food_Price int(5),
  primary key(food_Id));
  
  INSERT INTO food VALUES('101','Biriyani','150');
INSERT INTO food VALUES('102','Meals','120');
INSERT INTO food VALUES('103','Porotta-Beef','100');
INSERT INTO food VALUES('104','Fried Rice','130');
INSERT INTO food VALUES('105','Appam-Egg','100');

Create table menu (
  menu_Id int(5) AUTO_INCREMENT,
  restaurant_Id int(5),
  menu_Name varchar(25) NOT NULL,
  menu_Price char(10) NOT NULL, 
primary key (menu_Id)
);

INSERT INTO menu VALUES('1','2','Biriyani','150');
INSERT INTO menu VALUES('2','1','Meals','120');
INSERT INTO menu VALUES('3','5','Porotta-Beef','100');
INSERT INTO menu VALUES('4','2','Fried Rice','130');
INSERT INTO menu VALUES('5','3','Appam-Egg','100');
INSERT INTO menu VALUES('6','4','Mandi','200');
INSERT INTO menu VALUES('7','1','Masala Dosa','90');
INSERT INTO menu VALUES('8','3','Kappa-fish curry','100');
INSERT INTO menu VALUES('9','5','Chappathi-chilly chicken','110');
INSERT INTO menu VALUES('10','1','Chappathi-Veg curry','100');


