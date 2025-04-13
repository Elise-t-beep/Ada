WITH  Ada.Sequential_IO, Ada.Directories,Ada.Text_Io, Ada.Integer_Text_IO;
USE  Ada.Directories,Ada.Text_Io, Ada.Integer_Text_IO;

PACKAGE BODY Archivage_Doc IS
   USE Archive_Document;

   PROCEDURE Test IS
   BEGIN NULL;
   END Test;

  -- procedure d archivage des documents avant une date donnée
--   PROCEDURE Archive_Doc(Doc:t_document;date_archiv: out t_date;a:t_arbre) IS
--   Ancien_Doc: Archive_document.File_Type;
--      Tmp:T_Arbre:=A;
--      l:t_pteurdoc;
--   BEGIN
--   Put_Line("Veuillez indiquer la date d archivage.");
--      Saisie_Date(Date_Archiv);
--      IF Tmp/=NULL THEN
--         IF Tmp.Patient.Document /=NULL THEN
--            L:=TMP.Patient.Document;
--            WHILE L/=NULL LOOP
--
--               IF Comp_Dates(Date_Archiv,L.Document.Date_Creat) THEN

--                  IF Exists ("AncienDocument") THEN
--                     Open(Ancien_Doc, Append_File, "AncienDocument");
--                  ELSE
--                     Create (Ancien_Doc, Name =>"AncienDocument");
--                  END IF;
--                  Write (Ancien_Doc, Doc);
--                  Close (Ancien_Doc);
--                  END IF;
--            END LOOP;
--         END IF;
--      END IF;
--
--   END Archive_Doc;




---- procedure de visualisation de l'archive des anciens personnels --


--   PROCEDURE Visu_Archive_Anciens_Perso IS

--      Anciens_Perso : Archive_Personnel.File_Type;
--      Perso         : T_Personnel;

--   BEGIN

--      IF Exists ("Personnels") THEN
--         Open(Anciens_Perso, In_File, "Personnels");
--         WHILE NOT End_Of_File(Anciens_Perso) LOOP
--            Read(Anciens_Perso, Perso);
--            Visu1Personne(Perso);
--            New_Line;
--         END LOOP;

--         Close(Anciens_Perso);
--      ELSE
--         Put_Line("Aucun personnel archive");
--         New_Line;
--      END IF;

--   END Visu_Archive_Anciens_Perso;

--   ----- fonction pour rechercher un personnel dans l archive --------

--   FUNCTION Recherche_Archive_Perso (
--         Identite : T_Personnel)
--     RETURN BOOLEAN IS

--      Ok            : Boolean                     := True;
--      Anciens_Perso : Archive_Personnel.File_Type;
--      Perso         : T_Personnel;

--   BEGIN
--      IF Exists ("Personnels") THEN
--         Open(Anciens_Perso, In_File, "Personnels");
--         WHILE NOT End_Of_File(Anciens_Perso) LOOP
--            Read(Anciens_Perso, Perso);
--            IF Perso.Identite.Nom = Identite.Identite.Nom THEN
--               Ok := False;
--            END IF;
--         END LOOP;
--      ELSE
--         RETURN(Ok);
--      END IF;
--      Close (Anciens_Perso);
--      RETURN (Ok);
--   END Recherche_Archive_Perso;
--
--PROCEDURE SUPP_DOC_MED (A : IN OUT T_arbre_p ; ID : in T_identite) IS
--      tmp : T_Ptr_Doc;
--      DA : T_doc_archive;
--      doc : T_Doc;
--      ok : Boolean;
--   BEGIN
--      IF A /= NULL THEN
--         SUPP_DOC_MED (A.Fg_P, id);
--         if A.Pat.Liste_Doc_Pat /= null then
--            tmp := A.pat.Liste_Doc_Pat;
--         WHILE tmp /= NULL LOOP
--          if tmp.Doc.Medecin.perso.id_perso = ID then
--            transforme (tmp.doc, DA, A.PAT.Id_Pat);
--            ARCHIVE_UN_DOC (DA, A.PAT.Id_pat);
--            depiler (A.pat.liste_doc_pat, tmp.doc, ok);
--         END IF;
--         tmp := tmp.Suiv_Doc;
--         END LOOP;
--      END IF;
--      SUPP_DOC_MED (A.Fd_P, id);
--   end if;

--   END SUPP_DOC_MED;
END Archivage_Doc;

