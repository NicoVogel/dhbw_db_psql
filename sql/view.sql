
-- drop views if exist
drop view if exists arzt_overview;
drop view if exists fachbereich_overview;
drop view if exists arzt_overview_time;
drop view if exists angestellten_overview;

-- gibt alle ärzte mit der anzahl an behandelten patienten an
create materialized view arzt_overview as 
select person.nachname, person.vorname, fachgebiet.bezeichnung, count(distinct patient.pid) as behandelte_patienten 
from arzt 
join angestellter on arzt.pid = angestellter.pid and angestellter.sub_type = 'a'
join person on person.pid = angestellter.pid
join fachgebiet on fachgebiet.id = arzt.fachgebiet
join behandlung on behandlung.arzt = arzt.pid
join patient on patient.pid = behandlung.patient
group by person.nachname, person.vorname, fachgebiet.bezeichnung;

-- pro fachbereich ärzte und patienten
create view fachbereich_overview as 
select fachgebiet.bezeichnung, zahl.arztzahl as anzahl_aerzte, count(patient.pid) as behandelte_patienten
from (
	select fachgebiet.id, count(arzt.pid) as arztzahl
	from fachgebiet
	left join arzt on fachgebiet.id = arzt.fachgebiet
	group by fachgebiet.id
) as zahl, fachgebiet
left join arzt on fachgebiet.id = arzt.fachgebiet
left join behandlung on arzt.pid = behandlung.arzt
left join patient on behandlung.patient = patient.pid
where fachgebiet.id = zahl.id
group by fachgebiet.bezeichnung, zahl.arztzahl;

-- arzt overview mit zeit
create view arzt_overview_time as
select person.nachname, person.vorname, fachgebiet.bezeichnung, p.pfleger,count(patient.pid) as behandelte_patienten
from (
	select arzt.pid, string_agg(person.nachname || ' ' || person.vorname, ', ') as pfleger
	from arzt
	left join krankenpfleger on arzt.pid = krankenpfleger.arzt
	left join angestellter on krankenpfleger.pid = angestellter.pid and angestellter.sub_type = 'k'
	left join person on angestellter.pid = person.pid
	group by arzt.pid
) as p ,arzt 
join angestellter on arzt.pid = angestellter.pid and angestellter.sub_type = 'a'
join person on person.pid = angestellter.pid
join fachgebiet on fachgebiet.id = arzt.fachgebiet
join behandlung on behandlung.arzt = arzt.pid
join patient on patient.pid = behandlung.patient
where p.pid = arzt.pid
and behandlung.behandlungsdatum > CURRENT_DATE - INTERVAL '1 year'
group by person.nachname, person.vorname, fachgebiet.bezeichnung, p.pfleger;

-- angestellten overview
create view angestellten_overview as
select person.pid, person.geburtstag, person.familienstand, person.nachname, person.vorname, ausbildung.bezeichnung, adresse.ort, adresse.strasse, 
adresse.hausnummer, adresse.postleitzahl, angestellter.einstellungsdatum, angestellter.vertragsende
from angestellter
join krankenpfleger on angestellter.pid = krankenpfleger.pid and angestellter.sub_type = 'k'
join ausbildung on krankenpfleger.ausbildung = ausbildung.id
join person on angestellter.pid = person.pid
join adresse on person.pid = adresse.pid
union all
select person.pid, person.geburtstag, person.familienstand, person.nachname, person.vorname, fachgebiet.bezeichnung, adresse.ort, adresse.strasse, 
adresse.hausnummer, adresse.postleitzahl, angestellter.einstellungsdatum, angestellter.vertragsende
from angestellter
join arzt on arzt.pid = angestellter.pid and angestellter.sub_type = 'a'
join fachgebiet on arzt.fachgebiet = fachgebiet.id
join person on angestellter.pid = person.pid
join adresse on person.pid = adresse.pid
