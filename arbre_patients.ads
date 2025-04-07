WITH outils, Ada.Characters.Handling, Ada.Text_IO, Ada.Integer_Text_IO;
USE outils, Ada.Characters.Handling, Ada.Text_IO, Ada.Integer_Text_IO;


PACKAGE Arbre_Patients IS

   TYPE Role_P IS (Secretaire, Medecin, Administrateur, Patient);

   TYPE T_Patient IS RECORD
      Num_Patient : Integer;
	Identite_patient : T_pers;
      Login : T_Titre;
      Klogin : Integer;
      NomJM : T_Mot;
      K_NomJM : Integer;
      --ajouter mdp tout court?
	EmpreinteMDP : integer;
	Fonction : Role_P;
	--Document : T_pteurDoc;  --Pas fonctionnel
      DemandeMDP : boolean;
   END RECORD;

   TYPE T_Noeud;
   TYPE T_Arbre IS ACCESS T_Noeud;
   TYPE T_Noeud IS RECORD
      Patient : T_Patient;
      Fg, Fd : T_Arbre;
   END RECORD;

   PROCEDURE Tiret (N : IN Natural);
   PROCEDURE Init_Arbre (Pat : IN OUT T_Arbre);
   PROCEDURE Affichage_Prefixe (Pat : IN T_Arbre);
   FUNCTION Num_Max (A: T_Arbre) RETURN Integer;
   PROCEDURE Saisie_Patient (A : IN OUT T_Arbre; Pat : OUT T_Patient);
   PROCEDURE Saisie_NOMJM (Pat : OUT T_Patient);
   PROCEDURE Saisie_Fonction (Pat : OUT T_Patient);


END Arbre_Patients;

