--—————- PACKAGE—————————–
--
--Viết 1 Package thực hiện yêu cầu sau:
--–  1 Con trỏ trả về chi tiết tài khoản theo ID khách hàng truyền vào bao gồm các thông tin sau: 
--Mã khách hàng, Địa chỉ khách hàng, ID tài khoản, Số dư, Trạng thái
--–  1 Hàm cho phép truyền vào: ID khách hàng. Trả về Tổng số dư theo khách hàng
--–  1 Hàm cho phép truyền vào: ID nhân viên mở + Năm mở tài khoản. Trả về Tổng số dư theo nhân viên mở tài khoản 
--Gọi con trỏ, Hàm thông qua package vừa tạo

CREATE OR REPLACE PACKAGE customer_transaction 
as
    cursor cust_acc(v_cust_id customer.cust_id number) is
        select c.cust_id ,
                c.address,
                a.account_id,
                sum(avail_balance) tong_so_du,
                a.status
        from account a , customer c
        where a.cust_id = c.cust_id
            and a.cust_id = 3
        group by c.cust_id,c.address,a.account_id,a.status;
    
    function cust_bal(v_cusid customer.cust_id%type) 
    return float;
    function ybal_by_emp (v_emp employee.emp_id%type, 
                            v_year int) 
    return float;
    
end customer_transaction;

create or replace package body customer_transaction 
is
    function cust_bal(v_cusid customer.cust_id%type) 
    return float
    is v_bal float;
    begin
        select sum(avail_balance) so_du
        into v_bal
        from account
        where cust_id = v_cusid
        
        return v_bal;
        exception
            when no_data_found then
                dbms_output.put_line('no_data_found');
    end cust_bal;
    
    function ybal_by_emp (v_emp employee.emp_id%type, v_year int) 
    return float
    is v_tot_bal int;
    begin
        select sum(avail_balance)
        into v_tot_bal
        from account
        where open_emp_id = 3
        and extract(year from open_date) = v_year;
        return v_tot_bal;
        exception
            when no_data_found then
            dbms_output.put_line('NO DATA FOUND');
    end ybal_by_emp;

end customer_transaction;

select customer_transaction.cust_acc(10)
from dual;
select customer_transaction.cust_bal(3)
from dual;
select customer_transaction.ybal_by_emp(10,2003)
from dual;

set serveroutput on;
declare
    p_cust_id number;
    p_address varchar2(100);
    p_account_id number;
    p_tot_bal number;
    p_status varchar2(100);
begin
    open customer_transaction.cust_acc(10);
    loop
        fetch customer_transaction.cust_acc 
        into p_cust_id , p_address ,p_account_id,p_tot_bal,p_status;
        dbms_output.put_line(' Cust_id= ' || p_cust_id);
        EXIT WHEN  cust_pak.cust_inf%NOTFOUND;
    end loop;
    close customer_transaction.cust_acc;
end;
                

