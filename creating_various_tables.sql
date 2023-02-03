---Creating customer table
CREATE TABLE PUR_CUSTOMER (
CUSTOMER_ID INTEGER,
FIRST_NAME VARCHAR2 ( 50 ),
LAST_NAME VARCHAR2 ( 50 ),
ADDRESS VARCHAR2 ( 80 ),
CITY VARCHAR2 ( 40 ),
COUNTRY VARCHAR2 (50),
DATE_ADDED DATE,
REGION VARCHAR2 (10),
constraint PUR_CUSTOMER_pk PRIMARY KEY (CUSTOMER_ID) );

---Creating PUR_PRODUCT Table
CREATE TABLE PUR_PRODUCT (
PRODUCT_ID INTEGER ,
PRODUCT_NAME VARCHAR2 ( 100 ),
STANDARD_COST NUMBER ( 10,2 ),
LIST_PRICE NUMBER ( 10,2 ),
constraint PUR_PRODUCT_pk PRIMARY KEY (PRODUCT_ID) );

SELECT* FROM PUR_PRODUCT;

---Creating PUR_SALES Table
CREATE TABLE PUR_SALES (
SALES_ID INTEGER PRIMARY KEY,
SALES_DATE DATE,
ORDER_ID INTEGER,
PRODUCT_ID INTEGER ,
CUSTOMER_ID INTEGER ,
UNIT_PRICE NUMBER (10,2),
DISCOUNT NUMBER (10,2),
TOTAL_AMOUNT NUMBER (10,2),
constraint PRODUCT_ID_fk FOREIGN KEY (PRODUCT_ID) References PUR_PRODUCT
(PRODUCT_ID),
constraint CUSTOMER_ID_fk FOREIGN KEY (CUSTOMER_ID) References
PUR_CUSTOMER (CUSTOMER_ID)
);

---Creating PUR_SALESPERSON Table
CREATE TABLE PUR_SALESPERSON (
SALESPERSON_ID INTEGER ,
JOB_TITLE VARCHAR2 (80),
FIRST_NAME VARCHAR2 ( 50 ),
LAST_NAME VARCHAR2 ( 50 ),
MANAGER VARCHAR2 ( 20 ),
constraint PUR_SALESPERSON_pk PRIMARY KEY (SALESPERSON_ID) );

SELECT* FROM PUR_SALESPERSON;

----Creating PUR_SALES_CONTACT Table
CREATE TABLE PUR_SALES_CONTACT (
SALES_ID INTEGER ,
SALESPERSON_ID INTEGER,
COMMISSION NUMBER (6,2),
constraint PUR_SALES_CONTACT_pk PRIMARY KEY (SALES_ID),
constraint SALES_ID_fk FOREIGN KEY (SALES_ID)
References PUR_SALES (SALES_ID),
constraint SALESPERSON_ID_fk FOREIGN KEY (SALESPERSON_ID)
References PUR_SALESPERSON (SALESPERSON_ID) );

SELECT* FROM PUR_SALES_CONTACT;

--- PUR_CUSTOMER Table
Insert into PUR_CUSTOMER (CUSTOMER_ID, FIRST_NAME, LAST_NAME, ADDRESS,
CITY,
COUNTRY, DATE_ADDED, REGION) values
(10,'JOHN','DOE','200 Clinton Pkwy', 'Lawrence', 'USA', DATETIME('12-JAN-19','DD-MON-YY'),
'MIDWEST');
Insert into PUR_CUSTOMER (CUSTOMER_ID, FIRST_NAME, LAST_NAME, ADDRESS, 
CITY,
COUNTRY, DATE_ADDED, REGION) values
(11,'JANE','DOE', '201 Clinton Pkwy', 'Lawrence', 'USA', DATETIME('12-FEB-19','DD-MON-YY'),
'
MIDWEST');
Insert into PUR_CUSTOMER (CUSTOMER_ID, FIRST_NAME, LAST_NAME, ADDRESS,
CITY,
COUNTRY, DATE_ADDED, REGION) values
(12,'ALICA','EDWARD','3456 Gates Dr', 'Chicago', 'USA', DATETIME('12-FEB-19','DD-MON-
YY'),
'MIDWEST');
Insert into PUR_CUSTOMER (CUSTOMER_ID, FIRST_NAME, LAST_NAME, ADDRESS,
CITY,
COUNTRY, DATE_ADDED, REGION) values
(13,'PETER','EDWARD','123 Sandy Dr', 'Phoenix', 'USA', DATETIME('2-MAR-19','DD-MON-YY'),
'WEST');
Insert into PUR_CUSTOMER (CUSTOMER_ID, FIRST_NAME, LAST_NAME, ADDRESS,
CITY,
COUNTRY, DATE_ADDED, REGION) values
(14,'DAVE','TAYLOR','2345 Petersburg St', 'Portland', 'USA', DATETIME('2-MAR-19','DD-MON-
YY'),
'WEST');
Insert into PUR_CUSTOMER (CUSTOMER_ID, FIRST_NAME, LAST_NAME, ADDRESS,
CITY,
COUNTRY, DATE_ADDED, REGION) values
(15,'DIANA','THOMAS','1010 East Roger St', 'Miami', 'USA', DATETIME('12-JAN-19','DD-MON-
YY'),
'SOUTH');

SELECT* FROM PUR_CUSTOMER;

----PUR_PRODUCT Table
Insert into PUR_PRODUCT
(PRODUCT_ID,PRODUCT_NAME,STANDARD_COST,LIST_PRICE)
values (100,'Mobile Cover',30,35);
Insert into PUR_PRODUCT
(PRODUCT_ID,PRODUCT_NAME,STANDARD_COST,LIST_PRICE)
values (200,'Samsung F7100',80,100);
Insert into PUR_PRODUCT
(PRODUCT_ID,PRODUCT_NAME,STANDARD_COST,LIST_PRICE)
values (300,'LG F100',100,15);
Insert into PUR_PRODUCT
(PRODUCT_ID,PRODUCT_NAME,STANDARD_COST,LIST_PRICE)
values (400,'Apple A100',110,125);

SELECT* FROM PUR_PRODUCT;

---PUR_SALES Table
Insert into PUR_SALES (SALES_ID,
SALES_DATE,ORDER_ID,PRODUCT_ID,CUSTOMER_ID,UNIT_PRICE, DISCOUNT,
TOTAL_AMOUNT)
values (1001, DATETIME('12-AUG-21','DD-MON-YY'),100,100,11,40, 40, 440);
Insert into PUR_SALES (SALES_ID,
SALES_DATE,ORDER_ID,PRODUCT_ID,CUSTOMER_ID,UNIT_PRICE, DISCOUNT,
TOTAL_AMOUNT)
values (1002, DATETIME('22-SEP-21','DD-MON-YY'),200,200,13,35, 10, 50);
Insert into PUR_SALES (SALES_ID,
SALES_DATE,ORDER_ID,PRODUCT_ID,CUSTOMER_ID,UNIT_PRICE, DISCOUNT,
TOTAL_AMOUNT)
values (1003, DATETIME('25-AUG-21','DD-MON-YY'),300,300,13,40, 20, 80);
Insert into PUR_SALES (SALES_ID,
SALES_DATE,ORDER_ID,PRODUCT_ID,CUSTOMER_ID,UNIT_PRICE, DISCOUNT,
TOTAL_AMOUNT)
values (1004, DATETIME('25-NOV-21','DD-MON-YY'),300,300,13,40, 15, 80);

SELECT* FROM PUR_SALES;

----PUR_SALESPERSON Table
Insert into PUR_SALESPERSON
(SALESPERSON_ID,JOB_TITLE,FIRST_NAME,LAST_NAME,MANAGER) values
(11000,'Entry Level','Ben','Thomas','Greg');
Insert into PUR_SALESPERSON
(SALESPERSON_ID,JOB_TITLE,FIRST_NAME,LAST_NAME,MANAGER) values
(11001,'Developer','Anita','Borg','Greg');
Insert into PUR_SALESPERSON
(SALESPERSON_ID,JOB_TITLE,FIRST_NAME,LAST_NAME,MANAGER) values
(11002,'Customer Facing','Samantha','Doe','John');
Insert into PUR_SALESPERSON
(SALESPERSON_ID,JOB_TITLE,FIRST_NAME,LAST_NAME,MANAGER) values
(11003,'Entry Level','Sue','Bellman','Jane');
Insert into PUR_SALESPERSON
(SALESPERSON_ID,JOB_TITLE,FIRST_NAME,LAST_NAME,MANAGER) values
(11004,'Entry Level','Tom','Pardi','Jane');

SELECT* FROM PUR_SALESPERSON;

-----PUR_SALES_CONTACT Table
Insert into PUR_SALES_CONTACT (SALES_ID, SALESPERSON_ID, COMMISSION)
values (1001,
11003, 4.30);
Insert into PUR_SALES_CONTACT (SALES_ID, SALESPERSON_ID, COMMISSION)
values (1002,
11001, 30.92);
Insert into PUR_SALES_CONTACT (SALES_ID, SALESPERSON_ID, COMMISSION)
values (1003,
11002, 9.9);
Insert into PUR_SALES_CONTACT (SALES_ID, SALESPERSON_ID, COMMISSION)
values (1004,
11004, 10.50);
Insert into PUR_SALES_CONTACT (SALES_ID, SALESPERSON_ID, COMMISSION)
values (1005,
11004, 4.5);

SELECT* FROM PUR_SALES_CONTACT;