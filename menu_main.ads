WITH Ada.Characters.Handling, Ada.Text_IO, personnel,outils,liste_personnel,date;
USE Ada.Characters.Handling, Ada.Text_Io, personnel,outils,liste_personnel,date;

PACKAGE Menu_Main IS
PROCEDURE Menu_Connexion (Login : out T_Titre; Empreinte : out Integer; Fonction : in out Role_P);
PROCEDURE Menu_Demarrage (L: in out t_pteurpers;Date_Jour :out T_Date);
END Menu_Main;

