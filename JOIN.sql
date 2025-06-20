--JOIN
--Lấy  thông tin khách hàng bao gồm: Mã khách hàng, Họ và tên khách hàng, địa chỉ, Email, Số điện thoại 
select cu.customer_id,
        cu.name,
        cu.address,
        co.email,
        co.phone
from customers as cu
inner join contacts as co
    on cu.customer_id = co.customer_id,
        
--Lấy thông tin chi tiết của sản phẩm bao gồm: Tên sản phẩm, Tên danh mục sản phẩm tương ứng (Chỉ lấy những sản phẩm có danh mục sản phẩm)
SELECT P1.PRODUCT_NAME,
        P2.CATEGORY_NAME,
FROM PRODUCTS AS P1
INNER JOIN PRODUCT_CATEGORY AS P2
    ON P1.CATEGORY_ID=P2.CATEGORY_ID

--Lấy thông tin nhân viên bao gồm: Mã nhân viên, họ và tên nhân viên, Mã nhân viên quản lý, họ và tên nhân viên quản lý

--Lấy thông tin của tất cả đơn hàng gồm các thông tin khách hàng: Mã đơn hàng, Ngày đặt hàng, Họ và tên khách hàng đặt, Địa chỉ khách hàng đã đặt  
SELECT O.ORDER_ID,
        O.ORDER_DATE,
        C.NAME,
        C.ADDRESS
FROM ORDERS AS O
INNER JOIN CUSTOMERS AS C
	ON O.CUSTOMER_ID=C.CUSTOMER_ID

--Lấy thông tin của tất cả đơn hàng gồm các thông tin nhân viên bán: Mã đơn hàng, Ngày đặt hàng, Họ và tên nhân viên bán, Email, Điện thoại (Chỉ lấy những đơn hàng có thông tin nhân viên bán) 
SELECT O.ORDER_ID,
        O.ORDER_DATE,
        E.FIRST_NAME || ' ' || LAST_NAME
        E.EMAIL,
        E.PHONE,
FROM ORDERS AS O
INNER JOIN EMPLOYEES AS E
	ON O.SALEMAN_ID=E.EMPLOYEE_ID

--Lấy thông tin sản  phẩm và tồn kho tương ứng bao gồm: Tên sản phẩm, Mã kho tồn, SL tồn (Chỉ lấy những sản phẩm có tồn kho (Có trong bảng tồn kho))
SELECT P.PRODUCT_NAME,
        I.WAREHOUSE_ID,
        I. QUANTITY,
FROM PRODUCT AS P
INNER JOIN  INVENTORIES AS I
    ON P.PRODUCT_ID=I.PRODUCT_ID


--LEFT JOIN
--Lấy thông tin chi tiết của sản phẩm bao gồm: Tên sản phẩm, Tên danh mục sản phẩm tương ứng (Lấy cả những sản phẩm không có danh mục sản phẩm)
SELECT PRODUCT_NAME,
        CATEGORY_NAME
FROM PRODUCTS AS P
LEFT OUTER JOIN PRODUCT_CATEGORIES AS PC
    ON P.PRODUCT_ID=PC.PRODUCT_ID

--Lấy thông tin của tất cả đơn hàng gồm các thông tin nhân viên bán: Mã đơn hàng, Ngày đặt hàng, Họ và tên nhân viên bán, Email, Điện thoại (Lấy cả những đơn hàng không có thông tin nhân viên bán) 
SELECT O.ORDER_ID,
        O.ORDER_DATE,
        E.CONCAT(‘FIRST_NAME’,’LAST_NAME’),
        E.EMAIL,
        E.PHONE
FROM ORDERS AS O
LEFT OUTER JOIN EMPLOYEES AS E
	ON O.SALEMAN_ID=E.EMPLOYEE_ID

--Lấy thông tin sản phẩm và tồn kho tương ứng bao gồm: Tên sản phẩm, Mã kho tồn, SL tồn (Lấy cả những sản phẩm không tồn kho (Không có trong bảng tồn kho))
--RIGHT JOIN
--Lấy thông tin chi tiết của sản phẩm bao gồm: Tên sản phẩm, Tên danh mục sản phẩm tương ứng (Lấy cả những danh mục sản phẩm không có tên sản phẩm)
--Lấy thông tin của tất cả đơn hàng gồm các thông tin nhân viên bán: Mã đơn hàng, Ngày đặt hàng, Họ và tên nhân viên bán, Email, Điện thoại (Lấy cả những nhân viên mà không có thông tin đơn bán hàng) 
--FULL JOIN
--Lấy thông tin tổng hợp những mã đơn hàng nào đã có thông tin nhân viên bán và mã đơn nào chưa có thông tin nhân viên bán (Mã đơn hàng, ngày đặt hàng, Họ và tên nhân viên bán)
--Lấy ra thông tin tổng hợp những sản phẩm chưa có tồn kho và những sản phẩm đã có tồn kho (Tên sản phẩm, Mã kho tồn, SL tồn)
--TỔNG HỢP
--Lấy thông tin của tất cả đơn hàng gồm các thông tin khách hàng: Mã đơn hàng, Ngày đặt hàng, Họ và tên khách hàng đặt, Địa chỉ khách hàng đã đặt của khách hàng có hạn mức tín dụng >= 500
--Lấy tất cả thông tin đơn hàng bao gồm: Mã đơn hàng, Ngày đặt hàng, Họ và Tên khách hàng, Địa chỉ khách hàng, Họ Và Tên Nhân viên bán, Số ĐT nhân viên bán, Tổng tiền đơn hàng với Đơn hàng có trạng thái = “Shipped” và Ngày đặt hàng kể từ ngày 20/1/2017
--Lấy thông tin của tất cả đơn hàng gồm các thông tin nhân viên bán: Mã đơn hàng, Ngày đặt hàng, Họ và tên nhn viên bán, Email, Điện thoại  với những nhân viên ký hợp đầu sau ngày 1/3/2016
--Lấy thông tin sản phẩm và tồn kho tương ứng bao gồm: Tên sản phẩm, Mã kho tồn, SL tồn với những sản phẩm có SL tồn kho >2

--BÀI TẬP VỀ NHÀ
--* Các thông tin chung cần lấy của khách hàng bao gồm:  Mã khách hàng, Họ và tên khách hàng, địa chỉ, Email, Số điện thoại
--
--Lấy  thông tin khách hàng có địa chỉ kết thúc = ‘MI’
SELECT C.CUSTOMER_ID,
                NAME,
                ADDRESS,
                EMAIL,
                PHONE
FROM CUSTOMERS C
JOIN CONTACTS CON
 	ON C.CUSTOMER_ID = CON.CUSTOMER_ID
WHERE ADDRESS LIKE '%MI'


--Lấy  thông tin khách hàng có hạn mức từ 500 đến 700 và có số điện thoại bắt đầu = ‘+39’
SELECT C.CUSTOMER_ID,
                NAME,
                ADDRESS,
                EMAIL,
                PHONE
FROM CUSTOMERS C
JOIN CONTACTS CON
 	ON C.CUSTOMER_ID = CON.CUSTOMER_ID
WHERE CON.PHONE LIKE '+39%'
  	AND C.CREDIT_LIMIT BETWEEN 500 AND 700
    
    
--Lấy ra top 10  thông tin khách hàng có hạn mức lớn nhất. Sắp xếp theo thứ tự giảm dần. (Hàm lấy Top: FETCH FIRST n ROWS ONLY (n: Số dòng muốn lấy))
SELECT C.CUSTOMER_ID,
                NAME,
                ADDRESS,
                EMAIL,
                PHONE
FROM CUSTOMERS C
JOIN CONTACTS CON
 	ON C.CUSTOMER_ID = CON.CUSTOMER_ID
ORDER BY C.CREDIT_LIMIT DESC
FETCH FIRST 10 ROWS ONLY


--Tính tổng doanh thu theo từng khách hàng 
SELECT C.CUSTOMER_ID,
                NAME,
                SUM(O.TOTAL) AS TONG
FROM CUSTOMERS C
JOIN ORDERS O
 	ON O.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID, NAME
ORDER BY SUM(O.TOTAL) DESC;


--Tìm ra khách hàng có tổng doanh thu lớn nhất trong năm 2017
SELECT C.CUSTOMER_ID,
   	            C.NAME,
               SUM(O.TOTAL) AS TONG
FROM CUSTOMERS C
 	JOIN ORDERS O
      	ON O.CUSTOMER_ID = C.CUSTOMER_ID
WHERE EXTRACT(YEAR FROM O.ORDER_DATE) = 2017
GROUP BY C.CUSTOMER_ID,NAME
ORDER BY TONG DESC
FETCH FIRST 1 ROWS ONLY


--Tìm ra khách hàng có tổng có doanh thu nhỏ nhất trong năm 2017
SELECT C.CUSTOMER_ID,
   	            C.NAME,
               SUM(O.TOTAL) AS TONG
FROM CUSTOMERS C
 	JOIN ORDERS O
      	ON O.CUSTOMER_ID = C.CUSTOMER_ID
WHERE EXTRACT(YEAR FROM O.ORDER_DATE) = 2017
GROUP BY C.CUSTOMER_ID,NAME
ORDER BY TONG ASC
FETCH FIRST 1 ROWS ONLY


--Lấy ra top 10  khách hàng có mức doanh thu trung bình của các đơn lớn nhất. Sắp xếp theo thứ tự tăng dần (Hàm lấy Top: FETCH FIRST n ROWS ONLY (n: Số dòng muốn lấy))
SELECT C.CUSTOMER_ID,
                C.NAME,
                AVG(O.TOTAL) AS TRUNG_BINH
FROM CUSTOMERS C
 	JOIN ORDERS O
      	ON O.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID,NAME
ORDER BY TRUNG_BINH ASC
FETCH FIRST 10 ROWS ONLY


--Tính tổng doanh thu theo từng khách hàng đối với những đơn hàng có trạng thái = ‘Shipped’ và ngày đặt hàng lớn hơn ngày 1/12017
SELECT C.CUSTOMER_ID,
               C.NAME,
               SUM(O.TOTAL) AS TONG
FROM CUSTOMERS C
JOIN ORDERS O
ON O.CUSTOMER_ID = C.CUSTOMER_ID
WHERE O.STATUS = 'Shipped'
  	AND O.ORDER_DATE > TO_DATE('2017/01/01','YYYY-MM-DD')
GROUP BY C.CUSTOMER_ID,NAME
ORDER BY TONG DESC


--Tính tổng doanh thu theo từng khách hàng (Làm tròn đến số thập phân thứ nhất) đối với những đơn hàng có trạng thái = ‘Pending’ và thời điểm đặt hàng từ năm 2015 đến năm 2017
SELECT C.CUSTOMER_ID,
               C.NAME,
               ROUND(SUM(O.TOTAL),1) AS TONG
FROM CUSTOMERS C
JOIN ORDERS O
ON O.CUSTOMER_ID = C.CUSTOMER_ID
WHERE O.STATUS = 'Pending'
  	AND EXTRACT(YEAR FROM O.ORDER_DATE)
          BETWEEN 2015 AND 2017
GROUP BY C.CUSTOMER_ID,NAME
ORDER BY TONG DESC


--Tính tổng doanh thu các đơn hàng đã mua của các khách hàng theo từng tháng, năm. Sắp xếp theo theo tên khách hàng, tháng, năm mua hàng
SELECT C.CUSTOMER_ID,
       C.NAME,
       EXTRACT(MONTH FROM O.ORDER_DATE) AS THANG,
       EXTRACT(YEAR FROM O.ORDER_DATE) AS NAM,
       SUM(O.TOTAL) AS TONG  	
FROM CUSTOMERS C
JOIN ORDERS O
ON O.CUSTOMER_ID = C.CUSTOMER_ID
WHERE O.STATUS = 'Shipped'
GROUP BY C.CUSTOMER_ID, C.NAME,
         EXTRACT(MONTH FROM O.ORDER_DATE),
         EXTRACT(YEAR FROM O.ORDER_DATE)
ORDER BY C.NAME,
         EXTRACT(MONTH FROM O.ORDER_DATE),
         EXTRACT(YEAR FROM O.ORDER_DATE)
         
         
--Tính tổng giá trị các đơn hàng đã hủy, đơn hủy lớn nhất, đơn hủy nhỏ nhất theo từng khách hàng,  theo từng năm. Sắp xếp theo theo tên khách hàng, năm mua hàng
SELECT C.NAME,
               EXTRACT(YEAR FROM O.ORDER_DATE) AS NAM,
               SUM(O.TOTAL) AS TONG,
               MIN(O.TOTAL) AS NN,
               MAX(O.TOTAL) AS LN
FROM CUSTOMERS C
JOIN ORDERS O
ON O.CUSTOMER_ID = C.CUSTOMER_ID
WHERE O.STATUS = 'Canceled'
GROUP BY C.NAME, EXTRACT(YEAR FROM O.ORDER_DATE)
ORDER BY C.NAME,  EXTRACT(YEAR FROM O.ORDER_DATE)