WITH Ada.Text_IO, Ada.Integer_Text_IO,ada.Characters.Handling,outils,personnel;
USE Ada.Text_Io, Ada.Integer_Text_IO,Ada.Characters.Handling,Outils,Personnel;

PACKAGE BODY Menu_Main IS
   Login: T_Titre;
   Empreinte: Integer;
   Fonction : Role_P;
   L:t_pteurpers;
-----------------------------------------------------------------------------------------------------
   PROCEDURE Menu_Demarrage (L: in out t_pteurpers;Date_Jour : out T_Date)is
   rep:integer;
   BEGIN
      initialisation_pers(L);
      Put("Bienvenue");
      Put("Veuillez saisir la date du jour:");
      Saisie_Date(Date_Jour);
      put("Voici la date du jour:");
      Affiche_Date(Date_Jour);
      Put("Voici la liste du personnel:");
      Visualisation_Liste_Pers(L);
      --Rajouter l'abre de patient quand ce sera fait
      LOOP
      Put_line("Voici ce que vous pouvez faire:");
      Put_line("1-Demander un nouveau mot de passe.");
      Put_line("2-Se connecter.");
      Put_line("3- Passer au lendemain.");
      Put_line("Qu est ce que vous voulez faire ? 1/2/3");
      Get(Rep);Skip_Line;

      CASE Rep IS
            WHEN 1 => Put_Line("Vous avez choisi la demande d un nouveau mot de passe.");EXIT ;

            WHEN 2 => Put_Line("Vous avez choici la connexion."); EXIT;
               Menu_Connexion(Login,Empreinte,Fonction);
               Verif_Connexion (L,Login,Empreinte);
               Connexion_pers(L,Login,Empreinte,Fonction);
            WHEN 3 => Put_Line("Vous avez choisi le passage au lendemain.");EXIT;

            WHEN OTHERS => Put("Erreur de saisie.Veuillez recommencer.");

      END CASE;
      END LOOP;
      end menu_demarrage;
------------------------------------------------------------------------------------------------- Saisie des informations
   PROCEDURE Menu_Connexion (Login : out t_titre; Empreinte : out Integer; Fonction : in out Role_P) IS
      S: String (1..15);
      K:Integer;
      Klogin: Integer;
   BEGIN
      Put_Line("Veuillez indiquer votre login");
      saisie_titre(Login, klogin);
      Put_Line("Veuillez indiquer votre mot de passe");
      Init_Empreinte(Empreinte);
      Put_Line("Veuillez indiquer votre fonction:");
      Get_Line(S,K);
      Fonction:=Role_P'Value(S(1..K));

   END Menu_Connexion;

Procedure Menu_Admin (L: t_pteurpers; F: t_file_demande)
END Menu_Main;

