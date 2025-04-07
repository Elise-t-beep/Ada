WITH outils, Ada.Characters.Handling, Ada.Text_IO;
USE outils, Ada.Characters.Handling, Ada.Text_Io;


PACKAGE Patients IS

   -- extrait du package personnel
   TYPE Role_P IS (Secretaire, Medecin, Administrateur, Patient);

   TYPE T_Patient IS RECORD
      Identite_Patient : T_Pers;
      Login : T_Titre;
      Klogin : Integer;
      NomJM : T_Titre;
      K_nomJM : integer;
      EmpreinteMDP : integer;
      Fonction : Role_P;
      --Document : T_pteurDoc; (appel package doc)
      DemandeMDP : Boolean;
      --ajout mdp tout court?
   END RECORD;


   PROCEDURE Saisie_NOMJM (Pers : OUT T_Patient);
   PROCEDURE Saisie_Fonction (Pers : OUT T_Patient);
   PROCEDURE Saisie_Patient (Pers : OUT T_Patient);

END Patients;



