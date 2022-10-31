/*
  Nathan Nguyen
  CSC 355 Section 510
  Assignment 6
  March 11th, 2021
*/

-- 1
declare
	w1 WAGES.Wage1%type;
	w2 WAGES.Wage2%type;
	w3 WAGES.Wage3%type;
	
	eID EMPLOYEE.ID%type;
	eName EMPLOYEE.NAME%type;
	eType EMPLOYEE.TYPE%type;
	eHours EMPLOYEE.HOURS%type;
	ePay number;
	
	totalPay number := 0;
	
	cursor emplPtr is SELECT ID, NAME, TYPE, HOURS FROM EMPLOYEE;
begin
	SELECT Wage1, Wage2, Wage3
	INTO w1, w2, w3
	FROM WAGES;
	
	dbms_output.put_line( 'Rates: ' || w1 || ', ' || w2 || ', ' || w3 );
	dbms_output.put_line( '' );
	
	open emplPtr;
	
	loop
		fetch emplPtr into eID, eName, eType, eHours;
		if emplPtr%found then
			if eType = 1 then
				ePay := w1 * eHours;
			elsif eType = 2 then
				ePay := w2 * eHours;
			elsif eType = 3 then
				ePay := w3 * eHours;
			end if;
			
			totalPay := totalPay + ePay;
			
			dbms_output.put_line( eID || ' ' || eName || ' ' || ePay );
		else
			exit;
		end if;
	end loop;
	dbms_output.put_line( '' );
	dbms_output.put_line( 'Total pay: ' || totalPay );
	
	close emplPtr;
end;