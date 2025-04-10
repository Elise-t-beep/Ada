WITH Ada.Characters.Handling, Ada.Text_IO, personnel,outils,liste_personnel,date,file_demande;
USE Ada.Characters.Handling, Ada.Text_Io, personnel,outils,liste_personnel,date,file_demande;

PACKAGE Menu_Main IS
PROCEDURE Menu_Connexion (Login : out T_Titre; Empreinte : out Integer; Fonction : in out Role_P);
PROCEDURE Menu_Demarrage (L: IN OUT T_Pteurpers;Date_Jour :OUT T_Date;D: in out T_File_Dem;demande: in out t_demande;login: out t_titre;empreinte: out integer;fonction: out role_p;cpt: out integer;id:in out t_pers;pers:in out t_personnel;choix: out integer);
PROCEDURE Menu_Admin (L: in out T_Pteurpers; F: in out T_File_Dem ; id :out t_pers; pers: out t_personnel;Choix: out Integer);
PROCEDURE Menu_Creation_Compte ( L: in out T_PteurPers);
PROCEDURE Menu_Premier_Choix(L : in out T_Pteurpers; Date_Jour :in out T_Date; D: in out T_File_Dem;demande: in out t_demande;login: out t_titre;empreinte: out integer;fonction: out role_p;cpt:out integer;id: in out t_pers;pers:in out t_personnel;choix: out integer);

END Menu_Main;

