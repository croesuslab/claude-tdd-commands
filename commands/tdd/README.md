# TDD Commands

Commandes Claude Code pour le workflow Test-Driven Development.

## Vue d'ensemble

```
/init (natif) → /tdd:init:* → /tdd:flow:*
```

## Initialisation (`/tdd:init:*`)

Commandes pour initialiser un nouveau projet TDD.

| Commande | Description | Crée |
|----------|-------------|------|
| `/tdd:init:1-project` | Découverte du projet, définition des epics | `docs/state.json`, `docs/epics/*.md` |
| `/tdd:init:2-architecture` | Architecture technique | `docs/dev/architecture.md` |
| `/tdd:init:3-standards` | Conventions de code | `docs/dev/standards.md` |
| `/tdd:init:4-readme` | README final | `README.md` |

**Flow recommandé :**
```
/init → /tdd:init:1-project → /tdd:init:2-architecture → /tdd:init:3-standards → /tdd:init:4-readme
```

Chaque commande est indépendante et pose les questions nécessaires si le contexte manque.

## Flow TDD (`/tdd:flow:*`)

Commandes pour le cycle de développement TDD.

| Commande | Phase | Description |
|----------|-------|-------------|
| `/tdd:flow:status` | - | Affiche l'état actuel (epic, tâche, phase, progression) |
| `/tdd:flow:next` | - | Exécute automatiquement la prochaine étape |
| `/tdd:flow:1-analyze` | Plan | Analyse la tâche, écrit specs dans `docs/current-task.md` |
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
    └── api/
```

## state.json

```json
{
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

## Raccourcis

- `/tdd:flow:status` - Où en suis-je ?
- `/tdd:flow:next` - Continue automatiquement
