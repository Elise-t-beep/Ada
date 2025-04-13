
PACKAGE BODY Menu_Main IS
--------------------------------------------------------------------------------------------------
   PROCEDURE Menu_Demarrage (Doc:in out t_doc_archive;Date_archiv: out t_date;Initialisation_Id:in out integer;ListeD: in out t_pteurdoc;Document: in out t_document;L: in out t_pteurpers; Date_Jour : out T_Date;D: in out T_File_Dem; demande: in out t_demande;login: out t_titre;empreinte: out integer;fonction: out role_p;cpt: out integer;id: in out t_pers;pers:in out t_personnel;choix: out integer;a: in out t_arbre;pat: out t_patient) is
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
         Menu_Premier_Choix(Doc,Date_archiv,Initialisation_id,Listed,document,L,Date_Jour,D,Demande,Login,Empreinte,Fonction,Cpt,id,pers,choix,a,pat);
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
   PROCEDURE Menu_Premier_Choix(Doc:in out t_doc_archive;Date_archiv: out t_date;Initialisation_id:in out  integer;ListeD: in out t_pteurdoc;Document: in out t_document; L : in out T_Pteurpers; Date_Jour :in out T_Date; D: in out T_File_Dem;demande: in out t_demande;login: out t_titre;empreinte: out integer;fonction: out role_p;cpt: out integer;id: in out t_pers;pers: in out t_personnel;choix: OUT integer;a: in out t_arbre;pat: out t_patient) IS
      REP : character;
--      Ap:t_arbre;
   BEGIN
      cpt:=0;
      LOOP
      Put_line("Voici ce que vous pouvez faire:");
      Put_line("1-Demander un nouveau mot de passe.");
      Put_line("2-Se connecter.");
      Put_line("3- Passer au lendemain.");
      Put_line("Que souhaitez-vous faire ? 1/2/3");
         Get(Rep);Skip_Line;

      CASE Rep IS
            WHEN '1' => Put_Line("Vous avez choisi la demande d un nouveau mot de passe.");
               Ajout_Demande(D,Demande,l,a);EXIT;
            WHEN '2' => Put_Line("Vous avez choisi la connexion.");
               Menu_Connexion(Login,Empreinte,Fonction);
                  IF FONCTION /= Patient THEN
                     IF Recherche_Jm(D,L) = False THEN
                        IF Verif_Connexion (L,Login,Empreinte) THEN
                            Put_Line("Utilisateur trouve dans le personnel");
                                 IF Fonction = Medecin THEN
                           Put_line("Envoie vers le Menu Personnel Medecin");
                           Menu_Medecin (A,ListeD,Document,Initialisation_Id,Date_Jour,Pers,L,Id);
                           EXIT;
                                 ELSIF
                                    Fonction = Administrateur THEN
                                    Put("Envoie vers le menu Personnel Administrateur.");
                                    Menu_Admin(Document,Date_archiv,date_jour,L,D,Id,Pers,Choix,A,Pat);
                                       IF Choix = 1 THEN
                                          EXIT;
                                       END IF;
                                 ELSIF
                                    Fonction = Secretaire THEN
                           Put_Line("Envoie vers le menu Personnel Secretaire");
                           Menu_secretaire(A,ListeD,Document,Initialisation_Id,Date_Jour,Pers,L,Id);
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
                  IF Recherche_Patlog(A,Login) /= NULL THEN -- recherche du patient dans l'arbre
                     IF Recherche_Filepat (A,Login,D)=false THEN --verification si patient pas en attente d un nouveau mdp
                        IF Verif_Connexion2 (A,Login,Empreinte) THEN --verification des informations de connexion
                           Put_Line("Utilisateur trouve dans la patientele.");
                           Put_Line("Envoie vers menu patient, en cours");
                           Menu_Patient (A, Date_jour, Login);
                        ELSE
                           Put_Line("Erreur de saisie, veuillez recommencez la connexion.");
                           Cpt:=Cpt+1;
                        END IF;
                     ELSE
                        Put_Line("Connexion impossible, une demande de mot de passe est en cours.");Cpt:=Cpt+1;
                     END IF;
                  ELSE PUT_line("Personne non presente dans la patientele, veuillez recommencez la connexion.");
                  Cpt:=Cpt+1;
                  END IF;
               ELSE
                  put_line("Erreur de saisie.");
               END IF;
                IF Cpt = 3 THEN
                              EXIT;
                        END IF;
         WHEN '3' => Put_Line("Vous avez choisi le passage au lendemain.");
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
      LOOP
         BEGIN

      Put_Line("Veuillez indiquer votre login");
      saisie_titre(Login, klogin);
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
      choix : CHARACTER;
   BEGIN
      Put_Line("Vous etes dans la creation d un compte utilisateur.");
            LOOP
            Put_Line("Vous voulez creer un nouveau compte pour un personnel ou un patient? 1/2");
            Get(Choix); Skip_Line;
            IF Choix = '1' THEN
               Ajout_Pers (L); exit;
            ELSIF Choix = '2' THEN
                  Nouveau_pat(A);EXIT;
            ELSE
               put_line("Erreur de saisie, veuillez recommencer");
            END IF;
         END LOOP;
   END Menu_Creation_Compte;
-----------------------------------------------------------------------------------------------------
   PROCEDURE Menu_Admin (Document:t_document;Date_archiv: out t_date;date_jour: out t_date;L: in out T_Pteurpers; F: in out T_File_Dem; id : out t_pers; pers: out t_personnel;Choix: out Integer;A:in out t_arbre;pat:out t_patient) IS
      Rep : character;
   BEGIN
     LOOP
      Put_line("Menu Administrateur. Voici ce que vous pouvez faire:");
      Put_line("1-Creer un compte utilisateur.");
      Put_line("2-Visualiser l'ensemble du personnel.");
      Put_Line("3- Visualiser l'ensemble de la patientele.");
      Put_Line("4- Gestion des demandes de mot de passe.");
      Put_Line("5- Archivage de documents (avant une date donnee).");
      Put_Line("6- Visualiser l'ensemble des documents du centre.");
      Put_Line("7- Supprimer un patient.");
      Put_Line("8- Supprimer un medecin.");
      Put_Line("9- Supprimer une secretaire.");
      Put_Line("A- Se deconnecter.");
      Put_Line("B- Fermer l'application");

      Put_line("Qu est ce que vous voulez faire ? Veuillez saisir le numero :");
      Get(Rep);Skip_Line;
         rep:=to_upper(rep);
      CASE Rep IS
         WHEN '1' =>
            Menu_Creation_Compte(L,A);
         WHEN '2' =>
            Visualisation_Liste_Pers(L);
         WHEN '3' =>
            Affichage_prefixe(A);
         WHEN '4' =>
               Put_Line("Voici la file de demande:");
               Visu_file_demande(F);
               Traitement_Demande(F,L,a,A.Patient.login);
            WHEN '5' =>
               Put("pas fait");
--            Archive_doc(Document,Date_archiv,a);
         WHEN '6' =>
            Put_Line("Voici ceux non archives:");
               Visu_All_Document(A);
               put_line("Voici ceux archives:");
         WHEN '7' =>
            Put_Line("Pas fait");
         WHEN '8' =>
            Put_Line("Pas fait");
         WHEN '9' =>
               Supp_Secretaire(L,Id,Pers);
         WHEN 'A'  =>
               EXIT;
         WHEN 'B' => Choix:=1;
                  Put_Line("Fermeture en cours.");EXIT;


         WHEN OTHERS => Put_line("Erreur de saisie.Veuillez recommencer.");

         END CASE;
      END LOOP;
END Menu_Admin;
-----------------------------------------------------------------------------------------------------
   PROCEDURE Menu_Medecin (A: IN OUT T_Arbre;ListeD: IN OUT T_Pteurdoc;D: OUT T_Document;Initialisation_Id:in out Integer;Date_Jour: OUT T_Date;Pers:OUT T_Personnel;L:T_Pteurpers;Id: out t_pers)IS
     rep:character;
     BEGIN
      LOOP
         LOOP
      Put_line("Menu Medecin. Voici ce que vous pouvez faire:");
      Put_line("1- Ajouter un document pour un patient.");
      Put_line("2- Modifier un document.");
      Put_Line("3- Afficher vos documents (non archives).");
      Put_Line("4- Acceder a un document (lecture).");
      Put_Line("5- Visualiser les titres des documents d un patient.");
      Put_Line("6- Visualiser l'ensemble des documents du centre.");
      Put_Line("7- Se deconnecter.");

      Put_line("Qu est ce que vous voulez faire ? Veuillez saisir le numero :");
      Get(Rep);Skip_Line;
         IF REP < '8' AND Rep > '0' THEN
            EXIT;
         ELSE
            Put_Line("Erreur de saisie veuillez recommencer.");
         END IF;
         END LOOP;
      CASE Rep IS
         WHEN '1' =>
            Ajout_doc_med(A,ListeD,D,Initialisation_id,date_jour,pers,L);
         WHEN '2' =>
           Modif_1doc_med(A,date_jour);
        WHEN '3' =>
                 Put_Line("Vous etes dans l affichage des documents associes a votre identite.");
                 PUT_Line("Veuillez indiquer votre identite:");
                 saisie_identite(id);
                 Affiche_doc_med (A,id);
         WHEN '4' =>
            Acces_lecture_med(A,date_jour);
         WHEN '5' =>
            Visu_All_Titre_1patient(A);
         WHEN '6' =>
            Put_Line("Voici ceux non archives:");
               Visu_All_Document(A);
               put_line("Voici ceux archives:");
         WHEN '7' =>
                 EXIT;
         WHEN OTHERS => Put_line("Erreur de saisie.Veuillez recommencer.");
         END CASE;
      END LOOP;
     END MENU_MEDECIN;
-----------------------------------------------------------------------------------------------------
      PROCEDURE Menu_Patient (A : IN OUT T_Arbre; Date_jour:t_date; Login : IN OUT T_Titre) IS
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
                  Acces_lec_pat(A,date_jour);
               WHEN '3' =>
                  EXIT;
               WHEN OTHERS => Put_Line ("Erreur de saisie. Merci de faire votre choix dans les options proposees");
            END CASE;
            END LOOP;
      END Menu_Patient;

-----------------------------------------------------------------------------------------------------
PROCEDURE Menu_Secretaire (A: IN OUT T_Arbre;ListeD: IN OUT T_Pteurdoc;D: OUT T_Document;Initialisation_Id:in out Integer;Date_Jour: OUT T_Date;Pers:OUT T_Personnel;L:T_Pteurpers;Id: out t_pers)IS
     rep:character;CATEGORIE:t_nature;
     BEGIN
      LOOP
      Put_line("Menu Secretaire. Voici ce que vous pouvez faire:");
      Put_line("1- Ajouter un document pour un patient.");
      Put_line("2- Modifier un document.");
      Put_Line("3- Acceder a un document (lecture).");
      Put_Line("4- Visualiser les titres des documents d une categorie.");
      Put_Line("5- Visualiser les titres des documents d un patient.");
      Put_Line("6- Visualiser les titres des documents d un medecin.");
      Put_Line("7- Visualiser l'ensemble des documents du centre.");
      Put_Line("8- Se deconnecter.");

      Put_line("Qu est ce que vous voulez faire ? Veuillez saisir le numero :");
      Get(Rep);Skip_Line;

      CASE Rep IS
         WHEN '1' =>
           Ajout_doc_sec(A,ListeD,D,Initialisation_id,date_jour,pers,L);
         WHEN '2' =>
           Modif_1doc_sec(A,date_jour);
        WHEN '3' =>
           Acces_lecture_med(A,date_jour); --pas de différence avec l'accès pour les médecins
        WHEN '4' =>
         Put_Line("Vous etes dans la visualisation des titres des documents d un patient.");
         Put_Line("Veuillez indiquer pour quelle categorie vous voulez visualiser les titres de ces documents.");
         Saisie_Nature(categorie);
         Visu_All_Titre_1categ (A,categorie); --visualise les documents non archives
         put_line("Voici ceux archives:");
         WHEN '5' =>
                 Visu_All_Titre_1patient (A);
        WHEN '6'=>
                  put_Line("Vous etes dans la visualisation des titres des documents d un medecin.");
                  Put_Line("Veuillez indiquer pour quel medecin vous voulez visualiser les titres de ses documents.");
                  Saisie_Identite(id);
                  Visu_All_Titre_1medecin(A,Id);
                  put_line("Voici ceux archives:");

         WHEN '7' =>
               put_line("Voici les documents du centre non archives.");
               Visu_All_Document(A);
               put_line("Voici ceux archives:");
         WHEN '8' =>
                 EXIT;
         WHEN OTHERS => Put_line("Erreur de saisie.Veuillez recommencer.");
         END CASE;
      END LOOP;
     END MENU_secretaire;

END Menu_Main;

