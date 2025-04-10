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

