alter session set NLS_DATE_FORMAT='DD/MM/YYYY';

drop table ODI_SALES_DEV.NAMDH_TRG_COUNTRY;
drop table ODI_SALES_DEV.NAMDH_TRG_REGION;
drop table ODI_SALES_DEV.NAMDH_TRG_CITY;
drop table ODI_SALES_DEV.NAMDH_TRG_CUSTOMER;
drop table ODI_SALES_DEV.NAMDH_TRG_PROD_FAMILY;
drop table ODI_SALES_DEV.NAMDH_TRG_PRODUCT;
drop table ODI_SALES_DEV.NAMDH_TRG_SALES;
drop table ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER;

create table ODI_SALES_DEV.NAMDH_TRG_COUNTRY (
   COUNTRY_ID           NUMERIC(10)                      not null,
   COUNTRY              VARCHAR(50),
   constraint NAMDH_PK_TRG_COUNTRY primary key (COUNTRY_ID)
)
;

create table ODI_SALES_DEV.NAMDH_TRG_REGION (
   REGION_ID            NUMERIC(10)                      not null,
   COUNTRY_ID           NUMERIC(10)                      not null,
   REGION               VARCHAR(50),
   constraint NAMDH_PK_TRG_REGION primary key (REGION_ID)
)
;

create table ODI_SALES_DEV.NAMDH_TRG_CITY (
   CITY_ID              NUMERIC(10)                      not null,
   REGION_ID            NUMERIC(10)                      not null,
   CITY                 VARCHAR(50),
   POPULATION           NUMERIC(10),
   constraint NAMDH_PK_TRG_CITY primary key (CITY_ID)
)
;

create table ODI_SALES_DEV.NAMDH_TRG_CUSTOMER (
   CUST_ID              NUMERIC(10)                      not null,
   DEAR                 VARCHAR(4),
   CUST_NAME            VARCHAR(50),
   ADDRESS              VARCHAR(100),
   CITY_ID              NUMERIC(10)                      not null,
   PHONE                VARCHAR(50),
   AGE                  NUMERIC(3),
   AGE_RANGE            VARCHAR(50),
   SALES_PERS           VARCHAR(50),
   CRE_DATE             DATE,
   UPD_DATE             DATE,
   constraint NAMDH_PK_TRG_CUSTOMER primary key (CUST_ID)

)
;

create table ODI_SALES_DEV.NAMDH_TRG_PROD_FAMILY (
   FAMILY_ID            VARCHAR(3)                     not null,
   FAMILY_NAME          VARCHAR(50),
   constraint NAMDH_PK_TRG_PROD_FAMILY primary key (FAMILY_ID)
)
;

create table ODI_SALES_DEV.NAMDH_TRG_PRODUCT (
   PRODUCT_ID           NUMERIC(10)                      not null,
   FAMILY_ID            VARCHAR(3)                     not null,
   PRICE                NUMERIC(10,2),
   PRODUCT              VARCHAR(50),
   constraint NAMDH_PK_TRG_PRODUCT primary key (PRODUCT_ID)
)
;

create table ODI_SALES_DEV.NAMDH_TRG_SALES (
   CUST_ID              NUMERIC(10)                      not null,
   PRODUCT_ID           NUMERIC(10)                      not null,
   FIRST_ORD_ID         NUMERIC(10)                      not null,
   FIRST_ORD_DATE       DATE                            not null,
   LAST_ORD_ID          NUMERIC(10)                      not null,
   LAST_ORD_DATE        DATE                            not null,
   QTY                  NUMERIC(10)                      not null,
   AMOUNT               NUMERIC(10, 2)                      not null,
   PROD_AVG_PRICE       NUMERIC(10, 2)                      not null,
   constraint NAMDH_PK_TRG_SALES primary key (PRODUCT_ID, CUST_ID)
)
;


CREATE TABLE ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER 
   (	"CUST_ID" NUMBER(10,0), 
	"DEAR" VARCHAR2(4 BYTE), 
	"CUST_NAME" VARCHAR2(50 BYTE), 
	"ADDRESS" VARCHAR2(100 BYTE), 
	"CITY_ID" NUMBER(10,0), 
	"PHONE" VARCHAR2(50 BYTE), 
	"AGE" NUMBER(3,0), 
	"AGE_RANGE" VARCHAR2(50 BYTE), 
	"SALES_PERS" VARCHAR2(50 BYTE), 
	"CRE_DATE" DATE, 
	"UPD_DATE" DATE
   );
 
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (105,'Mr','Tony  Goldschmidt','91 Torre drive',14,'(619) 555 6529',55,'50-59 years','GOLDSCHMIDT',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (106,'Mr','William  Baker','2890 Grant Avenue',15,'(312) 555 7040',64,'60 years or more','BAKER',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (107,'Mr','Jack  Swenson','64 Imagination Drive',19,'(202) 555 8125',20,'20-29 years','SWENSON',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (201,'Mr','Jean  Sartois','71 rue Rousseau',25,'79 23 26 23',69,'60 years or more','SARTOIS',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (202,'Mr','Philippe  Michaud','197 impasse Renoir',23,'78 21 86 20',22,'20-29 years','MICHAUD',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (203,'Mr','Christian  Robert','1rue Cezanne',208,'42 25 27 29',38,'30-39 years','ROBERT',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (204,'Mrs','Christine  Martin','12 allee Victor Hugo',24,'25 26 46 26',42,'40-49 years','MARTIN',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (205,'Mr','Luc  Piaget','38 allee des Saules',29,'53 42 24 28',56,'50-59 years','PIAGET',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (206,'Mrs','Michele  Gentil','17montee des Chenes',25,'65 62 26 13',19,'Less than 20 years','GENTIL',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (207,'Mrs','Marie-Chantale  Dupont','37 rue Murat',20,'46 72 23 53',20,'20-29 years','DUPONT',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (301,'Mrs','Caroline  Edwards','68 Downing Street',35,'243867945',68,'60 years or more','EDWARDS',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (302,'Mr','Justin  Marlow','290 Yorkshire Drive',32,'653643634',29,'20-29 years','MARLOW',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (303,'Mr','John  Wilson','28 Sutton Row',33,'158746231',34,'30-39 years','WILSON',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (304,'Mr','George  Mccartney','45 Glenthorne Road',34,'323768678',47,'40-49 years','MCCARTNEY',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (305,'Mrs','Hariett  Keegan','10 Hamilton Park',35,'566344643',56,'50-59 years','KEEGAN',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (306,'Mrs','Mary  Jones','34 Apple Grove',36,'143546456',18,'Less than 20 years','JONES',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (401,'Ms','Erika  Diemers','Wiesenstra?40',51,'235345',68,'60 years or more','DIEMERS',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (402,'Mr','Jurgen  Schiller','Auf dem Rain 4',52,'142352',24,'20-29 years','SCHILLER',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (404,'Mr','Hans  Weimar','Goethering 33',54,'346636',45,'40-49 years','WEIMAR',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (405,'Mr','Herbert  Schultz','Am Holzbach 17',55,'256346',59,'50-59 years','SCHULTZ',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (406,'Mr','Silke  Titzman','Berliner Ring 56',56,'235463',63,'60 years or more','TITZMAN',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (407,'Ms','Heineke  Reinman','Yorkstra?75',55,'234646',19,'Less than 20 years','REINMAN',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (501,'Mr','Toshihijo  Arai','941 Toyota Ave',70,'34784597',68,'60 years or more','ARAI',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (502,'Mr','Mariko  Kamata','70 Kiroto Street',71,'57687462',24,'20-29 years','KAMATA',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (503,'Mr','Satoru  Kamimura','34 Kawasaki Avenue',72,'26475684',38,'30-39 years','KAMIMURA',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (504,'Mr','Tatsuo  Makino','2435 Toyota Ave',70,'34413486',45,'40-49 years','MAKINO',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (505,'Mr','Masayuki  Mukumoto','59 Yamamoto Blvd',73,'34827691',59,'50-59 years','MUKUMOTO',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (506,'Mr','Kenji  Oneda','94 Toyota Blvd',70,'51839463',18,'Less than 20 years','ONEDA',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));
Insert into ODI_SALES_DEV.NAMDH_TRG_BULK_CUSTOMER (CUST_ID,DEAR,CUST_NAME,ADDRESS,CITY_ID,PHONE,AGE,AGE_RANGE,SALES_PERS,CRE_DATE,UPD_DATE) values (507,'Mr','Isao  Okumura','3 Toyota Ave',74,'48928371',20,'20-29 years','OKUMURA',to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-FEB-10','DD-MON-RR HH.MI.SSXFF AM'));

commit;
exit;