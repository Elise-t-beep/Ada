WITH Ada.Text_IO, Ada.Integer_Text_IO,ada.Characters.Handling,liste_personnel,arbre_patients,outils,personnel,patients,ada.IO_Exceptions;
USE Ada.Text_Io, Ada.Integer_Text_IO,ada.Characters.Handling,liste_personnel,arbre_patients,outils,personnel,patients;

PACKAGE File_Demande IS

-- Informations demandées lors du changement de mdp
TYPE T_Demande IS RECORD
   Identite : T_Pers;
   NomJM : T_Mot;
   Fonction : Role_P ;
END RECORD ;
-- File de demande de changement de mdp
TYPE T_CellDemand ;
TYPE T_Pteurdemand IS ACCESS T_CellDemand;
TYPE T_CellDemand IS RECORD
   Demande : T_demande ;
   Demandsuiv : T_PteurDemand;
END RECORD ;
TYPE T_File_Dem IS RECORD
   TeteDem, FinDem : T_Pteurdemand ;
END RECORD;
PROCEDURE AJout_Demande (D: IN OUT T_file_dem;Demande:IN out T_Demande;L:in out t_pteurpers;A: in out t_arbre);
PROCEDURE Visu_1demande (Demande : IN T_Demande);
PROCEDURE Visu_File_Demande (F: IN T_File_Dem);
PROCEDURE Suppression_Demande (Demande : out T_Demande; F : IN OUT T_File_Dem;Erreur : OUT Boolean);
PROCEDURE Traitement_demande(F: IN out T_File_Dem; L:T_Pteurpers;a:in out t_arbre;login:t_titre);
FUNCTION Recherche_Jm (F: T_File_Dem; L: T_Pteurpers) RETURN Boolean;
FUNCTION Recherche_FilePat (A:t_arbre;Login:T_Titre;D:T_File_Dem) RETURN Boolean;
FUNCTION Recherche_fILEPAT3 (A : T_Arbre; d:t_file_dem) RETURN T_Arbre;
END File_Demande;

