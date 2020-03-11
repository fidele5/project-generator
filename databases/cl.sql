create table client
(
    id      int auto_increment
        primary key,
    nom     varchar(100) not null,
    postnom varchar(45)  not null,
    adresse varchar(45)  not null,
    mail    varchar(45)  not null
);

create table compte
(
    id          int auto_increment
        primary key,
    numCompte   varchar(45) not null,
    proprio     int         not null,
    solde       double      not null,
    typeCompte  varchar(45) not null,
    decouvert   double      not null,
    tauxInteret double      not null,
    constraint fk_Compte_Client
        foreign key (proprio) references client (id)
);

create index fk_Compte_Client_idx
    on compte (proprio);

create table operation
(
    id            int auto_increment
        primary key,
    numOperation  mediumtext  not null,
    Compte_id     int         not null,
    dateOperation varchar(10) not null,
    montant       double      not null,
    typeOperation varchar(45) not null,
    constraint fk_Operation_Compte1
        foreign key (Compte_id) references compte (id)
);

create index fk_Operation_Compte1_idx
    on operation (Compte_id);

