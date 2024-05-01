/* Task 1 */
drop procedure IF EXISTS AddBooking;
DELIMiTER //
create procedure AddBooking(IN BookingID INT, IN CustomerID INT, IN TableNo INT, IN BookDate DATE)
BEGIN
	INSERT INTO bookings (idBookings, TableNumber, Customer_idCustomer, Date) values (BookingID, TableNo, CustomerID, BookDate);
END//
DELIMITER ;

caLL AddBooking(9,3,4, '2022-12-30');

/* Task 2 */
drop procedure IF EXISTS UpdateBooking;
DELIMiTER //
create procedure UpdateBooking (IN BookingID INT, IN BookDate DATE)
BEGIN
	UPDATE bookings set DATE = BookDate where idBookings = BookingID;
END//
DELIMITER ;

call UpdateBooking(9,"2022-12-17");

/* Task 3 */
drop procedure IF EXISTS CancelBooking;
DELIMiTER //
create procedure CancelBooking (IN BookingID INT)
BEGIN
	DELETE FROM bookings where idBookings = BookingID;
END//
DELIMITER ;

call CancelBooking(9);