WITH Ada.Text_IO, Ada.Integer_Text_IO,ada.Characters.Handling,outils,personnel;
USE Ada.Text_Io, Ada.Integer_Text_IO,ada.Characters.Handling,outils,personnel;
PACKAGE BODY Liste_Personnel IS
-----------------------------------------------------------------------------------------------------
   PROCEDURE Initialisation_Pers (L:IN OUT T_Pteurpers) IS
      L1,L2,L3,L4,L5,L6:T_Personnel;
   BEGIN
      L1.Identite_Personnel.Nom:="LOVELACE"&(9..20=>' ');
      L1.Identite_Personnel.Knom:=8;
      L1.Identite_Personnel.preNom:="ADA"&(4..20=>' ');
      L1.Identite_Personnel.Kprenom:=3;
      L1.Nomjm:="BYRON"&(6..20=>' ');
      L1.K_nomjm:=5;
      L1.Login:="LOVELACE_ADA"&(13..50=>' ');
      L1.Empreintemdp:=1263;
      L1.Fonction:=Medecin;
      L1.Demandemdp:=FALSE;
      L:=NEW T_Cellpers'(L1,NULL);

      L2.Identite_Personnel.Nom:="EYRE"&(5..20=>' ');
      L2.Identite_Personnel.Knom:=4;
      L2.Identite_Personnel.preNom:="JANE"&(5..20=>' ');
      L2.Identite_Personnel.Kprenom:=4;
      L2.Nomjm:="BRONTE"&(7..20=>' ');
      L2.K_nomjm:=6;
      L2.Login:="EYRE_JANE"&(10..50=>' ');
      L2.Empreintemdp:=1158;
      L2.Fonction:=Secretaire;
      L2.Demandemdp:=FALSE;
      L:=NEW T_Cellpers'(L2,L);

      L3.Identite_Personnel.Nom:="SYLVESTRE"&(10..20=>' ');
      L3.Identite_Personnel.Knom:=9;
      L3.Identite_Personnel.preNom:="PIERRE"&(7..20=>' ');
      L3.Identite_Personnel.Kprenom:=6;
      L3.Nomjm:="RAYNAL"&(7..20=>' ');
      L3.K_nomjm:=6;
      L3.Login:="SYLVESTRE_PIERRE"&(17..50=>' ');
      L3.Empreintemdp:=1234;
      L3.Fonction:=MEDECIN;
      L3.Demandemdp:=FALSE;
      L:=NEW T_Cellpers'(L3,L);

      L4.Identite_Personnel.Nom:="LAMPION"&(8..20=>' ');
      L4.Identite_Personnel.Knom:=7;
      L4.Identite_Personnel.preNom:="SERAPHIN"&(9..20=>' ');
      L4.Identite_Personnel.Kprenom:=8;
      L4.Nomjm:="HERGE"&(6..20=>' ');
      L4.K_nomjm:=5;
      L4.Login:="LAMPION_SERAPHIN"&(17..50=>' ');
      L4.Empreintemdp:=1720;
      L4.Fonction:=Secretaire;
      L4.Demandemdp:=FALSE;
      L:=NEW T_Cellpers'(L4,L);

      L5.Identite_Personnel.Nom:="BOVARY"&(7..20=>' ');
      L5.Identite_Personnel.Knom:=6;
      L5.Identite_Personnel.preNom:="EMMA"&(5..20=>' ');
      L5.Identite_Personnel.Kprenom:=4;
      L5.Nomjm:="FLAUBERT"&(9..20=>' ');
      L5.K_nomjm:=8;
      L5.Login:="BOVARY_EMMA"&(12..50=>' ');
      L5.Empreintemdp:=1119;
      L5.Fonction:=MEDECIN;
      L5.Demandemdp:=FALSE;
      L:=NEW T_Cellpers'(L5,L);

      L6.Identite_Personnel.Nom:="LADMIN"&(7..20=>' ');
      L6.Identite_Personnel.Knom:=6;
      L6.Identite_Personnel.preNom:="LUCIEN"&(7..20=>' ');
      L6.Identite_Personnel.Kprenom:=6;
      L6.Nomjm:="MUM"&(4..20=>' ');
      L6.K_nomjm:=3;
      L6.Login:="LADMIN_LUCIEN"&(14..50=>' ');
      L6.Empreintemdp:=194;
      L6.Fonction:=ADMINISTRATEUR;
      L6.Demandemdp:=FALSE;
      L:=NEW T_Cellpers'(L6,L);

   END Initialisation_Pers;
-----------------------------------------------------------------------------------------------------
   PROCEDURE Visualisation_Liste_Pers (L: IN T_Pteurpers)IS
      tmp:t_pteurpers:=L;
   BEGIN
      put_line("Voici la liste du personnel:");
      WHILE Tmp/=NULL LOOP
         FOR I IN 1..100 LOOP
            Put('-');
         END LOOP;
         new_line;
         Visu_1personnel(TMP.Personnel);
         Tmp:=Tmp.perSuiv;
      END LOOP;
   END Visualisation_Liste_Pers;
-----------------------------------------------------------------------------------------------------
   FUNCTION Recherche_1pers (L: IN T_Pteurpers; Pers : IN T_Pers) RETURN Boolean IS
      Trouve : Boolean;
   BEGIN
      IF L/= NULL THEN
         IF L.Personnel.Identite_Personnel = Pers THEN
            Trouve := True;
         ELSE
           trouve:=recherche_1pers(L.persuiv,pers);
         END IF;
      ELSE
         Trouve:=False;
      END IF;
      RETURN(Trouve);
   END Recherche_1pers;
-----------------------------------------------------------------------------------------------------
  FUNCTION Recherche_1pers2 (L: IN T_Pteurpers; Pers : IN T_Personnel) RETURN t_pteurpers IS
   BEGIN
      IF L= NULL THEN
         RETURN(NULL);
      ELSIF L.Personnel.Identite_Personnel = Pers.identite_personnel THEN
         RETURN(L);
      ELSE
         RETURN(Recherche_1pers2(L.Persuiv,Pers));
      END IF;
   END Recherche_1pers2;
-----------------------------------------------------------------------------------------------------
   PROCEDURE Ajout_Pers (L: OUT T_Pteurpers) IS
      Pers: t_personnel;
   BEGIN
      FOR I IN 1..100 LOOP
         Put('-');
      END LOOP;
      New_line;
      put_line("Creation d un compte pour un nouvel employe:");
      Put_line("Quelle personne voulez-vous ajouter?");
      Saisie_Identite(Pers.Identite_Personnel);
      put_line("Verification si homonyme dans les employes");

      IF Recherche_1PERS(L,Pers.identite_personnel) THEN
         Put_line("Ajout Impossible car Homonyme");
      ELSE
         put_line("Cette personne n a pas d'homonyme, procedure d'ajout :");
         Saisie_Personnel(Pers);
         L:=NEW T_CellPers'(Pers,L);
      END IF;
   END Ajout_Pers;
-----------------------------------------------------------------------------------------------------
-- Pas encore testée la verif connexion je savais pas comment faire pour l'instant
   FUNCTION Verif_Connexion (L : IN T_Pteurpers;Login:T_titre;Empreinte:integer) RETURN Boolean IS
      Trouve : Boolean;
   BEGIN
      IF L/= NULL THEN
         IF L.personnel.login = Login and L.personnel.empreinteMDP = Empreinte THEN
            Trouve := True;
         ELSE
           trouve:=Verif_Connexion(L.persuiv,login,empreinte);
         END IF;
      ELSE
         Trouve:=False;
      END IF;
      RETURN(Trouve);
   END Verif_Connexion;
-----------------------------------------------------------------------------------------------------
--   PROCEDURE Connexion_Pers ( L: T_Pteurpers;Login : T_Titre; Empreinte : Integer; Fonction : Role_P) IS
--   BEGIN
--      LOOP
--      IF Verif_Connexion (L,Login,Empreinte) THEN
--            Put_Line("Utilisateur trouve dans le personnel");
--         IF Fonction = Medecin THEN
--               Put("Envoie vers le menu Personnel Medecin");
--         ELSIF
--               Fonction = Administrateur THEN
--               Put("Envoie vers le menu Personnel Secretaire");
--         ELSIF
--               Fonction = Secretaire THEN
--               Put("Envoie vers le menu Personnel Secretaire");
--         ELSE
--            Put("Erreur de saisie.");
--         END IF;
--      ELSE
--            Put_Line("Personne non presente dans la liste du personnel, veuillez recommencez la connexion.");
--            Cpt:=Cpt+1;
--            IF Cpt = 3 THEN
--
--      END IF;
--   END Connexion_Pers;
-----------------------------------------------------------------------------------------------------
      PROCEDURE Supp_1Pers (L: IN OUT T_Pteurpers;Pers: OUT T_personnel; Erreur:OUT Boolean)IS
   BEGIN
      IF L = NULL THEN
         Erreur:=True; New_Line;
      ELSE
         Pers := L.personnel;
         Erreur:=False;
         L:= L.persuiv;
      END IF;
   END supp_1Pers;
-----------------------------------------------------------------------------------------------------
   PROCEDURE Supp_Secretaire (L:IN OUT T_Pteurpers;Id: out t_pers;Pers : out t_personnel) IS
      Tmp: T_Pteurpers:=L;
      erreur: boolean;
   BEGIN
      Saisie_identite(Id);
      WHILE Tmp/=NULL LOOP
         IF Id = Tmp.Personnel.Identite_Personnel THEN
            IF Tmp.Personnel.Fonction = Secretaire THEN
               supp_1Pers(L,Tmp.Personnel,Erreur);
               Pers:= tmp.personnel;
            END IF;
         END IF;
         Tmp:=Tmp.perSuiv;
      END LOOP;
   END Supp_Secretaire;
-----------------------------------------------------------------------------------------------------


END Liste_Personnel;

