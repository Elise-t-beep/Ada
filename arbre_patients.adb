

PACKAGE BODY Arbre_Patients IS
-----------------------------------------------------------------------------------------------------
   PROCEDURE Init_Arbre (Pat : IN OUT T_Arbre;L: in out t_pteurpers) IS -- procedure d'initialisation de l'arbre.
      P1 : T_Patient;
      P2 : T_Patient;
      P3 : T_Patient;
      P4 : T_Patient;
      P5 : T_Patient;
      D1,D2,D3,D4,D5,D6,D7,D8:T_Document;

      L3,L4,L5:t_pteurdoc;

  BEGIN
      Initialisation_pers(L);

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
      D3.Nature:=ORDONNANCE;
      D3.medecin:=L.persuiv.persuiv.persuiv;

      D3.ID_Lecture:=true;
      D3.Date_Creat:=(9,Avril,2025);
      D3.Date_Deracc:=(14,Avril,2025);
      D3.Date_Dermodif:=(9,Avril,2025);
      Ajout_liste_doc(L3,D3);

      D4.id:=4;
      D4.Titre:= "Repos force"&(12..50=>' ');
      D4.K_Titre:=11;
      D4.Nature:=CERTIFICAT_MED;
      D4.medecin:=L.persuiv.persuiv.persuiv;

      D4.ID_Lecture:=false;
      D4.Date_Creat:=(9,Avril,2025);
      D4.Date_Deracc:=(13,Avril,2025);
      D4.Date_Dermodif:=(13,Avril,2025);
      Ajout_liste_doc(L3,D4);

      D7.id:=7;
      D7.Titre:= "Nouveau traitement"&(19..50=>' ');
      D7.K_Titre:=18;
      D7.Nature:=ORDONNANCE;

      D7.medecin:=L.persuiv.persuiv.persuiv.persuiv.persuiv;
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
      D5.Nature:=CERTIFICAT_MED;

      D5.medecin:=l.persuiv;
      D5.ID_Lecture:=false;
      D5.Date_Creat:=(12,Avril,2025);
      D5.Date_Deracc:=(12,Avril,2025);
      D5.Date_Dermodif:=(12,Avril,2025);
      Ajout_liste_doc(L4,D5);
      P4.Document:= L4;

      D6.id:=6;
      D6.Titre:= "Prescription Vitamines"&(23..50=>' ');
      D6.K_Titre:=22;
      D6.Nature:=ORDONNANCE;
      D6.medecin:=l.persuiv;
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
      D1.Nature:=CERTIFICAT_MED;

      D1.medecin:=l.persuiv;
      D1.ID_Lecture:=true;
      D1.Date_Creat:=(28,Mars,2025);
      D1.Date_Deracc:=(30,Mars,2025);
      D1.Date_Dermodif:=(28,Mars,2025);
      Ajout_liste_doc(L5,D1);
      P5.Document:= L5;

      D2.id:=2;
      D2.Titre:= "Maux de gorge"&(14..50=>' ');
      D2.K_Titre:=15;
      D2.Nature:=ORDONNANCE;
      D2.Medecin:=L.Persuiv.Persuiv.Persuiv.Persuiv.Persuiv;

      D2.ID_Lecture:=true;
      D2.Date_Creat:=(4,Avril,2025);
      D2.Date_Deracc:=(4,Avril,2025);
      D2.Date_Dermodif:=(4,Avril,2025);
      Ajout_liste_doc(L5,D2);
      P5.Document:= L5;

      D8.id:=8;
      D8.Titre:= "Controle routine"&(17..50=>' ');
      D8.K_Titre:=18;
      D8.Nature:=COMPTE_RENDU;
      D8.medecin:=l.persuiv.PERSUIV.PERSUIV;
      D8.ID_Lecture:=false;
      D8.Date_Creat:=(14,Avril,2025);
      D8.Date_Deracc:=(14,Avril,2025);
      D8.Date_Dermodif:=(14,Avril,2025);
      Ajout_liste_doc(L5,D8);
      P5.Document:= L5;
      P5.DemandeMDP := False;
      Pat.Fd.Fg := NEW T_Noeud'(P5, NULL, NULL);
   END Init_Arbre;
---------------------------------------------------------------------------
   PROCEDURE Affichage_Prefixe (Pat : IN T_Arbre) IS -- Affichae de l'entièreté d'un arbre
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
         Put_Line ("Ajout impossible, homonyme present");
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
 PROCEDURE Nouveau_Pat (A: IN OUT T_Arbre) is -- procedure d'ajout d'un nouveau patient
       Pat : T_Patient;
    BEGIN
       Put_Line ("Ajout d'un patient");
       Saisie_Patient (Pat);
       Ajout_Pat (A, Pat);
    END Nouveau_Pat;
----------------------------------------------------------------------
--faire une saisie de l'id pour la recherche
    FUNCTION Recherche_Pat_Bl (A : T_Arbre; Pat : T_Patient) RETURN Boolean IS
        --fonction qui recherche un patient dans l'arbre en fonction de son identite nom prenom et qui retourne un boolean
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
      --fonction qui recherche un patient dans l'arbre en fonction de son identite nom prenom et qui retourne un pointeur
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
PROCEDURE Traite_Max (A: IN OUT T_Arbre; Max : OUT T_Patient) IS -- Procedure auxiliaire pour supprimer le patient de l'arbre
    BEGIN
       IF A.Fd = NULL THEN
          Max := A.Patient;
          A := A.Fg;
       ELSE
          Traite_Max (A.Fd, Max);
       END IF;
    END Traite_Max;
----------------------------------------------------------------------
PROCEDURE Supp (A : IN OUT T_Arbre; Pat : T_Patient) IS -- Procedure de suppression d'un patient dans un arbre
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
    PROCEDURE Suppression_Pat (A : IN OUT T_Arbre) IS -- Procedure de supression d'un patient dans l'arbre qui appelle d'autres procedures
       Pat : T_Patient;
    BEGIN
       Put_Line ("Suppression d'un patient");
       Saisie_Identite (Pat.Identite_Patient);
       Supp (A, Pat);
    END Suppression_Pat;
----------------------------------------------------------------------
FUNCTION Verif_Connexion2 (A : IN T_arbre;Login:T_titre;Empreinte:integer) RETURN Boolean IS
   Trouve : Boolean;
   -- Fonction qui verifie la connexion du patient au demarrage
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
      -- Fonction qui recherche un patient dans l'arbre grâce à son login et qui retourne un pointeur
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
   PROCEDURE Ajout_Doc_Med (A: IN T_Arbre;ListeD: IN OUT T_Pteurdoc;D: out T_Document;initialisation_id:in out integer;date_jour: out t_date;pers:out t_personnel;l:t_pteurpers)IS
      Pat :T_Patient;
      TMP:t_arbre:=A;
   BEGIN                                                    --Ajout d'un document par un médecin
      Put_Line("Ajout d un document pour un patient.");

      LOOP
           Saisie_1doc(D,Initialisation_Id,Date_Jour,Pers,L);
        IF D.Nature = Certificat_Med OR D.Nature = Ordonnance THEN
            EXIT;
         ELSE
            Put_Line("Vous n etes pas habilites a enregistrer ce type de document.");
         END IF;
      END LOOP;
      LOOP
      Put_Line("Pour quel patient voulez vous ajouter ce document?");
      Saisie_Identite(Pat.Identite_Patient);
      Creation_Login(Pat.Identite_Patient,Pat.Login,Pat.Klogin);
      IF Recherche_Pat_bl(tmp,Pat) THEN
        Ajout_liste_doc(Recherche_Patlog(tmp,PaT.Login).Patient.Document,d);EXIT;
      ELSE
         Put_Line("Erreur de saisie. Veuillez recommencer.");
      END IF;
   END LOOP;
   END Ajout_Doc_Med;
--------------------------------------------------------------------------------------------------------------------------------------------
Procedure Ajout_doc_sec (A: IN T_Arbre;ListeD: IN OUT T_Pteurdoc;D: out T_Document;initialisation_id: in out integer;date_jour: out t_date;pers:out t_personnel;l:t_pteurpers)IS
   Pat :T_Patient; --Ajout d'un document par une secrétaire
   TMP:t_arbre:=A;
BEGIN
   Put_Line("Ajout d'un document pour un patient.");
         LOOP
      Saisie_1doc(D,Initialisation_Id,Date_Jour,Pers,L);
        IF D.Nature = Compte_rendu OR D.Nature = Resultat_exam THEN
            EXIT;
         ELSE
            Put_Line("Vous n etes pas habilites a enregistrer ce type de document.");
         END IF;
   END LOOP;
   Ajout_Liste_Doc(ListeD,D);
      LOOP
      Put_Line("Pour quel patient voulez vous ajouter ce document?");
      Saisie_Identite(Pat.Identite_Patient);
      Creation_Login(Pat.Identite_Patient,Pat.Login,Pat.Klogin);
      IF Recherche_Pat_bl(tmp,Pat) THEN
         Recherche_Patlog(tmp,PaT.Login).Patient.Document:=Listed;EXIT;
      ELSE
         Put_Line("Erreur de saisie. Veuillez recommencer.");
      END IF;
   END LOOP;
END Ajout_Doc_Sec;
--------------------------------------------------------------------------------------------------------------------------------------------
   PROCEDURE Visu_Doc_Pat (Pat : T_Patient) IS -- Visualisation de la liste de document d'un patient
   BEGIN
      Visu_liste_doc(Pat.document);
   END Visu_Doc_Pat;
--------------------------------------------------------------------------------------------------------------------------------------------
   PROCEDURE Visu_All_Document (A: T_Arbre) IS -- visualisation de tous les documents de l'arbre
   l:t_pteurdoc;
   BEGIN
      l:=a.patient.document;
      IF A/=NULL THEN
         Visu_Liste_Doc(L);
         Visu_All_Document(A.FG);
         Visu_All_Document(A.Fd);
      END IF;
   END Visu_All_Document;
--------------------------------------------------------------------------------------------------------------------------------------------
   PROCEDURE Affiche_Doc_Med (A: T_Arbre;Pers: t_pers) IS  --affichage des documents relatifs a un medecin
   L:t_pteurdoc;
   BEGIN
      IF A/=NULL THEN
         IF A.Patient.Document/= NULL THEN
            L:=A.patient.document;
            WHILE l/=NULL LOOP
               IF l.Document.Medecin.Personnel.Identite_Personnel = Pers THEN
                  Visu_1document(L.Document);
               END IF;
                  l:=l.Docsuiv;
            END LOOP;
               END IF;
         Affiche_Doc_Med(a.Fg,pers);
         Affiche_Doc_Med(a.Fd,pers);
         END IF;
   END Affiche_Doc_Med;
--------------------------------------------------------------------------------------------------------------------------------------------
   PROCEDURE Acces_Lecture_Med (A : T_Arbre;date_jour:t_date) IS
      Identite : T_patient; IdDoc:Integer;
      Tmp:T_Arbre:=a;
      Trouve:Boolean;
      L:t_pteurdoc;
   BEGIN
      Put_Line("Vous etes dans l acces aux documents du centre en lecture.");
      Put_Line("Pour quel patient voulez vous regarder ses documents?");
      Saisie_Identite(Identite.identite_patient);
      Put_Line("Veuillez indiquer l identifiant du document.");
      Get(Iddoc);Skip_Line;

      TMP:= Recherche_Pat_Pt(tmp,Identite);
      IF Tmp = NULL THEN
         Put_Line("Patient non trouve dans la patientele.");
      ELSE
         L:=tmp.patient.document;
      WHILE L /=NULL LOOP
         IF L.Document.Id = Iddoc THEN
               Visu_1document(l.DOCUMENT);
               l.DOCUMENT.DATE_Deracc:=Date_Jour;
               Trouve:=True;

               EXIT;
            ELSE
               TROUVE:=False;
        END IF;
         l:=l.Docsuiv;
         END LOOP;
         IF Trouve = False THEN
            Put_Line("Identifiant incorrect, le document n a pas ete trouve.");
         END IF;
      END IF;
   END Acces_Lecture_Med;
--------------------------------------------------------------------------------------------------------------------------------------------
   PROCEDURE Visu_All_Titre_1patient (A:T_Arbre)IS
      Identite:T_Patient;
      Tmp:T_Arbre;
      L:t_pteurdoc;
   BEGIN
      Put_Line("Vous etes dans la visualisation des titres des documents d un patient.");
      Put_Line("Veuillez indiquer pour quel patient vous voulez visualiser les titres de ses documents.");
      Saisie_Identite(Identite.Identite_Patient);

      Tmp:=Recherche_Pat_Pt(A,Identite);

          IF Tmp = NULL THEN
         Put_Line("Patient non trouve dans la patientele.");
      ELSE
         IF TMP.Patient.Document = NULL THEN
            Put_Line("Ce patient n a pas de document.");
         ELSE
            L:=tmp.patient.document;
         WHILE L/=NULL LOOP
               Put(L.Document.Titre);
               NEW_line;
            L:=L.Docsuiv;
         END LOOP;
      END IF;
      END IF;

      END Visu_All_Titre_1patient;
--------------------------------------------------------------------------------------------------------------------------------------------
   PROCEDURE Modif_1doc_Med (A:T_Arbre;date_jour:t_date)IS
       Identite : T_patient; IdDoc:Integer;
      Tmp:T_Arbre:=a;
      Medecin:T_Pers;
      L:T_Pteurdoc;
      ERREUR:boolean;
   BEGIN
      Put_Line("Vous etes dans la modification de document.");
      Put_Line("Verification de votre identite.");
      Saisie_identite(Medecin);
      Put_Line("Pour quel patient voulez vous modifier un document?");
      Saisie_Identite(Identite.identite_patient);
      Put_Line("Veuillez indiquer l identifiant du document que vous voulez modifier.");
      Get(Iddoc);Skip_Line;

      TMP:= Recherche_Pat_Pt(tmp,Identite);
      IF Tmp = NULL THEN
         Put_Line("Patient non trouve dans la patientele.");
      ELSE
        L:=tmp.patient.DOCUMENT ;
      WHILE L /=NULL LOOP
            IF L.Document.Id = Iddoc THEN
               IF L.Document.Medecin.Personnel.Identite_Personnel = Medecin AND THEN L.Document.nature /= Resultat_Exam THEN
                  IF L.DOCUMENT.Id_Lecture = false THEN

               PUT_line("Vous pouvez modifier ce document.");
               put_line("Voici le document avant modification:");
               Visu_1document(L.DOCUMENT);
                 FOR I IN 1..100 LOOP
                  Put('-');
                  END LOOP;
               L.DOCUMENT.DATE_dermodif:=Date_Jour;

                 put_line("Voici le document apres modification:");
                     Visu_1document(L.DOCUMENT);
                     Erreur:=False;

                     EXIT;
                  ELSE
                     erreur:=true;
                  END IF;
               ELSE
                  erreur:=true;
               END IF;
            ELSE
               erreur:=true;
            END IF;
         l:=l.Docsuiv;
         END LOOP;

      END IF;
      IF Erreur THEN
         put_line("Modification impossible, une de ces 3 erreurs :");
      Put_Line("Document deja lu par le patient, impossible de le modifier.");
      Put_Line("Vous n etes pas autorisez a modifier ce document, vous n etes pas le medecin associe a ce document ou bien c est un resultat d examen.");
      PUt_line("Identifiant incorrect, le document n a pas ete trouve.");
      END IF;

   END Modif_1doc_Med;
--------------------------------------------------------------------------------------------------------------------------------------------
   PROCEDURE Acces_Lec_Pat (A:T_Arbre;Date_Jour:T_Date) IS
      Identite:T_Patient;
      Id:Integer;
      Tmp:T_Arbre:=A;
      Trouve:Boolean:=False;
      L:t_pteurdoc;
   BEGIN
      Put_Line("Vous etes dans la lecture de document vous concernant.");
      Put_Line("Veuillez indiquer votre identite.");
      Saisie_Identite(Identite.Identite_Patient);
      Put_Line("Veuillez indiquer l identifiant du document que vous voulez consulter.");
      Get(Id);Skip_Line;

      TMP:= Recherche_Pat_Pt(tmp,Identite);
      IF Tmp = NULL THEN
         Put_Line("Patient non trouve dans la patientele.");
      ELSE
            l:=tmp.patient.document;
      WHILE L /=NULL LOOP
         IF L.Document.Id = Id THEN
               Visu_1document(L.DOCUMENT);
               L.DOCUMENT.DATE_Deracc:=Date_Jour;
               Trouve:=True;

               EXIT;
        END IF;
         L:=L.Docsuiv;
         END LOOP;
         IF Trouve = False THEN
            Put_Line("Identifiant incorrect, le document n a pas ete trouve.");
         END IF;
      END IF;
   END Acces_Lec_Pat;
--------------------------------------------------------------------------------------------------------------------------------------------
   PROCEDURE Modif_1doc_sec(A:T_Arbre;date_jour:t_date)IS
      Identite : T_patient; IdDoc:Integer;
      Tmp:T_Arbre:=A;
      L:t_pteurdoc;
   BEGIN
      Put_Line("Vous etes dans la modification de document.");
      Put_Line("Pour quel patient voulez vous modifier un document?");
      Saisie_Identite(Identite.identite_patient);
      Put_Line("Veuillez indiquer l identifiant du document que vous voulez modifier.");
      Get(Iddoc);Skip_Line;

      TMP:= Recherche_Pat_Pt(tmp,Identite);
      IF Tmp = NULL THEN
         Put_Line("Patient non trouve dans la patientele.");
      ELSE
         L:=tmp.patient.document;
      WHILE l /=NULL LOOP
            IF l.Document.Id = Iddoc THEN
               IF l.Document.nature = Compte_Rendu THEN
                  IF L.DOCUMENT.Id_Lecture = false THEN
               PUT_line("Vous pouvez modifier ce document.");
               put_line("Voici le document avant modification:");
               Visu_1document(L.DOCUMENT);
                 FOR I IN 1..100 LOOP
                  Put('-');
                  END LOOP;
               L.DOCUMENT.DATE_dermodif:=Date_Jour;

                 put_line("Voici le document apres modification:");
               Visu_1document(L.DOCUMENT);
                     EXIT;
                  ELSE
                     Put_Line("Document deja lu par le patient, impossible de le modifier.");

                  END IF;
               ELSE
                  Put_Line("Vous n etes pas autorisez a modifier ce document, ce n est pas un compte rendu.");

               END IF;
            ELSE
               PUt_line("Identifiant incorrect, le document n a pas ete trouve.");

            END IF;
         L:=L.Docsuiv;
         END LOOP;
      END IF;
   END Modif_1doc_sec;
--------------------------------------------------------------------------------------------------------------------------------------------
      PROCEDURE Visu_All_Titre_1categ (A:T_Arbre;categorie:t_nature)IS
         Tmp:T_Arbre:=A;
         l:t_pteurdoc;
   BEGIN

      IF Tmp /= NULL THEN
         L:=tmp.patient.document;
         IF l /= NULL THEN
            WHILE L /=NULL LOOP
               IF L.Document.Nature = Categorie THEN
                  Put(L.Document.Titre);
                  NEW_line;
               END IF;
               L:=L.Docsuiv;
            END LOOP;
            Visu_All_Titre_1categ(Tmp.Fg,Categorie);
            Visu_All_Titre_1categ(Tmp.Fd,Categorie);
         ELSE
            Visu_All_Titre_1categ(Tmp.Fg,Categorie);
            Visu_All_Titre_1categ(Tmp.Fd,Categorie);
         END IF;
      END IF;
      END Visu_All_Titre_1categ;
--------------------------------------------------------------------------------------------------------------------------------------------
PROCEDURE Visu_All_Titre_1medecin (A:T_Arbre;Identite:T_pers)IS
   Tmp:T_Arbre:=A;
   L:t_pteurdoc;
   BEGIN
          IF Tmp/= NULL THEN
         L:=Tmp.Patient.Document;

            IF L /= NULL THEN
             WHILE L /=NULL LOOP
               IF L.Document.Medecin.personnel.Identite_Personnel = Identite THEN
               Put(L.Document.Titre);
                  NEW_Line;
               END IF;
            l:=l.Docsuiv;
         END LOOP;
            Visu_All_Titre_1medecin(Tmp.Fg,identite);
            Visu_All_Titre_1medecin(Tmp.Fd,identite);
         ELSE
            Visu_All_Titre_1medecin(Tmp.Fg,identite);
            Visu_All_Titre_1medecin(Tmp.Fd,identite);
         END IF;
      END IF;
      END Visu_All_Titre_1medecin;
--------------------------------------------------------------------------------------------------------------------------------------------


END Arbre_Patients;
