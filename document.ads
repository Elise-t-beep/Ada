WITH Ada.Characters.Handling, Ada.Text_IO, personnel,outils,liste_personnel,date,file_demande;
USE Ada.Characters.Handling, Ada.Text_Io, personnel,outils,liste_personnel,date,file_demande;

PACKAGE Document IS
   -- Différents documents possibles
   TYPE T_Nature IS (Ordonnance, Certificat_Med, Compte_Rendu, Resultat_Exam) ;

   TYPE T_Document IS RECORD
      Id : Integer ; -- Compteur auto-incrémenté cf Projet S5
      Titre : T_Titre; -- Max 50 caractères
      K_Titre : Integer;
      Nature : T_Nature ;
      Medecin : T_PteurPers ;
      Id_Lecture :Boolean:=false ; --False quand non lu, true quand lu
      Date_Creat, Date_Deracc, Date_DerModif : T_Date ;
   END RECORD;
   PROCEDURE Saisie_NATURE(Nature: OUT T_nature);
   PROCEDURE Visu_1document (D: IN T_Document);
   PROCEDURE Saisie_1doc (D: OUT T_Document;L:t_pteurpers;date_jour:t_date;id:out t_pers;initialisation_id:integer);
END Document;







