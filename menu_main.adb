WITH Ada.Text_IO, Ada.Integer_Text_IO,ada.Characters.Handling,outils,personnel,file_demande,liste_personnel, date,liste_document,arbre_patients;
USE Ada.Text_Io, Ada.Integer_Text_IO,Ada.Characters.Handling,Outils,Personnel,file_demande,liste_personnel, date,liste_document,arbre_patients;

PACKAGE BODY Menu_Main IS
--------------------------------------------------------------------------------------------------
   PROCEDURE Menu_Demarrage (L: in out t_pteurpers; Date_Jour : out T_Date;D: in out T_File_Dem; demande: in out t_demande;login: out t_titre;empreinte: out integer;fonction: out role_p;cpt: out integer;id: in out t_pers;pers:in out t_personnel;choix: out integer;a: in out t_arbre;pat: out t_patient) is
   BEGIN
      Initialisation_Pers(L);
      Init_Arbre(A,L);
      LOOP
      New_Line;
      Put("Bienvenue");new_line;
      Put_line("Veuillez saisir la date du jour:");
      Saisie_Date(Date_Jour);
      put_line("Voici la date du jour:");
      Affiche_Date(Date_Jour);NEW_line;
      Visualisation_Liste_Pers(L);
      AFFICHage_prefixe(A);
      LOOP
         Menu_Premier_Choix(L,Date_Jour,D,Demande,Login,Empreinte,Fonction,Cpt,id,pers,choix,a,pat);
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
   PROCEDURE Menu_Premier_Choix(L : in out T_Pteurpers; Date_Jour :in out T_Date; D: in out T_File_Dem;demande: in out t_demande;login: out t_titre;empreinte: out integer;fonction: out role_p;cpt: out integer;id: in out t_pers;pers: in out t_personnel;choix: OUT integer;a: in out t_arbre;pat: out t_patient) IS
      REP : Integer;
      Ap:t_arbre;
   BEGIN
      cpt:=0;
      LOOP
         LOOP
      Put_line("Voici ce que vous pouvez faire:");
      Put_line("1-Demander un nouveau mot de passe.");
      Put_line("2-Se connecter.");
      Put_line("3- Passer au lendemain.");
      Put_line("Que souhaitez-vous faire ? 1/2/3");
         Get(Rep);Skip_Line;
         IF REP < 4 AND Rep > 0 THEN
            EXIT;
         ELSE
            Put_Line("Erreur de saisie veuillez recommencer.");
         END IF;
      END LOOP;
      CASE Rep IS
            WHEN 1 => Put_Line("Vous avez choisi la demande d un nouveau mot de passe.");
               Ajout_Demande(D,Demande);EXIT;
            WHEN 2 => Put_Line("Vous avez choisi la connexion.");
               Menu_Connexion(Login,Empreinte,Fonction);
                  IF FONCTION /= Patient THEN
                     IF Recherche_Jm(D,L) = False THEN
                        IF Verif_Connexion (L,Login,Empreinte) THEN
                            Put_Line("Utilisateur trouve dans le personnel");
                                 IF Fonction = Medecin THEN
                           Put("Envoie vers le menu Personnel Medecin");
                           --en attente du menu medecin
                           EXIT;
                                 ELSIF
                                    Fonction = Administrateur THEN
                                    Put("Envoie vers le menu Personnel Administrateur.");
                                    Menu_Admin(L,D,Id,Pers,Choix,A,Pat);
                                       IF Choix = 1 THEN
                                          EXIT;
                                       END IF;
                                 ELSIF
                                    Fonction = Secretaire THEN
                           Put("Envoie vers le menu Personnel Secretaire");
                           --en attente du menu secretaire
                           EXIT;
                                 END IF;
                        ELSE
                           Put_Line("Personne non presente dans la liste du personnel, veuillez recommencez la connexion.");
                           Cpt:=Cpt+1;
                        END IF;
                        IF Cpt = 3 THEN --retour au menu de demarrage
                              EXIT;
                        END IF;
                     ELSE
                        Put_Line("Connexion impossible, une demande de mot de passe est en cours.");EXIT; --retour a la connexion
                  END IF;

                  ELSIF Fonction = Patient THEN
                  IF Recherche_Patlog(A,Login) /=NULL THEN -- recherche du patient dans l'arbre
                     IF Recherche_Filepat (A,Login,D)THEN --verification si patient pas en attente d un nouveau mdp
                        IF Verif_Connexion2 (A,Login,Empreinte) THEN --verification des informations de connexion
                           Put_Line("Utilisateur trouve dans la patientele.");
                           Put_Line("Envoie vers menu patient, en cours");
                              Menu_Patient (A, Pat, D, Login); --penser aux variables
                        ELSE
                           Put_Line("Personne non presente dans la patientele, veuillez recommencez la connexion.");
                           Cpt:=Cpt+1;
                        END IF;
                        IF Cpt = 3 THEN
                              EXIT;
                        END IF;
                     ELSE
                        Put_Line("Connexion impossible, une demande de mot de passe est en cours.");
                     END IF;
                  END IF;
               ELSE
                  put_line("Erreur de saisie.");
            END IF;
         WHEN 3 => Put_Line("Vous avez choisi le passage au lendemain.");
            Lendemain(Date_Jour);NEW_line;
            put_line("Voici la nouvelle date:");
            Affiche_Date(Date_Jour);new_line; EXIT;
         WHEN OTHERS => Put("Erreur de saisie.Veuillez recommencer.");
         END CASE;
      END LOOP;
END Menu_Premier_Choix;
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
-----------------------------------------------------------------------------------------------------
   PROCEDURE Menu_Creation_Compte ( L: IN OUT T_PteurPers;A: in out t_Arbre;pat:out t_patient) IS
      choix : integer;
   BEGIN
      Put_Line("Vous etes dans la creation d un compte utilisateur.");
            LOOP
            Put_Line("Vous voulez creer un nouveau compte pour un personnel ou un patient? 1/2");
            Get(Choix); Skip_Line;
            IF Choix = 1 THEN
               Ajout_Pers (L); exit;
            ELSIF Choix = 2 THEN
                  Nouveau_pat(A);EXIT;
            ELSE
               put_line("Erreur de saisie, veuillez recommencer");
            END IF;
         END LOOP;
   END Menu_Creation_Compte;
-----------------------------------------------------------------------------------------------------
   PROCEDURE Menu_Admin (L: in out T_Pteurpers; F: in out T_File_Dem; id : out t_pers; pers: out t_personnel;Choix: out Integer;A:in out t_arbre;pat:out t_patient) IS
      Rep : Integer;
   BEGIN
     LOOP
      LOOP
      Put_line("Voici ce que vous pouvez faire:");
      Put_line("1-Creer un compte utilisateur.");
      Put_line("2-Visualiser l'ensemble du personnel.");
      Put_Line("3- Visualiser l'ensemble de la patientele.");
      Put_Line("4- Gestion des demandes de mot de passe.");
      Put_Line("5- Archivage de documents (avant une date donnee).");
      Put_Line("6- Visualiser l'ensemble des documents du centre.");
      Put_Line("7- Supprimer un patient.");
      Put_Line("8- Supprimer un medecin.");
      Put_Line("9- Supprimer une secretaire.");
      Put_Line("10- Se deconnecter.");
      Put_Line("11- Fermer l'application");

      Put_line("Qu est ce que vous voulez faire ? Veuillez saisir le numero :");
      Get(Rep);Skip_Line;
         IF REP < 12 AND Rep > 0 THEN
            EXIT;
         ELSE
            Put_Line("Erreur de saisie veuillez recommencer.");
         END IF;
      END LOOP;

      CASE Rep IS
         WHEN 1 =>
            Menu_Creation_Compte(L,A,Pat);
         WHEN 2 =>
            Visualisation_Liste_Pers(L);
         WHEN 3 =>
            Affichage_prefixe(A);
         WHEN 4 =>
            Traitement_Demande(F,L,a,A.Patient.login);
         WHEN 5 =>
            Put_Line("Pas fait");
         WHEN 6 =>
            Put_Line("Voici ceux non archives:");
               Visu_All_Document(A);
               put_line("Voici ceux archives:");
         WHEN 7 =>
            Put_Line("Pas fait");
         WHEN 8 =>
            Put_Line("Pas fait");
         WHEN 9 =>
               Supp_Secretaire(L,Id,Pers);
         WHEN 10 =>
               EXIT;
         WHEN 11 =>
               Put_Line("Vous souhaitez vraiment fermer l application ? 1/2");
               Get(Choix);
               IF Choix = 2 THEN
                  EXIT;
               ELSIF Choix = 1 THEN
                  Put_Line("Fermeture en cours.");EXIT;
               ELSE
                  put_line("Erreur de saisie.");
               END IF;

         WHEN OTHERS => Put_line("Erreur de saisie.Veuillez recommencer.");

         END CASE;
      END LOOP;
END Menu_Admin;
-----------------------------------------------------------------------------------------------------
   PROCEDURE Menu_Medecin (A: IN OUT T_Arbre;ListeD: IN OUT T_Pteurdoc;D: OUT T_Document;Initialisation_Id:Integer;Date_Jour: OUT T_Date;Pers:OUT T_Personnel;L:T_Pteurpers)IS
     rep:integer;
     BEGIN
      LOOP
         LOOP
      Put_line("Voici ce que vous pouvez faire:");
      Put_line("1-Ajouter un document pour un patient.");
      Put_line("2-Modifier un document.");
      Put_Line("3- Afficher vos documents (non archives).");
      Put_Line("4- Acceder a un document (lecture).");
      Put_Line("5- Visualiser les titres des documents d un patient.");
      Put_Line("6- Visualiser l'ensemble des documents du centre.");
      Put_Line("7- Se deconnecter.");

      Put_line("Qu est ce que vous voulez faire ? Veuillez saisir le numero :");
      Get(Rep);Skip_Line;
         IF REP < 8 AND Rep > 0 THEN
            EXIT;
         ELSE
            Put_Line("Erreur de saisie veuillez recommencer.");
         END IF;
         END LOOP;
      CASE Rep IS
         WHEN 1 =>
            Ajout_doc_med(A,ListeD,D,Initialisation_id,date_jour,pers,L);
         WHEN 2 =>
           Put_Line("Pas fait");
         WHEN 3 =>
            Put_Line("Pas fait");
         WHEN 4 =>
            Put_Line("Pas fait");
         WHEN 5 =>
            Put_Line("Pas fait");
         WHEN 6 =>
            Put_Line("Voici ceux non archives:");
               Visu_All_Document(A);
               put_line("Voici ceux archives:");
         WHEN 7 =>
                 EXIT;
         WHEN OTHERS => Put_line("Erreur de saisie.Veuillez recommencer.");

         END CASE;
      END LOOP;
     END MENU_MEDECIN;

---------------------------------------------------------------------------------------------
-- completer les variables
--verifier ou on recupere l'id du patient, sinon le faire
     PROCEDURE Menu_Patient (A : IN OUT T_Arbre; Pat : OUT T_Patient; D: IN OUT T_Document; Login : IN OUT T_Titre) IS
        Choix : Character;
        Id_Doc : Integer;
     BEGIN
        --recherche du patient dans arbre a partir de son login de connexion
--        IF Recherche_Patlog (A, Login) THEN
--           A:=Cpt;
--           Pat := A.Patient;
        A := Recherche_Patlog (A, Login);
        IF A /= NULL THEN
           Pat := A.Patient;
        END IF;
        Put ("Voici l'identite du patient connecte : ");
        Put (Pat.Login);
        New_Line;
--        END IF;
        --recuperation du pt du patient
--        A := Cpt;
        --verif de t_patient
--        Pat := A.Patient;
        LOOP
           New_Line;
           Put_Line ("Menu Patientele : ");
           Put_Line ("1, acces a la liste de vos documents");
           Put_Line ("2, acces en lecture a l'un de vos documents");
           Put_Line ("3, deconnexion");
           Get (Choix); Skip_Line;
           CASE Choix IS
              WHEN '1' =>
                 Put_line ("Liste des documents du patient : ");
                 Visu_Doc_Pat(Pat);
              WHEN '2' =>
                 Put ("Saisie de l'identifiant du document à visualiser : ");
                 Get (Id_Doc);
                 D.Id := Id_Doc;
                 Visu_1document (D);
              WHEN '3' =>
                 EXIT;
              WHEN OTHERS => Put_Line ("Merci de faire votre choix dans les options proposees");
           END CASE;
        END LOOP;
     END Menu_Patient;

----------------------------------------------------------------------------------------------





END Menu_Main;
