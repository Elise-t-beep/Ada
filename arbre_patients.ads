WITH Ada.Text_IO, Ada.Integer_Text_IO,ada.Characters.Handling,outils,personnel,liste_personnel, document,patients,date;
USE Ada.Text_Io, Ada.Integer_Text_IO,Ada.Characters.Handling,Outils,Personnel,liste_personnel,document,patients,date;


PACKAGE Arbre_Patients IS

   TYPE T_Noeud;
   TYPE T_Arbre IS ACCESS T_Noeud;
   TYPE T_Noeud IS RECORD
      Patient : T_Patient;
      Fg, Fd : T_Arbre;
   END RECORD;

   PROCEDURE Init_Arbre (Pat : IN OUT T_Arbre);
   PROCEDURE Affichage_Prefixe (Pat : IN T_Arbre);
   FUNCTION Homonyme (A: IN T_Arbre; Pat : IN T_Pers) RETURN Boolean;
   PROCEDURE Ajout_Pat (A: IN OUT T_Arbre; Pat: out T_Patient);
   FUNCTION Recherche_Pat (A : T_Arbre; Pat : T_Patient) RETURN Boolean;
--   PROCEDURE Supp_Patient (A : IN OUT T_Arbre; Id : OUT T_Pers; Pat : T_Patient);
   PROCEDURE Saisie_1doc (D: OUT T_Document;L:t_pteurpers;Date_jour: t_date;Id: out t_pers;initialisation_ID:integer);
   FUNCTION Verif_Connexion2 (A : IN T_arbre;Login:T_titre;Empreinte:integer) RETURN Boolean ;

END Arbre_Patients;

