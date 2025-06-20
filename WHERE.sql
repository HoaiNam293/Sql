--Lấy ra tất cả thông tin của các khách hàng. (Yêu cầu: Chuyển đổi Tên của khách hàng thành chữ Hoa, địa chỉ thành chữ thường)
SELECT CUSTOMER_ID,
        UPPER(NAME) AS TEN 
        LOWER(ADDRESS) AS DIACHI 
        WEBSITE
        CREDIT_LIMIT
FROM CUSTOMERS ;
--Tính tổng giá trị, giá trị lớn nhất, giá trị nhỏ nhất, giá trị trung bình các đơn hàng
SELECT SUM(TOTAL) AS TONG 
        MIX ( TOTAL) ,
        MIN ( TOTAL ) ,
        AVG(TOTAL)
FROM ORDERS ;        
--Tính giá trị trung bình của tất cả các đơn hàng được bán ra trong năm 2016 
SELECT AVG(TOTAL)
FROM ORDERS
WHERE EXTRACT(YEAR FROM ORDER_DATE) = 2016;
--Tính tổng doanh thu bán hàng từ năm 2016 đến năm 2017
SELECT SUM(TOTAL) AS TONG_DOANH_THU
FROM ORDERS
WHERE EXTRACT (YEAR FROM ORDER_DATE) BETWEEN 2016 AND 2017;
--Tính tổng giá trị, giá trị lớn nhất, giá trị nhỏ nhất, giá trị trung bình các đơn hàng có status = “Pending”
SELECT SUM(TOTAL) AS TONG_GIA_TRI
        MAX(TOTAL) AS GIA_TRI_LON_NHAT
        MIN(TOTAL) AS GIA_TRI_NHO_NHAT
        AVG(TOTAL) AS GIA_TRI_TRUNG_BÌNH
FROM ORDERS
WHERE STATUS = 'PENDING';
--Tính tổng giá trị, giá trị lớn nhất, giá trị nhỏ nhất, giá trị trung bình các đơn hàng có status = “Shipped” và ngày order >= 1/1/2017
SELECT SUM(TOTAL) AS TONG_GIA_TRI
        MAX(TOTAL) AS GIA_TRI_LON_NHAT
        MIN(TOTAL) AS GIA_TRI_NHO_NHAT
        AVG(TOTAL) AS GIA_TRI_TRUNG_BÌNH
FROM ORDERS
WHERE STATUS = 'SHIPPED'
        AND ORDER_DATE >= TO_DATE('01/01/2017' , 'DD/MM/YYYY');
        
--Tính tổng giá trị (Làm tròn đến số thập phân thứ nhất), giá trị lớn nhất, giá trị nhỏ nhất, giá trị trung bình của các đơn hàng có status = “Shipped” và ngày order >= 1
SELECT ROUND (SUM(TOTAL),1) AS TONG_GIA_TRI
        MAX(TOTAL) AS GIA_TRI_LON_NHAT
        MIN(TOTAL) AS GIA_TRI_NHO_NHAT
        AVG(TOTAL) AS GIA_TRI_TRUNG_BÌNH
FROM ORDERS
WHERE STATUS = 'SHIPPED'
        AND ORDER_DATE >= TO_DATE('01/01/2017' , 'DD/MM/YYYY');
--Lấy ra Mã các khách hàng có trên 4 lần mua hàng thành công (status = “Shipped”). 
SELECT CUSTOMER_ID
        COUNT(ORDER_ID) AS SL
FROM ORDERS
WHERE STATUS = 'SHIPPED'
GROUP BY CUSTOMER_ID
HAVING COUNT(ORDER_ID) >4;
--Lấy ra Mã các khách hàng có tổng số đơn mua hàng trong năm 2017 lớn hơn 2 đơn
SELECT CUSTOMER_ID
        COUNT(ORDER_ID) AS SL
WHERE EXTRACT(YEAR FROM ORDER_DATE) = 2017
GROUP BY CUSTOMER_ID
HAVING COUNT (ORDER_ID) >2;
--Lấy ra tổng giá bán (list_price), giá trị bán lớn nhất, giá trị bán nhỏ nhất, giá trị bán trung bình theo từng ID danh mục sản phẩm (category_id)
SELECT CATEGORY_ID
        SUM(LIST_PRICE)
        MAX(LIST_PRICE)
        MIN(LIST_PRICE)
        AVG(LIST_PRICE)
FROM PRODUCTS
GROUP BY CATEGORY_ID;
--Tính tổng doanh thu theo từng tháng trong năm 2017
SELECT EXTRACT(MONTH FROM ORDER_DATE)AS THANG
        SUM(TOTAL) AS TONG
FROM ORDERS
WHERE EXTRACT (YEAR FROM ORDER_DATE) = 2017
GROUP BY EXTRACT(MONTH FROM ORDER_DATE)
ORDER BY THANG;
--Tính tổng doanh thu theo từng tháng, từng năm tương ứng. Tính từ năm 2016 đến năm 2017
SELECT EXTRACT(MONTH FROM ORDER_DATE) AS THANG
        EXTRACT(YEAR FROM ORDER_DATE) AS NAM
        SUM(TOTAL) AS TONG
FROM ORDERS
WHERE EXTRACT(YEAR FROM ORDER_DATE) BETWEEN 2016 AND 2017
GROUP BY EXTRACT(MONTH FROM ORDER_DATE), 
        EXTRACT(YEAR FROM ORDER_DATE) 
ORDER BY THANG,NAM
--Tìm ra Top 3 khách hàng có doanh thu cao nhất trong năm 2017 (Sắp xếp theo thứ tự giảm dần) Gợi ý: (Hàm lấy Top: FETCH FIRST n ROWS ONLY (n: Số dòng muốn lấy))
SELECT CUSTOMER_ID
        SUM(TOTAL) AS TONG 
FROM ORDERS
WHERE EXTRACT (YEAR FROM ORDER_DATE) = 2017 
GROUP BY CUSTOMER_ID
ORDER BY TONG DESC
FETCH FIRST 3 ROWS ONLY ;
--Tìm ra Top 3 sản phẩm có tổng số lượng bán ra thấp nhất
SELECT ORDER_ID
        SUM(QUANTITY) AS SL
FROM ORDER_ITEMS
GROUP BY ORDER_ID
ORDER BY SL
FETCH FIRST 3 ROWS ONLY ;

--Lấy ra tất cả những sản phẩm mà công ty đang bán (Chuẩn hóa lại tên sản phẩm: Chuyển đổi tất cả các ký tự đầu của mỗi từ sang hoa, các ký tự còn lại sang chữ thường ). (Gợi ý: Sử dụng hàm INITCAP()) io
--Lấy ra tất cả các sản phẩm bao gồm: Tên sản phẩm, mô tả (Xóa tất cả ký tự ‘Speed:’ nằm bên trái) của sản phẩm có mô tả sản phẩm (description) bắt đầu bằng ‘Speed’  (Gợi ý: Dùng Hàm LTRIM()) Ví dụ: Speed:DDR4-3600,Type:288-pin DIMM,CAS:17Module:4x16GBSize:64GB → DDR4-3600,Type:288-pin DIMM,CAS:17Module:4x16GBSize:64GB
--Lấy ra tất cả các sản phẩm bao gồm: Tên sản phẩm, Hãng (Cột này được lấy bằng cách Cắt lấy 5 ký tự đầu của tên sản phẩm) của sản phẩm bắt đầu ‘Intel’ (Gợi ý: Dùng Hàm SUBSTR()) Ví dụ: Intel Xeon E5-2687W → Intel
--Lấy ra tất cả thông tin sản phẩm có độ dài ký tự của tên sản phẩm < 12 ký tự (Gợi ý: Dùng Hàm LENGTH())
--Lấy ra báo cáo tổng giá trị đơn hàng đã mua (status = “Shipped”) của các khách hàng theo từng năm, Sắp xếp theo thứ tự mã khách hàng, năm mua hàng. (Gợi ý sử dụng hàm: EXTRACT())
--Lấy ra báo cáo tổng giá trị đơn hàng chưa giao(status = “Pending”) của các khách hàng trong vòng 3 tháng trước tính từ ngày ‘2017/03/14′ , Sắp xếp theo mã khách hàng, tổng giá trị đơn chưa giao.  (Gợi ý sử dụng hàm: ADD_MONTHS ())
--Lấy ra báo cáo tổng giá trị các đơn hàng đã hủy (status = “Canceled”), đơn hủy lớn nhất, đơn hủy nhỏ nhất theo từng mã nhân viên bán (Saleman_id) theo từng tháng và từng năm (Gợi ý sử dụnga hàm: EXTRACT())