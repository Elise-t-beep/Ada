WITH patients, Ada.Characters.Handling, Ada.Text_IO, Ada.Integer_Text_IO;
USE patients, Ada.Characters.Handling, Ada.Text_IO, Ada.Integer_Text_IO;

PACKAGE BODY Arbre_Patients IS
-----------------------------------------------------------------------------------------------------
--prendre les trucs de Lydia
   PROCEDURE Init_Arbre (Pat : IN OUT T_Arbre) IS
      P1 : T_Patient;
      P2 : T_Patient;
      P3 : T_Patient;
      P4 : T_Patient;
      P5 : T_Patient;
   BEGIN
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
      P1.FONCTION:=Patient;
      Pat := NEW T_Noeud'(P1, NULL, NULL);

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
      P2.FONCTION:=Patient;
      Pat.Fg := NEW T_Noeud'(P2, NULL, NULL);

      P3.Identite_Patient.Nom := "VALJEAN"&(8..20=>' ');
      P3.Identite_Patient.Knom := 7;
      P3.Identite_Patient.Prenom := "JEAN"&(5..20=>' ');
      P3.Identite_Patient.Kprenom := 4;
      P3.Login := "VALJEAN_JEAN"&(13..50=>' ');
      P3.Klogin := 12;
      P3.NomJM := "Hugo"&(5..20=>' ');
      P3.K_NomJM := 4;
      P3.EmpreinteMDP := 1509;
      --P3.Document := NULL; --ATTENTION IL EN A, FAUT COMPLETER
      P3.DemandeMDP := False;
      P3.FONCTION:=Patient;
      Pat.Fd := NEW T_Noeud'(P3, NULL, NULL);

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
      P4.FONCTION:=Patient;
      Pat.Fg.Fg := NEW T_Noeud'(P4, NULL, NULL);

      P5.Identite_Patient.Nom := "Neige"&(6..20=>' ');
      P5.Identite_Patient.Knom := 5;
      P5.Identite_Patient.Prenom := "Blanche"&(8..20=>' ');
      P5.Identite_Patient.Kprenom := 7;
      P5.Login := "NEIGE_BLANCHE"&(14..50=>' ');
      P5.Klogin := 13;
      P5.NomJM := "Perrault"&(9..20=>' ');
      P5.K_NomJM := 8;
      P5.EmpreinteMDP := 44;
      P5.FONCTION:=Patient;
      --P5.Document := NULL; --ATTENTION IL EN A, FAUT COMPLETER
      P5.DemandeMDP := False;
      Pat.Fd.Fg := NEW T_Noeud'(P5, NULL, NULL);
   END Init_Arbre;
---------------------------------------------------------------------------
   PROCEDURE Affichage_Prefixe (Pat : IN T_Arbre) IS
   BEGIN
      IF Pat /= NULL THEN
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
         Tiret (50);
         New_Line;
         Affichage_Prefixe (Pat.Fg);
         Affichage_Prefixe (Pat.Fd);
      END IF;
   END Affichage_Prefixe;

----------------------------------------------------------------------

   PROCEDURE Ajout_Pat (A : IN OUT T_Arbre; Pat : IN T_Patient) is
   BEGIN
      IF Recherche_Pat_Bl (A, Pat) THEN
         Put_Line ("ajout impossible, homonyme present");
      ELSE
         IF A = NULL THEN
            A := NEW T_Noeud'(Pat, NULL, NULL);
         ELSE
            IF Pat.Identite_Patient.Nom < A.Patient.Identite_Patient.Nom THEN
               IF A.Fg = NULL THEN
                  A.Fg := NEW T_Noeud'(Pat, NULL, NULL);
               ELSE
                  Ajout_Pat (A.Fg, Pat);
               END IF;
            ELSIF Pat.Identite_Patient.Nom = A.Patient.Identite_Patient.Nom THEN
               IF Pat.Identite_Patient.Prenom < A.Patient.Identite_Patient.Prenom THEN
                  IF A.Fg = NULL THEN
                     A.Fg := NEW T_Noeud'(Pat, NULL, NULL);
                  ELSE
                     Ajout_Pat (A.Fg, Pat);
                  END IF;
               ELSE
                  IF A.Fd = NULL THEN
                     A.Fd := NEW T_Noeud'(Pat, NULL, NULL);
                  ELSE
                     Ajout_Pat (A.Fd, Pat);
                  END IF;
               END IF;
            ELSE
               IF A.Fd = NULL THEN
                  A.Fd := NEW T_Noeud'(Pat, NULL, NULL);
               ELSE
                  Ajout_Pat (A.Fd, Pat);
               END IF;
            END IF;
         END IF;
      END IF;
   END Ajout_Pat;

----------------------------------------------------------------------

   PROCEDURE Nouveau_Pat (A: IN OUT T_Arbre) is
      Pat : T_Patient;
   BEGIN
      Put_Line ("Ajout d'un patient");
      Saisie_Patient (Pat);
      Ajout_Pat (A, Pat);
   END Nouveau_Pat;

----------------------------------------------------------------------

   FUNCTION Recherche_Pat_Bl (A : T_Arbre; Pat : T_Patient) RETURN Boolean IS
   BEGIN
      IF A = NULL THEN
         RETURN (False);
      ELSIF A.Patient.Identite_Patient.Nom = Pat.Identite_Patient.Nom THEN
         IF A.Patient.Identite_Patient.Prenom = Pat.Identite_Patient.Prenom THEN
            RETURN (True);
         ELSIF A.Patient.Identite_Patient.Prenom < Pat.Identite_Patient.Prenom THEN
            RETURN (Recherche_Pat_Bl (A.Fd, Pat));
         ELSE
            RETURN (Recherche_Pat_Bl (A.Fg, Pat));
         END IF;
      ELSIF Pat.identite_patient.nom < A.Patient.identite_patient.nom THEN
         RETURN (Recherche_Pat_Bl (A.Fg, Pat));
      ELSE
         RETURN (Recherche_Pat_Bl (A.Fd, Pat));
      END IF;
   END Recherche_Pat_Bl;

----------------------------------------------------------------------

   FUNCTION Recherche_Pat_Pt (A : T_Arbre; Pat : T_Patient) RETURN T_Arbre IS
   BEGIN
      IF A = NULL THEN
         RETURN (NULL);
      ELSIF A.Patient.Identite_Patient = Pat.Identite_Patient THEN
         RETURN (A);
      ELSIF A.Patient.Identite_Patient.Nom < Pat.Identite_Patient.Nom THEN
         RETURN (Recherche_Pat_Pt (A.Fd, Pat));
      ELSIF A.Patient.Identite_Patient.Nom = Pat.Identite_Patient.Nom THEN
         IF A.Patient.Identite_Patient.Prenom < Pat.Identite_Patient.Prenom THEN
            RETURN (Recherche_Pat_Pt (A.Fd, Pat));
         ELSE
            RETURN (Recherche_Pat_Pt (A.Fg, Pat));
         END IF;
      ELSE
         RETURN (Recherche_Pat_Pt (A.Fg, Pat));
      END IF;
   END Recherche_Pat_Pt;

----------------------------------------------------------------------

   PROCEDURE Traite_Max (A: IN OUT T_Arbre; Max : OUT T_Patient) IS
   BEGIN
      IF A.Fd = NULL THEN
         Max := A.Patient;
         A := A.Fg;
      ELSE
         Traite_Max (A.Fd, Max);
      END IF;
   END Traite_Max;


----------------------------------------------------------------------
--ajouter un "if not find put "patient non existant?"
   PROCEDURE Supp (A : IN OUT T_Arbre; Pat : T_Patient) IS
   BEGIN
      IF A /= NULL THEN
         IF Pat.Identite_Patient.Nom < A.Patient.Identite_Patient.Nom THEN
            Supp (A.Fg, Pat);
         ELSIF Pat.Identite_Patient.Nom > A.Patient.Identite_Patient.Nom THEN
            Supp (A.Fd, Pat);
         ELSIF Pat.Identite_Patient.Nom = A.Patient.Identite_Patient.Nom THEN
            IF Pat.Identite_Patient.Prenom < A.Patient.Identite_Patient.Prenom THEN
               Supp (A.Fg, Pat);
            ELSIF Pat.Identite_Patient.Prenom > A.Patient.Identite_Patient.Prenom THEN
               Supp (A.Fd, Pat);
            ELSE
               IF A.Fg = NULL THEN
                  A := A.Fd;
               ELSIF A.Fd = NULL THEN
                  A := A.Fg;
               ELSE
                  Traite_Max (A.Fg, A.Patient);
               END IF;
            END IF;
         END IF;
      END IF;
   END Supp;

--------------------------------------------------------------------

   PROCEDURE Suppression_Pat (A : IN OUT T_Arbre) IS
      Pat : T_Patient;
   BEGIN
      Put_Line ("Suppression d'un patient");
      Saisie_Identite (Pat.Identite_Patient);
      Supp (A, Pat);
   END Suppression_Pat;

--------------------------------------------------------------------

-- inutile car recherche?
--   FUNCTION Homonyme (A: IN T_Arbre; Pat : IN T_Pers) RETURN Boolean IS
--      Trouve : Boolean;
--   BEGIN
--      IF A/= NULL THEN
--         IF A.Patient.Identite_Patient = Pat THEN
--            Trouve := True;
--         ELSE
--            Trouve:=Homonyme(A.Fg,Pat);
--            IF Trouve = False THEN
--               Trouve :=Homonyme(A.Fd,Pat);
--            END IF;
--         END IF;
--      ELSE
--         Trouve:=False;
--      END IF;
--      RETURN(Trouve);
--   END Homonyme;

----------------------------------------------------------------------
PROCEDURE Saisie_1doc (D: OUT T_Document;L:t_pteurpers;Date_jour: t_date;Id: out t_pers;initialisation_ID:integer) IS
      Pers,PersMed :T_Personnel;
   BEGIN
      Put_Line("Veuillez indiquer votre fonction :");
      Saisie_Fonction1(Pers);
      Put_Line("Veuillez saisir votre identite:");
      Saisie_Identite(Pers.identite_personnel);
      IF PERS.Fonction = Medecin THEN
         IF Recherche_1pers2(L,Pers) = NULL THEN
            Put_Line("Erreur, nous n avons pas trouve ce medecin dans la liste du personnel.");
         ELSE
            D.Medecin:= Recherche_1pers2(L,Pers);
            PUT_line("Veuillez saisir le titre:");
            Saisie_Titre(D.Titre,D.K_Titre);
            Put_Line("Attention, vous ne pouvez ajouter qu une ordonnance ou un certificat pour ce patient.");
            Saisie_Nature(D.Nature);
            D.Date_Creat:=Date_Jour;
            D.Id:= Initialisation_Id + 1;

            Put_Line("Pour quel patient voulez vous ajouter ce document ?");
            Saisie_Identite(ID);
            -- Recherche dans l'arbre fonction qui retourne pointeur?
         END IF;
      ELSIF PERS.Fonction = Secretaire THEN
          Put_Line("Veuillez saisir l identite du medecin :");
          Saisie_Identite(PersMed.identite_personnel);
         IF Recherche_1pers2(L,PersMed) = NULL THEN
            Put_Line("Erreur, nous n avons pas trouve ce medecin dans la liste du personnel.");
         ELSE
             D.Medecin:= Recherche_1pers2(L,PersMed);
             PUT_line("Veuillez saisir le titre:");
             Saisie_Titre(D.Titre,D.K_Titre);
             Put_Line("Attention, vous ne pouvez ajouter qu un compte-rendu de visite ou un resultat d'examen pour ce patient.");
             Saisie_Nature(D.Nature);
             D.Date_Creat:=Date_Jour;
             Put_Line("Pour quel patient voulez vous ajouter ce document ?");
             Saisie_Identite(ID);
             -- Recherche dans l'arbre fonction qui retourne pointeur?
         END IF;
      ELSE
         Put_Line("Vous n etes pas habilites a ajouter des documents.");
      END IF;
   END Saisie_1doc;
----------------------------------------------------------------------
FUNCTION Verif_Connexion2 (A : IN T_arbre;Login:T_titre;Empreinte:integer) RETURN Boolean IS
      Trouve : Boolean;
   BEGIN
      IF A/= NULL THEN
         IF A.patient.login = Login and A.patient.empreinteMDP = Empreinte THEN
            Trouve := True;
         ELSE
            Trouve:=Verif_connexion2(A.Fg,Login,empreinte);
            IF Trouve = False THEN
               Trouve :=verif_connexion2(A.Fd,login,empreinte);
            END IF;
         END IF;
      ELSE
         Trouve:=False;
      END IF;
      RETURN(Trouve);
   END Verif_Connexion2;
----------------------------------------------------------------------

END Arbre_Patients;