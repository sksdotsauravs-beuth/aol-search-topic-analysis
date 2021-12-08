CREATE OR REPLACE FUNCTION aol_time (y VARCHAR(4) UTF8,
                                     mon VARCHAR(10) UTF8,
                                     d VARCHAR(2) UTF8,
                                     h VARCHAR(2) UTF8,
                                     m VARCHAR(2) UTF8,
                                     s VARCHAR(2) UTF8)
   RETURN TIMESTAMP
   IS
     res TIMESTAMP;
   BEGIN
     res := TO_TIMESTAMP(y || '-' || mon || '-' || d || ' ' || h || ':' || m || ':' || s, 'YYYY-MONTH-DD HH:MI:SS');
     RETURN res;
   END aol_time;