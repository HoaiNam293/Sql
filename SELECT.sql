--Công ty A đang  cần xây dựng báo cáo cho quý 1/2021. Sử dụng lệnh SQL để lấy ra các báo cáo sau:
--
--Lấy ra tất cả các sản phẩm mà công ty đang có
SELECT *
FROM products;

--Lấy ra tên của sản phẩm có ID sản phẩm (PRODUCT_ID) = 225
SELECT PRODUCT_ID 
FROM PRODUCTS
WHERE PRODUCT_ID = 225;

--Lấy ra tất cả các sản phẩm có chi phi định mức (STANDARD_COST) lớn hơn 300
SELECT *
FROM PRODUCTS
WHERE STANDARD_COST > 300;

--Lấy ra tất cả các sản phẩm có chi phi định mức (STANDARD_COST) khác 500
SELECT * 
FROM PRODUCTS
WHERE STANDARD_COST > 500 or STANDARD_COST < 500;

--Lấy ra tất cả các sản phẩm có giá niêm yết (LIST_PRICE) trong khoảng từ 300 tới 700
SELECT
    *
FROM PRODUCTS
WHERE LIST_PRICE BETWEEN 300 AND 700;

--Lấy ra tất cả các sản phẩm có tên là ‘G.Skill Trident Z’ và có chi phi định mức (STANDARD_COST) lớn hơn 500 
SELECT * 
FROM PRODUCTS
WHERE PRODUCT_NAME = 'G.Skill Trident ' and standard_cost > 500;

--Lấy ra tất cả các sản phẩm có tên là ‘Corsair Dominator Platinum’ và có chi phi định mức (STANDARD_COST) lớn hơn hoặc bằng  600 và giá niêm yết (LIST_PRICE) > 700
SELECT * 
FROM PRODUCTS
WHERE PRODUCT_NAME = ' CORSAIR DOMINATOR PLATINUM ' 
    AND STANDARD_COST >= 600
    AND LIST_PRICE > 700;
    
--Lấy ra tất cả các sản phẩm có mã sản phẩm có giá nhỏ hơn 500 
SELECT *
FROM PRODUCTS
WHERE PRODUCT_ID <500;

--Lấy ra các sản phẩm có tên sản phẩm có chứa từ khóa là ‘Kingston’
SELECT *
FROM PRODUCTS
WHERE PRODUCT_NAME LIKE ' %Kington%' ;

--Lấy ra các sản phẩm có tên bắt đầu bằng ‘G.Skill’ và giá niêm yết (LIST_PRICE) > 650
SELECT *
FROM PRODUCTS
WHERE PRODUCT_NAME LIKE 'G.Skill%' 
    AND LIST_PRICE > 650 ;
    
--Lấy ra các sản phẩm có tên kết thúc bằng ‘Series’ và có mô tả sản phẩm (DESCRIPTION) có chứa từ khóa là ‘128GB’
SELECT *
FROM PRODUCTS
WHERE PRODUCT_NAME LIKE '%Series' 
    AND DESCRIPTION LIKE '%128GB%' ;
    
--Lấy ra tất cả các sản phẩm bắt đầu bằng chữ ‘C’ và có 7 ký tự (Bao gồm cả chữ C) và giá niêm yết (LIST_PRICE) khác 700
SELECT
    *
FROM PRODUCTS
WHERE PRODUCT_NAME LIKE 'C______' 
    AND LIST_PRICE NOT = 700 ;
    
--Lấy ra tất cả các sản phẩm có giá niêm yết (LIST_PRICE) lần lượt là 2200, 1850, 1756, 1249
SELECT *
FROM PRODUCTS
WHERE LIST_PRICE IN ('2200 , 1850 , 1756 , 1249' );

--Tìm thông tin khách hàng có tên chứa "n" ở vị trí thứ 2 
SELECT *
FROM CUSTOMERS
WHERE NAME LIKE ‘_N%’

---- Sử dụng bảng ORDER
SELECT *
FROM ORDERS;
--Lấy ra tất cả những đơn hàng đã bán trong năm 2017
SELECT *
FROM ORDERS
WHERE EXTRACT(YEAR FROM ORDER_DATE )= '2017';
--Lấy ra tất cả những đơn hàng đã bán từ năm 2016 đến năm 2017	
SELECT *
FROM ORDERS

--Lấy tất cả những đơn hàng có ngày đăt hàng (ORDER_DATE) lớn hơn ngày ‘2017-02-17’
--Lấy tất cả những đơn hàng có ngày đăt hàng (ORDER_DATE) là ngày ‘2017-02-17’ và trạng thái đơn hàng (STATUS) là ‘Shipped’
--
--
--Lấy tất cả những đơn hàng có ngày đăt hàng (ORDER_DATE) là ngày ‘2017-02-17’ sắp xếp theo tổng tiền hàng (TOTAL) theo thứ tự tăng dần 
--Lấy tất cả những đơn hàng có ngày đăt hàng (ORDER_DATE) khác ngày ‘2017-08-15’ sắp xếp theo tổng tiền hàng (TOTAL) theo thứ tự giảm dần 
--Lấy tất cả những đơn hàng mà có trạng thái đơn hàng (STATUS)  là ‘Pending’ và ‘Shipped’ và có tổng tiền hàng (TOTAL) lớn hơn 400000. Sắp xếp theo thứ tự tăng dần của ngày đặt hàng (ORDER_DATE).
