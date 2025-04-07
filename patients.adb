PACKAGE BODY Patients IS
--package à tester + à finir (doc et mdp)
-----------------------------------------------------------------------------------------

   --faire un appel de package personnel????
   --cf package Personnel
   PROCEDURE Saisie_NOMJM (Pat : OUT T_Patient) IS
   BEGIN
      Put_Line("Veuillez saisir le nom de jeune fille de votre mere");
      Saisie_Mot(Pat.NomJM, Pat.K_Nomjm);
   END Saisie_Nomjm;
   ----------------------------------------------------------------------------
   PROCEDURE Saisie_Fonction (Pat : OUT T_Patient) IS
      S:String(1..15);
      K:integer;
   BEGIN
      Put_Line("Veuillez indiquer votre fonction:");
      Get_Line(S,K);
      Pat.Fonction:=Role_P'Value(S(1..K));
   END Saisie_Fonction;

-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------

END Patients;

