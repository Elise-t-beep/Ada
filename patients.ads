WITH Ada.Text_IO, Ada.Integer_Text_IO,Ada.Characters.Handling,Outils,Personnel,Liste_Personnel,Date,Liste_Document, ada.IO_Exceptions;
USE Ada.Text_Io, Ada.Integer_Text_IO,Ada.Characters.Handling,Outils,Personnel,Liste_Personnel,Date,Liste_Document;


PACKAGE Patients IS

   TYPE T_Patient IS RECORD
      Identite_Patient : T_Pers;
      Login : T_Titre;
      Klogin : Integer;
      NomJM : T_mot; --modif faite 10/04 11H
      K_nomJM : integer;
      EmpreinteMDP : integer;
      Fonction : Role_P;
      Document : T_pteurDoc; --(appel package doc)
      DemandeMDP : Boolean;
      --ajout mdp tout court?
   END RECORD;

   PROCEDURE Saisie_NOMJM2 (Pat : OUT T_Patient);
   PROCEDURE Saisie_Fonction2 (Pat : OUT T_Patient);
   PROCEDURE Saisie_Patient (Pat : OUT T_Patient);
   PROCEDURE Visu_1Patient (Pat : IN T_Patient);
END Patients;

