WITH ada.IO_Exceptions, Ada.Text_IO, Ada.Integer_Text_IO,ada.Characters.Handling,outils,personnel,file_demande,liste_personnel, date,liste_document,arbre_patients;
USE Ada.Text_Io, Ada.Integer_Text_IO,Ada.Characters.Handling,Outils,Personnel,file_demande,liste_personnel, date,liste_document,arbre_patients;

PACKAGE BODY Menu_Main IS
--------------------------------------------------------------------------------------------------
   PROCEDURE Menu_Demarrage (initialisation_id : in out integer; listed: in out t_pteurdoc; document : in out t_document; L: in out t_pteurpers; Date_Jour : out T_Date;D: in out T_File_Dem; demande: in out t_demande;login: out t_titre;empreinte: out integer;fonction: out role_p;cpt: out integer;id: in out t_pers;pers:in out t_personnel;choix: out integer;a: in out t_arbre;pat: out t_patient) is
   BEGIN
      Initialisation_Pers(L);
      Init_Arbre(A,L);
      LOOP
      New_Line;
      Put("Bienvenue");new_line;
      Put_line("Veuillez saisir la date du jour:");
      Saisie_Date(Date_Jour);
      New_Line;
      put_line("Voici la date du jour:");
      Affiche_Date(Date_Jour);NEW_line;
      Visualisation_Liste_Pers(L);
      New_Line;
      Put_Line ("La Patientiele : ");
      Affichage_Prefixe(A);
      LOOP
         Menu_Premier_Choix(tentative,Initialisation_Id,Listed,Document,L,Date_Jour,D,Demande,Login,Empreinte,Fonction,Cpt,id,pers,choix,a,pat);
         IF Cpt = 3 THEN
            put_line("Erreur de connexion, redirection vers la page d'accueil.");
            EXIT;
            END IF;
            IF Choix = 1 THEN
               EXIT;
            END IF;
         END LOOP;
         IF Choix = 1 THEN
               EXIT;
            END IF;
      END LOOP;
   END Menu_Demarrage;
-----------------------------------------------------------------------------------------------------
   PROCEDURE Menu_Premier_Choix(tentative : in out t_tentative; Initialisation_id : in out integer; listeD : in out t_pteurdoc; document : in out t_document; L : in out T_Pteurpers; Date_Jour :in out T_Date; D: in out T_File_Dem;demande: in out t_demande;login: out t_titre;empreinte: out integer;fonction: out role_p;cpt: out integer;id: in out t_pers;pers: in out t_personnel;choix: OUT integer;a: in out t_arbre;pat: out t_patient) IS
      REP : Integer;
 --     Ap:t_arbre;
   BEGIN
      cpt:=0; --nombre de tentative de connexion
      LOOP
         LOOP
            Put_Line("Voici ce que vous pouvez faire:");
            Put_Line("1-Demander un nouveau mot de passe.");
            Put_Line("2-Se connecter.");
            Put_Line("3- Passer au lendemain.");
            Put_Line("Que souhaitez-vous faire ? 1/2/3");
            BEGIN
               Get(Rep);Skip_Line;
               IF REP < 4 AND Rep > 0 THEN
                  EXIT;
               ELSE
                  Put_Line("Erreur de saisie veuillez recommencer.");
               END IF;
            EXCEPTION
               WHEN Constraint_Error => Put_Line ("Erreur de saisie, merci de choisir entre 1, 2, 3");
            END;
         END LOOP;
         CASE Rep IS

            WHEN 1 => Put_Line("Vous avez choisi la demande d un nouveau mot de passe.");
               Ajout_Demande(D,Demande);EXIT;

            WHEN 2 => Put_Line("Vous avez choisi la connexion.");
               Menu_Connexion(Login,Empreinte,Fonction);
               IF FONCTION /= Patient THEN
                  IF Recherche_Jm(D,L) = False THEN
                     IF Verif_Connexion (L,Login,Empreinte) THEN
                        Reset_Connex (Login, tentative);
                        Put_Line("Utilisateur trouve dans le personnel");
                        IF Fonction = Medecin THEN
                           Put_Line("Envoie vers le menu Personnel Medecin");
                           Menu_Medecin (A,ListeD,Document,Initialisation_Id,Date_Jour,Pers,L,Id);
                           EXIT;
                        ELSIF Fonction = Administrateur THEN
                           Put("Envoie vers le menu Personnel Administrateur.");
                           Menu_Admin(L,D,Id,Pers,Choix,A,Pat);
                           IF Choix = 1 THEN
                              EXIT;
                           END IF;
                        ELSIF Fonction = Secretaire THEN
                           Put("Envoie vers le menu Personnel Secretaire");
                           Menu_Secretaire(A,ListeD,Document,Initialisation_Id,Date_Jour,Pers,L,Id);
                           EXIT;
                        END IF;
                     ELSE
                        Put_Line("Personne non presente dans la liste du personnel, veuillez recommencez la connexion.");
                        Incremente_Connex (Login, Tentative, Cpt);
                     END IF;
                     IF Cpt = 3 THEN --retour au menu de demarrage
                        EXIT;
                     END IF;
                  ELSE
                     Put_Line("Connexion impossible, une demande de mot de passe est en cours.");
                     EXIT; --retour a la connexion
                  END IF;
               ELSIF Fonction = Patient THEN
                  IF Recherche_Patlog(A,Login) /=NULL THEN -- recherche du patient dans l'arbre
                     IF Recherche_Filepat (A,Login,D)THEN --verification si patient pas en attente d un nouveau mdp
                        IF Verif_Connexion2 (A,Login,Empreinte) THEN --verification des informations de connexion
                           Reset_Connex (Login, tentative);
                           Put_Line("Utilisateur trouve dans la patientele.");
                           Put_Line("Envoie vers menu patient, en cours");
                           Menu_Patient (A, Date_Jour, Login);
                        ELSE
                           Put_Line("Personne non presente dans la patientele, veuillez recommencez la connexion.");
                           Incremente_Connex (Login, Tentative, Cpt);
                        END IF;
                        IF Cpt = 3 THEN
                           EXIT;
                        END IF;
                     ELSE
                        Put_Line("Connexion impossible, une demande de mot de passe est en cours.");
                     END IF;
                  END IF;
               ELSE
                  Put_Line("Erreur de saisie.");
               END IF;

            WHEN 3 =>
               Put_Line("Vous avez choisi le passage au lendemain.");
               Lendemain(Date_Jour);
               New_Line;
               Put_Line("Voici la nouvelle date:");
               Affiche_Date(Date_Jour);
               New_Line;
               EXIT;

            WHEN OTHERS =>
               Put("Erreur de saisie.Veuillez recommencer.");
         END CASE;
      END LOOP;
   END Menu_Premier_Choix;

------------------------------------------------------------------------------------------------- Saisie des informations
   PROCEDURE Menu_Connexion (Login : out t_titre; Empreinte : out Integer; Fonction : in out Role_P) IS
      S: String (1..15);
      K:Integer;
      Klogin: Integer;
   BEGIN
      LOOP
         BEGIN
            New_Line;
            Put_Line("Veuillez indiquer votre login, format NOM_PRENOM");
            Saisie_Titre(Login, Klogin);
            Put_Line("Veuillez indiquer votre mot de passe");
            Init_Empreinte(Empreinte);
            Put_Line("Veuillez indiquer votre fonction:");
            Get_Line(S,K);
            Fonction:=Role_P'Value(S(1..K));
            IF Fonction = Patient OR Fonction = Secretaire OR Fonction = Medecin OR Fonction = Administrateur THEN
               EXIT;
            END IF;
         EXCEPTION
            WHEN Data_Error => Put_Line ("merci de saisir une fonction valide");
            WHEN Constraint_Error => Put_Line ("merci de saisir une fonction valide");
         END;
      END LOOP;
   END Menu_Connexion;

-----------------------------------------------------------------------------------------------------

   PROCEDURE Menu_Creation_Compte ( L: IN OUT T_PteurPers;A: in out t_Arbre) IS
      choix : character;
   BEGIN
      Put_Line("Vous etes dans la creation d un compte utilisateur.");
      LOOP
         LOOP
            Put_Line("Vous voulez creer un nouveau compte pour un personnel ou un patient? 1/2");
            BEGIN
               Get(Choix);
               Skip_Line;
               IF Choix = '1' THEN
                  Ajout_Pers (L);
                  EXIT;
               ELSIF Choix = '2' THEN
                  Nouveau_Pat(A);
                  EXIT;
               ELSE
                  Put_Line("Erreur de saisie, veuillez recommencer");
               END IF;
            EXCEPTION
               WHEN Constraint_Error => Put_Line ("Erreur de saisie, merci de choisir entre 1 et 2");
            END;
            EXIT;
         END LOOP;
      END LOOP;
   END Menu_Creation_Compte;

-----------------------------------------------------------------------------------------------------
   PROCEDURE Menu_Admin (L: in out T_Pteurpers; F: in out T_File_Dem; id : out t_pers; pers: out t_personnel;Choix: out Integer;A:in out t_arbre;pat:out t_patient) IS
      Rep : Integer;
   BEGIN
      LOOP
         LOOP
            New_Line;
            Put_Line("Menu Administratuer, Voici ce que vous pouvez faire:");
            Put_Line("1-Creer un compte utilisateur.");
            Put_Line("2-Visualiser l'ensemble du personnel.");
            Put_Line("3- Visualiser l'ensemble de la patientele.");
            Put_Line("4- Gestion des demandes de mot de passe.");
            Put_Line("5- Archivage de documents (avant une date donnee).");
            Put_Line("6- Visualiser l'ensemble des documents du centre.");
            Put_Line("7- Supprimer un patient.");
            Put_Line("8- Supprimer un medecin.");
            Put_Line("9- Supprimer une secretaire.");
            Put_Line("10- Se deconnecter.");
            Put_Line("11- Fermer l'application");
            Put_Line("Que souhaitez-vous faire ? Veuillez saisir votre choix :");
            BEGIN
               Get(Rep);Skip_Line;
               IF REP < 12 AND Rep > 0 THEN
                  EXIT;
               ELSE
                  Put_Line("Erreur de saisie veuillez recommencer.");
               END IF;
            EXCEPTION
               WHEN Constraint_Error => Put_Line ("Erreur de saisie, merci de choisir entre 1 et 11");
            END;
         END LOOP;

         CASE Rep IS
            WHEN 1 =>
               Menu_Creation_Compte(L,A);

            WHEN 2 =>
               Visualisation_Liste_Pers(L);

            WHEN 3 =>
               Affichage_Prefixe(A);

            WHEN 4 =>
               Put_Line("Voici la file de demande:");
               Visu_File_Demande(F);
               Traitement_Demande(F,L,A,A.Patient.Login);

            WHEN 5 =>
               Put_Line("Pas fait");

            WHEN 6 =>
               Put_Line("Voici ceux non archives:");
               Visu_All_Document(A);
               Put_Line("Voici ceux archives:");
               Put_Line ("pas fait");

            WHEN 7 =>
               Put_Line("Pas fait");

            WHEN 8 =>
               Put_Line("Pas fait");

            WHEN 9 =>
               Supp_Secretaire(L,Id,Pers);

            WHEN 10 =>
               EXIT;

            WHEN 11 =>
               LOOP
                  Put_Line("Vous souhaitez vraiment fermer l application ? 1/2");
                  BEGIN
                     Get(Choix);
                     Skip_Line;
                     IF Choix = 2 THEN
                        EXIT;
                     ELSIF Choix = 1 THEN
                        Put_Line("Fermeture en cours.");
                        EXIT;
                     ELSE
                        Put_Line("Erreur de saisie.");
                     END IF;
                  EXCEPTION
                     WHEN Constraint_Error => Put_Line ("Faites votre choix entre 1 et 2");
                  END;
               END LOOP;

               WHEN OTHERS => Put_Line("Erreur de saisie.Veuillez recommencer.");
            END CASE;
         END LOOP;
      END Menu_Admin;

-----------------------------------------------------------------------------------------------------

   PROCEDURE Menu_Medecin (A: IN OUT T_Arbre;ListeD: IN OUT T_Pteurdoc;D: OUT T_Document;Initialisation_Id:IN OUT Integer;Date_Jour: OUT T_Date;Pers:OUT T_Personnel;L:T_Pteurpers;Id: OUT T_Pers)IS
     rep:Integer;
   BEGIN
      LOOP
         LOOP
            New_Line;
            Put_Line("Menu Medecin, Voici ce que vous pouvez faire:");
            Put_line("1-Ajouter un document pour un patient.");
            Put_Line("2-Modifier un document.");
            Put_Line("3- Afficher vos documents (non archives).");
            Put_Line("4- Acceder a un document (lecture).");
            Put_Line("5- Visualiser les titres des documents d un patient.");
            Put_Line("6- Visualiser l'ensemble des documents du centre.");
            Put_Line("7- Se deconnecter.");
            Put_Line("Qu est ce que vous voulez faire ? Veuillez saisir le numero :");
            BEGIN
               Get(Rep);Skip_Line;
               IF REP < 8 AND Rep > 0 THEN
                  EXIT;
               ELSE
                  Put_Line("Erreur de saisie veuillez recommencer.");
               END IF;
            EXCEPTION
               WHEN Constraint_Error => Put_Line ("Erreur de saisie, merci de choisir entre 1-7");
            END;
         END LOOP;

         CASE Rep IS

            WHEN 1 =>
               Ajout_Doc_Med(A,ListeD,D,Initialisation_Id,Date_Jour,Pers,L);

            WHEN 2 =>
               Modif_1doc_Med(A,Date_Jour);

            WHEN 3 =>
               Put_Line("Vous etes dans l affichage des documents associes a votre identite.");
               Put_Line("Veuillez indiquer votre identite:");
               Saisie_Identite(Id);
               Affiche_Doc_Med (A,Id);

            WHEN 4 =>
               Acces_Lecture_Med (A, Date_Jour);

            WHEN 5 =>
               Visu_All_Titre_1patient(A);

            WHEN 6 =>
               Put_Line("Voici ceux non archives:");
               Visu_All_Document(A);
               Put_Line("Voici ceux archives:");
               Put ("A faire");

            WHEN 7 =>
               EXIT;

            WHEN OTHERS =>
               Put_Line("Erreur de saisie.Veuillez recommencer.");
         END CASE;
      END LOOP;
   END Menu_Medecin;

---------------------------------------------------------------------------------------------
-- completer les variables
--verifier ou on recupere l'id du patient, sinon le faire
--     PROCEDURE Menu_Patient (A : IN OUT T_Arbre; Pat : OUT T_Patient; D: IN OUT T_Document; Login : IN OUT T_Titre) IS
--        Choix : Character;
--        Id_Doc : Integer;
--     BEGIN
--        --recherche du patient dans arbre a partir de son login de connexion
----        IF Recherche_Patlog (A, Login) THEN
----           A:=Cpt;
----           Pat := A.Patient;
----en dessous, bien mais à mettre ailleurs
----        A := Recherche_Patlog (A, Login);
----        IF A /= NULL THEN
----           Pat := A.Patient;
----        END IF;
----        Put ("Voici l'identite du patient connecte : ");
----        Put (Pat.Login);
----        New_Line;
----        END IF;
--        --recuperation du pt du patient
----        A := Cpt;
--        --verif de t_patient
----        Pat := A.Patient;
--        LOOP
--           New_Line;
--           Put_Line ("Menu Patientele : ");
--           Put_Line ("1, acces a la liste de vos documents");
--           Put_Line ("2, acces en lecture a l'un de vos documents");
--           Put_Line ("3, deconnexion");
--           Get (Choix); Skip_Line;
--           CASE Choix IS
--              WHEN '1' =>
--                 Put_line ("Liste des documents du patient : ");
--                 Visu_Doc_Pat(Pat);
--              WHEN '2' =>
--                 Put ("Saisie de l'identifiant du document à visualiser : ");
--                 Get (Id_Doc);
--                 D.Id := Id_Doc;
--                 Visu_1document (D);
--              WHEN '3' =>
--                 EXIT;
--              WHEN OTHERS => Put_Line ("Merci de faire votre choix dans les options proposees");
--           END CASE;
--        END LOOP;
--     END Menu_Patient;

----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
--pas besoin de data_error / constraint_error ???
   PROCEDURE Menu_Patient (A : IN OUT T_Arbre; Date_Jour:T_Date; Login : IN OUT T_Titre) IS
      Choix : Character;
   BEGIN
      LOOP
         New_Line;
         Put_Line ("Menu Patientele. Voici ce que vous pouvez faire: ");
         Put_Line ("1- Visualiser tous vos documents.");
         Put_Line ("2- Lire un document.");
         Put_Line ("3- Se deconnecter.");
         Get (Choix); Skip_Line;

         CASE Choix IS
            WHEN '1' =>
               Put_Line ("Voici vos documents : ");
               Visu_Doc_Pat(Recherche_Patlog(A,Login).Patient);

            WHEN '2' =>
               Acces_Lec_Pat(A,Date_Jour);

            WHEN '3' =>
               EXIT;

            WHEN OTHERS =>
               Put_Line ("Erreur de saisie. Merci de faire votre choix dans les options proposees");
         END CASE;
      END LOOP;
   END Menu_Patient;

----------------------------------------------------------------------------------------------------

   PROCEDURE Menu_Secretaire (A: IN OUT T_Arbre;ListeD: IN OUT T_Pteurdoc;D: OUT T_Document;Initialisation_Id:IN OUT Integer;Date_Jour: OUT T_Date;Pers:OUT T_Personnel;L:T_Pteurpers;Id: OUT T_Pers)IS
      Rep:Integer;
      Categorie:T_Nature;
   BEGIN
      LOOP
         LOOP
            New_Line;
            Put_Line("Menu Secretaire. Voici ce que vous pouvez faire:");
            Put_Line("1- Ajouter un document pour un patient.");
            Put_Line("2- Modifier un document.");
            Put_Line("3- Acceder a un document (lecture).");
            Put_Line("4- Visualiser les titres des documents d une categorie.");
            Put_Line("5- Visualiser les titres des documents d un patient.");
            Put_Line("6- Visualiser les titres des documents d un medecin.");
            Put_Line("7- Visualiser l'ensemble des documents du centre.");
            Put_Line("8- Se deconnecter.");
            Put_Line("Que souhaitez-vous faire ? Veuillez saisir le numero :");
            BEGIN
               Get(Rep);Skip_Line;
               IF REP < 9 AND Rep > 0 THEN
                  EXIT;
               ELSE
                  Put_Line("Erreur de saisie veuillez recommencer.");
               END IF;
            EXCEPTION
               WHEN Constraint_Error => Put_Line ("Erreur de saisie, veuillez choisir entre 1-8");
            END;
         END LOOP;

         CASE Rep IS
            WHEN 1 =>
               Ajout_Doc_Sec(A,ListeD,D,Initialisation_Id,Date_Jour,Pers,L);

            WHEN 2 =>
               Modif_1doc_Sec(A,Date_Jour);

            WHEN 3 =>
               Acces_Lecture_Med(A,Date_Jour); --pas de différence avec l'accès pour les médecins

            WHEN 4 =>
               Put_Line("Vous etes dans la visualisation des titres des documents d un patient.");
               Put_Line("Veuillez indiquer pour quelle categorie vous voulez visualiser les titres de ces documents.");
               Saisie_Nature(Categorie);

               Visu_All_Titre_1categ (A,Categorie); --visualise les documents non archives
               Put_Line("Voici ceux archives:");
               Put_Line ("a faire");

            WHEN 5 =>
               Visu_All_Titre_1patient (A);

            WHEN 6 =>
               Put_Line("Vous etes dans la visualisation des titres des documents d un medecin.");
               Put_Line("Veuillez indiquer pour quel medecin vous voulez visualiser les titres de ses documents.");
               Saisie_Identite(Id);
               Visu_All_Titre_1medecin(A,Id);
               Put_Line("Voici ceux archives:");

            WHEN 7 =>
               Put_Line("Voici les documents du centre non archives.");
               Visu_All_Document(A);
               Put_Line("Voici ceux archives:");
               Put_Line ("A faire");

            WHEN 8 =>
               EXIT;

            WHEN OTHERS =>
               Put_Line("Erreur de saisie.Veuillez recommencer.");
         END CASE;
      END LOOP;
   END Menu_Secretaire;

------------------------------------------------------------------------------------------

   FUNCTION Login_Cpt (Login : T_Titre; Tentative: T_Tentative) RETURN Integer IS
   BEGIN
      FOR I IN Tentative'RANGE LOOP
         IF Tentative(I).Login = Login THEN
            RETURN (I);
         END IF;
      END LOOP;
      RETURN (0);
   END Login_Cpt;
----------------------------------------------------------

   PROCEDURE Incremente_Connex (Login : T_Titre; Tentative : IN OUT T_Tentative; Cpt : OUT Integer) IS
      I : Integer;
   BEGIN
      I := Login_Cpt (Login, Tentative);
      IF I = 0 THEN
         FOR J IN Tentative'RANGE LOOP
            IF Tentative(J).Login = " " THEN
               Tentative (J).Login := Login;
               Tentative (J).Cpt := 1;
               Cpt := 1;
            END IF;
         END LOOP;
      ELSE
         Tentative (I).Cpt := Tentative (I).Cpt + 1;
         Cpt := Tentative (I).Cpt;
      END IF;
   END Incremente_Connex;

-----------------------------------------------------------

   PROCEDURE Reset_Connex (Login : T_Titre; Tentative : IN OUT T_Tentative) IS
   BEGIN
      FOR I IN Tentative'RANGE LOOP
         IF Tentative (I).Login = Login THEN
            Tentative (I).Cpt := 0;
            EXIT;
         END IF;
      END LOOP;
   END Reset_Connex;




END Menu_Main;

