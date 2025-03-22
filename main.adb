WITH Outils, Ada.Text_Io, Ada.Characters.Handling;
USE Outils, Ada.Text_Io, Ada.Characters.Handling;


PROCEDURE Main IS
   M: T_Mot;
   K: Integer;
   Id : T_Pers;
   Emp : Integer;
   Mdp : T_Mdp;
   T : T_Titre;

BEGIN
   Put ("------------------------");
   New_Line;
   Put ("test packages outils ");
   New_Line;
--   Put ("saisie mot : ");
--   New_Line;
--   Saisie_Mot (M, K);
--   New_Line;
--   Put ("saisie id : ");
--   New_Line;
--   Saisie_Identite (Id);
   Put ("saisie mdp");
   New_Line;
   Init_Empreinte (Emp);
   Put (Mdp);

--les commentaires dessous= pas tester
--   FUNCTION Calcul_Empreinte (Mdp : T_Mdp) RETURN Integer;
--   PROCEDURE Saisie_Titre (T : OUT T_Titre; K : OUT Integer);




END Main;




