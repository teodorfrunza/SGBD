drop table FLIGHT;
create table FLIGHT(flight_id NUMBER(10) primary key, plane_id NUMBER(10) not null , flight_date DATE not null, takeoff_town VARCHAR2(20) not null, destination VARCHAR2(20) not null, takeoff_time VARCHAR(10) not null, arrival_time VARCHAR2(10) not null);
ALTER TABLE FLIGHT
  ADD CONSTRAINT plane_id_fk FOREIGN KEY (plane_id) 
    REFERENCES PLANE(plane_id);
/

DECLARE
  v_id NUMBER :=1;
  CURSOR cursor1 IS 
    SELECT * FROM FLIGHT2;
  v_linie cursor1%ROWTYPE;
  v_data DATE :='01-JAN-17';
  v_repetari NUMBER:=0;
BEGIN
  LOOP
    OPEN cursor1;
    LOOP
    FETCH cursor1 INTO v_linie;
    EXIT WHEN cursor1%NOTFOUND;
      INSERT INTO FLIGHT VALUES (v_id,v_linie.plane_id,v_data,v_linie.takeoff_town,v_linie.destination,v_linie.takeoff_time,v_linie.arrival_time);
      v_id:=v_id+1;
      END LOOP;
    CLOSE cursor1;
    v_repetari:=v_repetari+1;
    v_data:=v_data+1;
    EXIT WHEN v_repetari=90;
  END LOOP;
END;