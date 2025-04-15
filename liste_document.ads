WITH Ada.Characters.Handling, Ada.Text_IO, personnel,outils,liste_personnel,date,document;
USE Ada.Characters.Handling, Ada.Text_Io, personnel,outils,liste_personnel,date,document;

PACKAGE Liste_Document IS
   TYPE T_CellDoc;
   TYPE T_PteurDoc IS ACCESS T_CellDoc ;
   TYPE T_CellDoc IS RECORD
      Document : T_Document;
      Docsuiv : T_Pteurdoc;
   END RECORD;

TYPE T_Doc_Archive IS RECORD

patient : T_pers;
medecin : T_pers;
Id_doc : integer ; -- Compteur auto-incrémenté cf Projet S5
Titre_doc : T_Titre; -- Max 50 caractères
K_titre : integer;
Nature_doc : T_Nature ;
Id_Lecture_doc :boolean ;
Date_creat, Date_deracc, Date_DerModif : T_date ;
END RECORD;

   PROCEDURE Visu_Liste_Doc (ListeD : T_Pteurdoc);
   PROCEDURE Ajout_Liste_Doc (ListeD : OUT T_Pteurdoc;D:T_Document);
   PROCEDURE Depiler_doc(P : IN OUT T_pteurdoc;Doc: OUT t_document; Erreur:OUT Boolean);

END Liste_Document;

