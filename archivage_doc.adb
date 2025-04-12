--mettre les with et use ici aussi ?
WITH liste_document, Ada.Sequential_IO, Ada.Directories;
USE liste_document, Ada.Directories;

PACKAGE BODY Archivage_Doc IS
   USE Archive_Document;



  -- procedure d archivage des anciens personnels --


   PROCEDURE Archive_Perso (
         Perso : IN T_Personnel) IS

      Anciens_Perso : Archive_Personnel.File_Type;

   BEGIN

      IF Exists ("Personnels") THEN
         Open(Anciens_Perso, Append_File, "Personnels");
      ELSE
         Create (Anciens_Perso, Name =>"Personnels");
      END IF;
      Write (Anciens_Perso, Perso);
      Close (Anciens_Perso);

   END Archive_Perso;




-- procedure de visualisation de l'archive des anciens personnels --


   PROCEDURE Visu_Archive_Anciens_Perso IS

      Anciens_Perso : Archive_Personnel.File_Type;
      Perso         : T_Personnel;

   BEGIN

      IF Exists ("Personnels") THEN
         Open(Anciens_Perso, In_File, "Personnels");
         WHILE NOT End_Of_File(Anciens_Perso) LOOP
            Read(Anciens_Perso, Perso);
            Visu1Personne(Perso);
            New_Line;
         END LOOP;

         Close(Anciens_Perso);
      ELSE
         Put_Line("Aucun personnel archive");
         New_Line;
      END IF;

   END Visu_Archive_Anciens_Perso;

   ----- fonction pour rechercher un personnel dans l archive --------

   FUNCTION Recherche_Archive_Perso (
         Identite : T_Personnel)
     RETURN BOOLEAN IS

      Ok            : Boolean                     := True;
      Anciens_Perso : Archive_Personnel.File_Type;
      Perso         : T_Personnel;

   BEGIN
      IF Exists ("Personnels") THEN
         Open(Anciens_Perso, In_File, "Personnels");
         WHILE NOT End_Of_File(Anciens_Perso) LOOP
            Read(Anciens_Perso, Perso);
            IF Perso.Identite.Nom = Identite.Identite.Nom THEN
               Ok := False;
            END IF;
         END LOOP;
      ELSE
         RETURN(Ok);
      END IF;
      Close (Anciens_Perso);
      RETURN (Ok);
   END Recherche_Archive_Perso;

END Archivage_Doc;

