PACKAGE BODY Outils IS

   -----------------------------------------------------------------------------------------------------
   PROCEDURE Saisie_Mot (
         M :    OUT T_Mot;
         K :    OUT Integer) IS
      --procedure afin de verifier que tous les mots saisis sont "grammaticalement" corrects
      Ok : Boolean := False;
   BEGIN
      LOOP
         M := (OTHERS =>' ');
         Get_Line (M, K);
         M := To_Upper (M);

         --validation de l'ensemble des characteres du mot ecrit
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
   PROCEDURE Saisie_Titre (
         M :    OUT T_Titre;
         K :    OUT Integer) IS
      Ok : Boolean := False;
   BEGIN
      LOOP
         --invit de saisie dans le programme principal
         M := (OTHERS =>' ');
         Put ("Saisie : ");
         Get_Line (M, K);
         M := To_Upper (M);

         --validation de l'ensemble des characteres du mot ecrit
         FOR I IN M'First..K LOOP
            CASE M(I) IS
               WHEN 'A'..'Z' =>
                  Ok := True;
               WHEN '-'|'''|' ' =>
                  IF I=M'First OR I=K THEN
                     Put_Line ("pas de caracteres speciaux aux extremites ");
                     Ok := False;
                     EXIT;
                  ELSIF M(I-1)='-' OR M(I-1)=''' OR M(I-1)=' ' THEN
                     Put_Line ("pas de caracteres speciaux a la suite ");
                     Ok := False;
                     EXIT;
                  END IF;
               WHEN OTHERS =>
                  Put ("erreur, caracteres non autorises ");
                  Ok := False;
                  EXIT;
            END CASE;
         END LOOP;
         EXIT WHEN OK=True;
      END LOOP;

   END Saisie_Titre;

   -----------------------------------------------------------------------------------------------------
   PROCEDURE Saisie_Identite (
         Id :    OUT T_Pers) IS
      --se servir de saisie_mot et de t_pers
   BEGIN
      Put_Line ("saisie de l'identite du membre (patient ou personnel : ");
      Put_Line ("Nom ");
      Saisie_Mot(Id.Nom, Id.Knom);
      Id.Nom := To_Upper(Id.Nom);
      Put_Line ("Prenom");
      Saisie_Mot(Id.Prenom, Id.Kprenom);
      Id.Prenom := To_Upper(Id.Prenom);
   END Saisie_Identite;
   -----------------------------------------------------------------------------------------------------
   PROCEDURE Creation_Login (Id : IN out T_Pers; Login : OUT T_Titre; Klogin : OUT Integer)IS

   BEGIN
      ID.Nom:= To_Upper(Id.Nom);
      ID.Prenom:= To_Upper(Id.Prenom);
      Login(1..Id.Knom):= Id.Nom(1..ID.Knom);
      Login(Id.Knom+1):='_';
      Login(id.knom+2..id.knom+id.kprenom+1):= Id.preNom(1..ID.Kprenom);
      Klogin:=Id.Kprenom+Id.Knom+1;
   END CREATION_Login;

END Outils;

