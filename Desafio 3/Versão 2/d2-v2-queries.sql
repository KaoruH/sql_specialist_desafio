select * 
from productSeller;

select * 
from clients;

select * 
from product;

select count(*) 
from clients;

select * 
from product 
where "avaliação" > 3;


select SUM(quantity) as TotalQuantity 
from productStorage;

select * 
from clients c, orders o 
where c.idClient = idOrderClient;

select * 
from clients 
where CPF like '12%';

select Fname,Lname, idOrder, orderStatus 
from clients c, orders o 
where c.idClient = idOrderClient;

select concat(Fname,' ',Lname) as Client, idOrder as Request, orderStatus as Status 
from clients c, orders o 
where c.idClient = idOrderClient;

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values 
(2, default,'compra via aplicativo',null,1);
                             
select count(*) from clients c, orders o 
where c.idClient = idOrderClient;

select * from clients c 
inner join orders o ON c.idClient = o.idOrderClient
inner join productOrder p on p.idPOorder = o.idOrder
group by idClient; 
        
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
inner join orders o ON c.idClient = o.idOrderClient
group by idClient; 

select category, AVG(avaliação) as AverageRating 
from product 
group by category 
having AVG(avaliação) > 4;

select P.Pname, S.SocialName
from productSupplier PS
inner join product P on P.idProduct = PS.idPsProduct
inner join supplier S on S.idSupplier = PS.idPsSupplier;

select O.idOrder, C.Fname, C.Lname, P.Pname
from orders O
inner join clients C on C.idClient = O.idOrderClient
inner join productOrder PO on PO.idPOorder = O.idOrder
inner join product P on P.idProduct = PO.idPOproduct;






