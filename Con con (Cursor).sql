SET SERVEROUTPUT ON
Declare
    type t_temp_storage is table of employee%rowtype;
    my_temp_storage t_temp_storage;

Begin
    select * bulk collect
    into my_temp_storage
    from employee;
    dbms_output.put_line(' ID là : ' || my_temp_storage(1).emp_id );
End;



--Kiểm tra số dư tài khoản của khách hàng có  ID = 1.
--Nếu số dư tài khoản > 1000$ thì in ra thông báo “Số dự hiện tại của bạn hiện đang lớn hơn 1000$”, ngược lại in ra thông báo “Số dư hiện tại của bạn không đạt 1000$” (bảng ACCOUNT). 
SET SERVEROUTPUT ON
DECLARE
    v_total_balance number;
Begin
    select sum(avail_balance) 
    into v_total_balance
    from account
    where cust_id = 1;
    if v_total_balance > 1000 then 
        dbmn_output.put_line(' so du hien tai lon hon 1000$');
    else
        dbms_output.put_line('so du hien tai cua ban kh dạt 1000$');
    end if ;
End;


--ID: Mã_phòng ban – Tên_phòng ban ”. (Bảng Department)

set serveroutput on;
declare

begin
    for c in ( select dept_id,
                        name
                from department
                )
    loop
        dbms_output.put_line ( ' các phòng ban gồm : ' ||c.dept_id || ' ' ||c.name);
    end loop;
end;


--lấy ra các thông tin: Amount của 10 ngày gần nhất của tất cả các giao dịch tính từ ngày 25-01-2004 (25-01-2004, 26-01-2004, 27-01-2004…..) . (Bảng Acc_transaction )
set serveroutput on
declare 

begin
    for 1 in 0..9
    loop
        begin 
            
        
--lấy ra các thông tin: Amount  của tất cả các giao dịch tính 
--từ ngày 24-01-2004 cho đến ngày 28-02-2014 .(Bảng Acc_transaction )
set serveroutput on
declare
    l_start_date DATE := DATE'2004-01-25';
    l_end_date DATE := DATE'2004-02-28';
    l_amount	NUMBER; 
    vDate date;
    v_run BOOLEAN := TRUE;
BEGIN 
  WHILE v_run
  LOOP 
  	begin         	
        	l_start_date := l_start_date + 1;
        	SELECT amount 
        	INTO l_amount 
        	FROM acc_transaction 
        	WHERE rownum =1 and
        	txn_date = l_start_date; 
        	dbms_output.put_line('Số dư cho ngày: ' || TO_CHAR(l_start_date,'DD-MM-YYYY') || ': ' || l_amount);
       	
    	exception
      	when no_data_found then
        	Dbms_Output.Put_Line('Không có dữ liệu cho ngày: ' || TO_CHAR(l_start_date,'DD-MM-YYYY'));
    	
    	end;
    	IF l_start_date = l_end_date
    	THEN
         	v_run := FALSE;
    	END IF;
  END LOOP; 
END; 


-------------- CURSOR ---------------------
--lấy các thông tin: 
--Mã sản phẩm (product_cd), Tên gói sản phẩm (name)  mà ngân hàng đang cung cấp(bảng Product). 

set serveroutput on;
declare
    cursor c1 is
            select product_cd,
                    name
            from product
            order by product_cd;
begin
    for v_c1 in c1
    loop
        dbms_output.put_line('Ma san pham : '|| v_c1.product_cd || ' '||v_c1.name);
        
    end loop;
end;
--lấy ra thông tin gồm 
--Mã Khách hàng và tên sản phẩm mà KH đó sử đụng, lấy từ bảng Account và Product (account join Product on account .Product_CD = Product.Product_CD)

Và hiện thị kết quả ra màn hình  “Cust_ID,Product Name” bằng lệnh: dbms_output.put_line() 
    
set serveroutput on;
declare
    cursor c1 is
            select cust_id ,
                    name
            from account
            join product
                on account.Product_CD = Product.Product_CD
            order by cust_id;
    v_c1 c1%rowtype;
begin
    open c1;
    loop
        fetch c1 into v_c1;
            dbms_output.put_line('cust id : ' ||v_c1.cust_id || '-product name :'|| v_c1.name );
            
        exit when c1%notfound;
    end loop;
    close c1;
end;


/*Lấy ra báo cáo bao gồm: Mã nhân viên, họ và tên nhân viên, ngày băt đầu vào làm và số tiền thưởng đạt được theo kinh nghiệm làm việc
Số tiền thưởng được tính theo CT sau: 
+ Thời gian làm việc = Số tháng của Ngày hiện tại so với ngày bắt đầu vào làm / 12
+ Nếu thời gian làm việc > 13: Tiền thưởng = 8000
+ Nếu thời gian làm việc > 11: Tiền thưởng = 5000
+ Nếu thời gian làm việc > 9: Tiền thưởng = 3000
+ Nếu thời gian làm việc > 7: Tiền thưởng = 2000
+ Nếu thời gian làm việc > 4: Tiền thưởng = 1000
Hiện thị ra màn hình bằng lệnh: dbms_output.put_line() */

set serveroutput on;

DECLARE
   CURSOR c
   IS
    SELECT * FROM employee;

   TYPE any_table_type IS TABLE OF employee%ROWTYPE
                             INDEX BY BINARY_INTEGER;

   emp_rec   any_table_type;
   inctv_amount  NUMBER;
   work_exp      NUMBER;
BEGIN
   OPEN c;
   FETCH c
   BULK COLLECT INTO emp_rec;
   CLOSE c;
   FOR i IN emp_rec.FIRST .. emp_rec.LAST 
   LOOP
          work_exp := Round(( Months_between(SYSDATE, emp_rec(i).START_DATE) / 12 ));

       IF work_exp > 13 THEN
          inctv_amount := 8000;
        ELSIF work_exp > 11 THEN
          inctv_amount := 5000;
        ELSIF work_exp > 9 THEN
          inctv_amount := 3000;
        ELSIF work_exp > 7 THEN
          inctv_amount := 2000;
        ELSIF work_exp > 4 THEN
          inctv_amount := 1000;
        ELSIF work_exp > 0 THEN
          inctv_amount := 400;
        END IF;
        dbms_output.Put_line(Rpad(emp_rec(i).emp_id, 15)
                             ||Rpad(( emp_rec(i).first_name
                                      ||' '
                                      ||emp_rec(i).last_name ), 30)
                             ||Rpad(emp_rec(i).START_DATE, 15)
                             || To_char(inctv_amount, '9,999'));
                         
    END LOOP;
END;