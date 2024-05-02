insert into city (city) values ('Los Angeles'),('Riverside'),('Irvine'),('Tustin'),('Orange'),('San Bernardino'),('Corona');
insert into state (State) values ('CA'),('NY');select * from contactdetail;
insert into contactdetail(PhoneNUmber, Email, Address1, Address2, city_idcity, State_idState, ZipCode, Zip4) values
('111-222-3333', 'abc@gmail.com', '1 Main Street', 'Suite 200', 1, 1, '90024', null),
('213-222-3333', '2bc@vegas.com', '883 Reno St', 'Apt 123', 1, 1, '90028', null),
('213-333-3333', '3bc@church.com', '111 Harvest Rd', 'APT 200', 1, 1, '90036', null),
('714-444-3333', '4bc@orange.com', '1 Orange Way', null, 5, 1, '93124', null),
('714-555-3333', '5bc@flgiht.com', '1 Tustin Way', 'Suite 15', 4, 1, '93344', null),
('909-666-3333', '6bc@yahoo.com', '1 Hip Street', 'Suite 1102', 6, 1, '92884', null),
('213-777-3333', '7bc@hotmail.com', '2 Flight Way', 'Building B', 2, 1, '92024', null);
#INSERT INTO `customer` VALUES (1,'Ace Ventura',1),(2,'Ben Johnson',2),(3,'Charlie Goodie',3),(4,'David Kim',4),(5,'Eden Lost',5);
#INSERT INTO `bookings` VALUES (1,'2022-10-10',5,1),(2,'2022-11-12',3,3),(3,'2022-10-11',2,2),(4,'2022-10-13',2,1);
REPLACE INTO `menuitems` VALUES (1, 'Pizza', 'Breadstick', 'Yogurt'),
(2,	'Sphagetti', 'Dinner Roll','Gelato'),
(3,	'Burger', 'Fries','Shake'),
(4,	'RoastBeef Sandwich', 'AuJus','Cheesecake'),
(5,	'Hotdog', 'Saurkraut','Ice Cream'),
(6,	'Steak', 'Baked Potato','Flan');
#select * from `menuitems`;
REPLACE INTO `menu` VALUES (1, null, 'Pizza', 15.00, 'Italian')
,(2, null, 'Burger', 8.00, 'American')
,(3, null, 'Hotdog', 3.00, 'Gastro')
,(4, null, 'Steak', 25.00, 'Diner')
,(5, 2, 'Sphagetti Comboorders', 30, 'Italian');
#select * from menu;
REPLACE INTO orders values (1, 1, 1, '2024-05-01', 5, null)
,(2, 1, 5, '2024-05-01', 1, null)
,(3, 2, 2, '2024-05-02', 2, null)
,(4, 2, 3, '2024-05-02', 2, null)
,(5, 3, 4, '2024-05-01', 2, null)
,(6, 4, 5, '2024-05-03', 4, null)
,(7, 5, 1, '2024-05-01', 1, null);
select * from orders;