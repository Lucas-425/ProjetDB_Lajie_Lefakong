use partie ; 
ALTER TABLE pays
ADD CONSTRAINT chk_continent CHECK (continent IN ('Europe', 'Afrique', 'Asie', 'Amérique', 'Océanie'));

ALTER TABLE pays
ADD CONSTRAINT unq_nom_pays UNIQUE (nom_pays);
ALTER TABLE agent
ADD CONSTRAINT chk_email_agent CHECK (email_agent LIKE '%@%.%');

ALTER TABLE agent
ADD CONSTRAINT chk_tel_agent CHECK (telephone_agent > 1000000);

ALTER TABLE agent
ADD CONSTRAINT unq_email_agent UNIQUE (email_agent);
ALTER TABLE joueur
ADD CONSTRAINT chk_valeur_marchande CHECK (valeur_marchande >= 0);

ALTER TABLE joueur
ADD CONSTRAINT chk_pied_fort CHECK (pied_fort_joueur IN ('Gauche', 'Droit', 'Ambidextre'));

ALTER TABLE joueur
ADD CONSTRAINT chk_statut_joueur CHECK (statut_joueur IN ('Actif', 'Retraité', 'Libre'));
ALTER TABLE ville
ADD CONSTRAINT unq_nom_ville UNIQUE (nom_ville, id_pays);
ALTER TABLE club
ADD CONSTRAINT unq_nom_club UNIQUE (nom_club, id_ville);
ALTER TABLE ligue
ADD CONSTRAINT unq_nom_ligue UNIQUE (nom_ligue, id_pays);
ALTER TABLE evoluer
ADD CONSTRAINT pk_evoluer PRIMARY KEY (id_club, id_ligue);
ALTER TABLE contrat
ADD CONSTRAINT chk_dates_contrat CHECK (date_fin > date_debut);

ALTER TABLE contrat
ADD CONSTRAINT chk_duree_positive CHECK (duree_contrat > 0);

ALTER TABLE contrat
ADD CONSTRAINT unq_contrat UNIQUE (id_joueur, id_club, date_debut);
ALTER TABLE avoir_nationalite
ADD CONSTRAINT pk_avoir_nationalite PRIMARY KEY (id_pays, id_joueur);
ALTER TABLE transferer
ADD CONSTRAINT chk_montant_transfert CHECK (montant_transfert >= 0);
ALTER TABLE transferer
ADD CONSTRAINT chk_type_contrat CHECK (type_contrat IN ('Prêt', 'Achat définitif', 'Libre'));
ALTER TABLE transferer
ADD CONSTRAINT chk_club_different CHECK (id_club <> id_club_1);
