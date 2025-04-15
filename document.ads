WITH Ada.Characters.Handling, Ada.Text_IO, personnel,outils,liste_personnel,date;
USE Ada.Characters.Handling, Ada.Text_Io, personnel,outils,liste_personnel,date;

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
      Archive : boolean :=false; -- pas archive, archive quand true
   END RECORD;
   PROCEDURE Saisie_NATURE(Nature: OUT T_nature);
   PROCEDURE Visu_1document (D: IN T_Document);
   PROCEDURE Saisie_1doc (D: out T_Document;Initialisation_id: in out integer;date_jour: out t_date;Pers: out t_personnel;L:t_pteurpers);

END Document;







