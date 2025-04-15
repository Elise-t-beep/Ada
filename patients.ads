WITH Ada.Text_IO, Ada.Integer_Text_IO,ada.Characters.Handling,outils,personnel,liste_personnel,date,liste_document;
USE Ada.Text_Io, Ada.Integer_Text_IO,Ada.Characters.Handling,Outils,Personnel,liste_personnel,date,liste_document;

PACKAGE Patients IS

   TYPE T_Patient IS RECORD
      Identite_Patient : T_Pers;
      Login : T_Titre;
      Klogin : Integer;
      NomJM : T_mot;
      K_nomJM : integer;
      EmpreinteMDP : integer;
      Fonction : Role_P;
      Document : T_pteurDoc;
      DemandeMDP : Boolean:=false;
   END RECORD;

   PROCEDURE Saisie_NOMJM2 (Pat : OUT T_Patient);
   PROCEDURE Saisie_Fonction2 (Pat : OUT T_Patient);
   PROCEDURE Saisie_Patient (Pat : OUT T_Patient);
   PROCEDURE Visu_1Patient (Pat : IN T_Patient);
END Patients;



