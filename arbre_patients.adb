WITH outils, patients, Ada.Characters.Handling, Ada.Text_IO, Ada.Integer_Text_IO;
USE outils, patients, Ada.Characters.Handling, Ada.Text_IO, Ada.Integer_Text_IO;

PACKAGE BODY Arbre_Patients IS

-------------------------------------------------------------------------------------------------------

   PROCEDURE Tiret (N : IN Natural) IS
   BEGIN
      FOR I IN 1..2*N LOOP
         Put ('-');
      END LOOP;
   END Tiret;

-----------------------------------------------------------------------------------------------------

   --recherche + visu 1 patient + ajout + suppression  + verif homonyme lors saisie

-----------------------------------------------------------------------------------------------------

   PROCEDURE Init_Arbre (Pat : IN OUT T_Arbre) IS
      P1 : T_Patient;
      P2 : T_Patient;
      P3 : T_Patient;
      P4 : T_Patient;
      P5 : T_Patient;
   BEGIN
      P1.Num_Patient := 1;
      P1.Identite_Patient.Nom := "Mandrake"&(9..20=>' ');
      P1.Identite_Patient.Knom := 8;
      P1.Identite_Patient.Prenom := "Alain"&(6..20=>' ');
      P1.Identite_Patient.Kprenom := 5;
      P1.Login := "MANDRAKE_ALAIN"&(15..50=>' ');
      P1.Klogin := 14;
      P1.NomJM := "Magie"&(6..20=>' ');
      P1.K_NomJM := 5;
      P1.EmpreinteMDP := 184;
      --P1.Document := NULL;
      P1.DemandeMDP := False;
      Pat := NEW T_Noeud'(P1, NULL, NULL);

      P2.Num_Patient := 2;
      P2.Identite_Patient.Nom := "Bernard"&(8..20=>' ');
      P2.Identite_Patient.Knom := 7;
      P2.Identite_Patient.Prenom := "Julie"&(6..20=>' ');
      P2.Identite_Patient.Kprenom := 5;
      P2.Login := "BERNARD_JULIE"&(14..50=>' ');
      P2.Klogin := 13;
      P2.NomJM := "Berger"&(7..20=>' ');
      P2.K_NomJM := 6;
      P2.EmpreinteMDP := 1972;
      --P2.Document := NULL;
      P2.DemandeMDP := False;
      Pat.Fg := NEW T_Noeud'(P2, NULL, NULL);

      P3.Num_Patient := 3;
      P3.Identite_Patient.Nom := "Valjean"&(8..20=>' ');
      P3.Identite_Patient.Knom := 7;
      P3.Identite_Patient.Prenom := "Jean"&(5..20=>' ');
      P3.Identite_Patient.Kprenom := 4;
      P3.Login := "VALJEAN_JEAN"&(13..50=>' ');
      P3.Klogin := 12;
      P3.NomJM := "Hugo"&(5..20=>' ');
      P3.K_NomJM := 4;
      P3.EmpreinteMDP := 1509;
      --P3.Document := NULL; --ATTENTION IL EN A, FAUT COMPLETER
      P3.DemandeMDP := False;
      Pat.Fd := NEW T_Noeud'(P3, NULL, NULL);

      P4.Num_Patient := 4;
      P4.Identite_Patient.Nom := "Bernard"&(8..20=>' ');
      P4.Identite_Patient.Knom := 7;
      P4.Identite_Patient.Prenom := "Charles"&(8..20=>' ');
      P4.Identite_Patient.Kprenom := 7;
      P4.Login := "BERNARD_CHARLES"&(16..50=>' ');
      P4.Klogin := 15;
      P4.NomJM := "Berger"&(7..20=>' ');
      P4.K_NomJM := 6;
      P4.EmpreinteMDP := 2013;
      --P4.Document := NULL;  --ATTENTION IL EN A, FAUT COMPLETER
      P4.DemandeMDP := False;
      Pat.Fg.Fg := NEW T_Noeud'(P4, NULL, NULL);

      P5.Num_Patient := 5;
      P5.Identite_Patient.Nom := "Neige"&(6..20=>' ');
      P5.Identite_Patient.Knom := 5;
      P5.Identite_Patient.Prenom := "Blanche"&(8..20=>' ');
      P5.Identite_Patient.Kprenom := 7;
      P5.Login := "NEIGE_BLANCHE"&(14..50=>' ');
      P5.Klogin := 13;
      P5.NomJM := "Perrault"&(9..20=>' ');
      P5.K_NomJM := 8;
      P5.EmpreinteMDP := 44;
      --P5.Document := NULL; --ATTENTION IL EN A, FAUT COMPLETER
      P5.DemandeMDP := False;
      Pat.Fd.Fg := NEW T_Noeud'(P5, NULL, NULL);
   END Init_Arbre;




---------------------------------------------------------------------------

   PROCEDURE Affichage_Prefixe (Pat : IN T_Arbre) IS
   BEGIN
      IF Pat /= NULL THEN
         New_Line;
         Put (Pat.Patient.Num_Patient);
         New_Line;
         Put (Pat.Patient.Identite_Patient.Nom);
         New_Line;
         Put (Pat.Patient.Identite_Patient.Prenom);
         New_Line;
         Put (Pat.Patient.Login);
         New_Line;
         Put (Pat.Patient.NomJM);
         New_Line;
         Put (Pat.Patient.EmpreinteMDP);
         New_Line;
         Tiret (5);
         Affichage_Prefixe (Pat.Fg);
         Affichage_Prefixe (Pat.Fd);
      END IF;
   END Affichage_Prefixe;

----------------------------------------------------------------------








---------------------------------------------------------------------------
--Issu du package patient
-----------------------------------------------------------------------------------------

   --faire un appel de package personnel????
   --cf package Personnel
   PROCEDURE Saisie_NOMJM (Pat : OUT T_Patient) IS
   BEGIN
      Put_Line("Veuillez saisir le nom de jeune fille de votre mere");
      Saisie_Mot(Pat.NomJM, Pat.K_Nomjm);
   END Saisie_Nomjm;
   ----------------------------------------------------------------------------
   PROCEDURE Saisie_Fonction (Pat : OUT T_Patient) IS
      S:String(1..15);
      K:integer;
   BEGIN
      Put_Line("Veuillez indiquer votre fonction:");
      Get_Line(S,K);
      Pat.Fonction:=Role_P'Value(S(1..K));
   END Saisie_Fonction;

----------------------------------------------------------------------

   FUNCTION Num_Max (A: T_Arbre) RETURN Integer IS
   BEGIN
      IF A = NULL THEN RETURN 0;
      ELSIF  A.Fg = NULL THEN
         RETURN (Integer'Max(A.Patient.Num_Patient, Num_Max (A.Fd)));
      ELSIF A.Fd = NULL THEN
         RETURN (Integer'Max (A.Patient.Num_Patient, Num_Max (A.Fg)));
      ELSE RETURN (Integer'Max (Num_Max (A.Fg), (Num_Max (A.Fd))));
      END IF;
   END;

----------------------------------------------------------------------

   --cf package Personnel
   PROCEDURE Saisie_Patient (A : in out T_Arbre; Pat : OUT T_Patient) IS
   BEGIN
      Pat.Num_Patient := Num_Max(A) + 1;
      Saisie_Identite(Pat.Identite_Patient);
      Creation_Login(Pat.Identite_Patient,Pat.Login,Pat.Klogin);
      Saisie_Nomjm(Pat);
      --faire demande mdp
      Init_Empreinte (Pat.EmpreinteMDP);
      Saisie_Fonction(Pat);
      IF Pat.Fonction /= Patient THEN Put ("erreur de saisie, veuillez choisir patient");
      END IF;
    --  Pat.Document := NULL;
      --faire saisie des docs (� partir package doc?)
      --proposez demande mdp (relier au package admin?)
      Pat.DemandeMDP := False;
   END Saisie_Patient;



END Arbre_Patients;

