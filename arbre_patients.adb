

PACKAGE BODY Arbre_Patients IS
-----------------------------------------------------------------------------------------------------
   PROCEDURE Init_Arbre (Pat : IN OUT T_Arbre;L: in out t_pteurpers) IS
      P1 : T_Patient;
      P2 : T_Patient;
      P3 : T_Patient;
      P4 : T_Patient;
      P5 : T_Patient;
      D1,D2,D3,D4,D5,D6,D7,D8:T_Document;
      M1,M2,M3 : T_Personnel;
      L3,L4,L5:t_pteurdoc;

   BEGIN
      Initialisation_pers(L);
      M1.Identite_Personnel.Nom:="SYLVESTRE"&(10..20=>' ');
      M1.Identite_Personnel.PreNom:="PIERRE"&(7..20=>' ');

      M2.Identite_Personnel.Nom:="LOVELACE"&(9..20=>' ');
      M2.Identite_Personnel.preNom:="ADA"&(4..20=>' ');

      M3.Identite_Personnel.Nom:="BOVARY"&(7..20=>' ');
      M3.Identite_Personnel.PreNom:="EMMA"&(5..20=>' ');


      P1.Identite_Patient.Nom := "MANDRAKE"&(9..20=>' ');
      P1.Identite_Patient.Knom := 8;
      P1.Identite_Patient.Prenom := "ALAIN"&(6..20=>' ');
      P1.Identite_Patient.Kprenom := 5;
      P1.Login := "MANDRAKE_ALAIN"&(15..50=>' ');
      P1.Klogin := 14;
      P1.NomJM := "MAGIE"&(6..20=>' ');
      P1.K_NomJM := 5;
      P1.EmpreinteMDP := 184;
      P1.Document := NULL;
      P1.DemandeMDP := False;
      P1.FONCTION:=Patient;
      Pat := NEW T_Noeud'(P1, NULL, NULL);

      P2.Identite_Patient.Nom := "BERNARD"&(8..20=>' ');
      P2.Identite_Patient.Knom := 7;
      P2.Identite_Patient.Prenom := "JULIE"&(6..20=>' ');
      P2.Identite_Patient.Kprenom := 5;
      P2.Login := "BERNARD_JULIE"&(14..50=>' ');
      P2.Klogin := 13;
      P2.NomJM := "BERGER"&(7..20=>' ');
      P2.K_NomJM := 6;
      P2.EmpreinteMDP := 1972;
      P2.Document := NULL;
      P2.DemandeMDP := False;
      P2.FONCTION:=Patient;
      Pat.Fg := NEW T_Noeud'(P2, NULL, NULL);

      P3.Identite_Patient.Nom := "VALJEAN"&(8..20=>' ');
      P3.Identite_Patient.Knom := 7;
      P3.Identite_Patient.Prenom := "JEAN"&(5..20=>' ');
      P3.Identite_Patient.Kprenom := 4;
      P3.Login := "VALJEAN_JEAN"&(13..50=>' ');
      P3.Klogin := 12;
      P3.NomJM := "HUGO"&(5..20=>' ');
      P3.K_NomJM := 4;
      P3.EmpreinteMDP := 1509;

      D3.id:=3;
      D3.Titre:= "Ordo du jour"&(13..50=>' ');
      D3.K_Titre:=12;
      D3.Nature:=Ordonnance;
      D3.Medecin:=Recherche_1pers2(L,M1);

      D3.ID_Lecture:=true;
      D3.Date_Creat:=(9,Avril,2025);
      D3.Date_Deracc:=(14,Avril,2025);
      D3.Date_Dermodif:=(9,Avril,2025);
      Ajout_liste_doc(L3,D3);

      D4.id:=4;
      D4.Titre:= "Repos force"&(12..50=>' ');
      D4.K_Titre:=11;
      D4.Nature:=Certificat_med;
      D4.Medecin:=Recherche_1pers2(L,M1);

      D4.ID_Lecture:=false;
      D4.Date_Creat:=(9,Avril,2025);
      D4.Date_Deracc:=(13,Avril,2025);
      D4.Date_Dermodif:=(13,Avril,2025);
      Ajout_liste_doc(L3,D4);

      D7.id:=7;
      D7.Titre:= "Nouveau traitement"&(19..50=>' ');
      D7.K_Titre:=18;
      D7.Nature:=Ordonnance;
      D7.Medecin:=Recherche_1pers2(L,M2);

      D7.ID_Lecture:=false;
      D7.Date_Creat:=(13,Avril,2025);
      D7.Date_Deracc:=(13,Avril,2025);
      D7.Date_Dermodif:=(13,Avril,2025);
      Ajout_liste_doc(L3,D7);
      P3.Document:= L3;

      P3.DemandeMDP := False;
      P3.FONCTION:=Patient;
      Pat.Fd := NEW T_Noeud'(P3, NULL, NULL);


      P4.Identite_Patient.Nom := "BERNARD"&(8..20=>' ');
      P4.Identite_Patient.Knom := 7;
      P4.Identite_Patient.Prenom := "CHARLES"&(8..20=>' ');
      P4.Identite_Patient.Kprenom := 7;
      P4.Login := "BERNARD_CHARLES"&(16..50=>' ');
      P4.Klogin := 15;
      P4.NomJM := "BERGER"&(7..20=>' ');
      P4.K_NomJM := 6;
      P4.EmpreinteMDP := 2013;

      D5.id:=5;
      D5.Titre:= "Pratique Judo"&(14..50=>' ');
      D5.K_Titre:=15;
      D5.Nature:=Certificat_med;
      D5.Medecin:=Recherche_1pers2(L,M3);

      D5.ID_Lecture:=false;
      D5.Date_Creat:=(12,Avril,2025);
      D5.Date_Deracc:=(12,Avril,2025);
      D5.Date_Dermodif:=(12,Avril,2025);
      Ajout_liste_doc(L4,D5);
      P4.Document:= L4;

      D6.id:=6;
      D6.Titre:= "Prescription Vitamines"&(23..50=>' ');
      D6.K_Titre:=22;
      D6.Nature:=Ordonnance;
      D6.Medecin:=Recherche_1pers2(L,M3);

      D6.ID_Lecture:=true;
      D6.Date_Creat:=(12,Avril,2025);
      D6.Date_Deracc:=(13,Avril,2025);
      D6.Date_Dermodif:=(12,Avril,2025);
      Ajout_liste_doc(L4,D6);
      P4.Document:= L4;

      P4.DemandeMDP := False;
      P4.FONCTION:=Patient;
      Pat.Fg.Fg := NEW T_Noeud'(P4, NULL, NULL);

      P5.Identite_Patient.Nom := "NEIGE"&(6..20=>' ');
      P5.Identite_Patient.Knom := 5;
      P5.Identite_Patient.Prenom := "BLANCHE"&(8..20=>' ');
      P5.Identite_Patient.Kprenom := 7;
      P5.Login := "NEIGE_BLANCHE"&(14..50=>' ');
      P5.Klogin := 13;
      P5.NomJM := "PERRAULT"&(9..20=>' ');
      P5.K_NomJM := 8;
      P5.EmpreinteMDP := 44;
      P5.FONCTION:=Patient;

      D1.id:=1;
      D1.Titre:= "Aptitude a la danse"&(20..50=>' ');
      D1.K_Titre:=21;
      D1.Nature:=Certificat_med;
      D1.Medecin:=Recherche_1pers2(L,M3);

      D1.ID_Lecture:=true;
      D1.Date_Creat:=(28,Mars,2025);
      D1.Date_Deracc:=(30,Mars,2025);
      D1.Date_Dermodif:=(28,Mars,2025);
      Ajout_liste_doc(L5,D1);
      P5.Document:= L5;

      D2.id:=2;
      D2.Titre:= "Maux de gorge"&(14..50=>' ');
      D2.K_Titre:=15;
      D2.Nature:=Ordonnance;
      D2.Medecin:=Recherche_1pers2(L,M2);

      D2.ID_Lecture:=true;
      D2.Date_Creat:=(4,Avril,2025);
      D2.Date_Deracc:=(4,Avril,2025);
      D2.Date_Dermodif:=(4,Avril,2025);
      Ajout_liste_doc(L5,D2);
      P5.Document:= L5;

      D8.id:=8;
      D8.Titre:= "Controle routine"&(17..50=>' ');
      D8.K_Titre:=18;
      D8.Nature:=Compte_rendu;
      D8.Medecin:=Recherche_1pers2(L,M1);

      D8.ID_Lecture:=false;
      D8.Date_Creat:=(14,Avril,2025);
      D8.Date_Deracc:=(14,Avril,2025);
      D8.Date_Dermodif:=(14,Avril,2025);
      Ajout_liste_doc(L5,D8);
      P5.Document:= L5;


      --P5.Document := NULL; --ATTENTION IL EN A, FAUT COMPLETER
      P5.DemandeMDP := False;
      Pat.Fd.Fg := NEW T_Noeud'(P5, NULL, NULL);
   END Init_Arbre;
---------------------------------------------------------------------------
   PROCEDURE Affichage_Prefixe (Pat : IN T_Arbre) IS
   BEGIN
      IF Pat /= NULL THEN
         new_line;
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
         Visu_Liste_Doc(Pat.Patient.Document);
         New_Line;
         Tiret (50);
         New_Line;
         Affichage_Prefixe (Pat.Fg);
         Affichage_Prefixe (Pat.Fd);
         NEW_Line;
      END IF;
   END Affichage_Prefixe;
----------------------------------------------------------------------
   PROCEDURE Ajout_Pat (A: IN OUT T_Arbre; Pat: in T_Patient) IS
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
--faire une saisie de l'id pour la recherche
   FUNCTION Recherche_Pat_bl (A : T_Arbre; Pat : T_Patient) RETURN Boolean IS
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

   END Recherche_Pat_bl;

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
----------------------------------------------------------------------
    PROCEDURE Suppression_Pat (A : IN OUT T_Arbre) IS
       Pat : T_Patient;
    BEGIN
       Put_Line ("Suppression d'un patient");
       Saisie_Identite (Pat.Identite_Patient);
       Supp (A, Pat);
    END Suppression_Pat;
----------------------------------------------------------------------
-- Autre fonction de recherche utilisée
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
----------------------------------------------------------------------pas testée
--PROCEDURE Saisie_1doc (ListeD: out t_pteurdoc; D: OUT T_Document;L:t_pteurpers;Date_jour: t_date;Id: out t_pers;initialisation_ID:integer;A: in out t_arbre;pat:t_pers) IS
--      Pers,PersMed :T_Personnel;
--   BEGIN
--      Saisie_Fonction1(Pers);
--      Put_Line("Veuillez saisir votre identite:");
--      Saisie_Identite(Pers.identite_personnel);
--      IF PERS.Fonction = Medecin THEN
--         IF Recherche_1pers2(L,Pers) = NULL THEN
--            Put_Line("Erreur, nous n avons pas trouve ce medecin dans la liste du personnel.");
--         ELSE
--            D.Medecin:= Recherche_1pers2(L,Pers);
--            PUT_line("Veuillez saisir le titre:");
--            Saisie_Titre(D.Titre,D.K_Titre);
--            Put_Line("Attention, vous ne pouvez ajouter qu une ordonnance ou un certificat pour ce patient.");
--            Saisie_Nature(D.Nature);
--            D.Date_Creat:=Date_Jour;
--            D.Id:= Initialisation_Id + 1;

--            Put_Line("Pour quel patient voulez vous ajouter ce document ?");
--            Saisie_Identite(ID);
--            A:=Recherche_Pat2(A,Pat);
--            Ajout_liste_doc(A.patient.document,D);
--         END IF;
--      ELSIF PERS.Fonction = Secretaire THEN
--          Put_Line("Veuillez saisir l identite du medecin :");
--          Saisie_Identite(PersMed.identite_personnel);
--         IF Recherche_1pers2(L,PersMed) = NULL THEN
--            Put_Line("Erreur, nous n avons pas trouve ce medecin dans la liste du personnel.");
--         ELSE
--             D.Medecin:= Recherche_1pers2(L,PersMed);
--             PUT_line("Veuillez saisir le titre:");
--             Saisie_Titre(D.Titre,D.K_Titre);
--             Put_Line("Attention, vous ne pouvez ajouter qu un compte-rendu de visite ou un resultat d'examen pour ce patient.");
--             Saisie_Nature(D.Nature);
--             D.Date_Creat:=Date_Jour;
--             D.Id:= Initialisation_Id + 1;
--             Put_Line("Pour quel patient voulez vous ajouter ce document ?");
--             Saisie_Identite(ID);
--             A:=Recherche_Pat2(A,Pat);
--             Ajout_liste_doc(A.patient.document,D);
--         END IF;
--      ELSE
--         Put_Line("Vous n etes pas habilites a ajouter des documents.");
--      END IF;
--   END Saisie_1doc;
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
--------------------------------------------------------------------------------------------------------------------------------------------

  FUNCTION Recherche_PatLog (A : T_Arbre; Login : T_Titre) RETURN T_Arbre IS
      cpt:t_arbre;
   BEGIN
      IF A = NULL THEN
         RETURN (Null);
      ELSIF A.Patient.Login = Login THEN --Trouvee dans l arbre
         RETURN (A);
      ELSE
         Cpt:= Recherche_Patlog(A.Fg, Login);
         IF Cpt = NULL THEN
            Cpt:=Recherche_Patlog (A.Fd, Login);
            RETURN(Cpt);
         ELSE
            RETURN(Cpt);
         END IF;
      END IF;
   END Recherche_PatLog;
--------------------------------------------------------------------------------------------------------------------------------------------
   PROCEDURE Ajout_Doc_Med (A: IN OUT T_Arbre;ListeD: IN OUT T_Pteurdoc;D: out T_Document;initialisation_id:integer;date_jour: out t_date;pers:out t_personnel;l:t_pteurpers)IS
      Pat :T_Patient;
   BEGIN
      Put_Line("Ajout d un document pour un patient.");
      Saisie_1doc(D,Initialisation_Id,Date_Jour,Pers,L);
      Ajout_Liste_Doc(ListeD,D);
      LOOP
      Put_Line("Pour quel patient voulez vous ajouter ce document?");
      Saisie_Identite(Pat.Identite_Patient);
      Creation_Login(Pat.Identite_Patient,Pat.Login,Pat.Klogin);
      IF Recherche_Pat(A,Pat) THEN
         Recherche_Patlog(A,PaT.Login).Patient.Document:=Listed;EXIT;
      ELSE
         Put_Line("Erreur de saisie. Veuillez recommencer.");
      END IF;
   END LOOP;
   END Ajout_Doc_Med;
--------------------------------------------------------------------------------------------------------------------------------------------
   PROCEDURE Visu_Doc_Pat (Pat : T_Patient) IS
   BEGIN
      Visu_liste_doc(Pat.document);
   END Visu_Doc_Pat;
--------------------------------------------------------------------------------------------------------------------------------------------
   PROCEDURE Visu_All_Document (A: T_Arbre) IS
   BEGIN
      IF A/=NULL THEN
         Visu_Liste_Doc(A.Patient.Document);
         Visu_All_Document(A.FG);
         Visu_All_Document(A.Fd);
      END IF;
   END Visu_All_Document;


END Arbre_Patients;