drop table FLIGHT2;
/
create table FLIGHT2(plane_id NUMBER(10) not null ,crew_id NUMBER(10) NOT NULL,takeoff_town VARCHAR2(20) not null, destination VARCHAR2(20) not null, takeoff_time VARCHAR(10) not null, arrival_time VARCHAR2(10) not null);
/
--CURSE DE 2 ORE DIN IASI--

--DIMINEATA--
INSERT INTO FLIGHT2 VALUES (1,1,'IASI','BUCURESTI','08:00','10:00');
INSERT INTO FLIGHT2 VALUES (2,2,'IASI','CONSTANTA','08:00','10:00');
INSERT INTO FLIGHT2 VALUES (3,3,'IASI','TIMISOARA','08:30','10:30');
INSERT INTO FLIGHT2 VALUES (4,4,'IASI','ORADEA','08:30','10:30');

--RETUR SPRE IASI DIMINEATA--
INSERT INTO FLIGHT2 VALUES (1,1,'BUCURESTI','IASI','12:00','14:00');
INSERT INTO FLIGHT2 VALUES (2,2,'CONSTANTA','IASI','12:00','14:00');
INSERT INTO FLIGHT2 VALUES (3,3,'TIMISOARA','IASI','12:30','14:30');
INSERT INTO FLIGHT2 VALUES (4,4,'ORADEA','IASI','12:30','14:30');

--SEARA--
INSERT INTO FLIGHT2 VALUES (5,1,'IASI','BUCURESTI','16:00','18:00');
INSERT INTO FLIGHT2 VALUES (6,2,'IASI','CONSTANTA','16:00','18:00');
INSERT INTO FLIGHT2 VALUES (7,3,'IASI','TIMISOARA','16:30','18:30');
INSERT INTO FLIGHT2 VALUES (8,4,'IASI','ORADEA','16:30','18:30');

--RETUR SPRE IASI SEARA--
INSERT INTO FLIGHT2 VALUES (5,1,'BUCURESTI','IASI','20:00','22:00');
INSERT INTO FLIGHT2 VALUES (6,2,'CONSTANTA','IASI','20:00','22:00');
INSERT INTO FLIGHT2 VALUES (7,3,'TIMISOARA','IASI','20:30','22:30');
INSERT INTO FLIGHT2 VALUES (8,4,'ORADEA','IASI','20:30','22:30');


--CURSE DE O ORA DIN IASI--

--DIMINEATA--
INSERT INTO FLIGHT2 VALUES (9,5,'IASI','CLUJ-NAPOCA','09:00','10:00');
INSERT INTO FLIGHT2 VALUES (10,6,'IASI','SIBIU','09:00','10:00');

--RETUR SPRE IASI DIMINEATA--
INSERT INTO FLIGHT2 VALUES (9,5,'CLUJ-NAPOCA','IASI','11:00','12:00');
INSERT INTO FLIGHT2 VALUES (10,6,'SIBIU','IASI','11:00','12:00');

--SEARA--
INSERT INTO FLIGHT2 VALUES (11,5,'IASI','CLUJ-NAPOCA','15:00','16:00');
INSERT INTO FLIGHT2 VALUES (12,6,'IASI','SIBIU','15:00','16:00');

--RETUR SPRE IASI SEARA--
INSERT INTO FLIGHT2 VALUES (11,5,'CLUJ-NAPOCA','IASI','19:00','20:00');
INSERT INTO FLIGHT2 VALUES (12,6,'SIBIU','IASI','19:00','20:00');

--CURSE DE 30 MIN DIN IASI--

--DIMINEATA--
INSERT INTO FLIGHT2 VALUES (13,7,'IASI','BACAU','09:30','10:00');

--RETUR SPRE IASI DIMINEATA--
INSERT INTO FLIGHT2 VALUES (13,7,'BACAU','IASI','11:30','12:00');

--SEARA--
INSERT INTO FLIGHT2 VALUES (14,7,'IASI','BACAU','19:30','20:00');

--RETUR SPRE IASI SEARA--
INSERT INTO FLIGHT2 VALUES (14,7,'BACAU','IASI','21:30','22:00');




--CURSE DE 2 ORE DIN BUCURESTI--

--DIMINEATA--
INSERT INTO FLIGHT2 VALUES (15,8,'BUCURESTI','CLUJ-NAPOCA','08:00','10:00');
INSERT INTO FLIGHT2 VALUES (16,9,'BUCURESTI','TIMISOARA','08:00','10:00');
INSERT INTO FLIGHT2 VALUES (17,10,'BUCURESTI','ORADEA','08:30','10:30');

--RETUR SPRE BUCURESTI DIMINEATA--
INSERT INTO FLIGHT2 VALUES (15,8,'CLUJ-NAPOCA','BUCURESTI','12:00','14:00');
INSERT INTO FLIGHT2 VALUES (16,9,'TIMISOARA','BUCURESTI','12:00','14:00');
INSERT INTO FLIGHT2 VALUES (17,10,'ORADEA','BUCURESTI','12:30','14:30');

--SEARA--
INSERT INTO FLIGHT2 VALUES (18,8,'BUCURESTI','CLUJ-NAPOCA','16:00','18:00');
INSERT INTO FLIGHT2 VALUES (19,9,'BUCURESTI','TIMISOARA','16:00','18:00');
INSERT INTO FLIGHT2 VALUES (20,10,'BUCURESTI','ORADEA','16:30','18:30');

--RETUR SPRE BUCURESTI SEARA--
INSERT INTO FLIGHT2 VALUES (18,8,'CLUJ-NAPOCA','BUCURESTI','20:00','22:00');
INSERT INTO FLIGHT2 VALUES (19,9,'TIMISOARA','BUCURESTI','20:00','22:00');
INSERT INTO FLIGHT2 VALUES (20,10,'ORADEA','BUCURESTI','20:30','22:30');


--CURSE DE 30 DE MIN DIN BUCURESTI--

--DIMINEATA--
INSERT INTO FLIGHT2 VALUES (21,11,'BUCURESTI','BACAU','09:30','10:00');
INSERT INTO FLIGHT2 VALUES (22,12,'BUCURESTI','SIBIU','09:30','10:00');
INSERT INTO FLIGHT2 VALUES (23,13,'BUCURESTI','CONSTANTA','09:30','10:00');

--RETUR SPRE BUCURESTI DIMINEATA--
INSERT INTO FLIGHT2 VALUES (21,11,'BACAU','BUCURESTI','11:30','12:00');
INSERT INTO FLIGHT2 VALUES (22,12,'SIBIU','BUCURESTI','11:30','12:00');
INSERT INTO FLIGHT2 VALUES (23,13,'CONSTANTA','BUCURESTI','11:30','12:00');

--SEARA--
INSERT INTO FLIGHT2 VALUES (24,11,'BUCURESTI','BACAU','19:30','20:00');
INSERT INTO FLIGHT2 VALUES (25,12,'BUCURESTI','SIBIU','19:30','20:00');
INSERT INTO FLIGHT2 VALUES (26,13,'BUCURESTI','CONSTANTA','19:30','20:00');

--RETUR SPRE BUCURESTI SEARA--
INSERT INTO FLIGHT2 VALUES (24,11,'BACAU','BUCURESTI','21:30','22:00');
INSERT INTO FLIGHT2 VALUES (25,12,'SIBIU','BUCURESTI','21:30','22:00');
INSERT INTO FLIGHT2 VALUES (26,13,'CONSTANTA','BUCURESTI','21:30','22:00');




--CURSE DE 2 ORE DIN CONSTANTA--

--DIMINEATA--
INSERT INTO FLIGHT2 VALUES (27,14,'CONSTANTA','TIMISOARA','08:00','10:00');
INSERT INTO FLIGHT2 VALUES (28,15,'CONSTANTA','ORADEA','08:00','10:00');
INSERT INTO FLIGHT2 VALUES (29,16,'CONSTANTA','CLUJ-NAPOCA','08:30','10:30');

--RETURN SPRE CONSTANTA DIMINEATA--
INSERT INTO FLIGHT2 VALUES (27,14,'TIMISOARA','CONSTANTA','12:00','14:00');
INSERT INTO FLIGHT2 VALUES (28,15,'ORADEA','CONSTANTA','12:00','14:00');
INSERT INTO FLIGHT2 VALUES (29,16,'CLUJ-NAPOCA','CONSTANTA','12:30','14:30');

--SEARA--
INSERT INTO FLIGHT2 VALUES (28,14,'CONSTANTA','TIMISOARA','16:00','18:00');
INSERT INTO FLIGHT2 VALUES (29,15,'CONSTANTA','ORADEA','16:00','18:00');
INSERT INTO FLIGHT2 VALUES (30,16,'CONSTANTA','CLUJ-NAPOCA','16:30','18:30');

--RETURN SPRE CONSTANTA SEARA--
INSERT INTO FLIGHT2 VALUES (28,14,'TIMISOARA','CONSTANTA','20:00','22:00');
INSERT INTO FLIGHT2 VALUES (29,15,'ORADEA','CONSTANTA','20:00','22:00');
INSERT INTO FLIGHT2 VALUES (30,16,'CLUJ-NAPOCA','CONSTANTA','20:30','22:30');


--CURSE DE O ORA DIN CONSTANTA--

--DIMINEATA--
INSERT INTO FLIGHT2 VALUES (31,17,'CONSTANTA','SIBIU','09:00','10:00');

--RETURN SPRE CONSTANTA DIMINEATA--
INSERT INTO FLIGHT2 VALUES (31,17,'SIBIU','CONSTANTA','11:00','12:00');

--SEARA--
INSERT INTO FLIGHT2 VALUES (31,17,'CONSTANTA','SIBIU','15:00','16:00');

--RETURN SPRE CONSTANTA SEARA--
INSERT INTO FLIGHT2 VALUES (31,17,'SIBIU','CONSTANTA','19:00','20:00');

--CURSE DE 30 MIN DIN CONSTANTA--

--DIMINEATA--
INSERT INTO FLIGHT2 VALUES (32,18,'CONSTANTA','BACAU','09:30','10:00');

--RETURN SPRE CONSTANTA DIMINEATA--
INSERT INTO FLIGHT2 VALUES (32,18,'BACAU','CONSTANTA','11:30','12:00');

--SEARA--
INSERT INTO FLIGHT2 VALUES (33,18,'CONSTANTA','BACAU','19:30','20:00');

--RETURN SPRE CONSTANTA SEARA--
INSERT INTO FLIGHT2 VALUES (33,18,'BACAU','CONSTANTA','21:30','22:00');




--CURSE DE 2 ORE DIN TIMISOARA--

--DIMINEATA--
INSERT INTO FLIGHT2 VALUES (34,19,'TIMISOARA','BACAU','08:00','10:00');

--RETUR SPRE TIMISOARA DIMINEATA--
INSERT INTO FLIGHT2 VALUES (34,19,'BACAU','TIMISOARA','12:00','14:00');

--SEARA--
INSERT INTO FLIGHT2 VALUES (35,19,'TIMISOARA','BACAU','16:00','18:00');

--RETUR SPRE TIMISOARA SEARA--
INSERT INTO FLIGHT2 VALUES (35,19,'BACAU','TIMISOARA','20:00','22:00');

--CURSE DE 30 MIN DIN TIMISOARA--

--DIMINEATA--
INSERT INTO FLIGHT2 VALUES (36,20,'TIMISOARA','SIBIU','09:30','10:00');
INSERT INTO FLIGHT2 VALUES (37,21,'TIMISOARA','ORADEA','09:30','10:00');
INSERT INTO FLIGHT2 VALUES (38,22,'TIMISOARA','CLUJ-NAPOCA','09:30','10:00');

--RETUR SPRE TIMISOARA DIMINEATA--
INSERT INTO FLIGHT2 VALUES (36,20,'SIBIU','TIMISOARA','11:30','12:00');
INSERT INTO FLIGHT2 VALUES (37,21,'ORADEA','TIMISOARA','11:30','12:00');
INSERT INTO FLIGHT2 VALUES (38,22,'CLUJ-NAPOCA','TIMISOARA','11:30','12:00');

--SEARA--
INSERT INTO FLIGHT2 VALUES (39,20,'TIMISOARA','SIBIU','19:30','20:00');
INSERT INTO FLIGHT2 VALUES (40,21,'TIMISOARA','ORADEA','19:30','20:00');
INSERT INTO FLIGHT2 VALUES (41,22,'TIMISOARA','CLUJ-NAPOCA','19:30','20:00');

--RETUR SPRE TIMISOARA SEARA--
INSERT INTO FLIGHT2 VALUES (39,20,'SIBIU','TIMISOARA','21:30','22:00');
INSERT INTO FLIGHT2 VALUES (40,21,'ORADEA','TIMISOARA','21:30','22:00');
INSERT INTO FLIGHT2 VALUES (41,22,'CLUJ-NAPOCA','TIMISOARA','21:30','22:00');



--CURSE DE 2 ORE DIN ORADEA--

--DIMINEATA--
INSERT INTO FLIGHT2 VALUES (42,23,'ORADEA','BACAU','08:00','10:00');

--RETUR SPRE ORADEA DIMINEATA--
INSERT INTO FLIGHT2 VALUES (42,23,'BACAU','ORADEA','12:00','14:00');

--SEARA--
INSERT INTO FLIGHT2 VALUES (43,23,'ORADEA','BACAU','16:00','18:00');

--RETUR SPRE ORADEA SEARA--
INSERT INTO FLIGHT2 VALUES (43,23,'BACAU','ORADEA','20:00','22:00');


--CURSE DE 1 ORA DIN ORADEA--

--DIMINEATA--
INSERT INTO FLIGHT2 VALUES (44,24,'ORADEA','SIBIU','09:00','10:00');

--RETUR SPRE ORADEA DIMINEATA--
INSERT INTO FLIGHT2 VALUES (44,24,'SIBIU','ORADEA','11:00','12:00');

--SEARA--
INSERT INTO FLIGHT2 VALUES (45,24,'ORADEA','SIBIU','15:00','16:00');

--RETUR SPRE ORADEA SEARA--
INSERT INTO FLIGHT2 VALUES (45,24,'SIBIU','ORADEA','19:00','20:00');

--CURSE DE 30 MIN DIN ORADEA--

--DIMINEATA--
INSERT INTO FLIGHT2 VALUES (46,25,'ORADEA','CLUJ-NAPOCA','09:30','10:00');

--RETUR SPRE ORADEA DIMINEATA--
INSERT INTO FLIGHT2 VALUES (46,25,'CLUJ-NAPOCA','ORADEA','11:30','12:00');

--SEARA--
INSERT INTO FLIGHT2 VALUES (47,25,'ORADEA','CLUJ-NAPOCA','19:30','20:00');

--RETUR SPRE ORADEA SEARA--
INSERT INTO FLIGHT2 VALUES (47,25,'CLUJ-NAPOCA','ORADEA','21:30','22:00');


--CURSE DE 30 MIN DIN BACAU--

--DIMINEATA--
INSERT INTO FLIGHT2 VALUES (48,26,'BACAU','SIBIU','09:30','10:00');
INSERT INTO FLIGHT2 VALUES (49,27,'BACAU','CLUJ-NAPOCA','09:30','10:00');

--RETUR SPRE BACAU DIMINEATA--
INSERT INTO FLIGHT2 VALUES (48,26,'SIBIU','BACAU','11:30','12:00');
INSERT INTO FLIGHT2 VALUES (49,27,'CLUJ-NAPOCA','BACAU','11:30','12:00');

--SEARA--
INSERT INTO FLIGHT2 VALUES (50,26,'BACAU','SIBIU','19:30','20:00');
INSERT INTO FLIGHT2 VALUES (51,27,'BACAU','CLUJ-NAPOCA','19:30','20:00');

--RETUR SPRE BACAU SEARA--
INSERT INTO FLIGHT2 VALUES (50,26,'SIBIU','BACAU','21:30','22:00');
INSERT INTO FLIGHT2 VALUES (51,27,'CLUJ-NAPOCA','BACAU','21:30','22:00');

--CURSE DE 30 MIN DIN SIBIU--

--DIMINEATA--
INSERT INTO FLIGHT2 VALUES (52,28,'SIBIU','CLUJ-NAPOCA','09:30','10:00');

--RETUR SPRE SIBIU DIMINEATA--
INSERT INTO FLIGHT2 VALUES (52,28,'CLUJ-NAPOCA','SIBIU','11:30','12:00');

--SEARA--
INSERT INTO FLIGHT2 VALUES (53,28,'SIBIU','CLUJ-NAPOCA','19:30','20:00');

--RETUR SPRE SIBIU SEARA--
INSERT INTO FLIGHT2 VALUES (53,28,'CLUJ-NAPOCA','SIBIU','21:30','22:00');