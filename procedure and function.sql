--CREATE OR REPLACE FUNCTION namtt_concat (n1 IN Nvarchar2,n2 IN Nvarchar2)
--RETURN Nvarchar2 IS n3 Nvarchar2(20);
--BEGIN
--
--    n3 := n1 || ' ' || n2;
--    RETURN n3;
--END;
--
--SELECT namtt_concat('xin','chao') as data
--from dual;
--
--create or replace procedure nam_pro(n1 in nvarchar2 , n2 out nvarchar2)
--is
--begin
--    n2 := 'hello' ||n1' ;
--end;
--
--set serveroutput on;
--declare 
--    data nvarchar2(100);
--begin
--    nam_pro('world',data);
--    dbms_output.put_line(data);
--end;

—————- FUNCTION—————————–

--Viết 1 Function với tham số đầu vào là NĂM cần lấy dữ liệu.
--Tính tổng số dư tài khoản (ACCOUNT) của tất cả khách hàng có Năm mở tài khoản bằng NĂM truyền vào

CREATE OR REPLACE FUNCTION get_total_acc(
    in_year PLS_INTEGER
) 
RETURN account.avail_balance%type
IS
v_relt account.avail_balance%type;
BEGIN
    -- get total sales
    select sum(avail_balance) into v_relt
    from account
    where extract(year from open_date) = y;
    RETURN v_relt;    
END;

select get_total_acc(2023)
from dual;

-- Viết 1 Function với tham số đầu vào là ID của khách hàng. 
--Lấy ra Tống số TK đã mở của khách hàng có ID = ID truyền vào

CREATE OR REPLACE FUNCTION tong_acc(cusid in account.custid%type)
return number ;
is v_tong_acc number;
begin
    select sum(cust_id) as tai_khoan
    into v_tong_acc
    from account acc
    where acc.cust_id = cusid
    return v_tong_acc;
end tong_acc;

--Viết 1 Function với tham số đầu vào là ID nhân viên. 
--Thực hiện Tính số năm đã làm việc của nhân viên đó theo công thức sau: work_exp  = Số tháng của Ngày hiện tại so với ngày bắt đầu vào làm / 12
--Thực hiện truy vấn lấy ra thông tin của nhân viên bao gồm: Họ, Tên, Ngày bắt đầu làm việc, số tháng đã làm việc (Gọi đến Function trên)

create or replace function work_exp(id in employee.emp_id%type)
return int;
is v_exp int;
begin
    select round(months_between(sysdate,start_date)/12,0) 
    into v_exp
    from employees emp
    where emp.emp_id = id;
    return v_exp;
end work_exp;

--Viết Function “FUNC_Get_Emp_Department” với tham số đầu vào là mã nhân viên EMP_ID và trả về tên phòng ban mà nhân viên đó làm việc (Dept_Name).
--+ Yêu cầu 1: Truyền vào ID là 1 và hiện thị kết quả ra màn hình “Get_Emp_Department(1)”;
--+ Yêu cầu 2: Viết lệnh SELECT để lấy ra toàn bộ EMP_ID, First_Name, Last_Name và tên phòng ban sử dụng Function “FUNC_Get_Emp_Department”.

create or replace function get_emp_department (v_emp_id in employees.emp_id%type)
return varchar2;
is v_department department.name%type;
begin
    select emp.first_name
    into v_department
    from employees emp , department d
    where 
        1 = 1,
        and emp.dept_id = d.dept_id,
        and emp.emp_id = v_emp_id;
    return v_department;
end get_emp_department;
 

———– PROCEDURE————————

--
-- Viết  1 procedure không có tham số. Trả về tất cả thông tin của các nhân viên bao gồm: Họ, Tên, Phòng ban, Ngày vào làm

create or replace procedure emp_info
as
    cursor c1 is
        select emp.first_name , emp.last_name , d.name , emp.start_date
        from employees emp 
        join department d
            on emp.emp_id = d.dept_id;
        
        v_first_name employees.first_name%type;
        v_last_name employees.last_name%type;
        v_name department.name%type;
        v_start_date emp.start_date;
begin
    open c1;
    loop
        fetch c1 into v_first_name,v_last_name,v_name,v_start_date
        exit when c1%notfound;
        dbms_output.put_line(first_name || last_name || name || start_date);
    end loop;
    close c1;
end;

set serveroutput on;
EXECUTE emp_info;
    
--


    