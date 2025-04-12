WITH Ada.Text_IO, Ada.Integer_Text_IO,ada.Characters.Handling,outils,personnel,liste_personnel, date,patients,document,date;
USE Ada.Text_Io, Ada.Integer_Text_IO,Ada.Characters.Handling,Outils,Personnel,liste_personnel, date,patients,document,date;

PACKAGE BODY Liste_Document IS
   PROCEDURE Test (D:T_Document) IS
   BEGIN
      NULL;
   END Test;
----------------------------------------------------------------------

   PROCEDURE Visu_Liste_Doc (ListeD : T_Pteurdoc)IS
      tmp:t_pteurdoc:=ListeD;
   BEGIN
      WHILE Tmp/= NULL LOOP
         FOR I IN 1..100 LOOP
            Put('-');
         END LOOP;
         New_Line;
         Visu_1document(Tmp.Document);
         Tmp:=Tmp.docSuiv;
      END LOOP;
   END Visu_Liste_Doc;
 ----------------------------------------------------------------------
 PROCEDURE Ajout_Liste_Doc (ListeD : OUT T_Pteurdoc;D:T_Document)IS
 BEGIN
       ListeD:= NEW T_CellDoc'(D,ListeD);

   END Ajout_Liste_Doc;
----------------------------------------------------------------------

END Liste_Document;

