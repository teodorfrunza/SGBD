CREATE OR REPLACE TRIGGER trigger_plane 
  BEFORE
    INSERT OR
    --UPDATE OF PLANE_ID OR
    DELETE
  ON PLANE
  REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
DECLARE 
  CURSOR cursor1 IS
    SELECT * FROM FLIGHT2;
  v_linie cursor1%ROWTYPE;
  v_rand INTEGER;
  v_data flight.flight_date%TYPE;
  v_id flight.flight_id%TYPE;
BEGIN
  OPEN cursor1;
  SELECT MAX(flight_id) INTO v_id FROM FLIGHT;
  SELECT MAX(flight_date) INTO v_data FROM FLIGHT;
  LOOP
  FETCH cursor1 INTO v_linie;
  v_rand:=DBMS_RANDOM.VALUE(1,10);
  EXIT WHEN v_rand>7;
  END LOOP;
  CASE
    WHEN INSERTING THEN
      INSERT INTO FLIGHT VALUES (v_id+1,:NEW.plane_id,v_linie.crew_id,v_data+1,v_linie.takeoff_town,v_linie.destination,v_linie.takeoff_time,v_linie.arrival_time);
    --WHEN UPDATING('salary') THEN
      --DBMS_OUTPUT.PUT_LINE('Updating salary');
    --WHEN UPDATING('department_id') THEN
      --DBMS_OUTPUT.PUT_LINE('Updating department ID');
    WHEN DELETING THEN
      DELETE FROM FLIGHT WHERE :OLD.PLANE_ID=PLANE_ID;
      DELETE FROM HANGAR WHERE :OLD.PLANE_ID=PLANE_ID;
  END CASE;
END;