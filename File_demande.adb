WITH Ada.Text_IO, Ada.Integer_Text_IO,ada.Characters.Handling,liste_personnel,arbre_patients;
USE Ada.Text_Io, Ada.Integer_Text_IO,ada.Characters.Handling,liste_personnel,arbre_patients;

PACKAGE BODY File_demande IS

-----------------------------------------------------------------------------------------------------
-- utilisateur qui fait mdp oublié donc ajoute une demande
   PROCEDURE AJout_Demande (D: IN OUT T_file_dem;Demande:IN out T_Demande;L:in out t_pteurpers;A: in out t_arbre) IS
      K:Integer;
      S:String(1..15);
      Pers :T_Personnel;
      pat:t_patient;
   BEGIN
      LOOP
         BEGIN
      Put_Line("Vous etes dans la demande d un nouveau mot de passe.");
            Saisie_Identite(Demande.Identite);
            Pers.Identite_Personnel:=demande.Identite;
            pat.identite_patient:=demande.identite;
      Put_Line("Veuillez saisir le nom de jeune fille de votre mere.");
      Saisie_mot(Demande.NomJm,k);
      Put_Line("Veuillez indiquer votre fonction:");
      Get_Line(S,K);
            DEMANDE.Fonction:=Role_P'Value(S(1..K));
         IF Demande.Fonction = Patient OR Demande.Fonction = Secretaire OR Demande.Fonction = Medecin OR Demande.Fonction = Administrateur THEN
               EXIT;
         END IF;
         EXCEPTION
            WHEN Data_Error => Put_Line ("merci de saisir une fonction valide");
            WHEN Constraint_Error => Put_Line ("merci de saisir une fonction valide");
         END;
         END LOOP;
      IF D.Tetedem = NULL THEN
         D.Tetedem:= NEW T_CellDemand'(Demande,NULL);
         D.Findem:=D.Tetedem;
      ELSE
         D.FINdem.demandSUIV:= NEW T_Celldemand'(Demande,NULL);
         D.FINdem:=D.Findem.Demandsuiv;
      END IF;
      IF Demande.Fonction /= PATIENT THEN
         Recherche_1pers2(L,Pers).personnel.Demandemdp:=True;
      ELSE Recherche_Pat_Pt(A,Pat).patient.Demandemdp:=TRUE;
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
      trouve: boolean:=false;
   BEGIN
      WHILE Tmp/= NULL LOOP
         IF F.tetedem/= null then
            IF F.Tetedem.Demande.Nomjm = tmp.Personnel.Nomjm THEN
               Trouve:=True;
            END IF;
         END IF;
        tmp:=tmp.persuiv;
      END LOOP;
         RETURN (trouve);
   END Recherche_Jm;
-----------------------------------------------------------------------------------------------------   fonctionne
--   FUNCTION Recherche_PatLog (A : T_Arbre; Login : T_Titre) RETURN T_Arbre IS
--      cpt:t_arbre;
--   BEGIN
--      IF A = NULL THEN
--         RETURN (Null);
--      ELSIF A.Patient.Login = Login THEN --Trouvee dans l arbre
--         RETURN (A);
--      ELSE
--         Cpt:= Recherche_Patlog(A.Fg, Login);
--         IF Cpt = NULL THEN
--            Cpt:=Recherche_Patlog (A.Fd, Login);
--            RETURN(Cpt);
--         ELSE
--            RETURN(Cpt);
--         END IF;
--      END IF;
--   END Recherche_PatLog;
-----------------------------------------------------------------------------------------------------
   FUNCTION Recherche_fILEPAT3 (A : T_Arbre; d:t_file_dem) RETURN T_Arbre IS
      cpt:t_arbre;
   BEGIN
      IF A = NULL THEN
         RETURN (Null);
      ELSIF A.Patient.nomjm = d.tetedem.demande.nomjm THEN --Trouvee dans l arbre
         RETURN (A);
      ELSE
         Cpt:= Recherche_filepat3(A.Fg, d);
         IF Cpt = NULL THEN
            Cpt:=Recherche_filepat3(A.Fd, d);
            RETURN(Cpt);
         ELSE
            RETURN(Cpt);
         END IF;
      END IF;
   END Recherche_FILEPAT3;
-----------------------------------------------------------------------------------------------------
   FUNCTION Recherche_FilePat (A:t_arbre;Login:T_Titre;D:T_File_Dem) RETURN Boolean IS
      Log:T_Titre;
      Klogin:Integer;
      F : T_File_Dem:=D;
      Tmp:t_arbre:=a;
   BEGIN
      IF F.tetedem/=NULL THEN
      Creation_Login(F.Tetedem.Demande.Identite,Log,Klogin);
      IF tmp = NULL THEN
         RETURN(False);
      ELSIF Log = Login THEN
            IF tmp.Patient.Nomjm = f.Tetedem.Demande.Nomjm THEN
               return(true);
            eLSIF Recherche_Filepat(tmp.Fg,Login,f) THEN
            RETURN(FALSE);
         ELSE RETURN (Recherche_Filepat(tmp.Fd,Login,f));
         END IF;
      ELSE RETURN(false);
         END IF;
      ELSE
         return(false);
      END IF;

   END Recherche_Filepat;
-----------------------------------------------------------------------------------------------------
   PROCEDURE Traitement_demande(F: IN out T_File_Dem ; L:T_Pteurpers;a: in out t_arbre;login:t_titre) IS
      Erreur : Boolean;
      tmp:t_pteurpers:=l;
   BEGIN
      IF F.TETEDEM = NULL THEN
         Put_Line("Pas de demande en cours.");
      ELSE

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

                        Init_Empreinte(Tmp.Personnel.Empreintemdp);
                        tmp.personnel.demandemdp:=false;
                        Put_Line("Suppression de la demande.");
                        Suppression_Demande(F.Tetedem.Demande,F,Erreur);

               ELSIF  recherche_filepat3(A,F)/= null  THEN
                      Put_Line("Nom de jeune fille de la mere bien conforme.");
                      Put_Line("Vous allez pouvoir choisir un nouveau mot de passe pour cette personne :");
                      Init_Empreinte(A.Patient.Empreintemdp);
                      A.patient.demandemdp:=false;
                      Put_Line("Suppression de la demande.");
                      Suppression_Demande(F.Tetedem.Demande,F,Erreur);
               ELSE
                  Put_Line("Nom de jeune fille non trouve ni dans le personnel ni dans la patientele.");
                  Put_Line("Annulation de la demande.");
                  F.TETEDEM:=f.tetedem.demandsuiv;
         END IF;
      END IF;

END Traitement_Demande;
-----------------------------------------------------------------------------------------------------
END File_Demande;

