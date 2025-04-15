PACKAGE Date IS

-- Type pour la Date
   TYPE T_mois is (Janvier, Fevrier, Mars, Avril, Mai, Juin, Juillet, Aout, Septembre, Octobre, Novembre, Decembre) ;
   SUBTYPE Intj IS Integer RANGE 1..31 ; -- pour le nombre de jours dans un mois
   TYPE T_Date IS RECORD -- pour la date entière
      Numj : Intj ;
      Mois : T_Mois ;
      Annee : Positive ;
   END RECORD ;


   PROCEDURE Saisie_Date (T: OUT T_Date);
   -- Au début du logiciel utilisateur saisie la date du jour
   FUNCTION Bis(Annee: integer) RETURN Boolean;
   FUNCTION Nbj( M:T_Mois; Annee: Integer) RETURN Integer;
   -- Fonctions de vérifications de la saisie du jour
   -- Procédure de passage au lendemain
   PROCEDURE Affiche_Date(T: IN T_Date); -- Besoin pour afficher la date du jour et autres dates
   PROCEDURE Lendemain (T : IN OUT T_Date);
   -- Actualise le jour au lendemain // passage au lendemain
   FUNCTION Comp_Dates (D1, D2 : IN T_Date) RETURN Boolean;
END Date;

