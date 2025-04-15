WITH liste_document,date,personnel,outils,liste_personnel,arbre_patients, Ada.Sequential_IO, Ada.Directories,liste_document,date,document;
USE liste_document,date,personnel,outils,liste_personnel, arbre_patients,Ada.Directories,liste_document,date,document;

PACKAGE Archivage_Doc IS

PACKAGE Archive_Document IS NEW Ada.Sequential_IO(T_doc_archive);
USE Archive_Document;

--   PROCEDURE SUPP_DOC_MED (A : IN OUT T_arbre ; ID : in T_identite);

PROCEDURE Transfo_Doc_To_Archive (Document:IN T_Document; Doc_Arch:OUT T_Doc_Archive;Identite:T_pers);
PROCEDURE Archivage_Documents (Archive : IN T_Doc_Archive);
PROCEDURE Archivage_Liste_Documents (Liste_Document_archive :T_pteurDoc; Identite : IN T_pers);
PROCEDURE Visu_1_Doc_Arch ( Document_Archive : T_Doc_Archive);
PROCEDURE Visu_Archive_Doc;
PROCEDURE Archivage_Fonction_Date (Date_Archiv: OUT T_Date;A:T_Arbre);
PROCEDURE SUPP_DOC_MED (A : IN OUT T_arbre ; IDentite : in T_PERS);
END Archivage_Doc;

