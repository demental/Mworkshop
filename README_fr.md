# Gestion d'ateliers
## Objectif

* Saisir facilement les ateliers pour chaque trimestre
* Saisir facilement la liste des participants et leurs listes de choix (2X2 choix par trimestre)
* MEttre à jour la liste de choix.
* A l'aide d'un algorithme répartir les participants en respectant au mieux leur liste de choix.

## Données minimales

* Nom/prénom de chaque élève. Second prénom en cas d'homonyme
* Niveau (classe)
* Liste des activités pour chaque trimestre,
* Effectif maxi de chaque atelier
* Niveau min / max


## Données importantes influant sur le résultat de la répartition

* Classe de chaque élève
* Choix 1 / choix 2 pour un atelier et un second atelier, pour chaque trimestre.


## Fonctionnalités d'administration

* Réinitialiser la liste des élèves
* Réinitialiser la liste des ateliers

## Nomenclature

Anglicisation du nommage pour en faciliter l'utilisation.

* Elève = student
* Nom = name
* Atelier = workshop
* Classe = grade
* Nombre de participants max : max_attendees
* Choix atelier : workshop1_choice1 workshop1_choice2


## Interface

4 interfaces :

* Saisie des élèves et de leurs choix
* Saisie des ateliers
* Affectation des élèves
* Administration


