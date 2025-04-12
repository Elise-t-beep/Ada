WITH liste_document, Ada.Sequential_IO, Ada.Directories;
USE liste_document, Ada.Directories;

PACKAGE Archivage_Doc IS

PACKAGE Archive_Document IS NEW Ada.Sequential_IO(T_Doc_Archive);
USE Archive_Document;

--   PROCEDURE Archive_Perso (Perso : IN T_Personnel);

--   PROCEDURE Visu_Archive_Anciens_Perso;

--   FUNCTION Recherche_Archive_Perso (Identite : T_Personnel) RETURN Boolean;

END Archivage_Doc;

