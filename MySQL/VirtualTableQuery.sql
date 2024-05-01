CREATE OR REPLACE VIEW OrdersView as 
select idOrders as OrderID, Quantity, price as Cost from orders inner join menu on orders.Menu_idMenu = Menu_idMenu;

select * from OrdersView