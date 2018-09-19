
-- persons
insert into person values (DEFAULT, '1974-11-11', 'l', 'Ramirez', 'Colin ', 'a');
insert into person values (DEFAULT, '1975-11-14', 'l', 'Parker', 'Elsa ', 'a');
insert into person values (DEFAULT, '1977-05-31', 'l', 'Barber', 'Jordan ', 'a');
insert into person values (DEFAULT, '1979-05-05', 'l', 'Dean', 'Alice ', 'a');
insert into person values (DEFAULT, '1979-06-28', 'l', 'Berry', 'Kristy ', 'a');
insert into person values (DEFAULT, '1980-06-08', 'l', 'Klein', 'Megan ', 'a');
insert into person values (DEFAULT, '1980-12-25', 'l', 'Garrett', 'Juanita ', 'a');
insert into person values (DEFAULT, '1983-10-04', 'l', 'Mason', 'Emmett ', 'a');
insert into person values (DEFAULT, '1983-11-08', 'l', 'Greer', 'Miguel ', 'a');
insert into person values (DEFAULT, '1984-02-19', 'l', 'Caldwell', 'Terry ', 'a');
insert into person values (DEFAULT, '1985-09-27', 'l', 'Leonard', 'Lynn', 'p');
insert into person values (DEFAULT, '1986-03-29', 'l', 'Franklin', 'Dwayne', 'p');
insert into person values (DEFAULT, '1987-10-19', 'l', 'Sutton', 'Erik', 'p');
insert into person values (DEFAULT, '1989-06-28', 'l', 'Larson', 'Kate', 'p');
insert into person values (DEFAULT, '1989-07-13', 'l', 'Copeland', 'Ronnie', 'p');
insert into person values (DEFAULT, '1989-10-04', 'l', 'Lyons', 'Emilio', 'p');
insert into person values (DEFAULT, '1989-11-07', 'l', 'Robinson', 'Dominic', 'p');
insert into person values (DEFAULT, '1990-11-29', 'l', 'Walters', 'Misty', 'p');
insert into person values (DEFAULT, '1993-10-28', 'l', 'Doyle', 'Geoffrey', 'p');
insert into person values (DEFAULT, '1994-01-05', 'l', 'Bradley', 'Darla', 'p');


-- adresses
insert into adresse select pid, '53', 'Schillerstrasse', '86456', 'Gablingen' from person where vorname = 'Colin ' and nachname = 'Ramirez';
insert into adresse select pid, '89', 'Leopoldstraße', '12351', 'Berlin Buckow' from person where vorname = 'Elsa ' and nachname = 'Parker';
insert into adresse select pid, '41', 'Leipziger Straße', '37633', 'Dielmissen' from person where vorname = 'Jordan ' and nachname = 'Barber';
insert into adresse select pid, '4', 'Marseiller Strasse', '82386', 'Huglfing' from person where vorname = 'Alice ' and nachname = 'Dean';
insert into adresse select pid, '30', 'Brandenburgische Str.', '74363', 'Güglingen' from person where vorname = 'Kristy ' and nachname = 'Berry';
insert into adresse select pid, '8', 'Invalidenstrasse', '66484', 'Kleinsteinhausen' from person where vorname = 'Megan ' and nachname = 'Klein';
insert into adresse select pid, '3', 'Lietzenburger Straße', '29481', 'Karwitz' from person where vorname = 'Juanita ' and nachname = 'Garrett';
insert into adresse select pid, '46', 'Leopoldstraße', '13467', 'Berlin Frohnau' from person where vorname = 'Emmett ' and nachname = 'Mason';
insert into adresse select pid, '36', 'Hochstrasse', '24970', 'Steinbergkirche' from person where vorname = 'Miguel ' and nachname = 'Greer';
insert into adresse select pid, '22', 'Ellmenreichstrasse', '95302', 'Kulmbach' from person where vorname = 'Terry ' and nachname = 'Caldwell';
insert into adresse select pid, '74', 'Rudower Chaussee', '23566', 'Lübeck' from person where vorname = 'Lynn' and nachname = 'Leonard';
insert into adresse select pid, '34', 'Gotzkowskystrasse', '56821', 'Ellenz-Poltersdorf' from person where vorname = 'Dwayne' and nachname = 'Franklin';
insert into adresse select pid, '51', 'Alsterkrugchaussee', '91103', 'Schwabach' from person where vorname = 'Erik' and nachname = 'Sutton';
insert into adresse select pid, '66', 'Ansbacher Strasse', '55487', 'Laufersweiler' from person where vorname = 'Kate' and nachname = 'Larson';
insert into adresse select pid, '43', 'Messedamm', '06108', 'Bad Windsheim' from person where vorname = 'Ronnie' and nachname = 'Copeland';
insert into adresse select pid, '38', 'Heiligengeistbrücke', '81908', 'München' from person where vorname = 'Emilio' and nachname = 'Lyons';
insert into adresse select pid, '66', 'Brandenburgische Strasse', '76829', 'Ranschbach' from person where vorname = 'Dominic' and nachname = 'Robinson';
insert into adresse select pid, '94', 'Büsingstrasse', '85207', 'Dachau' from person where vorname = 'Misty' and nachname = 'Walters';
insert into adresse select pid, '68', 'Motzstr.', '55232', 'Ensheim' from person where vorname = 'Geoffrey' and nachname = 'Doyle';
insert into adresse select pid, '19', 'Lange Strasse', '29690', 'Grethem' from person where vorname = 'Darla' and nachname = 'Bradley';


-- krankenkasse
insert into krankenkasse values (DEFAULT, 'techniker' );
insert into krankenkasse values (DEFAULT, 'aok' );
insert into krankenkasse values (DEFAULT, 'bkk' );


-- patient
insert into patient select pid, 2, 66.0, 1.39  from person where vorname = 'Lynn' and nachname = 'Leonard';
insert into patient select pid, 1, 55.0, 1.39  from person where vorname = 'Dwayne' and nachname = 'Franklin';
insert into patient select pid, 1, 84.0, 1.87  from person where vorname = 'Erik' and nachname = 'Sutton';
insert into patient select pid, 2, 55.0, 1.43  from person where vorname = 'Kate' and nachname = 'Larson';
insert into patient select pid, 2, 96.0, 1.15  from person where vorname = 'Ronnie' and nachname = 'Copeland';
insert into patient select pid, 3, 60.0, 1.12  from person where vorname = 'Emilio' and nachname = 'Lyons';
insert into patient select pid, 1, 84.0, 1.29  from person where vorname = 'Dominic' and nachname = 'Robinson';
insert into patient select pid, 2, 84.0, 1.43  from person where vorname = 'Misty' and nachname = 'Walters';
insert into patient select pid, 3, 63.0, 1.35  from person where vorname = 'Geoffrey' and nachname = 'Doyle';
insert into patient select pid, 3, 77.0, 2.17  from person where vorname = 'Darla' and nachname = 'Bradley';


-- angestellter
insert into angestellter select pid, '2018-11-27', '2011-03-11', 2910, 'k' from person where vorname = 'Colin ' and nachname = 'Ramirez';
insert into angestellter select pid, '9999-01-01', '2011-06-17', 2863, 'k' from person where vorname = 'Elsa ' and nachname = 'Parker';
insert into angestellter select pid, '9999-01-01', '2013-03-07', 3680, 'k' from person where vorname = 'Jordan ' and nachname = 'Barber';
insert into angestellter select pid, '2019-07-08', '2013-10-08', 4375, 'k' from person where vorname = 'Alice ' and nachname = 'Dean';
insert into angestellter select pid, '9999-01-01', '2013-10-24', 3532, 'k' from person where vorname = 'Kristy ' and nachname = 'Berry';
insert into angestellter select pid, '9999-01-01', '2016-12-08', 6092, 'a' from person where vorname = 'Megan ' and nachname = 'Klein';
insert into angestellter select pid, '9999-01-01', '2017-03-09', 7676, 'a' from person where vorname = 'Juanita ' and nachname = 'Garrett';
insert into angestellter select pid, '2019-08-06', '2017-04-11', 9440, 'a' from person where vorname = 'Emmett ' and nachname = 'Mason';
insert into angestellter select pid, '9999-01-01', '2018-06-27', 6970, 'a' from person where vorname = 'Miguel ' and nachname = 'Greer';
insert into angestellter select pid, '9999-01-01', '2018-11-28', 9936, 'a' from person where vorname = 'Terry ' and nachname = 'Caldwell';


-- fachbereich
insert into fachgebiet values (DEFAULT, 'Allgemeinchirurgie');
insert into fachgebiet values (DEFAULT, 'Anästhesiologie');
insert into fachgebiet values (DEFAULT, 'Augenheilkunde');
insert into fachgebiet values (DEFAULT, 'Frauenheilkunde');
insert into fachgebiet values (DEFAULT, 'Gefäßchirurgie');
insert into fachgebiet values (DEFAULT, 'Geriatrie');
insert into fachgebiet values (DEFAULT, 'Innere Medizin');
insert into fachgebiet values (DEFAULT, 'Kinder- und Jugendheilkunde');
insert into fachgebiet values (DEFAULT, 'Kindererchirurgie');
insert into fachgebiet values (DEFAULT, 'Mund-, Kiefer- und Gesichtschirurgie');
insert into fachgebiet values (DEFAULT, 'Neurologie');
insert into fachgebiet values (DEFAULT, 'Nuklermedizin');
insert into fachgebiet values (DEFAULT, 'Orthopädie');
insert into fachgebiet values (DEFAULT, 'Radiologie');
insert into fachgebiet values (DEFAULT, 'Unfallchirurgie');


-- arzt
insert into arzt select pid, 4 from person where vorname = 'Megan ' and nachname = 'Klein';
insert into arzt select pid, 10 from person where vorname = 'Juanita ' and nachname = 'Garrett';
insert into arzt select pid, 3 from person where vorname = 'Emmett ' and nachname = 'Mason';
insert into arzt select pid, 14 from person where vorname = 'Miguel ' and nachname = 'Greer';
insert into arzt select pid, 13 from person where vorname = 'Terry ' and nachname = 'Caldwell';


-- ausbildung
insert into ausbildung values (DEFAULT, 'helden');
insert into ausbildung values (DEFAULT, 'kempfer');
insert into ausbildung values (DEFAULT, 'chiller');


-- krankenpfleger
insert into krankenpfleger values (1, 6, 1);
insert into krankenpfleger values (2, 6, 2);
insert into krankenpfleger values (3, 8, 3);
insert into krankenpfleger values (4, 10, 1);
insert into krankenpfleger values (5, 10, 2);


-- krankheit
insert into krankheit values ('AI', 'AIDS');
insert into krankheit values ('TU', 'tupacolose');
insert into krankheit values ('TE', 'tetanus');
insert into krankheit values ('GI', 'gippe');


-- behandlung
insert into behandlung values (DEFAULT, 6, 11, 'AI', '2010-12-02' );
insert into behandlung values (DEFAULT, 8, 12, 'TU', '2011-05-13' );
insert into behandlung values (DEFAULT, 8, 13, 'TE', '2011-06-20' );
insert into behandlung values (DEFAULT, 6, 14, 'TE', '2011-09-13' );
insert into behandlung values (DEFAULT, 9, 15, 'AI', '2011-11-18' );
insert into behandlung values (DEFAULT, 8, 16, 'TE', '2011-12-06' );
insert into behandlung values (DEFAULT, 8, 17, 'TE', '2012-12-20' );
insert into behandlung values (DEFAULT, 6, 18, 'AI', '2013-01-17' );
insert into behandlung values (DEFAULT, 10, 19, 'TU', '2013-03-23' );
insert into behandlung values (DEFAULT, 7, 20, 'GI', '2013-10-29' );
insert into behandlung values (DEFAULT, 9, 11, 'TU', '2014-05-12' );
insert into behandlung values (DEFAULT, 8, 12, 'TE', '2014-05-19' );
insert into behandlung values (DEFAULT, 8, 13, 'TU', '2015-01-25' );
insert into behandlung values (DEFAULT, 9, 14, 'GI', '2016-02-19' );
insert into behandlung values (DEFAULT, 10, 15, 'GI', '2017-01-04' );
insert into behandlung values (DEFAULT, 9, 16, 'TU', '2017-03-04' );
insert into behandlung values (DEFAULT, 10, 17, 'TU', '2017-04-14' );
insert into behandlung values (DEFAULT, 6, 18, 'TU', '2017-05-06' );
insert into behandlung values (DEFAULT, 10, 19, 'TU', '2017-08-18' );
insert into behandlung values (DEFAULT, 7, 20, 'TU', '2017-09-25' );
