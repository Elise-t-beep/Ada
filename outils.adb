PACKAGE BODY Outils IS
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   PROCEDURE Tiret (N : IN Natural) IS
   BEGIN
      FOR I IN 1..2*N LOOP
         Put ('-');
      END LOOP;
   END Tiret;
--------------------------------------------------------------------------------------------------------------------------------------------------------------
   PROCEDURE Saisie_Mot (M : OUT T_Mot; K : OUT Integer) IS
      Ok : Boolean := False;
   BEGIN
      LOOP
         M := (OTHERS =>' ');
         Get_Line (M, K);
         M := To_Upper (M);

         --Vérification des caractères saisis
         FOR I IN 1..K LOOP
            CASE M(I) IS
               WHEN 'A'..'Z' =>
                  Ok := True;
               WHEN '-'|'''|' ' =>
                  IF I= 1 OR I=K THEN
                     Put_Line ("Erreur de saisie, pas de caracteres speciaux aux extremites ");
                     Ok := False;
                     EXIT;
                  ELSIF M(I-1)='-' OR M(I-1)=''' OR M(I-1)=' ' THEN
                     Put_Line ("Erreur de saisie, pas de caracteres speciaux a la suite ");
                     Ok := False;
                     EXIT;
                  ELSE Ok:=True;
                  END IF;
               WHEN OTHERS =>
                  Put ("Erreur de saisie, erreur, caracteres non autorises ");
                  Ok := False;
                  EXIT;
            END CASE;
         END LOOP;
         EXIT WHEN OK=True;
      END LOOP;

   END Saisie_Mot;
   -----------------------------------------------------------------------------------------------------
   PROCEDURE Saisie_Titre (M : OUT T_Titre; K :    OUT Integer) IS
      Ok : Boolean := False;
   BEGIN
         M := (OTHERS =>' ');
         Put ("Saisie : ");
         Get_Line (M, K);
         M := To_Upper (M);
   END Saisie_Titre;

   -----------------------------------------------------------------------------------------------------
   PROCEDURE Saisie_Identite (Id : OUT T_Pers) IS
   BEGIN
      Put_Line ("Saisie de l'identite : ");
      Put_Line ("Nom :");
      Saisie_Mot(Id.Nom, Id.Knom);
      Id.Nom := To_Upper(Id.Nom);
      Put_Line ("Prenom :");
      Saisie_Mot(Id.Prenom, Id.Kprenom);
      Id.Prenom := To_Upper(Id.Prenom);
   END Saisie_Identite;
   -----------------------------------------------------------------------------------------------------
   PROCEDURE Creation_Login (Id : IN out T_Pers; Login : OUT T_Titre; Klogin : OUT Integer)IS
   BEGIN
      Login := (OTHERS =>' ');
      ID.Nom:= To_Upper(Id.Nom);
      ID.Prenom:= To_Upper(Id.Prenom);
      Login(1..Id.Knom):= Id.Nom(1..ID.Knom);
      Login(Id.Knom+1):='_';
      Login(id.knom+2..id.knom+id.kprenom+1):= Id.preNom(1..ID.Kprenom);
      Klogin:=Id.Kprenom+Id.Knom+1;
   END CREATION_Login;
   -----------------------------------------------------------------------------------------------------

   FUNCTION Calcul_Empreinte (Mdp : T_Mdp) RETURN Integer IS
      Emp : Integer := 0;
   BEGIN
      FOR I IN Mdp'RANGE LOOP
         Emp := (Emp + (I * Character'Pos (Mdp(I)))) mod 2048;
      END LOOP;
      RETURN (Emp);
   END Calcul_Empreinte;

-----------------------------------------------------------------------------------------------------
   PROCEDURE Init_Empreinte (Emp : OUT Integer) IS
      Mdp : T_Mdp;
      Ok : Boolean;
   BEGIN
         Put ("Saisie du mot de passe (10 caracteres) : ");
         Get(Mdp); Skip_Line;
      FOR I IN Mdp'RANGE LOOP
         CASE Mdp(I) IS
            WHEN 'A'..'Z' =>
               Ok := True;
            WHEN 'a'..'z' =>
               Ok := True;
            WHEN '0'..'9' =>
               Ok := True;
            WHEN '#'|'$'|'*'|'.'|'!'|'?' =>
               Ok := True;
            WHEN OTHERS =>
               Ok := False;
               EXIT;
         END CASE;
      END LOOP;
      Put ("Verification : Le mot de passe saisi est : "); Put (Mdp);
      New_Line;
      IF Ok = True THEN
         Emp := Calcul_Empreinte (Mdp);
      ELSE
         Put ("Erreur lors de la saisie du mot de passe."); Skip_Line;
      END IF;
   END Init_Empreinte;

-----------------------------------------------------------------------------------------------------

END Outils;

