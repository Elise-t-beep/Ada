WITH file_demande, menu_main,Ada.Text_IO, Ada.Integer_Text_IO,ada.Characters.Handling,outils,personnel,liste_personnel, document,patients,arbre_patients,date,liste_document;
USE file_demande, menu_main,Ada.Text_Io, Ada.Integer_Text_IO,Ada.Characters.Handling,Outils,Personnel,liste_personnel,document,patients,arbre_patients,date,liste_document;


PROCEDURE Main IS
   M: T_Mot;
   K: Integer;
   Id : T_Pers;
   Emp : Integer;
   Mdp : T_Mdp;
   T : T_Titre;
   A : T_Arbre;
   Pat : T_Patient;
   L: T_Pteurpers;
   --D : T_Document;
   Login : T_Titre;
   Date_Jour : T_Date;
   D: T_File_Dem; --D
   Demande: T_Demande;
   Empreinte: Integer;
   Fonction: Role_P;
   Cpt: Integer;
   Pers: T_Personnel;
   Choix: Integer;
   Initialisation_Id : Integer;
   ListeD : T_Pteurdoc;
   Document : T_Document;








BEGIN
   Put ("------------------------");
   New_Line;
--   Put ("test packages outils ");
--   New_Line;
--   Put ("saisie mot : ");
--   New_Line;
--   Saisie_Mot (M, K);
--   New_Line;
--   Put ("saisie id : ");
--   New_Line;
--   Saisie_Identite (Id);
--   Put ("saisie mdp");
--   New_Line;
--   Init_Empreinte (Emp);
--   Put (emp);
--   Saisie_Titre (T, K);
--   Put (T);
--   Put ("test packages arbre_patients");
--   New_Line;
--   Init_Arbre (A, L);
--   Affichage_Prefixe (A);
--   Nouveau_Pat (A);
--   Affichage_Prefixe (A);
--   Suppression_Pat (A);
--   Affichage_Prefixe (A);
--   Put_Line ("test package liste_personnel");
--   Initialisation_Pers (L);
--   Visualisation_Liste_Pers (L);
--   Ajout_Pers (L);
--   Visualisation_Liste_Pers (L);

   Menu_Demarrage (Initialisation_Id,ListeD,Document,L,Date_Jour,D,Demande,Login,Empreinte,Fonction,Cpt,Id,Pers,Choix,A,Pat);





--   PROCEDURE Init_Arbre (Pat : IN OUT T_Arbre);
--   PROCEDURE Affichage_Prefixe (Pat : IN T_Arbre);
--   FUNCTION Homonyme (A: IN T_Arbre; Pat : IN T_Pers) RETURN Boolean;
--   PROCEDURE Ajout_Pat (A: IN OUT T_Arbre; Pat: OUT T_Patient);
--   FUNCTION Recherche_Pat (A : T_Arbre; Pat : T_Patient) RETURN Boolean;
----   PROCEDURE Supp_Patient (A : IN OUT T_Arbre; Id : OUT T_Pers; Pat : T_Patient);
--   PROCEDURE Saisie_1doc (D: OUT T_Document;L:t_pteurpers;Date_jour: t_date;Id: out t_pers;initialisation_ID:integer);
--   FUNCTION Verif_Connexion2 (A : IN T_Arbre;Login:T_Titre;Empreinte:Integer) RETURN Boolean ;



--les commentaires dessous= pas tester
--   PROCEDURE Saisie_Titre (T : OUT T_Titre; K : OUT Integer);
-- Procedure Creation login teste par Lydia



END Main;




