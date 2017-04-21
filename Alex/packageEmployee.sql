
create or replace package proiect_employee as

  procedure afisareCrew(p_idZbor flight.flight_id%TYPE);
  procedure freeFlights(p_orasPlecare IN OUT flight.takeoff_town%TYPE, p_orasSosire IN OUT flight.destination%TYPE,p_ora1 IN OUT flight.takeoff_time%TYPE, p_ora2 IN OUT flight.takeoff_time%TYPE, p_data IN OUT FLIGHT.FLIGHT_DATE%TYPE);
  
end proiect_employee;
/
create or replace package body proiect_employee as

  procedure afisareCrew(p_idZbor flight.flight_id%TYPE) as
    cursor angajati is
      select * from crew c join flight f on c.crew_id=f.crew_id where f.flight_id=p_idZbor;
    v_linie angajati%ROWTYPE;
    v_flag1 number(10) :=0;
    v_flag2 number(10) :=0;
    eroare1 EXCEPTION;
    pragma exception_init(eroare1,-20001);
    eroare2 exception;
    pragma exception_init(eroare2,-20002);
  begin
    select count(*) into v_flag1 from flight where flight_id=p_idZbor;
      if(v_flag1=0)
        then
          raise eroare1;
        else
          select count(*) into v_flag2 from crew c join flight f on c.crew_id=f.crew_id where f.flight_id=p_idZbor;
          if(v_flag2=0)
            then
              raise eroare2;
          end if;
      end if;
    open angajati;
      loop
        fetch angajati into v_linie;
        exit when angajati%NOTFOUND;
        dbms_output.put_line('Nume pilot: '||v_linie.pilot_name);
        dbms_output.put_line('Nume copilot: '||v_linie.copilot_name);
        dbms_output.put_line('Nume stewardesa1: '||v_linie.flight_attendant1);
        dbms_output.put_line('Nume stewardesa2: '||v_linie.flight_attendant2);
      end loop;
    close angajati;
    exception
    when eroare1 
      then
        raise_application_error(-20001,'Nu exista zborul cu id-ul indicat ('||p_idZbor||')');
    when eroare2
      then
        raise_application_error(-20002,'Nu exista echipaj pentru zborul cu id-ul: '||p_idZbor);
    when others 
      then
        raise_application_error(-20003,'Eroare necunoscuta');
  end afisareCrew;


  procedure freeFlights(p_orasPlecare IN OUT flight.takeoff_town%TYPE, p_orasSosire IN OUT flight.destination%TYPE,p_ora1 IN OUT flight.takeoff_time%TYPE, p_ora2 IN OUT flight.takeoff_time%TYPE, p_data IN OUT FLIGHT.FLIGHT_DATE%TYPE) as
    cursor zboruri is
      select * from flight where p_orasPlecare like takeoff_town and p_orasSosire like destination and flight_date=p_data and takeoff_time between p_ora1 and p_ora2;
    v_linie_zboruri zboruri%ROWTYPE;
    v_capacitate number(10);
    v_nr_persoane number(10);
    v_flag integer := 0;
    v_flag1 varchar2(50) := 0;
    v_flag2 varchar2(50) := 0;
    v_flag3 integer := 0;
    v_flag4 integer := 0;
    v_flag5 integer := 0;
    v_locuri_ramase number(10);
    eroare1 EXCEPTION;
    pragma exception_init(eroare1,-20004);
    eroare2 exception;
    pragma exception_init(eroare2,-20005);
    eroare3 EXCEPTION;
    pragma exception_init(eroare3,-20006);
    eroare4 exception;
    pragma exception_init(eroare4,-20007);
    eroare5 exception;
    pragma exception_init(eroare5,-20008);
    eroare6 exception;
    pragma exception_init(eroare6,-20009);
    eroare7 exception;
    pragma exception_init(eroare7,-20010);
    eroare8 exception;
    pragma exception_init(eroare8,-20011);
    eroare9 exception;
    pragma exception_init(eroare9,-20012);
  begin
    select count(*) into v_flag3 from flight where p_orasPlecare like takeoff_town;
    select count(*) into v_flag4 from flight where p_orasSosire like destination;
    if(v_flag3 = 0 and v_flag4 = 0)
      then
        raise eroare5;
    else
      if(v_flag3 = 0)
        then
          raise eroare6;
      else
        if(v_flag4 = 0)
          then
            raise eroare7;
        end if;
      end if;
    end if;
    
    if(p_ora1 not between '00:00' and '24:00') AND (p_ora2 not between '00:00' and '24:00')
      then
        v_flag1:=p_ora1;
        v_flag2:=p_ora2;
        raise eroare3;
    else
      if(p_ora1 not between '00:00' and '24:00')
        then
          v_flag1:=p_ora1;
          raise eroare1;
      else
        if(p_ora2 not between '00:00' and '24:00')
          then
            v_flag2:=p_ora2;
            raise eroare2;
        else
          if(p_ora1 > p_ora2)
            then
              raise eroare4;
          end if;
        end if;
      end if;
    end if;
    
    select count(*) into v_flag5 from flight where flight_date=p_data;
    if(v_flag5 = 0)
      then
        raise eroare8;
    else
      if(p_data<SYSDATE)
        then
          raise eroare9;
      end if;
    end if;  
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
    EXCEPTION
    when eroare1 then
      raise_application_error(-20004,'Ora '||v_flag1||' nu este corecta');
    when eroare2 then
      raise_application_error(-20005,'Ora '||v_flag2||' nu este corecta');
    when eroare3 then
      raise_application_error(-20006,'Orele '||v_flag1||' si '||v_flag2||' nu sunt corecte');
    when eroare4 then
      raise_application_error(-20007,'Orele introduse sunt in ordine incorecta');
    when eroare5 then
      raise_application_error(-20008,'Nu exista aeroport in orasul '||p_orasPlecare||' sau in orasul '||p_orasSosire);
    when eroare6 then
      raise_application_error(-20009,'Orasul '||p_orasPlecare||' nu are aeroport');
    when eroare7 then
      raise_application_error(-20010,'Orasul '||p_orasSosire||' nu are aeroport');
    when eroare8 then
      raise_application_error(-20011,'Nu avem data '||p_data||' in baza noastra de date');
    when eroare9 then
      raise_application_error(-20012,'Data invalida (masina timpului nu s-a inventat inca, ne pare rau!)');
    when others then
      raise_application_error(-20003,'Eroare necunoscuta');
  end freeFlights;



end proiect_employee;    
