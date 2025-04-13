WITH Ada.Characters.Handling, Ada.Text_IO, personnel,outils;
USE Ada.Characters.Handling, Ada.Text_Io, personnel,outils;

PACKAGE Liste_Personnel IS

-- Liste chaînée du personnel du centre
   TYPE T_CellPers ;
   TYPE T_PteurPers IS ACCESS T_CellPers;
   TYPE T_CellPers IS RECORD
      Personnel : T_Personnel;
      Persuiv : T_PteurPers;
   END RECORD;

   PROCEDURE Initialisation_Pers (L: IN OUT T_Pteurpers);
   PROCEDURE Visualisation_Liste_Pers (L: IN T_Pteurpers);
   FUNCTION Recherche_1pers (L: IN T_Pteurpers; Pers : IN T_Pers) RETURN Boolean;
   FUNCTION Recherche_1pers2 (L: IN T_Pteurpers; Pers : IN T_Personnel) RETURN t_pteurpers; --non testée
   FUNCTION Verif_Connexion (L : IN T_Pteurpers;Login:T_titre;Empreinte:integer) RETURN Boolean;
   PROCEDURE Supp_1Pers (L: IN OUT T_Pteurpers;Pers: OUT T_personnel; Erreur:OUT Boolean);
   PROCEDURE Supp_Secretaire (L:IN OUT T_Pteurpers;Id: out t_pers;Pers : out t_personnel);
   PROCEDURE Ajout_Pers (L: OUT T_Pteurpers);
--   PROCEDURE Connexion_Pers ( L: T_Pteurpers;Login : T_Titre; Empreinte : Integer; Fonction : Role_P);

END Liste_Personnel;

