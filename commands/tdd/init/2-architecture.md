# Commande: /tdd:init:2-architecture

Définir l'architecture technique en se basant sur le contexte du projet.

## Instructions

### 1. Charger le contexte (si disponible)

Vérifier et lire si présents :
- `CLAUDE.md` - Vue d'ensemble, stack, structure
- `docs/epics/*.md` - Comprendre les fonctionnalités prévues

**Si `CLAUDE.md` n'existe pas**, poser les questions de base :
```
Avant de définir l'architecture, j'ai besoin de quelques infos :

1. Nom du projet ?
2. Description en 1-2 phrases ?
3. Stack technique (langage/framework) ?
4. Type de projet (web, CLI, desktop, API, etc.) ?
```

Extraire ou collecter :
- Nom et description du projet
- Stack technique choisi
- Type de projet (web, CLI, desktop, etc.)
- Fonctionnalités principales (depuis les epics ou la conversation)

### 2. Questions ciblées selon le contexte

**Ne pas poser de questions génériques.** Adapter selon le type de projet détecté.

#### Si projet Web Frontend/Full-stack :
```
Pour l'architecture de {nom} :

1. State management : Comment gérer l'état de l'app ?
   ○ Store global (Redux, Zustand, Pinia)
   ○ Context/Composition API
   ○ Server state only (React Query, SWR)
   ○ Minimal (useState local)

2. Routing : Quelle approche ?
   ○ File-based (Next.js, Nuxt)
   ○ Config-based (React Router, Vue Router)
   ○ SPA simple (hash routing)

3. Styling : Quelle approche CSS ?
   ○ CSS Modules
   ○ Tailwind
   ○ CSS-in-JS (styled-components)
   ○ Plain CSS/SCSS

4. API calls : Comment communiquer avec le backend ?
   ○ REST (fetch/axios)
   ○ GraphQL (Apollo, urql)
   ○ tRPC
   ○ Pas d'API (static)
```

#### Si projet Backend/API :
```
Pour l'architecture de {nom} :

1. Pattern API : Quelle structure ?
   ○ REST classique (controllers/routes)
   ○ Clean Architecture (use cases, entities)
   ○ CQRS (commands/queries séparés)
   ○ Minimal API / Functions

2. Base de données : Quel accès ?
   ○ ORM (Entity Framework, Prisma, SQLAlchemy)
   ○ Query builder (Knex, Dapper)
   ○ Raw SQL
   ○ NoSQL driver direct

3. Auth : Quelle stratégie ?
   ○ JWT tokens
   ○ Sessions
   ○ OAuth/OIDC externe
   ○ Pas d'auth pour l'instant

4. Validation : Où valider les données ?
   ○ DTOs avec validation (FluentValidation, Zod)
   ○ Dans les controllers
   ○ Dans le domain layer
```

#### Si projet CLI :
```
Pour l'architecture de {nom} :

1. Parsing des arguments : Quelle approche ?
   ○ Library (System.CommandLine, yargs, click)
   ○ Manuel simple
   ○ Subcommands style git

2. Configuration : Comment gérer les settings ?
   ○ Fichier config (JSON, YAML, TOML)
   ○ Variables d'environnement
   ○ Arguments uniquement
   ○ Mix des trois

3. Output : Comment afficher les résultats ?
   ○ JSON (machine-readable)
   ○ Tables formatées
   ○ Texte simple
   ○ Interactif (prompts, progress bars)

4. Erreurs : Comment les gérer ?
   ○ Exit codes + stderr
   ○ Exceptions avec stack trace (debug)
   ○ Messages user-friendly
```

#### Si projet Desktop :
```
Pour l'architecture de {nom} :

1. UI Pattern : Quelle architecture ?
   ○ MVVM
   ○ MVC
   ○ Component-based (si Blazor/Electron)
   ○ Simple code-behind

2. Threading : Comment gérer le background work ?
   ○ Async/await partout
   ○ Background workers
   ○ Thread pool manuel
   ○ Pas de long-running tasks

3. Persistance locale : Comment sauvegarder ?
   ○ SQLite
   ○ Fichiers JSON/XML
   ○ Settings natifs (Registry, plist)
   ○ Pas de persistance
```

#### Si projet avec contraintes performance :
```
J'ai noté des contraintes de performance. Quelques questions :

1. Hot path : Quelles opérations sont critiques ?
   [Champ texte]

2. Allocation : Faut-il éviter les allocations ?
   ○ Oui, zero-alloc critique
   ○ Minimiser seulement
   ○ Pas de contrainte

3. Threading : Modèle de concurrence ?
   ○ Thread dédié haute priorité
   ○ Thread pool standard
   ○ Single-threaded
   ○ Actor model
```

### 3. Générer l'architecture

Créer `docs/dev/architecture.md` adapté au projet :

```markdown
# {Projet} - Architecture

{Description courte}

## Stack

- **Runtime**: {stack détaillé}
- **UI**: {si applicable}
- **Data**: {stockage}
- **Testing**: {framework}

## Architecture

```
{Diagramme ASCII adapté au projet}
{Montrer les composants principaux et leurs relations}
```

## Composants

### {Composant 1}

| Aspect | Description |
|--------|-------------|
| Rôle | {description} |
| Responsabilités | {liste} |

{Code exemple si pertinent}

### {Composant 2}

...

## Patterns

### {Pattern principal choisi}

{Explication et exemple de code}

## Flux de données

{Description du flux principal}

```
{Diagramme de séquence ASCII si utile}
```

## Structure Projet

```
src/
├── {dossier}/     # {description}
└── {dossier}/     # {description}

tests/
└── {structure}
```

## Configuration

{Pattern de configuration utilisé}

## Décisions clés

| Décision | Choix | Raison |
|----------|-------|--------|
| {aspect} | {choix} | {justification} |
```

### 4. Mettre à jour CLAUDE.md

Enrichir la section Architecture de `CLAUDE.md` avec :
- Structure projet détaillée
- Composants principaux
- Patterns utilisés

### 5. Afficher le résumé

```
## Architecture définie : {projet}

**Composants principaux :**
- {composant 1} - {rôle}
- {composant 2} - {rôle}

**Patterns :**
- {pattern 1}
- {pattern 2}

**Fichiers créés/mis à jour :**
- `docs/dev/architecture.md`
- `CLAUDE.md` (section Architecture enrichie)

**Prochaine étape :** `/tdd:init:3-standards`
```

## Notes

- Les questions doivent être pertinentes au projet spécifique
- Ne pas demander des choix déjà implicites dans le stack
- Proposer des valeurs par défaut sensées
- Le document doit être actionnable, pas théorique
- Diagrammes ASCII > pas de diagramme > outils externes
