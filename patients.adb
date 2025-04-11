WITH Ada.Text_IO, Ada.Integer_Text_IO,ada.Characters.Handling,outils,personnel,liste_document,liste_personnel, document,date,patients;
USE Ada.Text_Io, Ada.Integer_Text_IO,Ada.Characters.Handling,Outils,liste_document,Personnel,liste_personnel,document, date,patients;

PACKAGE BODY Patients IS
-----------------------------------------------------------------------------------------
   PROCEDURE Saisie_NOMJM2 (Pat : OUT T_Patient) IS
   BEGIN
      Put_Line("Veuillez saisir le nom de jeune fille de votre mere");
      Saisie_Mot(Pat.NomJM, Pat.K_Nomjm);
   END Saisie_Nomjm2;
   ----------------------------------------------------------------------------
   PROCEDURE Saisie_Fonction2 (Pat : OUT T_Patient) IS
      S:String(1..15);
      K:integer;
   BEGIN
      LOOP
          BEGIN
             Put_Line("Veuillez indiquer votre fonction:");
             Get_Line(S,K);
             Pat.Fonction:=Role_P'Value(S(1..K));
             IF Pat.Fonction /= Patient THEN
                Put ("erreur de choix de fonction, veuillez choisir patient");
                New_Line;
             END IF;
             EXIT WHEN Pat.Fonction = Patient;
          EXCEPTION
             WHEN Constraint_Error => Put_Line ("Cette fonction n'existe pas, recommencez");
          END;
       END LOOP;
   END Saisie_Fonction2;
-----------------------------------------------------------------------------------------
   PROCEDURE Saisie_Patient (Pat : OUT T_Patient) IS
   BEGIN
      Saisie_Identite(Pat.Identite_Patient);
      Creation_Login(Pat.Identite_Patient,Pat.Login,Pat.Klogin);
      Saisie_Nomjm2(Pat);
      Init_Empreinte (Pat.EmpreinteMDP);
      Saisie_Fonction2(Pat);
   END Saisie_Patient;
-----------------------------------------------------------------------------------------
   PROCEDURE Visu_1Patient (Pat : IN T_Patient) IS
   BEGIN
      Put_Line("Identite:");
      put_line("Nom:");
      Put_Line(Pat.Identite_Patient.Nom);
      put_line("Prenom:");
      Put_line(Pat.Identite_Patient.Prenom);
      Put_line("Login:");
      Put_line(Pat.Login);
      Put_line("Nom de Jeune Fille de la Mere:");
      Put_line(Pat.NomJM);
      Put_line("Empreinte du Mot de Passe:");
      Put(Pat.EmpreinteMDP);NEW_Line;
      put_line("Fonction:");
      Put(Role_P'Image(Pat.Fonction));new_line;
      Put_Line("Les documents de ce patient:");
      New_Line;
   END VISU_1Patient;
END Patients;

