# /tdd:init:1-project

Découverte interactive du projet pour définir la vision, les epics et initialiser la structure TDD.

## Instructions

### 1. Vérifier l'état initial

Vérifie si `docs/state.json` existe :
- **Si oui** → demander confirmation avant de réinitialiser
- **Si non** → continuer

### 2. Exploration silencieuse

**Avant de parler, explorer :**
- Structure du dossier actuel (fichiers existants)
- `package.json`, `*.csproj`, `Cargo.toml`, etc. (indices sur le stack)
- `README.md` existant (contexte du projet)
- Fichiers de code existants (patterns, architecture émergente)

**Identifier :**
1. **Type de projet probable** - Web, CLI, API, library, desktop ?
2. **Stack détecté** - Langage, framework, dépendances
3. **État actuel** - Projet vierge, prototype existant, refactoring ?
4. **Indices sur le domaine** - Noms de fichiers, variables, commentaires

### 3. Présenter la compréhension initiale

```
## Exploration initiale

### Ce que j'ai détecté
- **Dossier:** [vierge / contient du code / prototype]
- **Stack apparent:** [langage/framework ou "non déterminé"]
- **Indices:** [ce que les fichiers suggèrent]

### Mon hypothèse
[Ce que je pense que le projet pourrait être, basé sur les indices]

Parle-moi de ton projet. Qu'est-ce que tu veux construire ?
```

### 4. Conversation de découverte

**Objectif :** Comprendre le projet à travers une conversation naturelle, pas un interrogatoire.

**Écoute active :**
| Si l'utilisateur mentionne... | Creuser sur... |
|-------------------------------|----------------|
| Un problème à résoudre | Qui a ce problème ? Quelle est la douleur actuelle ? |
| Une technologie | Pourquoi ce choix ? Contrainte ou préférence ? |
| Des utilisateurs | Qui sont-ils ? Quel est leur niveau technique ? |
| Une fonctionnalité | Pourquoi celle-là en premier ? Qu'est-ce qui en dépend ? |
| Une contrainte | D'où vient-elle ? Est-elle négociable ? |

**Questions à couvrir (adapter au contexte) :**

| Catégorie | Questions clés |
|-----------|----------------|
| Vision | Quel problème ça résout ? Pour qui ? Pourquoi maintenant ? |
| Scope | MVP vs vision complète ? Qu'est-ce qui est essentiel ? |
| Technique | Stack préféré ou ouvert ? Contraintes d'intégration ? |
| Contexte | Solo ou équipe ? Timeline ? Dépendances externes ? |

**Règles de conversation :**
- Questions **ouvertes** (pas oui/non)
- **Itérer** sur les réponses (creuser les "pourquoi")
- **Challenger** les hypothèses ("tu mentionnes X, mais as-tu considéré Y ?")
- **Reformuler** pour valider la compréhension
- Adapter la **profondeur** au projet (simple → rapide, complexe → approfondi)

### 5. Analyse silencieuse (après la conversation)

Avant de proposer les epics, identifier :

1. **Domaine** - Concepts clés, vocabulaire métier
2. **Entités** - Objets principaux du système
3. **Flux** - Comment les données/actions circulent
4. **Risques** - Complexités techniques, dépendances externes, inconnues
5. **Priorités** - Ce qui apporte le plus de valeur le plus tôt

### 6. Présenter la synthèse

```
## Synthèse: {Nom du projet}

### Ce que j'ai compris

**Vision:** [Résumé en 2-3 phrases]

**Utilisateurs:** [Qui et pourquoi]

**Problème résolu:** [La douleur adressée]

### Domaine identifié

| Concept | Description |
|---------|-------------|
| {Entité 1} | {Rôle dans le système} |
| {Entité 2} | {Rôle dans le système} |

### Points d'attention

1. [Risque ou complexité identifiée]
2. [Dépendance externe ou inconnue]
3. [Décision architecturale à prendre]

### Questions ouvertes

[Questions restantes avant de définir les epics]
```

Attendre validation ou clarification.

### 7. Proposer les epics

```
## Epics proposés

### Stratégie de découpage
[Expliquer le raisonnement derrière l'ordre et le découpage]

### Epics

| Epic | Nom | Objectif | Valeur |
|------|-----|----------|--------|
| E0 | Foundation | {Setup, structure de base} | Fondation technique |
| E1 | {Feature clé} | {Objectif} | {Valeur métier} |
| E2 | {Feature 2} | {Objectif} | {Valeur métier} |

**Ordre recommandé:** E0 → E1 → E2 → ...

**Raisonnement:**
- E0 d'abord car [raison]
- E1 avant E2 car [raison]

Des ajustements ? Un epic à diviser ou fusionner ?
```

### 8. Détailler chaque epic

Pour chaque epic validé :

```
## Détail: E{N} - {Nom}

### Objectif
{Ce que l'epic accomplit}

### Tâches proposées

| # | Tâche | Description | Dépend de |
|---|-------|-------------|-----------|
| T1 | {titre} | {description} | - |
| T2 | {titre} | {description} | T1 |

### Critères de complétion
- [ ] {Critère mesurable 1}
- [ ] {Critère mesurable 2}

### Risques spécifiques
- {Risque identifié pour cet epic}

Ça te convient ? Des tâches à ajouter/retirer ?
```

Itérer jusqu'à validation.

### 9. Créer la structure

Une fois tout validé, créer :

**Structure de dossiers :**
```bash
mkdir -p docs/dev/api docs/dev/decisions docs/epics docs/user/guides docs/user/reference
```

**`docs/state.json` :**
```json
{
  "project": {
    "name": "{nom}",
    "description": "{description courte}",
    "stack": "{stack}",
    "type": "{web|cli|api|desktop|library}"
  },
  "current": {
    "epic": "E0",
    "task": null,
    "phase": null
  },
  "epics": {
    "E0": { "status": "not_started", "completed": [] },
    "E1": { "status": "not_started", "completed": [] }
  }
}
```

**`docs/epics/e{n}-{nom}.md`** pour chaque epic (format enrichi) :
```markdown
# E{N}: {Nom}

{Description complète}

## Objectif

{Ce que cet epic accomplit et pourquoi}

## Valeur

{Quelle valeur ça apporte à l'utilisateur/projet}

## Tâches

| # | Tâche | Description | Dépend de |
|---|-------|-------------|-----------|
| T1 | {Titre} | {Description} | - |
| T2 | {Titre} | {Description} | T1 |

## T1: {Titre}

### Objectif
{Ce que cette tâche accomplit}

### Contexte
{Pourquoi cette tâche, lien avec le reste}

### À créer
- {fichier/composant}

### Critères de succès
- [ ] {Critère mesurable}

## T2: {Titre}

...

## Critères de complétion de l'epic

- [ ] {Critère global 1}
- [ ] {Critère global 2}

## Risques

- {Risque identifié}
- {Mitigation possible}
```

**`CLAUDE.md`** :
```markdown
# CLAUDE.md

This file provides guidance to Claude Code when working with this repository.

## Project Overview

**{Nom}** - {Description complète basée sur la conversation}

### Vision
{Vision du projet en 2-3 phrases}

### Utilisateurs
{Qui utilise ce projet et pourquoi}

## Build & Test Commands

```bash
# Build
{commande selon stack}

# Run tests
{commande selon stack}

# Run
{commande selon stack}
```

## Architecture

### Technology Stack
- **Runtime:** {stack}
- **Testing:** {framework test}

### Project Structure
```
{structure selon le type de projet}
```

### Key Concepts
| Concept | Description |
|---------|-------------|
| {Entité 1} | {Rôle} |
| {Entité 2} | {Rôle} |

## Development Flow (TDD)

```
/tdd:flow:1-analyze → /tdd:flow:2-test (RED) → /tdd:flow:3-dev (GREEN) → /tdd:flow:4-review → /tdd:flow:5-docs → /tdd:flow:6-done
```

## Epic Sequence

{E0} → {E1} → {E2} → ...

See `docs/epics/` for details and `docs/state.json` for progress.
```

**`CHANGELOG.md`** :
```markdown
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

### Added
- Initial project setup
- Project structure and TDD workflow
```

### 10. Afficher le résumé

```
## Projet initialisé: {nom}

### Résumé
- **Vision:** {vision en 1 ligne}
- **Stack:** {stack}
- **Epics:** {n} epics, {m} tâches total

### Fichiers créés
- `docs/state.json` - État du projet
- `docs/epics/e0-foundation.md`
- `docs/epics/e1-{nom}.md`
- ...
- `CLAUDE.md` - Guide pour Claude
- `CHANGELOG.md` - Journal des changements

### Décisions capturées
- {Décision clé 1}
- {Décision clé 2}

### Prochaines étapes
1. `/tdd:init:2-architecture` - Définir l'architecture technique
2. `/tdd:init:3-standards` - Définir les conventions de code
3. `/tdd:init:4-readme` - Générer le README

Ou sauter directement : `/tdd:flow:1-analyze`
```

## Adapter la profondeur

| Projet simple | Projet complexe |
|---------------|-----------------|
| 2-3 questions de découverte | Conversation approfondie |
| 2-3 epics | 5+ epics détaillés |
| Synthèse rapide | Analyse domaine complète |
| Création immédiate | Validation itérative |
