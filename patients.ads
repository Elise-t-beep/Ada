WITH outils, Ada.Characters.Handling, Ada.Text_IO;
USE outils, Ada.Characters.Handling, Ada.Text_Io;


PACKAGE Patients IS

   -- extrait du package personnel
   TYPE Role_P IS (Secretaire, Medecin, Administrateur, Patient);


   TYPE T_Patient IS RECORD
      Num_Patient : Integer; --numero du patient dans l'arbre
      Identite_Patient : T_Pers;
      Login : T_Titre;
      Klogin : Integer;
      NomJM : T_Titre;
      K_nomJM : integer;
      EmpreinteMDP : integer;
      Fonction : Role_P;
     -- Document : T_pteurDoc; --(appel package doc?)
      DemandeMDP : Boolean;
      --ajout mdp tout court?
   END RECORD;


   PROCEDURE Saisie_NOMJM (Pat : OUT T_Patient);
   PROCEDURE Saisie_Fonction (Pat : OUT T_Patient);

END Patients;



