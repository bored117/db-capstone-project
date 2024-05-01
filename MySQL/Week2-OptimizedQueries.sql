DROP PROCEDURE IF EXISTS GetMaxQuantity;
CREATE Procedure GetMaxQuantity() select max(quantity) from orders;
call GetMaxQuantity();

prepare GetOrderDetail from 'select idOrders as OrderID, Quantity, menu.Price as Cost from orders inner join menu on orders.Menu_idMenu = menu.idMenu where Customer_idCustomer = ?';
set @id = 1;
execute GetOrderDetail using @id;

DROP PROCEDURE IF EXISTS CancelOrder;
DELIMITER //
CREATE Procedure CancelOrder(IN OrderID INT) 
BEGIN
	DELETE FROM Orders where idOrders = OrderID;
    SELECT concat("ORDER ", OrderID, " is cancelled") as Confirmation;
END //
DELIMITER ;   
call CancelOrder(5);