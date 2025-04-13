WITH liste_document,arbre_patients, Ada.Sequential_IO, Ada.Directories,liste_document,date,document;
USE liste_document, arbre_patients,Ada.Directories,liste_document,date,document;

PACKAGE Archivage_Doc IS

PACKAGE Archive_Document IS NEW Ada.Sequential_IO(T_doc_archive);
USE Archive_Document;

--   PROCEDURE Archive_Perso (Perso : IN T_Personnel);

--   PROCEDURE Visu_Archive_Anciens_Perso;

--   FUNCTION Recherche_Archive_Perso (Identite : T_Personnel) RETURN Boolean;
--   PROCEDURE SUPP_DOC_MED (A : IN OUT T_arbre ; ID : in T_identite);
   PROCEDURE Test;
--   PROCEDURE Archive_Doc(Doc:t_document;date_archiv: out t_date;a:t_arbre);


END Archivage_Doc;

