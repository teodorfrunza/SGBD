drop table PLANE;
/
create table companyPlane(cname VARCHAR2(20), locuri integer);
/
insert into companyPlane values ('AirBus',10);
insert into companyPlane values ('Tarom',30);
insert into companyPlane values ('BlueAir',50);
insert into companyPlane values ('AirForceOne',70);
insert into companyPlane values ('RomaniaLines',100);
insert into companyPlane values ('FlyToSky',20);
insert into companyPlane values ('Andromeda',80);
/
create table PLANE(plane_id NUMBER(10) primary key,company_name VARCHAR2(20) not null,fabrication_series VARCHAR2(20) not null unique, plane_capacity NUMBER(3) not null);
/
declare
  v_name VARCHAR2(20) :=0 ;
  v_slots NUMBER(4) :=0 ;
BEGIN
  FOR IDS IN 1..10000
  LOOP
    select cname into v_name from (select cname from COMPANYPLANE order by dbms_random.random) where rownum<2;
    select locuri into v_slots from (select locuri from COMPANYPLANE order by dbms_random.random) where rownum<2;
    INSERT INTO PLANE VALUES (IDS,v_name,DBMS_RANDOM.STRING('U',4)||IDS||DBMS_RANDOM.STRING('U',4),v_slots);
    IF MOD(IDS,10000)=0 THEN
      COMMIT;
    END IF;
  END LOOP;
END;
/
drop table companyPlane;
/
create table AJUTOR(oras VARCHAR2(20));
insert into AJUTOR values ('IASI');
insert into AJUTOR values ('BUCURESTI');
insert into AJUTOR values ('TIMISOARA');
insert into AJUTOR values ('ORADEA');
insert into AJUTOR values ('CLUJ-NAPOCA');
insert into AJUTOR values ('CONSTANTA');
insert into AJUTOR values ('BACAU');
insert into AJUTOR values ('SIBIU');
/
create table ORA1(hh1 NUMBER(10));
insert into ORA1 values(12);
insert into ORA1 values(14);
insert into ORA1 values(10);
insert into ORA1 values(8);
/*
create table ORA2(hh2 VARCHAR2(20));
insert into ORA2 values('16:00');
insert into ORA2 values('18:00');
insert into ORA2 values('20:00');
insert into ORA2 values('22:00');
*/
/
drop table FLIGHT;
create table FLIGHT(flight_id NUMBER(10) primary key, plane_id NUMBER(10) not null , flight_date DATE not null, takeoff_town VARCHAR2(20) not null, destination VARCHAR2(20) not null, takeoff_time VARCHAR(10) not null, arrival_time VARCHAR2(10) not null);
ALTER TABLE FLIGHT
  ADD CONSTRAINT plane_id_fk FOREIGN KEY (plane_id) 
    REFERENCES PLANE(plane_id);
/
DECLARE
  v_oras1 VARCHAR2(20) :=0;
  v_oras2 VARCHAR2(20) :=0;
  v_ora1 VARCHAR2(20) :=0;
  v_ora2 VARCHAR2(20) :=0;
BEGIN
  FOR FIDS IN 1..10000
  LOOP
    select hh1 into v_ora1 from (select hh1 from ORA1 order by dbms_random.random) where rownum<2;
    select oras into v_oras1 from (select oras from AJUTOR order by dbms_random.random) where rownum<2;
    select oras into v_oras2 from (select oras from AJUTOR order by dbms_random.random) where rownum<2;
    IF(v_oras1=v_oras2) THEN  
      select oras into v_oras2 from (select oras from AJUTOR where oras not like v_oras1 order by dbms_random.random) where rownum<2;
    END IF;
    
    IF (v_oras1 like '%IASI%' AND (v_oras2 like '%BUCURESTI%' OR v_oras2 like '%CONSTANTA%' OR v_oras2 like '%TIMISOARA%' OR v_oras2 like '%ORADEA%')) THEN
      INSERT INTO FLIGHT values (FIDS+1263, 10000-FIDS+1, TO_DATE (TRUNC(DBMS_RANDOM.VALUE (2451545, 5373484)), 'J'),v_oras1, v_oras2, TO_CHAR(v_ora1)||':00', TO_CHAR(v_ora1+2)||':00');
    END IF;
    IF (v_oras1 like '%IASI%' AND (v_oras2 like '%CLUJ%' OR v_oras2 like '%SIBIU%')) THEN
      INSERT INTO FLIGHT values (FIDS+1263, 10000-FIDS+1, TO_DATE (TRUNC(DBMS_RANDOM.VALUE (2451545, 5373484)), 'J'),v_oras1, v_oras2, TO_CHAR(v_ora1)||':00', TO_CHAR(v_ora1+1)||':00');
    END IF;
    IF (v_oras1 like '%IASI%' AND (v_oras2 like '%BACAU%')) THEN
      INSERT INTO FLIGHT values (FIDS+1263, 10000-FIDS+1, TO_DATE (TRUNC(DBMS_RANDOM.VALUE (2451545, 5373484)), 'J'),v_oras1, v_oras2, TO_CHAR(v_ora1)||':00', TO_CHAR(v_ora1)||':30');
    END IF;
    
    IF (v_oras1 like '%BUCURESTI%' AND (v_oras2 like '%IASI%' OR v_oras2 like '%CLUJ-NAPOCA%' OR v_oras2 like '%TIMISOARA%' OR v_oras2 like '%ORADEA%')) THEN
      INSERT INTO FLIGHT values (FIDS+1263, 10000-FIDS+1, TO_DATE (TRUNC(DBMS_RANDOM.VALUE (2451545, 5373484)), 'J'),v_oras1, v_oras2, TO_CHAR(v_ora1)||':00', TO_CHAR(v_ora1+2)||':00');
    END IF;
    IF (v_oras1 like '%BUCURESTI%' AND (v_oras2 like '%BACAU%' OR v_oras2 like '%SIBIU%' OR v_oras2 like '%CONSTANTA%')) THEN
      INSERT INTO FLIGHT values (FIDS+1263, 10000-FIDS+1, TO_DATE (TRUNC(DBMS_RANDOM.VALUE (2451545, 5373484)), 'J'),v_oras1, v_oras2, TO_CHAR(v_ora1)||':00', TO_CHAR(v_ora1)||':30');
    END IF;
    
    IF (v_oras1 like '%CONSTANTA%' AND (OR v_oras2 like '%IASI%' OR v_oras2 like '%TIMISOARA%' OR v_oras2 like '%ORADEA%' OR v_oras2 like '%CLUJ-NAPOCA%')) THEN
      INSERT INTO FLIGHT values (FIDS+1263, 10000-FIDS+1, TO_DATE (TRUNC(DBMS_RANDOM.VALUE (2451545, 5373484)), 'J'),v_oras1, v_oras2, TO_CHAR(v_ora1)||':00', TO_CHAR(v_ora1+2)||':00');
    END IF;
    IF (v_oras1 like '%CONSTANTA%' AND (v_oras2 like '%SIBIU%')) THEN
      INSERT INTO FLIGHT values (FIDS+1263, 10000-FIDS+1, TO_DATE (TRUNC(DBMS_RANDOM.VALUE (2451545, 5373484)), 'J'),v_oras1, v_oras2, TO_CHAR(v_ora1)||':00', TO_CHAR(v_ora1+1)||':00');
    END IF;
    IF (v_oras1 like '%CONSTANTA%' AND (v_oras2 like '%BACAU%' OR v_oras2 like '%BUCURESTI%')) THEN
      INSERT INTO FLIGHT values (FIDS+1263, 10000-FIDS+1, TO_DATE (TRUNC(DBMS_RANDOM.VALUE (2451545, 5373484)), 'J'),v_oras1, v_oras2, TO_CHAR(v_ora1)||':00', TO_CHAR(v_ora1)||':30');
    END IF;
    
    
    
    IF MOD(FIDS,10000)=0 THEN
      COMMIT;
    END IF;
  END LOOP;
END;
/
drop table AJUTOR;
drop table ORA1;
--drop table ORA2;
/