WITH Outils, ada.IO_Exceptions;
USE Outils;

PACKAGE Personnel IS

   TYPE Role_P IS (Secretaire, Medecin, Administrateur, Patient);

   TYPE T_Personnel IS RECORD
      Identite_Personnel : T_Pers; --nom et prenom
      Login : T_Titre; --Format LEFEBVRE_LYDIA
      Klogin : Integer;
      NomJM : T_Mot;
      K_NomJM : Integer;
      EmpreinteMDP: Integer; --calcule par la formule
      Fonction: Role_P;
      DemandeMDP: boolean; -- si true pas de connexion jusqu'à demande traitée par admin
   END RECORD;

   PROCEDURE Saisie_NOMJM (Pers : OUT T_Personnel);
   PROCEDURE Saisie_Personnel (Pers : OUT T_Personnel);
   PROCEDURE Visu_1Personnel (Pers : IN T_Personnel);
   PROCEDURE Saisie_Fonction1 (Pers : OUT T_Personnel);

END Personnel;

