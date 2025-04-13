WITH Ada.Text_IO, Ada.Integer_Text_IO,ada.Characters.Handling,outils,personnel,liste_personnel, document,patients,date,liste_document;
 USE Ada.Text_Io, Ada.Integer_Text_IO,Ada.Characters.Handling,Outils,Personnel,liste_personnel,document,patients,date,liste_document;

PACKAGE Arbre_Patients IS

   TYPE T_Noeud;
   TYPE T_Arbre IS ACCESS T_Noeud;
   TYPE T_Noeud IS RECORD
      Patient : T_Patient;
      Fg, Fd : T_Arbre;
   END RECORD;

   PROCEDURE Init_Arbre (Pat : IN OUT T_Arbre; L : IN OUT T_Pteurpers);
   PROCEDURE Affichage_Prefixe (Pat : IN T_Arbre);
   PROCEDURE Ajout_Pat (A : IN OUT T_Arbre; Pat : IN T_Patient);
   PROCEDURE Nouveau_Pat (A: IN OUT T_Arbre);
--   FUNCTION Homonyme (A: IN T_Arbre; Pat : IN T_Pers) RETURN Boolean;
   FUNCTION Recherche_Pat_Bl (A : T_Arbre; Pat : T_Patient) RETURN Boolean;
   FUNCTION Recherche_Pat_Pt (A : T_Arbre; Pat : T_Patient) RETURN T_Arbre;
   PROCEDURE Traite_Max (A: IN OUT T_Arbre; Max : OUT T_Patient);
   PROCEDURE Supp (A : IN OUT T_Arbre; Pat : T_Patient);
   PROCEDURE Suppression_Pat (A: IN OUT T_Arbre);
   FUNCTION Verif_Connexion2 (A : IN T_Arbre;Login:T_Titre;Empreinte:Integer) RETURN Boolean ;
   PROCEDURE Ajout_Doc_Med (A: IN OUT T_Arbre;ListeD: IN OUT T_Pteurdoc;D: out T_Document;initialisation_id:integer;date_jour: out t_date;pers:out t_personnel;l:t_pteurpers);
   FUNCTION Recherche_PatLog (A : T_Arbre; Login : T_Titre) RETURN T_Arbre ;
   PROCEDURE Visu_Doc_Pat (Pat : T_Patient);
   PROCEDURE Visu_All_Document (A: T_Arbre);
   PROCEDURE Affiche_Doc_Med (A: T_Arbre;pers: in t_pers);
 --   FUNCTION Recherche_Med_A (A :T_Arbre; Pers: in T_Pers) RETURN T_Arbre;
   PROCEDURE Acces_Lecture_Med (A : T_Arbre;date_jour:t_date);
   PROCEDURE Visu_All_Titre_1patient (A:T_Arbre);
   PROCEDURE Modif_1doc_Med (A:T_Arbre;Date_Jour:T_Date);
   PROCEDURE Acces_Lec_Pat (A:T_Arbre;Date_Jour:T_Date);
   Procedure Ajout_doc_sec (A: IN T_Arbre;ListeD: IN OUT T_Pteurdoc;D: out T_Document;initialisation_id: in out integer;date_jour: out t_date;pers:out t_personnel;l:t_pteurpers);
   PROCEDURE Modif_1doc_Sec(A:T_Arbre;Date_Jour:T_Date);
   PROCEDURE Visu_All_Titre_1categ (A:T_Arbre;Categorie:T_Nature);
   PROCEDURE Visu_All_Titre_1medecin (A:T_Arbre;Identite:T_pers);

END Arbre_Patients;


--   PROCEDURE Supp_Patient (A : IN OUT T_Arbre; Id : T_pers; Pat : T_Patient) IS
--   BEGIN
--      Put ("Suppression d'un patient");
--      New_Line;
--      Put ("saisie de l'identite du patient à supprimer : nom et prenom : ");
--      Saisie_Identite (Id);
--      Pat := Id;
--      IF A /= NULL THEN
--         IF Recherche_Pat (A, Pat) THEN --pat remplace id sinon pb t_pers et t_patient
--            IF A.Fg = NULL THEN
--               A := A.Fd;
--            ELSIF A.Fd = NULL THEN
--               A := A.Fg;
--            ELSE
--               Put("noeud double, comment faire?");
--            END IF;
--         ELSE
--            Recherche_Pat (A.Fg, Pat);
--            Recherche_Pat (A.Fd, Pat);
--         END IF;
--      END IF;
--   END Supp_Patient;


--   PROCEDURE Supp (A : IN OUT T_Arbre; Pat : T_Patient) IS
--   BEGIN
--      Put ("Suppression d'un patient");
--      New_Line;
--      IF A /= NULL THEN
--         IF Pat.Identite_Patient.Nom < A.Patient.Identite_Patient.Nom THEN
--            Supp_Patient (A.Fg, Pat);
--         ELSIF Pat.Identite_Patient.Nom > A.Patient.Identite_Patient.Nom THEN
--            Supp_Patient (A.Fd, Pat);
--         ELSIF Pat.Identite_Patient.Nom = A.Patient.Identite_Patient.Nom THEN
--            IF Pat.Identite_Patient.Prenom < A.Patient.Identite_Patient.Prenom THEN
--               Supp_Patient (A.Fg, Pat);
--            ELSIF Pat.Identite_Patient.Prenom > A.Patient.Identite_Patient.Prenom THEN
--               Supp_Patient (A.Fd, Pat);
--            ELSE
--               IF A.Fg = NULL THEN
--                  A := A.Fd;
--               ELSIF A.Fd = NULL THEN
--                  A := A.Fg;
--               ELSE
--                  Traite_Max (A.Fg, A.Patient);
--               END IF;
--            END IF;
--         END IF;
--      END IF;
--   END Supp_Patient;
