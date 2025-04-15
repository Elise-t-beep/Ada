WITH Ada.Text_IO, Ada.Integer_Text_IO,ada.Characters.Handling,outils,personnel,liste_personnel, date,patients,document,date;
USE Ada.Text_Io, Ada.Integer_Text_IO,Ada.Characters.Handling,Outils,Personnel,liste_personnel, date,patients,document,date;

PACKAGE BODY Liste_Document IS
--------------------------------------------------------------------------------------------------------------------------------------------

   PROCEDURE Visu_Liste_Doc (ListeD : T_Pteurdoc)IS
      tmp:t_pteurdoc:=ListeD;
   BEGIN
      WHILE Tmp/= NULL LOOP
         FOR I IN 1..100 LOOP
            Put('-');
         END LOOP;
         New_Line;
         if TMP.document.archive=False then
            Visu_1document(Tmp.Document);
            end if;
         Tmp:=Tmp.docSuiv;
      END LOOP;
   END Visu_Liste_Doc;
 --------------------------------------------------------------------------------------------------------------------------------------------
 PROCEDURE Ajout_Liste_Doc (ListeD : OUT T_Pteurdoc;D:T_Document)IS
 BEGIN
       ListeD:= NEW T_CellDoc'(D,ListeD);

   END Ajout_Liste_Doc;
--------------------------------------------------------------------------------------------------------------------------------------------
PROCEDURE Depiler_doc(P : IN OUT T_pteurdoc;Doc: OUT t_document; Erreur:OUT Boolean)IS
   BEGIN
      IF p = NULL THEN
         Erreur:=True; New_Line;

      ELSE
         doc:= P.document;
         Erreur:=False;
         P:= P.docsuiv;
      END IF;
   END Depiler_Doc;
--------------------------------------------------------------------------------------------------------------------------------------------
END Liste_Document;

