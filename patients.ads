WITH Outils, Personnel, Liste_Document, Ada.Text_Io, Ada.Integer_Text_IO, ada.IO_Exceptions;
USE Outils, Personnel, Liste_Document, Ada.Text_Io, Ada.Integer_Text_IO;


PACKAGE Patients IS

   TYPE T_Patient IS RECORD
      Identite_Patient : T_Pers; --nom et prenom
      Login : T_Titre; --format TONNOIR_ELISE
      Klogin : Integer;
      NomJM : T_mot;
      K_nomJM : integer;
      EmpreinteMDP : integer;
      Fonction : Role_P;
      Document : T_pteurDoc;
      DemandeMDP : Boolean; --si true alors connexion impossible
   END RECORD;

   PROCEDURE Saisie_NOMJM2 (Pat : OUT T_Patient);
   PROCEDURE Saisie_Fonction2 (Pat : OUT T_Patient);
   PROCEDURE Saisie_Patient (Pat : OUT T_Patient);
   PROCEDURE Visu_1Patient (Pat : IN T_Patient);

END Patients;

