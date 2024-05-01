select idCustomer as CustomerID, Name as FullName from customer;

select orders.idOrders as OrderID, menu.Price, orders.Quantity as Cost  from orders inner join menu on orders.Menu_idMenu = menu.idMenu;

select customer.idCustomer as CustomerID, customer.Name as FullName, orders.idOrders as OrderID, menu.Price as Cost, menu.MenuName, menuitems.CourseName
from customer inner join orders on customer.idCustomer = orders.Customer_idCustomer inner join menu on orders.Menu_idMenu = menu.idMenu inner join menuitems on MenuItems_idMenuItems = menu.MenuItems_idMenuItems
where menu.Price > 150;
select Menu_idMenu from orders group by Menu_idMenu having count(idOrders) > 2;

select MenuName from menu where idMenu = ANY (select Menu_idMenu from orders group by Menu_idMenu having count(idOrders) > 2);
