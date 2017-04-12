set serveroutput on;

create or replace procedure freeFlights(p_orasPlecare IN OUT flight.takeoff_town%TYPE, p_orasSosire IN OUT flight.destination%TYPE,p_ora1 IN OUT flight.takeoff_time%TYPE, p_ora2 IN OUT flight.takeoff_time%TYPE, p_data IN OUT FLIGHT.FLIGHT_DATE%TYPE) as
  cursor zboruri is
    select * from flight where p_orasPlecare like takeoff_town and p_orasSosire like destination and flight_date=p_data and takeoff_time between p_ora1 and p_ora2;
  v_linie_zboruri zboruri%ROWTYPE;
  v_capacitate number(10);
  v_nr_persoane number(10);
  v_flag integer := 0;
  v_locuri_ramase number(10);
begin
  open zboruri;
    loop
      fetch zboruri into v_linie_zboruri;
      exit when zboruri%NOTFOUND;
      select plane_capacity into v_capacitate from plane where plane_id=v_linie_zboruri.plane_id;
      select count (*) into v_nr_persoane from booking where flight_id=v_linie_zboruri.flight_id;
      v_locuri_ramase:=v_capacitate - v_nr_persoane;
      if(v_capacitate!=v_nr_persoane) 
        then
          dbms_output.put_line('| Plecare: '||v_linie_zboruri.takeoff_town||'  ora: '||v_linie_zboruri.takeoff_time||'  ---  '||' Sosire: '||v_linie_zboruri.destination||'  ora: '||v_linie_zboruri.arrival_time||'  |  Avionul mai are '||v_locuri_ramase||' locuri libere. |');
          v_flag:=1;
      end if;
    end loop;
  close zboruri;
  if(v_flag=0)
    then
      dbms_output.put_line('Nu este nici un zbor disponibil momentan.');
  end if;
end;

/*
declare
  v_1 FLIGHT.TAKEOFF_TOWN%TYPE := 'BUCURESTI';
  v_2 FLIGHT.DESTINATION%TYPE := 'ORADEA';
  v_3 FLIGHT.TAKEOFF_TIME%TYPE := '08:00';
  v_4 FLIGHT.TAKEOFF_TIME%TYPE := '10:00';
  v_5 FLIGHT.FLIGHT_DATE%TYPE := '20-MAR-17';
begin
  freeFlights(v_1,v_2,v_3,v_4,v_5);
end;
*/