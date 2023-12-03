create schema EECS4413Project;
use EECS4413Project;

create table products (
id int primary key, 
make varchar(255), 
model varchar(255), 
type varchar(255),
color varchar(255),
year int,
numDoors int,
price int, 
odometer int, 
image1 varchar(255), 
soldStatus int,
vehicleCondition varchar(4), 
onSale int, 
salePrice int,
accident varchar(3), 
vehicleHistoryReport varchar(255),
DateListed varchar(255),
DateSold varchar(255),
soldPrice int
);

create table reviews (
make varchar(255),
model varchar(255),
rating int,
comment varchar(255));

create table registeredUsers(
email varchar(255),
password varchar(255),
isAdmin varchar(255),
name varchar(255),
numVisits int);

-- Insert electric vehicle records
INSERT INTO products (id, make, model, type, color, year, numDoors, price, odometer, soldStatus, vehicleCondition, accident, DateListed, onSale, salePrice, vehicleHistoryReport, DateSold, soldPrice, image1)
VALUES
  (1, 'Tesla', 'Model 3', 'Sedan', 'Red', 2022, 4, 45000, 10000, 0, 'New', 'No', '2023-10-01', 0, null, null, null, null, 'https://shorturl.at/kmnS6'),
  (2, 'Nissan', 'Leaf', 'Sedan', 'Blue', 2021, 4, 32000, 20000, 1, 'Used', 'Yes', '2023-09-15', 0, null, 'https://orange-cacilia-15.tiiny.site/', '2023-10-16', 32000, 'https://shorturl.at/tuRV8'),
  (3, 'Chevrolet', 'Bolt', 'Sedan', 'Silver', 2022, 4, 42000, 15000, 0, 'New', 'No', '2023-10-03', 1, 39000, null, null, null, 'https://shorturl.at/lmO09'),
  (4, 'Ford', 'Mustang Mach-E', 'SUV', 'White', 2021, 4, 50000, 8000, 0, 'New', 'No', '2023-09-22', 0, null, null, null, null, 'https://shorturl.at/acioM'),
  (5, 'Kia', 'Soul EV', 'Sedan', 'Gray', 2023, 4, 38000, 1000, 0, 'New', 'No', '2023-10-10', 0, null, null, null, null, 'https://shorturl.at/yFW24'),
  (6, 'Volkswagen', 'ID.4', 'SUV', 'Black', 2022, 4, 46000, 13000, 0, 'Used', 'No', '2023-09-19', 1, 43000, null, null, null, 'https://shorturl.at/uwBC3'),
  (7, 'Hyundai', 'Kona Electric', 'Sedan', 'Blue', 2021, 4, 34000, 21000, 1, 'Used', 'Yes', '2023-09-05', 0, null, 'https://orange-cacilia-15.tiiny.site/', '2023-10-06', 34000, 'https://shorturl.at/oPVW5'),
  (8, 'Porsche', 'Taycan', 'Sedan', 'Silver', 2022, 4, 90000, 5000, 0, 'New', 'No', '2023-10-07', 0, null, null, null, null, 'https://shorturl.at/fgzCM'),
  (9, 'BMW', 'i3', 'Sedan', 'White', 2021, 4, 38000, 19000, 0, 'New', 'No', '2023-09-18', 0, null, null, null, null, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6zqhsiLRzxQEZHU8iyvquLfxCyvhR5B0QJg&usqp=CAU'),
  (10, 'Audi', 'e-tron', 'Sedan', 'Gray', 2022, 4, 65000, 7000, 0, 'New', 'No', '2023-10-12', 0, null, null, null, null, 'https://t.ly/dEjvS'),
  (11, 'Jaguar', 'I-PACE', 'Sedan', 'Black', 2021, 4, 56000, 12000, 0, 'Used', 'Yes', '2023-09-07', 1, 40000, 'https://orange-cacilia-15.tiiny.site/', null, null, 'https://t.ly/1JXiA'),
  (12, 'Mitsubishi', 'i-MiEV', 'Sedan', 'Blue', 2023, 4, 30000, 30000, 0, 'New', 'No', '2023-10-15', 0, null, null, null, null, 'https://t.ly/aADSP'),
  (13, 'Volvo', 'XC40 Recharge', 'SUV', 'Silver', 2022, 4, 52000, 6000, 1, 'Used', 'No', '2023-09-10', 0, null, null, '2023-09-28', 52000, 'https://t.ly/ioI7t'),
  (14, 'Mini', 'Cooper SE', 'Sedan', 'White', 2021, 4, 35000, 18000, 0, 'New', 'No', '2023-09-25', 0, null, null, null, null, 'https://shorturl.at/uLPZ5'),
  (15, 'Rivian', 'R1T', 'SUV', 'Gray', 2022, 4, 75000, 500, 0, 'New', 'No', '2023-10-19', 0, null, null, null, null, 'https://t.ly/RrVkR'),
  (16, 'Lucid', 'Air', 'Sedan', 'Black', 2021, 4, 88000, 9000, 0, 'Used', 'Yes', '2023-09-13', 1, 82000, 'https://orange-cacilia-15.tiiny.site/', null, null, 'https://t.ly/bU92E'),
  (17, 'Fisker', 'Ocean', 'SUV', 'Blue', 2023, 4, 44000, 200, 0, 'New', 'No', '2023-10-24', 0, null, null, null, null, 'https://t.ly/rgG7v'),
  (18, 'Canoo', 'MPDV', 'SUV', 'Silver', 2022, 4, 42000, 300, 0, 'New', 'No', '2023-09-29', 0, null, null, null, null, 'https://t.ly/Hq33F'),
  (19, 'NIO', 'ES6', 'SUV', 'White', 2021, 4, 58000, 5000, 1, 'Used', 'Yes', '2023-09-01', 0, null, 'https://orange-cacilia-15.tiiny.site/', '2023-11-05', 58000, 'https://t.ly/7V8hg');


insert into reviews values('Lamborghini','Huracan', 5, 'Amazing vehicle');
insert into reviews values('Honda','Civic', 4, 'Nice drive');
insert into reviews values('Tesla', 'Model 3', 5, 'Love it!');
insert into reviews values('Ford', 'F-150', 5, 'Does a great job');
insert into reviews values('Toyota', 'Camry', 5, 'Fuel efficient');

insert into registeredUsers values('abc@gmail.com', 'Abc123', 'False', 'Abc', 0);
insert into registeredUsers values('james@gmail.com', 'james123', 'False', 'james', 0);
insert into registeredUsers values('macy@gmail.com', 'macy123', 'False', 'macy', 0);
insert into registeredUsers values('jimmy@gmail.com', 'jimmy123', 'False', 'jimmy', 0);
insert into registeredUsers values('jack@gmail.com', 'jack123', 'False', 'jack', 0);
insert into registeredUsers values('Bob@gmail.com', 'bob123', 'True', 'Bob', 0);