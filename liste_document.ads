WITH Ada.Characters.Handling, Ada.Text_IO, personnel,outils,liste_personnel,date,document;
USE Ada.Characters.Handling, Ada.Text_Io, personnel,outils,liste_personnel,date,document;

PACKAGE Liste_Document IS
   TYPE T_CellDoc;
   TYPE T_PteurDoc IS ACCESS T_CellDoc ;
   TYPE T_CellDoc IS RECORD
      Document : T_Document;
      Docsuiv : T_Pteurdoc;
   END RECORD;
   PROCEDURE Test (D:T_Document) ;
   PROCEDURE Visu_Liste_Doc (ListeD : T_Pteurdoc);
   PROCEDURE Ajout_Liste_Doc (ListeD : OUT T_Pteurdoc;D:T_Document);
END Liste_Document;

