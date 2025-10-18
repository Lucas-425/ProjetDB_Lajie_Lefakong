use partie ; 
create table pays(id_pays varchar (50) , nom_pays varchar (50)  not null, continent varchar (50)  , primary key (id_pays)); 
create table Agent(id_agent int ,
 nom_agence varchar(50) ,
 nom_agent varchar (50) not null
 ,prenom_agent varchar (50) not null 
 , email_agent varchar(50) not null , 
 telephone_agent varchar(50)  ,
 id_pays varchar(50) not null  ,
 primary key(id_agent),
 unique(email_agent),
 foreign key (id_pays) references pays(id_pays)); 
 create table joueur ( id_joueur varchar (50)  ,
 nom_agent varchar(50) not null,
 prenom_joueur varchar(50) not null ,
 date_naissance date not null,
 statut_joueur varchar (50) not null ,
 valeur_marchande double not null ,
 pied_fort_joueur varchar (50) not null ,
 id_agent int , id_pays varchar(50),
 primary key ( id_joueur),
 foreign key (id_agent) references agent (id_agent),
 foreign key (id_pays) references pays (id_pays)); 
create table ville( id_ville int ,
nom_ville varchar(50) not null ,
id_pays varchar(50) not  null ,
 primary key (id_ville) ,
 foreign key (id_pays) references pays (id_pays)); 
 create table club (id_club varchar(50) not null,
 nom_club varchar(50) ,
 id_ville int  ,
 primary key (id_club),
 foreign key (id_ville) references ville(id_ville));
create table ligue (id_ligue int ,
nom_ligue varchar(50) not null,
 id_pays varchar(50) not null ,
 primary key (id_ligue),
 foreign key (id_pays) references pays(id_pays))  ; 
 create table evoluer (id_club varchar(50),
 id_ligue int ,
 foreign key (id_club) references club(id_club),
 foreign key (id_ligue) references ligue(id_ligue));
create table contrat (id_contrat int ,
date_debut date not null,
date_fin date not null,
 duree_contrat int not null,
 id_club varchar(50) not null ,id_joueur varchar(50) not null ,primary key (id_contrat), foreign key (id_club) references club(id_club),foreign key (id_joueur) references joueur(id_joueur));
create table avoir_nationalite(id_pays varchar(50),
id_joueur varchar(50),
foreign key(id_pays) references pays(id_pays),
foreign key (id_joueur) references joueur (id_joueur));
create table transferer(date_transfert date ,
saison_reference varchar(50),montant_transfert varchar(50) , 
type_contrat varchar(50) ,
 id_joueur varchar(50),
 id_club varchar(50),
 id_club_1 varchar (50),
 foreign key (id_joueur) references joueur(id_joueur),
 foreign key (id_club) references club(id_club),
 foreign key (id_club_1) references club(id_club));
    