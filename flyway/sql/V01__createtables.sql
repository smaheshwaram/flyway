CREATE SCHEMA IF NOT EXISTS smaheshwaram;

CREATE TABLE IF NOT EXISTS smaheshwaram.district(
district_id bigint NOT NULL primary key,
district_abrv CHARACTER VARYING(5) NOT NULL,
district_name CHARACTER VARYING(100) NOT NULL,
district_label CHARACTER VARYING(50) NOT NULL,
country_code CHARACTER VARYING(3) NOT NULL,
country_name CHARACTER VARYING(100) NOT NULL
);

CREATE TABLE smaheshwaram.CUSTOMERS(
   ID   INT              NOT NULL,
   NAME VARCHAR (20)     NOT NULL,
   AGE  INT              NOT NULL,
   ADDRESS  CHAR (25) ,
   SALARY   DECIMAL (18, 2),
   PRIMARY KEY (ID)
);
