WITH Ada.Text_IO, Ada.Integer_Text_IO,ada.Characters.Handling,liste_personnel,arbre_patients;
USE Ada.Text_Io, Ada.Integer_Text_IO,ada.Characters.Handling,liste_personnel,arbre_patients;

PACKAGE BODY File_demande IS

-----------------------------------------------------------------------------------------------------
-- utilisateur qui fait mdp oublie donc ajoute une demande
   PROCEDURE AJout_Demande (D: IN OUT T_file_dem;Demande:IN out T_Demande) IS
      K:Integer;
      s:string(1..15);
   BEGIN
      Put_Line("Vous etes dans la demande d un nouveau mot de passe.");
      Saisie_Identite(Demande.Identite);
      Put_Line("Veuillez saisir le nom de jeune fille de votre mere.");
      Saisie_mot(Demande.NomJm,k);
      Put_Line("Veuillez indiquer votre fonction:");
      Get_Line(S,K);
      DEMANDE.Fonction:=Role_P'Value(S(1..K));
      IF D.Tetedem = NULL THEN
         D.Tetedem:= NEW T_CellDemand'(Demande,NULL);
         D.Findem:=D.Tetedem;
      ELSE
         D.FINdem.demandSUIV:= NEW T_Celldemand'(Demande,NULL);
         D.FINdem:=D.Findem.Demandsuiv;
      END IF;
   END Ajout_Demande;
-----------------------------------------------------------------------------------------------------

   PROCEDURE Suppression_Demande (Demande : out T_Demande; F : IN OUT T_File_Dem;Erreur : OUT Boolean)IS
   BEGIN
      IF F.Findem /=NULL THEN
         Erreur := False;
         Demande:= F.Tetedem.demande;
         F.Tetedem:=F.Tetedem.Demandsuiv;
         IF F.Tetedem = NULL THEN
            F.Findem:=NULL;
         END IF;
      ELSE Erreur:= True;
      END IF;
   END Suppression_Demande;
-----------------------------------------------------------------------------------------------------

   PROCEDURE Visu_1demande (Demande : IN T_Demande) IS
   BEGIN
      Put_Line("Identite:");
      put_line("Nom:");
      Put(Demande.Identite.Nom); new_line;
      put_line("Prenom:");
      Put(Demande.Identite.prenom);new_line;
      Put_line("Nom de la mere:");
      Put(Demande.NomJm);new_line;
      Put_Line("Fonction:");
      Put(Role_P'Image(demande.Fonction));new_line;
   END Visu_1demande;
-----------------------------------------------------------------------------------------------------

   PROCEDURE Visu_File_Demande (F: IN T_File_Dem) IS
      Tmp:T_Pteurdemand:=F.Tetedem;
   BEGIN
      WHILE TMP/= NULL LOOP
           FOR I IN 1..100 LOOP
            Put('-');
         END LOOP;
         new_line;
         Visu_1demande(TMP.demande);
         Tmp:=Tmp.demandSuiv;
      END LOOP;
   END Visu_File_Demande;
-----------------------------------------------------------------------------------------------------
   FUNCTION Recherche_Jm (F: t_file_dem; L:in T_Pteurpers) RETURN boolean IS
      Tmp: T_Pteurpers:=L;
      trouve: boolean;
   BEGIN
      WHILE Tmp/=NULL LOOP
         IF F.tetedem/=null then
         IF F.Tetedem.Demande.Nomjm = tmp.Personnel.Nomjm THEN
            Trouve:=True;
         ELSE
            Trouve:=False;
            END IF;
         ELSE
            Trouve:=False;
         END IF;
         tmp:=tmp.persuiv;
      END LOOP;
         RETURN (trouve);
   END Recherche_Jm;
-----------------------------------------------------------------------------------------------------
--pb avec les feuilles de l'arbre?
--   FUNCTION Recherche_Patlog (A : T_Arbre; Login: T_Titre) RETURN T_Arbre IS
--      Cpt : T_Arbre;
--   BEGIN
--      IF A = NULL THEN
--         RETURN (NULL);
--      ELSIF A.Patient.Login = Login THEN
--         RETURN (A);
--      ELSE
--         Cpt := Recherche_Patlog (A.Fg, Login);
--         IF Cpt = NULL THEN
--            Cpt := Recherche_Patlog (A.Fd, Login);
--            RETURN (Cpt);
--         ELSE
--            RETURN (Cpt);
--         END IF;
--      END IF;
--   END Recherche_Patlog;

-----------------------------------------------------------------------------------------------------
   FUNCTION Recherche_FilePat3 (A:t_arbre; D:T_File_Dem) RETURN t_arbre IS
      Cpt : T_Arbre;
   BEGIN
      IF A = NULL THEN
         RETURN (NULL);
      ELSIF A.Patient.Nomjm = D.Tetedem.Demande.Nomjm THEN
         RETURN (A);
      ELSE
         Cpt := Recherche_Filepat3 (A.Fg, D);
         IF Cpt = NULL THEN
            Cpt := Recherche_Filepat3 (A.Fd, D);
            RETURN (Cpt);
         ELSE
            RETURN (Cpt);
         END IF;
      END IF;
   END Recherche_Filepat3;

---------------------------------------------------------------------------------------
   FUNCTION Recherche_Filepat (A: T_Arbre; Login : T_Titre; D: T_File_Dem) RETURN Boolean IS
      Log : T_Titre;
      Klogin : Integer;
   BEGIN
      IF D.Tetedem /= NULL THEN
      Creation_Login(D.Tetedem.Demande.Identite,Log,Klogin);
      IF A = NULL THEN
         RETURN (False);
      ELSIF Log = Login THEN
         IF A.Patient.Nomjm = D.Tetedem.Demande.Nomjm THEN
            RETURN (False);
         ELSIF Recherche_Filepat (A.Fg, Login, D) THEN
            RETURN (False);
         ELSE RETURN (Recherche_Filepat (A.Fd, Login, D));
         END IF;
      ELSE RETURN (True);
         END IF;
      ELSE RETURN (True);
      END IF;

   END Recherche_Filepat;

-----------------------------------------------------------------------------------------------------
--   FUNCTION Recherche_FilePat2 (A:t_arbre;D:T_File_Dem) RETURN boolean IS
 --      Log:T_Titre;
 --      Klogin:integer;
 --   BEGIN
 --      Creation_Login(D.Tetedem.demande.Identite,Log,Klogin);
 --      IF Log = A.patient.login THEN
 --         IF A.Patient.Nomjm = D.Tetedem.Demande.Nomjm THEN
 --            RETURN(true);
 --         ELSE
 --            RETURN (False);
 --         END IF;
 --      ELSE
 --         RETURN (False);
 --      END IF;
 --   END Recherche_Filepat2;
 -----------------------------------------------------------------------------------------------------
   -- Traitement de la demande de nouveau mot de passe.
   PROCEDURE Traitement_demande(F: IN out T_File_Dem ; L:T_Pteurpers; a:in out t_arbre; login : t_titre) IS
      Erreur : Boolean;
      tmp:t_pteurpers:=l;
   BEGIN
      Put("Voici le nom de jeune fille de la premiere demande a traiter:");
      Put(F.Tetedem.Demande.NOMJM); New_Line;

               IF recherche_jm(F,L) THEN
                  Put_Line("Nom de jeune fille de la mere bien conforme.");
                  Put_Line("Vous allez pouvoir choisir un nouveau mot de passe pour cette personne :");
                     WHILE Tmp.personnel.nomjm /=F.Tetedem.Demande.NOMJM LOOP
                        Tmp:=Tmp.Persuiv;
                     END LOOP;

                        Put(tmp.Personnel.Identite_Personnel.Nom); new_line;
                        Put(tmp.Personnel.Identite_Personnel.Prenom);New_Line;

                        Init_Empreinte(tmp.Personnel.Empreintemdp);
                        Put_Line("Suppression de la demande.");
                        Suppression_Demande(F.Tetedem.Demande,F,Erreur);
               ELSIF  Recherche_filepat3(A,F) /= NULL THEN
                      Put_Line("Nom de jeune fille de la mere bien conforme.");
                      Put_Line("Vous allez pouvoir choisir un nouveau mot de passe pour cette personne :");
                      Init_Empreinte(A.Patient.Empreintemdp);
                       Put_Line("Suppression de la demande.");
                       Suppression_Demande(F.Tetedem.Demande,F,Erreur);
                ELSE
                   Put_Line("Nom de jeune fille non trouve ni dans le personnel ni dans la patientele.");
                   Put_Line("Annulation de la demande.");
                   F.TETEDEM:=f.tetedem.demandsuiv;
      END IF;

   END Traitement_Demande;

-----------------------------------------------------------------------------------------------------

END File_Demande;

