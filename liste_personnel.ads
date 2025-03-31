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
   PROCEDURE Visualisation_Liste_Pers (L: IN
      T_Pteurpers);
   FUNCTION Recherche_1pers (L: IN T_Pteurpers; Pers : IN T_Pers) RETURN Boolean;
   FUNCTION Verif_Connexion (L : IN T_Pteurpers; Pers : IN T_Personnel;Login:T_Titre;Empreinte:Integer) RETURN Boolean ;
   PROCEDURE Defiler_Pers (L: IN OUT T_Pteurpers;Pers: OUT T_personnel; Erreur:OUT Boolean);
   PROCEDURE Supp_Secretaire (L:IN OUT T_Pteurpers;Id: out t_pers;Pers : out t_personnel);
   PROCEDURE Ajout_Pers (L: OUT T_Pteurpers);

END Liste_Personnel;

