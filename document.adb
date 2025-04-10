WITH Ada.Text_IO, Ada.Integer_Text_IO,ada.Characters.Handling,outils,personnel,file_demande,liste_personnel, date,patients,arbre_patients;
USE Ada.Text_Io, Ada.Integer_Text_IO,Ada.Characters.Handling,Outils,Personnel,file_demande,liste_personnel, date,patients,arbre_patients;

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
   PROCEDURE Saisie_1doc (D: OUT T_Document;L:t_pteurpers;Date_jour: t_date;Id: out t_pers;initialisation_ID:integer) IS
      Pers,PersMed :T_Personnel;
   BEGIN
      Put_Line("Veuillez indiquer votre fonction :");
      Saisie_Fonction1(Pers);
      Put_Line("Veuillez saisir votre identite:");
      Saisie_Identite(Pers.identite_personnel);
      IF PERS.Fonction = Medecin THEN
         IF Recherche_1pers2(L,Pers) = NULL THEN
            Put_Line("Erreur, nous n avons pas trouve ce medecin dans la liste du personnel.");
         ELSE
         D.Medecin:= Recherche_1pers2(L,Pers);
         Saisie_Titre(D.Titre,D.K_Titre);
         Put_Line("Attention, vous ne pouvez ajouter qu une ordonnance ou un certificat pour ce patient.");
         Saisie_Nature(D.Nature);
         D.Date_Creat:=Date_Jour;
         D.Id:= Initialisation_Id + 1;

         Put_Line("Pour quel patient voulez vous ajouter ce document ?");
         Saisie_Identite(ID);
         -- Recherche dans l'arbre fonction qui retourne pointeur?
         END IF;
      ELSIF PERS.Fonction = Secretaire THEN
          Put_Line("Veuillez saisir l identite du medecin :");
          Saisie_Identite(PersMed.identite_personnel);
         IF Recherche_1pers2(L,PersMed) = NULL THEN
            Put_Line("Erreur, nous n avons pas trouve ce medecin dans la liste du personnel.");
         ELSE
          D.Medecin:= Recherche_1pers2(L,PersMed);
          Saisie_Titre(D.Titre,D.K_Titre);
          Put_Line("Attention, vous ne pouvez ajouter qu un compte-rendu de visite ou un resultat d'examen pour ce patient.");
          Saisie_Nature(D.Nature);
          D.Date_Creat:=Date_Jour;
          Put_Line("Pour quel patient voulez vous ajouter ce document ?");
          Saisie_Identite(ID);
          -- Recherche dans l'arbre fonction qui retourne pointeur?
         END IF;
      ELSE
         Put_Line("Vous n etes pas habilites a ajouter des documents.");
      END IF;
   END Saisie_1doc;
-----------------------------------------------------------------------------------------------------------------------------------------
   PROCEDURE Visu_1document (D: in T_Document)IS
   BEGIN
      Put_Line("Id du document:");
      Put(D.Id);
      Put_Line("Titre du document:");
      Put(D.Titre);
      Put("Nature du document:");
      Put(T_Nature'Image(D.Nature));New_Line;
      Put("Medecin associe a ce document:");
      Put(D.Medecin.Personnel.Identite_Personnel.Nom);New_Line;
      put(d.medecin.personnel.identite_personnel.prenom);
   END Visu_1document;
----------------------------------------------------------------------------------------------------------------------------------------------


END Document;

