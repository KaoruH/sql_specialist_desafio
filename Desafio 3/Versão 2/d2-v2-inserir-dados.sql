use ecommerce;

insert into Clients (Fname, Minit, Lname, CPF, Address)
values('Harry','J','Potter', 12346789, '4 Privet Drive, Little Whinging'),
('Hermione','J','Granger', 987654321,'12 Grimmauld Place, London'),
('Ron','B','Weasley', 45678913,'The Burrow, Ottery St. Catchpole'),
('Draco','L','Malfoy', 789123456,'Malfoy Manor, Wiltshire'),
('Luna','L','Lovegood', 98745631,'The Lovegood House, Ottery St. Catchpole'),
('Neville','L','Longbottom', 654789123,'The Longbottom House, Yorkshire');

             
insert into product (Pname, classification_kids, category, avaliação, size) values
('Vassoura Firebolt',true,'Brinquedos','4',null),
('Vestes de Hogwarts',true,'Vestimenta','5',null),
('Varinha Mágica',false,'Eletrônico','4',null),
('Colar de Diamante da Grifinória',False,'Acessórios','3',null),
('Cama de Dossel',False,'Móveis','3','2x90x200'),
('Sapo de Chocolate',False,'Alimentos','2',null),
('Mapa do Maroto',False,'Eletrônico','3',null);


insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values 
(1, default,'compra via aplicativo',null,1),
(2,default,'compra via aplicativo',50,0),
(3,'Confirmado',null,null,1),
(4,default,'compra via web site',150,0),
(2, default, 'compra via web site', 95, 1),
(4, 'Confirmado', 'compra via web site', 235, 0);


insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
(1,5,2,null),
(2,5,1,null),
(3,6,1,null);

insert into productStorage (storageLocation,quantity) values
('Diagon Alley',1000),
('Diagon Alley',500),
('Hogsmeade',10),
('Hogsmeade',100),
('Hogsmeade',10),
('Knockturn Alley',60);


insert into storageLocation (idLproduct, idLstorage, location) values
(1,2,'DA'),
(2,6,'KA');


insert into supplier (SocialName, CNPJ, contact) values
("Ollivander's", 123456789123456,'21985474'),
("Weasleys' Wizard Wheezes",854519649143457,'21985484'),
("Madam Malkin's Robes for All Occasions", 934567893934695,'21975474');


insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
(1,1,500),
(1,2,400),
(2,4,633),
(3,3,5),
(2,5,10);
                         
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
('Slug & Jiggers Apothecary', null, 123456789456321, null, 'London', 219946287),
("Madam Malkin's Robes for All Occasions",null,null,123456783,'Hogsmeade', 219567895),
("Zonko's Joke Shop",null,456789123654485,null,'Hogsmeade', 1198657484);

insert into productSeller (idPseller, idPproduct, prodQuantity) values 
(1,6,80),
(2,7,10);

