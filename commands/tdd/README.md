# TDD Commands

Commandes Claude Code pour le workflow Test-Driven Development.

## Vue d'ensemble

```
/init (natif) → /tdd:init:* → /tdd:flow:*
```

## Philosophie

Toutes les commandes suivent une approche **interactive et méthodique** :

1. **Exploration silencieuse** - Analyser le contexte avant de parler
2. **Présentation structurée** - Montrer ce qui a été compris
3. **Discussion interactive** - Creuser avec des questions ouvertes
4. **Synthèse et validation** - Confirmer avant d'agir
5. **Adaptation** - Ajuster la profondeur selon la complexité

## Initialisation (`/tdd:init:*`)

Commandes pour initialiser un nouveau projet TDD avec une approche conversationnelle.

| Commande | Description | Crée |
|----------|-------------|------|
| `/tdd:init:1-project` | Découverte du projet, vision, epics | `docs/state.json`, `docs/epics/*.md`, `CLAUDE.md` |
| `/tdd:init:2-architecture` | Architecture technique, composants, patterns | `docs/dev/architecture.md`, ADRs |
| `/tdd:init:3-standards` | Conventions de code et tests | `docs/dev/standards.md` |
| `/tdd:init:4-readme` | README final synthétisant le tout | `README.md` |

**Flow recommandé :**
```
/init → /tdd:init:1-project → /tdd:init:2-architecture → /tdd:init:3-standards → /tdd:init:4-readme
```

Chaque commande :
- Explore le contexte existant avant de poser des questions
- Présente son analyse et sa compréhension
- Engage une discussion pour clarifier et décider
- Synthétise les décisions avant de créer les fichiers
- S'adapte à la complexité du projet

## Flow TDD (`/tdd:flow:*`)

Commandes pour le cycle de développement TDD.

| Commande | Phase | Description |
|----------|-------|-------------|
| `/tdd:flow:status` | - | Affiche l'état actuel (epic, tâche, phase, progression) |
| `/tdd:flow:next` | - | Exécute automatiquement la prochaine étape |
| `/tdd:flow:1-analyze` | Plan | Analyse la tâche, discussion interactive, specs |
| `/tdd:flow:2-test` | RED | Écrit les tests (doivent compiler mais échouer) |
| `/tdd:flow:3-dev` | GREEN | Implémente jusqu'à ce que tous les tests passent |
| `/tdd:flow:4-review` | Validate | Vérifie standards, couverture, qualité |
| `/tdd:flow:5-docs` | Document | Documente, met à jour CHANGELOG |
| `/tdd:flow:6-done` | Commit | Commit, met à jour state.json |

**Cycle :**
```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│   1-analyze → 2-test → 3-dev → 4-review → 5-docs → 6-done  │
│       ↑                                              │      │
│       └──────────────────────────────────────────────┘      │
│                     (tâche suivante)                        │
└─────────────────────────────────────────────────────────────┘
```

## Structure des fichiers

```
docs/
├── state.json          # État du projet (epic, tâche, phase)
├── current-task.md     # Specs de la tâche en cours
├── epics/
│   ├── e0-foundation.md
│   └── e1-feature.md
└── dev/
    ├── architecture.md
    ├── standards.md
    ├── decisions/      # ADRs
    └── api/
```

## state.json

```json
{
  "project": {
    "name": "mon-projet",
    "description": "Description courte",
    "stack": "TypeScript/Node.js",
    "type": "cli"
  },
  "current": {
    "epic": "E1",
    "task": "T2",
    "phase": "dev"
  },
  "epics": {
    "E0": { "status": "completed", "completed": ["T1", "T2", "T3"] },
    "E1": { "status": "in_progress", "completed": ["T1"] }
  }
}
```

## Quickfix (`/tdd:flow:quickfix`)

Pour les corrections rapides qui ne nécessitent pas le processus TDD complet.

```bash
# Setup worktree (une seule fois)
git worktree add ../projet-quickfix -b quickfix

# Dans le worktree, lancer la commande
/tdd:flow:quickfix "fix typo in error message"
```

**Quand utiliser:**
- Changements < 20 lignes
- Corrections évidentes (typos, imports, null checks)
- Pas de nouvelle fonctionnalité

## Raccourcis

| Commande | Description |
|----------|-------------|
| `/tdd:flow:status` | Où en suis-je ? |
| `/tdd:flow:next` | Continue automatiquement |
| `/tdd:flow:quickfix "desc"` | Correction rapide |

## Principe d'interaction

Toutes les commandes privilégient :

- **Questions ouvertes** plutôt que oui/non
- **Itération** sur les réponses
- **Challenger** les hypothèses quand nécessaire
- **Reformulation** pour valider la compréhension
- **Adaptation** de la profondeur au contexte
