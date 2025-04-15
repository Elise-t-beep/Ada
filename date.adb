WITH Ada.Text_IO, Ada.Integer_Text_IO;
USE Ada.Text_Io, Ada.Integer_Text_IO;

PACKAGE BODY Date IS

   FUNCTION Bis (
         Annee : Integer)
     RETURN Boolean IS
      Bissextile : Boolean;
   BEGIN
      IF (Annee mod 4 = 0 AND (Annee mod 100 /= 0 OR Annee mod 400 = 0))THEN
         Bissextile:= True;
      ELSE
         Bissextile:= False;
      END IF;
      RETURN Bissextile;
   END Bis;

   FUNCTION Nbj (
         M     : T_Mois;
         Annee : Integer)
     RETURN Integer IS

   BEGIN
      CASE M IS
         WHEN Janvier | Mars | Mai | Juillet | Aout | Octobre | Decembre =>
            RETURN 31;
         WHEN Avril | Juin | Septembre | Novembre =>
            RETURN 30;
         WHEN Fevrier =>
            IF Bis(annee) THEN
               RETURN 29;
            ELSE
               RETURN 28;
            END IF;
      END CASE;
   END Nbj;

   PROCEDURE Saisie_date (
         T :    OUT T_Date) IS
      S : String (1 .. 10);
      K : Integer;

   BEGIN
      LOOP
         begin
         Put_Line("Veuillez saisir l'annee:");
         Get(T.Annee);
            Skip_Line;
         EXIT WHEN T.Annee > 0;
         EXCEPTION
         WHEN Data_Error => Skip_Line;Put_Line("erreur de saisie, recommencez");
         end;
      END LOOP;
      LOOP
         begin
         Put_Line("Veuillez saisir le mois (en lettres):");
         Get_Line(S,K);
         T.Mois:= T_Mois'Value(S(1..K));
         EXIT;
         EXCEPTION
         WHEN Constraint_Error=>Put_Line("erreur de saisie");
         end;
      end loop;
      LOOP
         begin
         Put_Line("Veuillez saisir le jour (nombre):");
         Get(T.Numj);
         Skip_Line;
         EXIT WHEN T.Numj <= Nbj(T.Mois,T.Annee);
         EXCEPTION
         When constraint_error => skip_line;put_line("Mauvaise valeur, recommencez");
         WHEN Data_Error => Skip_Line;Put_Line("Erreur de saisie, recommencez");
         end;
      END LOOP;
   END Saisie_date;

   PROCEDURE Lendemain (
         T : IN OUT T_Date) IS
   BEGIN
      IF T.Numj < Nbj(T.Mois,T.Annee) THEN
         T.Numj:= T.Numj +1;
      ELSE
         T.Numj:=1;
         IF T.Mois = T_Mois'Last THEN
            T.Mois:= T_Mois'First;
            T.annee:=T.annee + 1;
         ELSE
            T.Mois:= T_Mois'succ(T.mois);
         END IF;
      END IF;
   END Lendemain;


      PROCEDURE affiche_date(
            T : IN     T_Date) IS
                     BEGIN
         Put(T.Numj,1);
         Put(" -- ");
         Put(T_Mois'Image(T.Mois));
         Put(" -- ");
         Put(T.Annee,1);

                     END Affiche_Date;


   FUNCTION Comp_Dates (D1, D2 : IN T_Date) RETURN Boolean IS
      supp : Boolean;
   BEGIN

      IF D1.Annee> D2.Annee THEN
         supp := true;
      ELSE
         IF D1.Annee = D2.Annee THEN
            IF T_Mois'Pos(D1.Mois) > T_Mois'Pos(D2.Mois) THEN
               supp := true;
            ELSE
               IF T_Mois'Pos(D1.Mois) = T_Mois'Pos(D2.Mois) THEN
                  IF D1.numj > D2.numj THEN
                     Supp:=true;
                  ELSE
                     Supp:= False;
                  END IF;
               ELSE
                  Supp:=False;
               END IF;
            END IF;
         ELSE
            Supp:= False;
         END IF;
      END IF;
      RETURN(Supp);
   END Comp_Dates;
   END Date;



