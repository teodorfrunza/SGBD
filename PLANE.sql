drop table PLANE;
/
create table companyPlane(cname VARCHAR2(20), locuri integer);
/
insert into companyPlane values ('AirBus',10);
insert into companyPlane values ('Tarom',30);
insert into companyPlane values ('BlueAir',50);
insert into companyPlane values ('AirForceOne',70);
insert into companyPlane values ('Andromeda',20);
/
create table PLANE(plane_id NUMBER(10) primary key,company_name VARCHAR2(20) not null,fabrication_series VARCHAR2(20) not null unique, plane_capacity NUMBER(3) not null);
/
declare
  v_name VARCHAR2(20) :=0 ;
  v_slots NUMBER(4) :=0 ;
BEGIN
  FOR IDS IN 1..60
  LOOP
    select cname into v_name from (select cname from COMPANYPLANE order by dbms_random.random) where rownum<2;
    select locuri into v_slots from (select locuri from COMPANYPLANE order by dbms_random.random) where rownum<2;
    INSERT INTO PLANE VALUES (IDS,v_name,DBMS_RANDOM.STRING('U',4)||IDS||DBMS_RANDOM.STRING('U',4),v_slots);
    IF MOD(IDS,60)=0 THEN
      COMMIT;
    END IF;
  END LOOP;
END;
/
drop table companyPlane;