PACKAGE BODY Patients IS
--package à tester + à finir (doc et mdp)
-----------------------------------------------------------------------------------------

   --faire un appel de package personnel????
   --cf package Personnel
   PROCEDURE Saisie_NOMJM (Pers : OUT T_Patient) IS
   BEGIN
      Put_Line("Veuillez saisir le nom de jeune fille de votre mere");
      Saisie_Mot(Pers.NomJM, Pers.K_Nomjm);
   END Saisie_Nomjm;
   ----------------------------------------------------------------------------
   PROCEDURE Saisie_Fonction (Pers : OUT T_Patient) IS
      S:String(1..15);
      K:integer;
   BEGIN
      Put_Line("Veuillez indiquer votre fonction:");
      Get_Line(S,K);
      Pers.Fonction:=Role_P'Value(S(1..K));
   END Saisie_Fonction;

-----------------------------------------------------------------------------------------

   --cf package Personnel
   PROCEDURE Saisie_Patient (Pers : OUT T_Patient) IS
   BEGIN
      Saisie_Identite(Pers.Identite_Patient);
      Creation_Login(Pers.Identite_Patient,Pers.Login,Pers.Klogin);
      Saisie_Nomjm(Pers);
      --faire demande mdp
      Init_Empreinte (Pers.EmpreinteMDP);
      Saisie_Fonction(Pers);
      IF Pers.Fonction /= Patient THEN Put ("erreur de saisie, veuillez choisir patient");
      END IF;
      --faire saisie des docs (à partir package doc?)
      --proposez demande mdp (relier au package admin?)
   END Saisie_Patient;

-----------------------------------------------------------------------------------------

END Patients;

