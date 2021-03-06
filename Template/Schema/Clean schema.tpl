SET pagesize  0
spool command.txt

SELECT 'drop ' ||object_type || ' '|| /*owner||'.' ||*/ object_name || ';'
FROM User_Objects
where 
--owner in ('USER1', 'USER2')
--and 
object_type not in ( 'PACKAGE BODY', 'INDEX', 'TABLE', 'TRIGGER', 'UNDEFINED')
union
SELECT 'drop ' || object_type || ' ' || /*owner||'.'||*/object_name || ' cascade constraints;'
FROM User_Objects
where 
--owner in ('USER1', 'USER2')
--and 
object_type = 'TABLE';

spool OFF;
