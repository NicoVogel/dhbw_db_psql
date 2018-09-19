--drop all tables
drop table if exists hatmedikament;
drop table if exists behandlung;
drop table if exists eingesetzt;
drop table if exists wechselwirkung;
drop table if exists medikament;
drop table if exists hatsymptom;
drop table if exists krankheit;
drop table if exists symptom;
drop table if exists patient;
drop table if exists krankenkasse;
drop table if exists krankenpfleger;
drop table if exists ausbildung;
drop table if exists arzt;
drop table if exists fachgebiet;
drop table if exists angestellter;
drop table if exists adresse;
drop table if exists person;

-- create tables
create table person(
	pid serial primary key,
	geburtstag date not null,
	familienstand char(1) not null check(familienstand <> ''),
	nachname text not null check(nachname <> ''),
	vorname text not null check(vorname <> ''),
	sub_type char(1) not null check(sub_type = 'a' or sub_type = 'p')
);
create table adresse(
	pid int not null references person (pid),
	hausnummer text not null check(hausnummer <> ''),
	strasse text not null check(strasse <> ''),
	postleitzahl text not null check(postleitzahl <> ''),
	ort text not null check(ort <> ''),
	primary key (pid)
);
create table angestellter(
	pid int not null references person (pid),
	vertragsende date not null,
	einstellungsdatum date not null,
	jaehrlichesgehalt numeric(10,2) not null check(jaehrlichesgehalt <> 0),
	sub_type char(1) not null check(sub_type = 'k' or sub_type = 'a'),
	primary key (pid)
);
create table fachgebiet(
	id serial primary key,
	bezeichnung text not null check(bezeichnung <> '')
);
create table arzt(
	pid int not null references person (pid),
	fachgebiet int not null references fachgebiet (id),
	primary key (pid)
);
create table ausbildung(
	id serial primary key,
	bezeichnung text not null check(bezeichnung <> '')
);
create table krankenpfleger(
	pid int not null references person (pid),
	arzt int not null references arzt (pid),
	ausbildung int not null references ausbildung (id),
	primary key (pid)
);
create table krankenkasse(
	id serial primary key,
	bezeichnung text not null check(bezeichnung <> '')
);
create table patient(
	pid int not null references person (pid),
	krankenkasse int not null references krankenkasse (id),
	gewicht numeric(6,3) not null check(gewicht <> 0),
	groesse numeric(5,2) not null check(groesse <> 0),
	primary key (pid)
);
create table symptom(
	id serial primary key,
	bezeichnung text not null check(bezeichnung <> '')
);
create table krankheit(
	whoid text primary key check(whoid <> ''),
	name text not null check(whoid <> '')
);
create table hatsymptom(
	whoid text references krankheit (whoid),
	symptom int references symptom (id),
	primary key (whoid, symptom)
);
create table medikament(
	znr text primary key check(znr <> ''),
	name text not null check(name <> '')
);
create table wechselwirkung(
	znr_first text references medikament(znr),
	znr_second text references medikament(znr),
	bemerkung text,
	primary key (znr_first, znr_second)
);
create table eingesetzt(
	znr text references medikament (znr),
	whoid text references krankheit (whoid),
	primary key (znr, whoid)
);
create table behandlung(
	behnr serial primary key,
	arzt int not null references arzt (pid),
	patient int not null references patient (pid),
	krankheit text not null references krankheit (whoid),
	behandlungsdatum date not null
);
create table hatmedikament(
	behnr int references behandlung (behnr),
	znr text references medikament (znr),
	primary key (behnr, znr)
);
