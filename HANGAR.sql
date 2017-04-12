create table HANGAR(plane_id NUMBER(10) NOT NULL,hangar_number NUMBER(2) NOT NULL,occupied_slots NUMBER(1) NOT NULL,plane_status VARCHAR(20));

/

DECLARE
  v_plane_nr NUMBER(10);
  v_rand NUMBER;
  CURSOR cursor1 IS 
    SELECT plane_id from FLIGHT;
  v_linie cursor1%ROWTYPE;
  v_flag NUMBER:=1;
  CURSOR cursor2 is
    SELECT * from HANGAR;
  v_linie2 cursor2%ROWTYPE;
  v_nr_hangar NUMBER(3) :=1;
  v_nr_slot NUMBER(3) :=1;
  v_status INTEGER;
BEGIN
  SELECT COUNT(plane_id) INTO v_plane_nr FROM PLANE;
  FOR i IN 1..v_plane_nr LOOP
    v_flag:=1;
    OPEN cursor1;
    LOOP
      FETCH cursor1 INTO v_linie;
      EXIT WHEN cursor1%NOTFOUND;
      IF (i=v_linie.plane_id) THEN
        v_flag:=0;
      END IF;
    END LOOP;
    CLOSE cursor1;
    IF(v_flag=1) THEN
      IF(v_nr_slot!=4) THEN
        v_status:=DBMS_RANDOM.VALUE(1,10);
        IF(v_status<=3) THEN
          INSERT INTO HANGAR VALUES (i,v_nr_hangar,v_nr_slot,'MAINTENANCE');
          v_nr_slot:=v_nr_slot+1;
        ELSE
          INSERT INTO HANGAR VALUES (i,v_nr_hangar,v_nr_slot,'PARKED');
          v_nr_slot:=v_nr_slot+1;
        END IF;
      ELSE
        v_status:=DBMS_RANDOM.VALUE(1,10);
        IF(v_status<=3) THEN
          INSERT INTO HANGAR VALUES (i,v_nr_hangar,v_nr_slot,'MAINTENANCE');
          v_nr_hangar:=v_nr_hangar+1;
          v_nr_slot:=1;
        ELSE
          INSERT INTO HANGAR VALUES (i,v_nr_hangar,v_nr_slot,'PARKED');
          v_nr_hangar:=v_nr_hangar+1;
          v_nr_slot:=1;
        END IF;
      END IF;
    END IF;
  END LOOP;
END;