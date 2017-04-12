CREATE TABLE BOOKING(flight_id NUMBER(10),person_id VARCHAR2(20) NOT NULL UNIQUE,last_name VARCHAR2(20) NOT NULL,first_name VARCHAR2(20) NOT NULL,cnp VARCHAR2(30) NOT NULL,number_of_luggages NUMBER(1))
/
DECLARE
  v_nume VARCHAR2(50);
  v_prenume VARCHAR2(50);
  v_random INTEGER;
  v_id NUMBER(15) := 1;
  v_cnp_part1 VARCHAR2(15);
  v_cnp_part2 VARCHAR2(15);
  v_cnp_part3 INTEGER;
  v_cnp_part3_2 VARCHAR2(15);
  v_cnp_part4 INTEGER;
  v_cnp_part5 INTEGER;
  v_rand_part2 INTEGER;
  v_rand_part1 INTEGER;
  v_rand INTEGER;
  v_rand_part3 VARCHAR2(10);
BEGIN
  FOR i IN 1..10000
    LOOP
      v_random:=dbms_random.value(1,3);
        FOR j IN 1..v_random
          LOOP
            SELECT SUBSTR(name,INSTR(name,' ',1,1)+1) INTO v_nume FROM (SELECT name FROM USERS WHERE SUBSTR(name,INSTR(name,' ',1,1)+1) IS NOT NULL ORDER BY DBMS_RANDOM.RANDOM) WHERE ROWNUM<2;
            SELECT SUBSTR(name,0,INSTR(name,' ',1,1)-1) INTO v_prenume FROM (SELECT name FROM USERS WHERE SUBSTR(name,0,INSTR(name,' ',1,1)-1) IS NOT NULL ORDER BY DBMS_RANDOM.RANDOM) WHERE ROWNUM<2;
            IF(v_prenume like '%a') THEN
              v_cnp_part1:='2';
            ELSE 
              v_cnp_part1:='1';
            END IF;
            v_cnp_part2:=TO_DATE(TRUNC(DBMS_RANDOM.VALUE(TO_CHAR(DATE '1936-01-01','J'),TO_CHAR(DATE '2016-01-01','J'))),'J');
            v_cnp_part3:=DBMS_RANDOM.VALUE(1,52);
            IF(v_cnp_part3>0 AND v_cnp_part3<10) THEN
              v_cnp_part3_2:='0'||v_cnp_part3;
            ELSE
              v_cnp_part3_2:=v_cnp_part3;
            END IF;
            v_cnp_part4:=DBMS_RANDOM.VALUE(100,999);
            v_cnp_part5:=DBMS_RANDOM.VALUE(1,9);
            v_rand_part1:=DBMS_RANDOM.VALUE(10,12);
            v_rand_part2:=DBMS_RANDOM.VALUE(1,9);
            v_rand_part3:='0'||v_rand_part2;
            v_rand:=DBMS_RANDOM.VALUE(1,12);
            IF (v_rand>=10) THEN 
              INSERT INTO BOOKING VALUES(i,v_id,v_nume,v_prenume,v_cnp_part1||substr(v_cnp_part2,8,2)||v_rand_part1||substr(v_cnp_part2,1,2)||v_cnp_part3_2||v_cnp_part4||v_cnp_part5,dbms_random.value(1,3));
              v_id:=v_id+1;
            ELSE 
              INSERT INTO BOOKING VALUES(i,v_id,v_nume,v_prenume,v_cnp_part1||substr(v_cnp_part2,8,2)||v_rand_part3||substr(v_cnp_part2,1,2)||v_cnp_part3_2||v_cnp_part4||v_cnp_part5,dbms_random.value(1,3));
              v_id:=v_id+1;
            END IF;
          END LOOP;
    END LOOP;
END;
/
