# Commande: /tdd:flow:status

Affiche l'état actuel du projet TDD : epic en cours, tâche, phase, progression.

## Instructions

### 1. Charger l'état

Lire `docs/state.json`.

Si le fichier n'existe pas → afficher :
```
## Projet non initialisé

Aucun fichier `docs/state.json` trouvé.

Lancer `/tdd:init:1-project` pour initialiser le projet.
```

### 2. Charger le contexte

Lire en parallèle :
- Le fichier epic courant (`docs/epics/e{n}-*.md`)
- `docs/current-task.md` (si existe)

### 3. Afficher le statut

```
## Status TDD

**Epic:** E{N} - {Nom de l'epic}
**Tâche:** {T{M} - {Nom} | Aucune tâche en cours}
**Phase:** {phase | Prêt pour /tdd:flow:1-analyze}

### Progression E{N}

{barre de progression ASCII}
{completed}/{total} tâches ({pourcentage}%)

Complétées : {liste T1, T2, ...}
Restantes : {liste T3, T4, ...}

### Progression globale

| Epic | Nom | Status | Progression |
|------|-----|--------|-------------|
| E0 | Foundation | ✓ completed | 3/3 |
| E1 | {Nom} | ► in_progress | 2/5 |
| E2 | {Nom} | ○ not_started | 0/4 |
| ... | ... | ... | ... |

### Prochaine action

{Suggestion basée sur la phase actuelle}
```

### 4. Suggestions selon la phase

| Phase actuelle | Suggestion |
|----------------|------------|
| `null` | Lancer `/tdd:flow:1-analyze` pour commencer la prochaine tâche |
| `analyze` | Continuer l'analyse ou lancer `/tdd:flow:1-analyze` |
| `test` | Lancer `/tdd:flow:2-test` pour écrire les tests |
| `dev` | Lancer `/tdd:flow:3-dev` pour implémenter |
| `review` | Lancer `/tdd:flow:4-review` pour valider |
| `docs` | Lancer `/tdd:flow:5-docs` pour documenter |

### 5. Afficher les infos de la tâche en cours (si applicable)

Si `docs/current-task.md` existe et une tâche est en cours :

```
### Tâche en cours : T{M} - {Titre}

**Objectif:** {résumé de l'objectif}

**Fichiers:**
- Tests : {liste des fichiers de test}
- Code : {liste des fichiers à créer/modifier}
```

## Format de la barre de progression

```
[████████░░░░░░░░] 50%
[████████████████] 100%
[░░░░░░░░░░░░░░░░] 0%
```

16 caractères, █ pour complété, ░ pour restant.

## Notes

- Cette commande est en lecture seule (ne modifie rien)
- Utile pour reprendre le travail après une pause
- Peut être lancée à tout moment
