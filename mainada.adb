WITH personnel,liste_document,date,document,menu_main,outils, liste_personnel,file_demande,patients,arbre_patients;
USE personnel,liste_document,date,document,menu_main,outils, liste_personnel,file_demande,patients,arbre_patients;

PROCEDURE MainAda IS
   L:T_Pteurpers;
   Id:T_Pers;
   pers:t_personnel;
   Login :T_Titre;
   Empreinte :Integer;
   Fonction : Role_P;
   D: T_File_Dem;
   Demande:T_Demande;
   Date_Jour : T_Date;
   Cpt,Choix:Integer:=0;
   Document : T_Document;
   A:T_Arbre;
   Pat:T_Patient;
   ListeD : T_Pteurdoc;
   Initialisation_Id:Integer;
   Doc:T_Doc_Archive;Date_Archiv: T_Date;
   Liste_document_archive:t_pteurdoc;
BEGIN
   Initialisation_Pers(L);
   Init_Arbre(A,L);
   initialisation_id:=8;

   Menu_Demarrage(Liste_document_archive,doc,date_archiv,initialisation_id,listed,Document,L,Date_Jour,D,Demande,Login,Empreinte,Fonction, cpt,id,pers,choix,a,pat);

   end mainada;

