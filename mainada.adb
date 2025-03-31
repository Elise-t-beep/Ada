WITH Ada.Characters.Handling, Ada.Text_IO, personnel,outils,date,liste_personnel;
USE Ada.Characters.Handling, Ada.Text_Io, personnel,outils,date,liste_personnel;

PROCEDURE MainAda IS
   L_Pers: T_Pteurpers;
   Date_jour: t_date;
BEGIN
   --Initialisation de la liste de personnel
   Initialisation_pers(L_pers);

   -- Menu 1 d'accueil
   -- Visualisation du personnel
   Put_line("Bienvenue");
   put_line("Voici la liste du personnel:");
   Visualisation_Liste_Pers(L_Pers);
   --Visualisation Arbre patient en cours
   -- Saisie de la date du jour
   Put_Line("Veuillez saisir la date du jour:");
   Saisie_Date(Date_Jour);

   -- Menu 2 : demande de mdp / connexion ?


   end mainada;

