CREATE TABLE CREW(crew_id NUMBER(10) primary key, pilot_name VARCHAR2(50) NOT NULL, copilot_name VARCHAR2(50) NOT NULL, flight_attendant1 VARCHAR2(50) NOT NULL, flight_attendant2 VARCHAR2(50) NOT NULL)
/
DECLARE
  TYPE MyTab IS TABLE OF VARCHAR2(255 BYTE) INDEX BY PLS_INTEGER;
  nume MyTab;
  v_name users.name%TYPE;
  v_ind NUMBER :=0;
  v_count NUMBER :=0;
  v_flag NUMBER :=0;
BEGIN
  FOR i IN 0..129 LOOP
    SELECT name INTO v_name FROM (SELECT name FROM users ORDER BY DBMS_RANDOM.RANDOM) WHERE ROWNUM<2;
    nume(i):=v_name;
  END LOOP;
  LOOP
    EXIT WHEN v_flag=1;
    v_count:=0;
    FOR i IN 0..129 LOOP
      FOR j IN 0..129 LOOP
        IF (nume(i) like '%'||nume(j)||'%' AND i!=j) THEN
          SELECT name INTO v_name FROM (SELECT name FROM users ORDER BY DBMS_RANDOM.RANDOM) WHERE ROWNUM<2;
          nume(j):=v_name;
          v_count:=v_count+1;
        END IF;
      END LOOP;
    END LOOP;
    IF (v_count=0) THEN
      v_flag:=1;
    END IF;
  END LOOP;
  FOR IDS in 1..30 LOOP
    INSERT INTO CREW VALUES (IDS,nume(v_ind),nume(v_ind+1),nume(v_ind+2),nume(v_ind+3));
    v_ind:=v_ind+4;
  END LOOP;
END;
/
