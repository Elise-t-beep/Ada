WITH Ada.Characters.Handling, Ada.Text_IO;
USE Ada.Characters.Handling, Ada.Text_Io;

PACKAGE Outils IS

   SUBTYPE T_Mot IS String(1..20);

   TYPE T_Pers IS
      RECORD
         Nom     : T_Mot   := (OTHERS => ' ');
         Knom    : Integer;
         Prenom  : T_Mot   := (OTHERS => ' ');
         Kprenom : Integer;
      END RECORD;

   SUBTYPE T_Titre IS String(1..50); --titre des docs
   SUBTYPE T_Mdp IS String(1..10); --chaine de caractere de 10 pour mdp

   PROCEDURE Saisie_Mot (
         M :    OUT T_Mot;
         K :    OUT Integer);
   PROCEDURE Saisie_Identite (
      Id :    OUT T_Pers);

   PROCEDURE Saisie_Titre (
         M :    OUT T_Titre;
      K :    OUT Integer);
   PROCEDURE Creation_Login (Id : IN OUT T_Pers; Login : OUT T_Titre; Klogin : OUT Integer);
   PROCEDURE Init_Empreinte (Emp : OUT Integer);
   FUNCTION Calcul_Empreinte (Mdp : T_Mdp) RETURN Integer;

END Outils;

