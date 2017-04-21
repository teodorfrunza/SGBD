create or replace package proiect_users as

  procedure freeFlights(p_orasPlecare IN OUT flight.takeoff_town%TYPE, p_orasSosire IN OUT flight.destination%TYPE,p_ora1 IN OUT flight.takeoff_time%TYPE, p_ora2 IN OUT flight.takeoff_time%TYPE, p_data IN OUT FLIGHT.FLIGHT_DATE%TYPE);
  procedure sugestii(p_cnp booking.cnp%TYPE);
end proiect_users;

/
create or replace package body proiect_users as

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
  
  
  procedure sugestii(p_cnp booking.cnp%TYPE) as
    TYPE orasPlecare IS TABLE OF PLS_INTEGER INDEX BY VARCHAR2(20);
    v_orasPlecare orasPlecare;
    TYPE orasSosire IS TABLE OF PLS_INTEGER INDEX BY VARCHAR2(20);
    v_orasSosire orasPlecare;
    cursor rezervatii is
      select * from booking b join flight f on b.flight_id=f.flight_id where cnp=p_cnp;
    v_linie rezervatii%ROWTYPE;
    v_max1 number(10) :=0;
    v_max2 number(10) :=0;
    v_oras1 varchar2(20) :=0;
    v_oras2 varchar2(20) :=0;
    v_oras1_nume varchar2(20);
    v_oras2_nume varchar2(20);
    v_nr_orase_plecare number(10) :=0;
    v_nr_orase_sosire number(10) :=0;
    eroare EXCEPTION;
    pragma exception_init(eroare,-20013);
    v_flag integer :=0;
  begin
  
    select count(*) into v_flag from booking where cnp=p_cnp;
    if(v_flag = 0)
      then
        raise eroare;
    end if;
  
    select count(distinct takeoff_town) into v_nr_orase_plecare from flight;
    select count(distinct destination) into v_nr_orase_sosire from flight;
  
    v_orasPlecare('ORADEA') := 0;
    v_orasPlecare('BUCURESTI') := 0;
    v_orasPlecare('TIMISOARA') := 0;
    v_orasPlecare('CLUJ-NAPOCA') := 0;
    v_orasPlecare('SIBIU') := 0;
    v_orasPlecare('BACAU') := 0;
    v_orasPlecare('CONSTANTA') := 0;
    v_orasPlecare('IASI') := 0;
    
    v_orasSosire('ORADEA') := 0;
    v_orasSosire('BUCURESTI') := 0;
    v_orasSosire('TIMISOARA') := 0;
    v_orasSosire('CLUJ-NAPOCA') := 0;
    v_orasSosire('SIBIU') := 0;
    v_orasSosire('BACAU') := 0;
    v_orasSosire('CONSTANTA') := 0;
    v_orasSosire('IASI') := 0;
       
    open rezervatii;
      loop
        fetch rezervatii into v_linie;
        exit when rezervatii%NOTFOUND;
        v_orasPlecare(v_linie.takeoff_town):= v_orasPlecare(v_linie.takeoff_town) + 1;
        v_orasSosire(v_linie.destination):= v_orasSosire(v_linie.destination) + 1;
      end loop;
    close rezervatii; 
    
    v_oras1:=v_orasPlecare.first;
      loop
        if(v_orasPlecare(v_oras1) > v_max1)
          then 
            v_max1:=v_orasPlecare(v_oras1);
            v_oras1_nume:=v_oras1;
        end if;
        exit when v_oras1=v_orasPlecare.last;
        v_oras1:=v_orasPlecare.next(v_oras1);
      end loop;
  
    v_oras2:=v_orasSosire.first;
      loop
        if(v_orasSosire(v_oras2) > v_max2)
          then 
            v_max2:=v_orasSosire(v_oras2);
            v_oras2_nume:=v_oras2;
        end if;
        exit when v_oras2=v_orasSosire.last;
        v_oras2:=v_orasSosire.next(v_oras2);
      end loop;
      
    dbms_output.put_line('Avand in vedere alegerile dumneavoastra de pana acum, noi va recomandam urmatoarele zboruri de azi: ');
    declare
      cursor zboruri is
        select * from flight where takeoff_town=v_oras1_nume and destination=v_oras2_nume and flight_date like CURRENT_DATE;
      v_linie2 zboruri%ROWTYPE;
      begin
        open zboruri;
          loop
            fetch zboruri into v_linie2;
            exit when zboruri%NOTFOUND;
            dbms_output.put_line('Zbor id: '||v_linie2.flight_id||' | Avion id: '||v_linie2.plane_id||' | Pleaca din: '||v_linie2.takeoff_town||' la '||v_linie2.takeoff_time||'  si  ajunge in '||v_linie2.destination||' la '||v_linie2.arrival_time);
          end loop;
        close zboruri;
      end; 
    EXCEPTION
    when eroare then
      raise_application_error(-20013,'Nu exista persoana cu cnp-ul "'||p_cnp||'"');
    when others then
      raise_application_error(-20003,'Eroare necunoscuta');
    
  end sugestii;
  
end proiect_users;
