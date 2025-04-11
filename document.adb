WITH Ada.Text_IO, Ada.Integer_Text_IO,ada.Characters.Handling,outils,personnel,file_demande,liste_personnel, date;
USE Ada.Text_Io, Ada.Integer_Text_IO,Ada.Characters.Handling,Outils,Personnel,file_demande,liste_personnel, date;

PACKAGE BODY Document IS
-------------------------------------------------------------------------------------------------------------------------------------------------
   PROCEDURE Saisie_NATURE(Nature: OUT T_nature) IS
      S:String(1..15);
      K:integer;
   BEGIN
      put_line("Voici les natures possibles : Ordonnance, Certificat_Med, Compte_Rendu, Resultat_Exam");
      Put_Line("Veuillez indiquer la nature du document:");
      Get_Line(S,K);
      Nature:=T_nature'Value(S(1..K));
   END Saisie_Nature;
--------------------------------------------------------------------------------------------------pas testée
   PROCEDURE Visu_1document (D: in T_Document)IS
   BEGIN
      Put_Line("Id du document:");
      Put(D.Id);new_line;
      Put_Line("Titre du document:");
      Put(D.Titre);new_line;
      Put_line("Nature du document:");
      Put(T_Nature'Image(D.Nature));New_Line;
      Put_Line("Medecin associe a ce document:");
      visualisation_liste_pers(D.medecin);
--      Put(D.Medecin.Personnel.Identite_Personnel.Prenom);New_Line;
--      Put(D.Medecin.Personnel.Identite_Personnel.Prenom);new_line;
      IF D.Id_Lecture THEN
         Put_Line("Document lu.");
      ELSE
         Put_Line("Non lu.");
      END IF;
      Put_Line("Voici la date de creation:");
      Affiche_Date(D.Date_Creat);new_line;
      Put_Line("Voici la date du dernier acces:");
      Affiche_Date(D.Date_Deracc);new_line;
      Put_Line("Voici la date de derniere modification:");
      Affiche_Date(D.date_dermodif); new_line;
   END Visu_1document;
----------------------------------------------------------------------------------------------------------------------------------------------
   PROCEDURE Saisie_1doc (D: out T_Document;Initialisation_id:integer;date_jour: out t_date;Pers: out t_personnel;L:t_pteurpers)IS
   BEGIN
      LOOP
      Put_Line("Veuillez indiquer le medecin a l origine de ce document :");
      Saisie_Identite(Pers.Identite_Personnel);
         IF Recherche_1pers(L,Pers.Identite_Personnel) THEN
            D.Medecin:=Recherche_1pers2(L,Pers);EXIT;
         ELSE
            Put_Line("Erreur de saisie. Veuillez recommencer.");
         END IF;
      END LOOP;
      Put_Line("Vous etes dans la saisie du document.");
      D.Id:=Initialisation_Id+1;
      PUT_line("Veuillez saisir le titre:");
      Saisie_Titre(D.Titre,D.K_Titre);
      Saisie_Nature(D.Nature);
      D.Date_Creat:=Date_Jour;
      D.Date_Deracc:=Date_Jour;
      D.Date_dermodif:=Date_Jour;
   END Saisie_1doc;
----------------------------------------------------------------------------------------------------------------------------------------------


END Document;

