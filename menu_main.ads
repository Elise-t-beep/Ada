WITH Ada.Text_IO, Ada.Integer_Text_IO,ada.Characters.Handling,outils,personnel,liste_document,file_demande,liste_personnel, document,date,patients,arbre_patients, ada.IO_Exceptions;
USE Ada.Text_Io, Ada.Integer_Text_IO,Ada.Characters.Handling,Outils,liste_document,Personnel,file_demande,liste_personnel,document, date,patients,arbre_patients;

--pas de mess d'erreur lors connexion infructueuse (pas de difference entre les logins)
--pas fonctionnement des constraints errors fonctions dans menu mais fonctionnement individuel
--pb avec les dates
--penser aux archivages
--completer les differents menus avec les docs archives

PACKAGE Menu_Main IS

   --nbr tentative pour login
   SUBTYPE T_Tentative_Cpt IS Integer RANGE 0..3;
   TYPE T_Tentatives IS RECORD
      Login : T_Titre;
      Cpt : T_Tentative_Cpt := 0;
   END RECORD;

   TYPE T_Tentative IS ARRAY (Integer RANGE <>) OF T_Tentatives;




PROCEDURE Menu_Connexion (Login : out T_Titre; Empreinte : out Integer; Fonction : in out Role_P);
PROCEDURE Menu_Demarrage (Initialisation_Id:IN OUT Integer;ListeD: IN OUT T_Pteurdoc;Document: IN OUT T_Document;L: IN OUT T_Pteurpers;Date_Jour :OUT T_Date;D: IN OUT T_File_Dem;Demande: IN OUT T_Demande;Login: OUT T_Titre;Empreinte: OUT Integer;Fonction: OUT Role_P;Cpt: OUT Integer;Id:IN OUT T_Pers;Pers:IN OUT T_Personnel;Choix: OUT Integer;A: IN OUT T_Arbre;Pat:OUT T_Patient);
PROCEDURE Menu_Admin (L: in out T_Pteurpers; F: in out T_File_Dem ; id :out t_pers; pers: out t_personnel;Choix: out Integer;a: in out t_arbre;pat:out t_patient);
PROCEDURE Menu_Creation_Compte ( L: in out T_PteurPers;A: in out t_Arbre);
 PROCEDURE Menu_Premier_Choix(tentative : in out t_tentative; Initialisation_id: in out integer;ListeD: in out t_pteurdoc;Document: in out t_document;L : in out T_Pteurpers; Date_Jour :in out T_Date; D: in out T_File_Dem;demande: in out t_demande;login: out t_titre;empreinte: out integer;fonction: out role_p;cpt:out integer;id: in out t_pers;pers:in out t_personnel;choix: out integer;a: in out t_arbre;pat: out t_patient);
 PROCEDURE Menu_Medecin (A: IN OUT T_Arbre;ListeD: IN OUT T_Pteurdoc;D: OUT T_Document;Initialisation_Id:in out Integer;Date_Jour: OUT T_Date;Pers:OUT T_Personnel;L:T_Pteurpers;Id: out t_pers);
 PROCEDURE Menu_Patient (A : IN OUT T_Arbre; Date_jour:t_date; Login : IN OUT T_Titre);
 PROCEDURE Menu_Secretaire (A: IN OUT T_Arbre;ListeD: IN OUT T_Pteurdoc;D: OUT T_Document;Initialisation_Id: in out Integer;Date_Jour: OUT T_Date;Pers:OUT T_Personnel;L:T_Pteurpers;Id: out t_pers);

 FUNCTION Login_Cpt (Login : T_Titre; Tentative: T_Tentative) RETURN Integer;
 PROCEDURE Incremente_Connex (Login : T_Titre; Tentative : IN OUT T_Tentative; Cpt : OUT Integer);
 PROCEDURE Reset_Connex (Login : T_Titre; tentative : IN OUT T_Tentative);



END Menu_Main;

