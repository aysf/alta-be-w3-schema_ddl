# alta-be-w3-schema_ddl
3rd week task / part 2 : data definition language

## Learning Competencies
* Mampu untuk menggunakan statement SQL DDL
* Mampu menggunakan MySQL di Terminal untuk query data

## Problem
1. Create database alta_online_shop
2. Dari scheme Olshop yang telah kamu kerjakan implementasikan menjadi table pada MySQL    

    a. Create table user    
    b. Create table product, product type, operators, product description, payment_method    
    c. Create table transaction, transaction detail

3. Create table kurir menjadi shipping
4. Tambahkan ongkos_dasar column di table kurir.
5. Rename table kurir menjadi shipping
6. Hapus / Drop table shipping karena ternyata tidak dibutuhkan
7. Silahkan menambahkan entry baru dengan relation 1-to-1, 1-to-many, many-to-many, seperti:    
     
    a. 1-to-1: payment method description    
    b. 1-to-many: user dengan alamat    
    c. many-to-many: user dengan payment method menjadi user_payment_method_detail
  
## DDL Recipe
showing contraint name (https://stackoverflow.com/questions/824584/drop-foreign-key-without-knowing-the-name-of-the-constraint)
```sql
select CONSTRAINT_NAME
from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
where TABLE_NAME = 'table_name'
```
showing constraint name in specific column
```sql
select CONSTRAINT_NAME
from INFORMATION_SCHEMA.KEY_COLUMN_USAGE
where TABLE_NAME = 'table_name'
AND COLUMN_NAME = 'column name'
```
change `table_name` and `column_name` accordingly in the single quotes

drop and add constraint (foreign key)

```sql
ALTER TABLE Orders
DROP FOREIGN KEY FK_PersonOrder;

ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);
```

add contraint with `ON DELETE` features. First of all, delete existing foreign key. then follow this syntax
```sql
ALTER TABLE child_table_name 
  ADD CONSTRAINT fk_name 
  FOREIGN KEY (child_column_name) 
  REFERENCES parent_table_name(parent_column_name) 
  ON DELETE CASCADE;
```
