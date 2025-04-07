WITH Outils, Patients, Arbre_Patients, Ada.Text_Io, Ada.Integer_Text_IO, Ada.Characters.Handling;
USE Outils, Patients, Arbre_Patients, Ada.Text_Io, Ada.Integer_Text_IO, Ada.Characters.Handling;


PROCEDURE Main IS
   M: T_Mot;
   K: Integer;
   Id : T_Pers;
   Emp : Integer;
   Mdp : T_Mdp;
   T : T_Titre;
   Pat : T_Arbre;

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
   Put ("test packages arbre_patients");
   New_Line;
   Init_Arbre (Pat);
   Affichage_Prefixe (Pat);



--les commentaires dessous= pas tester
--   PROCEDURE Saisie_Titre (T : OUT T_Titre; K : OUT Integer);
-- Procedure Creation login teste par Lydia



END Main;




