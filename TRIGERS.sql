CREATE OR REPLACE TRIGGER TRIGER_PLANE_INSERT
AFTER INSERT
ON PLANE
FOR EACH ROW
DECLARE
  v_count INTEGER :=0;
  CURSOR cursor1 IS
    SELECT * FROM FLIGHT2;
  v_linie cursor1%ROWTYPE;
  v_rand INTEGER:=0;
  v_date flight.flight_date%TYPE;
BEGIN
  SELECT MAX(flight_date) INTO v_date FROM FLIGHT;
  OPEN cursor1;
  LOOP
    EXIT WHEN v_rand>=4;
    v_rand:=DBMS_RANDOM.VALUE(1,10);
    FETCH cursor1 INTO v_linie;
  END LOOP;
  SELECT COUNT(flight_id) INTO v_count FROM FLIGHT;
  INSERT INTO FLIGHT VALUES (v_count+1,:NEW.plane_id,v_linie.crew_id,v_date+1,v_linie.takeoff_town,v_linie.destination,v_linie.takeoff_time,v_linie.arrival_time);
  CLOSE cursor1;
END;
/
CREATE OR REPLACE TRIGGER TRIGER_PLANE_DELETE
BEFORE DELETE
ON PLANE
FOR EACH ROW
BEGIN
  DELETE FROM FLIGHT WHERE :OLD.plane_id=plane_id;
END;
/