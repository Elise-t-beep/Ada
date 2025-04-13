WITH Ada.Characters.Handling, Ada.Text_IO, personnel,outils,liste_personnel,date, ada.IO_Exceptions;
USE Ada.Characters.Handling, Ada.Text_Io, personnel,outils,liste_personnel,date;

PACKAGE Document IS
   -- Les differents documents possibles
   TYPE T_Nature IS (Ordonnance, Certificat_Med, Compte_Rendu, Resultat_Exam) ;

   TYPE T_Document IS RECORD
      Id : Integer ; -- Compteur auto-incremente cf Projet S5
      Titre : T_Titre; -- Max 50 caracteres
      K_Titre : Integer;
      Nature : T_Nature ;
      Medecin : T_PteurPers ;
      Id_Lecture :Boolean:=false ; --False quand non lu, true quand lu
      Date_Creat, Date_Deracc, Date_DerModif : T_Date ;
      Archive : Boolean := False;
   END RECORD;

--faire ajout data_error? (que constraint fait)
   PROCEDURE Saisie_NATURE(Nature: OUT T_nature);
   PROCEDURE Visu_1document (D: IN T_Document);
--pas de exception fait pour celui dessous
   PROCEDURE Saisie_1doc (D: out T_Document;Initialisation_id: in out integer;date_jour: out t_date;Pers: out t_personnel;L:t_pteurpers);

END Document;







