WITH Ada.Characters.Handling, Ada.Text_IO, personnel,outils,liste_personnel;
USE Ada.Characters.Handling, Ada.Text_Io, Personnel,Outils,Liste_Personnel;

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
PROCEDURE AJout_Demande (D: IN OUT T_file_dem;Demande:IN out T_Demande);
PROCEDURE Visu_1demande (Demande : IN T_Demande);
PROCEDURE Visu_File_Demande (F: IN T_File_Dem);
PROCEDURE Suppression_Demande (Demande : out T_Demande; F : IN OUT T_File_Dem;Erreur : OUT Boolean);
PROCEDURE Traitement_demande(F: IN out T_File_Dem; L:T_Pteurpers);
FUNCTION Recherche_Jm (F: t_file_dem; L: T_Pteurpers) RETURN Boolean;
END File_Demande;

