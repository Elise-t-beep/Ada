WITH Ada.Text_IO, Ada.Integer_Text_IO,outils,ada.Characters.Handling;
USE Ada.Text_Io, Ada.Integer_Text_IO,outils,ada.Characters.Handling;

PACKAGE BODY Personnel IS

-----------------------------------------------------------------------------------------------------
   PROCEDURE Saisie_NOMJM (Pers : OUT T_Personnel) IS
   BEGIN
      Put_Line("Veuillez saisir le nom de jeune fille de votre mere");
      Saisie_Mot(Pers.NomJM, Pers.K_Nomjm);
   END Saisie_Nomjm;
-----------------------------------------------------------------------------------------------------
   PROCEDURE Saisie_Fonction1 (Pers : OUT T_Personnel) IS
      S:String(1..15);
      K:integer;
   BEGIN
     LOOP
          BEGIN
             Put_Line("Veuillez indiquer votre fonction:");
             Get_Line(S,K);
             S:=to_upper(s);
             Pers.Fonction:=Role_P'Value(S(1..K));
             IF Pers.Fonction = Patient THEN
                Put ("Vous etes au niveau du personnel, vous ne pouvez pas etre patient");
                New_Line;
             END IF;
             EXIT WHEN Pers.Fonction = Secretaire OR Pers.Fonction = Medecin OR Pers.Fonction = Administrateur;
          EXCEPTION
             WHEN Constraint_Error => Put_Line ("Cette fonction n'existe pas, recommencez");
          END;
       END LOOP;
   END Saisie_Fonction1;
-----------------------------------------------------------------------------------------------------
   PROCEDURE Saisie_Personnel (Pers : OUT T_Personnel) IS
   BEGIN
     New_Line;
     Saisie_Identite(Pers.Identite_Personnel);
     Creation_login(Pers.identite_personnel,pers.login,pers.klogin);
     Saisie_Nomjm(Pers);
     Saisie_Fonction1(Pers);
     Init_Empreinte (Pers.EmpreinteMDP);
   END SAISIE_Personnel;
-----------------------------------------------------------------------------------------------------
   PROCEDURE Visu_1Personnel (Pers : IN T_Personnel) IS
   BEGIN
      Put_line("Identite:");
      Put_line(Pers.Identite_Personnel.Nom);
      Put_line(Pers.Identite_Personnel.Prenom);
      Put_line("Login:");
      Put_line(Pers.Login);
      Put_line("Nom de Jeune Fille de la Mere:");
      Put_line(Pers.Nomjm);
      Put_line("Empreinte du Mot de Passe:");
      Put(Pers.Empreintemdp);NEW_line;
      Put_line("Fonction:");
      Put(Role_P'Image(Pers.Fonction));new_line;
   END VISU_1personnel;
-----------------------------------------------------------------------------------------------------

END Personnel;


