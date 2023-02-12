-- EXERCISES
-- Try to nest functions instead of creating new fields
-- You should only create one new column

-- 1. Convert the emails to have the first letters of the first and last names instead of the whole names
-- for example MARY.SMITH@sakilacustomer.org should be MS@sakilacustomer.org
-- use only the email column. You are not allowed to use the first and last name columns

SELECT email, SUBSTRING(email, 1, 1) || SUBSTRING(email, INSTR(email, '.')+1, 1) || SUBSTRING(email, INSTR(email, '@')) as new_email
FROM customer; 

-- 2. Convert the emails to have the first letter of the first name and the whole last name
-- lowercase them
-- for example MARY.SMITH@sakilacustomer.org should be msmith@sakilacustomer.org 
-- use the first and last name columns

SELECT first_name, last_name, SUBSTRING(LOWER(first_name), 1,1) || LOWER(last_name) || "@sakilacustomer.org" as lil_email
FROM customer;

-- 3. Complete part 2 without using the first and last name columns, only the email.

SELECT email, SUBSTRING(LOWER(email), 1,1) || SUBSTRING(LOWER(email), INSTR(email, '.')+1, 1) || SUBSTRING(email, INSTR(email, '@')) as lil_email_2
FROM customer;

-- 4. Lowercase the first part of the email and uppercase the second
-- MARY.SMITH@sakilacustomer.org should be mary.smith@SAKILACUSTOMER.ORG
-- use only column email.

SELECT email, LOWER(SUBSTR(email, 1, INSTR(email, '@') - 1)) || SUBSTRING(UPPER(email), INSTR(email, '@')) as updated_email
FROM customer;