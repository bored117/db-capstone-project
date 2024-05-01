/* Task 1 */
insert into bookings (idBookings, Date, TableNumber, Customer_idCustomer) values
	(1,'2022-10-10',5,1),
	(2,'2022-11-12',3,3),
	(3,'2022-10-11',2,2),
    (4,'2022-10-13',2,1);
select * from bookings;

/* Task 2 */
drop procedure IF EXISTS CheckBooking;
DELIMiTER //
create procedure CheckBooking(IN BookDate DATE, IN TableNo INT)
BEGIN
    select case isnull(TableNumber) when false then concat('Table ', TableNumber, ' is already booked') end as "Booking Status" from bookings where Date = BookDate and TableNumber = TableNo;
END
//
DELIMITER ;
call CheckBooking('2022-11-12',3);

call CheckBooking('2022-11-12', 3) into @res;
    select @res;
    
/* Task 3 */
drop procedure IF EXISTS AddValidBooking;
DELIMiTER //
create procedure AddValidBooking(IN BookDate DATE, IN TableNo INT)
BEGIN
	DECLARE OPENSLOT BOOL DEFAULT TRUE;
    start transaction;
		SELECT isnull(TableNumber) into OPENSLOT FROM bookings where DATE = BookDate and TableNumber = TableNo;
		INSERT INTO bookings (Date, TableNumber, Customer_idCustomer) values ( BookDate, TableNo, 1);
		select case OPENSLOT when TRUE then concat('Table ', TableNo, ' is booked')
			else concat('Table ', TableNo, ' is already booked - booking cancelled')
            end as "Booking Status";
		if OPENSLOT then
			commit;
		else
			rollback;
		end if;
END//
DELIMITER ;
caLL AddValidBooking('2022-10-10',5);
