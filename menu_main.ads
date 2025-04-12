WITH Ada.Text_IO, Ada.Integer_Text_IO,ada.Characters.Handling,outils,personnel,liste_document,file_demande,liste_personnel, document,date,patients,arbre_patients;
USE Ada.Text_Io, Ada.Integer_Text_IO,Ada.Characters.Handling,Outils,liste_document,Personnel,file_demande,liste_personnel,document, date,patients,arbre_patients;

PACKAGE Menu_Main IS
PROCEDURE Menu_Connexion (Login : out T_Titre; Empreinte : out Integer; Fonction : in out Role_P);
PROCEDURE Menu_Demarrage (Initialisation_id:in out integer;ListeD: in out t_pteurdoc;Document: in out t_document;L: IN OUT T_Pteurpers;Date_Jour :OUT T_Date;D: in out T_File_Dem;demande: in out t_demande;login: out t_titre;empreinte: out integer;fonction: out role_p;cpt: out integer;id:in out t_pers;pers:in out t_personnel;choix: out integer;a: in out t_arbre;pat:out t_patient);
PROCEDURE Menu_Admin (L: in out T_Pteurpers; F: in out T_File_Dem ; id :out t_pers; pers: out t_personnel;Choix: out Integer;a: in out t_arbre;pat:out t_patient);
PROCEDURE Menu_Creation_Compte ( L: in out T_PteurPers;A: in out t_Arbre);
PROCEDURE Menu_Premier_Choix(Initialisation_id: in out integer;ListeD: in out t_pteurdoc;Document: in out t_document;L : in out T_Pteurpers; Date_Jour :in out T_Date; D: in out T_File_Dem;demande: in out t_demande;login: out t_titre;empreinte: out integer;fonction: out role_p;cpt:out integer;id: in out t_pers;pers:in out t_personnel;choix: out integer;a: in out t_arbre;pat: out t_patient);
PROCEDURE Menu_Medecin (A: IN OUT T_Arbre;ListeD: IN OUT T_Pteurdoc;D: OUT T_Document;Initialisation_Id:in out Integer;Date_Jour: OUT T_Date;Pers:OUT T_Personnel;L:T_Pteurpers;Id: out t_pers);
PROCEDURE Menu_Patient (A : IN OUT T_Arbre; Date_jour:t_date; Login : IN OUT T_Titre);
PROCEDURE Menu_Secretaire (A: IN OUT T_Arbre;ListeD: IN OUT T_Pteurdoc;D: OUT T_Document;Initialisation_Id: in out Integer;Date_Jour: OUT T_Date;Pers:OUT T_Personnel;L:T_Pteurpers;Id: out t_pers);

END Menu_Main;

