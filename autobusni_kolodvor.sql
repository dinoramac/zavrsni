# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Dino\Documents\GitHub\zavrsni\autobusni_kolodvor.sql

drop database if exists autobusni_kolodvor;
create database autobusni_kolodvor;
use autobusni_kolodvor;

create table vozac(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11) not null
);

create table autobus(
    sifra int not null primary key auto_increment,
    broj_autobusa varchar(50) not null,
    broj_sjedala int not null,
    stanje_autobusa varchar(50)
);

create table relacija(
    sifra int not null primary key auto_increment,
    vrijeme_polaska datetime not null,
    mjesto_polaska varchar(50) not null,
    destinacija varchar(50) not null,
    trajanje int,
    vozac int,
    autobus int
);

create table rezervacija(
    sifra int not null primary key auto_increment,
    datum_rezervacije datetime not null,
    putnik int,
    relacija int
);

create table putnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(100) not null,
    datum_rodjenja varchar(50)
);

alter table relacija add foreign key (vozac) references vozac(sifra);
alter table relacija add foreign key (autobus) references autobus(sifra);

alter table rezervacija add foreign key (relacija) references relacija(sifra);
alter table rezervacija add foreign key (putnik) references putnik(sifra);

