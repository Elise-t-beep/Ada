WITH  Ada.Sequential_IO, Ada.Directories,Ada.Text_Io, Ada.Integer_Text_IO,personnel;
USE  Ada.Directories,Ada.Text_Io, Ada.Integer_Text_IO,personnel;

PACKAGE BODY Archivage_Doc IS
   USE Archive_Document;
-------------------------------------------------------------------------------------------------------------------------
--Procedure qui transforme le document qu'on veut archiver en T_doc_archive le pointeur pour archiver
   PROCEDURE Transfo_Doc_To_Archive (Document:IN T_Document; Doc_Arch:OUT T_Doc_Archive;Identite:T_pers) IS
   BEGIN
      Doc_Arch.Id_doc:=Document.Id;
      Doc_Arch.Titre_doc:=Document.Titre;
      Doc_Arch.Nature_doc:=Document.Nature;
      Doc_Arch.Medecin:=Document.Medecin.Personnel.identite_personnel;
      Doc_Arch.Patient:=Identite;
      Doc_Arch.id_Lecture_doc:=Document.id_lecture;
      Doc_Arch.Date_Creat:=Document.Date_Creat;
      Doc_Arch.Date_Deracc:=Document.Date_Deracc;
      Doc_Arch.Date_Dermodif:=Document.Date_Dermodif;
   END Transfo_Doc_To_Archive;
-------------------------------------------------------------------------------------------------------------------------
 -- procédure qui prend le pointeur et qui l'archive en fichier sur le pc
   PROCEDURE Archivage_Documents (Archive : IN T_Doc_Archive) IS
      Document_Archive2 : Archive_document.File_Type;
   BEGIN

      IF Exists ("Document_archive2")THEN
         Open(Document_archive2,Append_File,"Document_Archive2");
      ELSE
         Create( document_archive2,Name =>"Document_archive2");
      END IF;
      Write( document_archive2,Archive);
      Close( document_archive2);
   END Archivage_Documents;
-------------------------------------------------------------------------------------------------------------------------
PROCEDURE Archivage_Liste_Documents (Liste_Document_archive :T_pteurDoc; Identite : IN T_pers) IS
      Document_archive: T_Doc_Archive;
   BEGIN
      IF Liste_document_archive.Docsuiv/=NULL THEN
         Archivage_Liste_Documents (liste_document_archive.Docsuiv,Identite);
      END IF;
      Transfo_Doc_To_Archive(liste_document_archive.Document,Document_archive,Identite);
      Archivage_Documents(Document_archive);

   END Archivage_Liste_Documents;
-------------------------------------------------------------------------------------------------------------------------
   PROCEDURE Visu_1_Doc_Arch ( Document_archive : T_Doc_Archive) IS
   BEGIN
      new_line;
      Put_line("Identifiant du document : ");
      Put(Document_archive.ID_doc);
      New_Line;
      Put_line("Titre du document : ");
      Put(Document_Archive.Titre_Doc);
      New_Line;
      Put_line("Nature du document: ");
      Put(T_Nature'Image(Document_Archive.Nature_Doc));
      new_line;
      Put_line("Medecin a l origine du document : ");
      Put(Document_Archive.Medecin.Prenom);New_Line;
      put(document_archive.medecin.nom);new_line;
      Put_line("Identite du Patient : ");
      Put(Document_Archive.patient.Prenom);New_Line;
      put(document_archive.patient.nom);new_line;
      IF Document_archive.id_Lecture_doc THEN
         Put("Document lu");
      ELSE
         Put("Document non lu");
      END IF;
      New_Line;
      Put_line("Date de creation du document: ");
      Affiche_Date(Document_archive.Date_Creat);
      New_Line;
      Put_line("Date du dernier acces au document : ");
      Affiche_Date(Document_archive.Date_Deracc);
      New_Line;
      Put_line("Date de la derniere modification du document : ");
      Affiche_Date(Document_archive.Date_dermodif);
      New_Line;
   END Visu_1_Doc_Arch;
-------------------------------------------------------------------------------------------------------------------------
 PROCEDURE Visu_Archive_Doc IS
    Document_archive2: Archive_document.File_Type;
    Doc_arch : T_Doc_Archive;
 BEGIN
    FOR I IN 1..100 LOOP
       PUT('-');
    END LOOP;

      IF Exists ("Document_archive2")  THEN
         Open(document_archive2,In_File,"Document_archive2");

         WHILE  NOT End_Of_File(document_archive2) LOOP
            Read(document_archive2,doc_arch);
            Visu_1_Doc_Arch(doc_arch);
            New_Line;
         END LOOP;
         Close(document_archive2);
      ELSE
         Put("Il n y a pas de document archive.");
      END IF;
   END Visu_Archive_Doc;
-----------------------------------------------------------------------------------------------------
-- procedure d archivage des documents avant une date donnée
   PROCEDURE Archivage_Fonction_Date (Date_Archiv: out T_Date;A:T_Arbre) IS
      L:T_Pteurdoc;
      Doc_Archiv: T_Doc_Archive;
      Compare:Boolean;
      erreur:boolean;
      BEGIN
         IF A/= NULL THEN
            Archivage_Fonction_Date(Date_Archiv,A.Fg);
            IF A.Patient.Document /= NULL THEN
               L:= A.Patient.Document;
               WHILE L/= NULL LOOP
                  LOOP
                  BEGIN

                  Compare:=Comp_Dates(Date_Archiv,L.Document.Date_Creat);
                     IF Compare THEN
                        L.document.archive:=true;
                     Transfo_Doc_To_Archive (L.DOCUMENT, Doc_Archiv,A.Patient.Identite_Patient);
                        Archivage_Documents(Doc_Archiv);

                        Depiler_Doc(L,L.Document,Erreur);
                        EXIT;
                  END IF;
                        L:=L.Docsuiv;
                        EXIT;
                     EXCEPTION
                     WHEN Constraint_Error => Put("Invalide.");
                     SKIP_line;
                     END ;
                  END LOOP;

               END LOOP;
            END IF;
            Archivage_Fonction_Date(Date_Archiv,A.Fd);
         END IF;
      END Archivage_Fonction_Date;
-----------------------------------------------------------------------------------------------------
PROCEDURE SUPP_DOC_MED (A : IN OUT T_arbre ; IDentite : in T_PERS) IS
      tmp : T_pteurDoc;
      Doc_arch : T_doc_archive;
      doc : T_Document;
      erreur: Boolean;
   BEGIN
      IF A /= NULL THEN
         SUPP_DOC_MED (A.Fg, identite);
         if A.Patient.document /= null then
            tmp := A.patient.document;
         WHILE tmp /= NULL LOOP
          if tmp.Document.Medecin.personnel.identite_personnel = IDentite then
            Transfo_Doc_To_Archive (tmp.DOCUMENT, Doc_Arch,A.Patient.Identite_Patient);
            Archivage_Documents(Doc_Arch);
            Depiler_doc(tmp,tmp.document,erreur);
         END IF;
         tmp := tmp.docsuiv;
         END LOOP;
      END IF;
      SUPP_DOC_MED (A.Fd, identite);
      END IF;
   END SUPP_DOC_MED;
-----------------------------------------------------------------------------------------------------

END Archivage_Doc;

