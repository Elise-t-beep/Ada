WITH Ada.Text_IO, Ada.Integer_Text_IO,ada.Characters.Handling,outils,personnel,liste_personnel, document,patients,date,liste_document;
USE Ada.Text_Io, Ada.Integer_Text_IO,Ada.Characters.Handling,Outils,Personnel,liste_personnel,document,patients,date,liste_document;


PACKAGE Arbre_Patients IS

   TYPE T_Noeud;
   TYPE T_Arbre IS ACCESS T_Noeud;
   TYPE T_Noeud IS RECORD
      Patient : T_Patient;
      Fg, Fd : T_Arbre;
   END RECORD;

   PROCEDURE Init_Arbre (Pat : IN OUT T_Arbre;L: in out t_pteurpers);
   PROCEDURE Affichage_Prefixe (Pat : IN T_Arbre);


   PROCEDURE Ajout_Pat (A : IN OUT T_Arbre; Pat : IN T_Patient);
   PROCEDURE Nouveau_Pat (A: IN OUT T_Arbre);

   FUNCTION Recherche_Pat_Bl (A : T_Arbre; Pat : T_Patient) RETURN Boolean;

   PROCEDURE Traite_Max (A: IN OUT T_Arbre; Max : OUT T_Patient);
   PROCEDURE Supp (A : IN OUT T_Arbre; Pat : T_Patient;trouve:out boolean);
   PROCEDURE Suppression_Pat (A: IN OUT T_Arbre);

   FUNCTION Verif_Connexion2 (A : IN T_arbre;Login:T_titre;Empreinte:integer) RETURN Boolean ;

   FUNCTION Recherche_Pat_Pt (A : T_Arbre; Pat : T_Patient) RETURN T_Arbre;
   PROCEDURE Ajout_Doc_Med (A: IN T_Arbre;ListeD: IN OUT T_Pteurdoc;D: out T_Document;initialisation_id: in out integer;date_jour: out t_date;pers:out t_personnel;l:t_pteurpers);
   FUNCTION Recherche_PatLog (A : T_Arbre; Login : T_Titre) RETURN T_Arbre ;
   PROCEDURE Visu_Doc_Pat (Pat : T_Patient);
   PROCEDURE Visu_All_Document (A: T_Arbre);
   PROCEDURE Affiche_Doc_Med (A: T_Arbre;pers: in t_pers);
   PROCEDURE Acces_Lecture_Med (A : T_Arbre;date_jour:t_date);
   PROCEDURE Visu_All_Titre_1patient (A:T_Arbre);
   PROCEDURE Modif_1doc_Med (A:T_Arbre;Date_Jour:T_Date);
   PROCEDURE Acces_Lec_Pat (A:T_Arbre;Date_Jour:T_Date);
   Procedure Ajout_doc_sec (A: IN T_Arbre;ListeD: IN OUT T_Pteurdoc;D: out T_Document;initialisation_id: in out integer;date_jour: out t_date;pers:out t_personnel;l:t_pteurpers);
   PROCEDURE Modif_1doc_Sec(A:T_Arbre;Date_Jour:T_Date);
   PROCEDURE Visu_All_Titre_1categ (A:T_Arbre;Categorie:T_Nature);
   PROCEDURE Visu_All_Titre_1medecin (A:T_Arbre;Identite:T_pers);
   END Arbre_Patients;

