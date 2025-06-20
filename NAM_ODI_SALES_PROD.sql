
drop table ODI_SALES_PROD.NAMDH_TRG_COUNTRY;
drop table ODI_SALES_PROD.NAMDH_TRG_REGION;
drop table ODI_SALES_PROD.NAMDH_TRG_CITY;
drop table ODI_SALES_PROD.NAMDH_TRG_CUSTOMER;
drop table ODI_SALES_PROD.NAMDH_TRG_PROD_FAMILY;
drop table ODI_SALES_PROD.NAMDH_TRG_PRODUCT;
drop table ODI_SALES_PROD.NAMDH_TRG_SALES;

create table ODI_SALES_PROD.NAMDH_TRG_COUNTRY (
   COUNTRY_ID           NUMERIC(10)                      not null,
   COUNTRY              VARCHAR(50),
   constraint NAMDH_PK_TRG_COUNTRY primary key (COUNTRY_ID)
)
;

create table ODI_SALES_PROD.NAMDH_TRG_REGION (
   REGION_ID            NUMERIC(10)                      not null,
   COUNTRY_ID           NUMERIC(10)                      not null,
   REGION               VARCHAR(50),
   constraint NAMDH_PK_TRG_REGION primary key (REGION_ID)
)
;

create table ODI_SALES_PROD.NAMDH_TRG_CITY (
   CITY_ID              NUMERIC(10)                      not null,
   REGION_ID            NUMERIC(10)                      not null,
   CITY                 VARCHAR(50),
   POPULATION           NUMERIC(10),
   constraint NAMDH_PK_TRG_CITY primary key (CITY_ID)
)
;

create table ODI_SALES_PROD.NAMDH_TRG_CUSTOMER (
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

create table ODI_SALES_PROD.NAMDH_TRG_PROD_FAMILY (
   FAMILY_ID            VARCHAR(3)                     not null,
   FAMILY_NAME          VARCHAR(50),
   constraint NAMDH_PK_TRG_PROD_FAMILY primary key (FAMILY_ID)
)
;

create table ODI_SALES_PROD.NAMDH_TRG_PRODUCT (
   PRODUCT_ID           NUMERIC(10)                      not null,
   FAMILY_ID            VARCHAR(3)                     not null,
   PRICE                NUMERIC(10,2),
   PRODUCT              VARCHAR(50),
   constraint NAMDH_PK_TRG_PRODUCT primary key (PRODUCT_ID)
)
;

create table ODI_SALES_PROD.NAMDH_TRG_SALES (
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