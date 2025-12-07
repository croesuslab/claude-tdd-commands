# Commande: /tdd:init:1-project

Conversation exploratoire pour comprendre le projet, définir les epics et initialiser la structure TDD.

## Instructions

### 1. Vérifier si le projet existe déjà

Vérifie si `docs/state.json` existe :
- Si oui → demander confirmation avant de réinitialiser
- Si non → continuer

### 2. Conversation de découverte

L'objectif est de comprendre le projet à travers une conversation naturelle. Poser des questions ouvertes et creuser selon les réponses.

**Démarrer avec :**
```
Parle-moi de ton projet. Qu'est-ce que tu veux construire ?
```

**Creuser selon la réponse.** Exemples de questions de suivi :

| Si l'utilisateur mentionne... | Questions de suivi |
|-------------------------------|-------------------|
| Site web / App web | Frontend seul ou full-stack ? Quel framework ? SSR/SPA ? Auth requise ? |
| API / Backend | REST ou GraphQL ? Quelles entités principales ? Base de données ? |
| CLI | Quelles commandes ? Interactif ou batch ? Config file ? |
| Desktop | Quelle plateforme ? UI native ou web-based ? |
| Import/Export de fichiers | Quels formats ? Taille des fichiers ? Streaming nécessaire ? |
| Base de données | SQL ou NoSQL ? Quelles entités ? Relations ? |
| Temps réel | WebSocket ? Polling ? Quelle fréquence ? |
| Hardware / IoT | Quels protocoles ? Latence critique ? |

**Questions essentielles à couvrir (adapter selon le contexte) :**

1. **But** : Quel problème ça résout ? Pour qui ?
2. **Fonctionnalités clés** : Les 3-5 features principales ?
3. **Stack préféré** : Langage/framework déjà choisi ou ouvert ?
4. **Contraintes** : Performance, plateforme, intégrations externes ?
5. **MVP** : Qu'est-ce qui est essentiel vs nice-to-have ?

### 3. Synthétiser et proposer les epics

Une fois le projet bien compris, proposer un découpage en epics :

```
## Récapitulatif

**Projet :** {nom} - {description courte}
**Stack :** {langage/framework}
**Type :** {web/cli/desktop/etc.}

## Epics proposés

| Epic | Nom | Description | Tâches estimées |
|------|-----|-------------|-----------------|
| E0 | Foundation | {setup, modèles de base} | ~{n} |
| E1 | {Feature 1} | {description} | ~{n} |
| E2 | {Feature 2} | {description} | ~{n} |
| ... | ... | ... | ... |

**Ordre :** E0 → E1 → E2 → ...

Ça te convient ? Tu veux ajuster quelque chose ?
```

### 4. Détailler les epics

Pour chaque epic validé, demander les détails ou les proposer :

```
Pour l'epic "{Nom}", voici les tâches que je propose :

| # | Tâche | Description |
|---|-------|-------------|
| T1 | {titre} | {description} |
| T2 | {titre} | {description} |
| ... | ... | ... |

Des ajustements ?
```

### 5. Créer la structure

Une fois tout validé, créer :

**Structure de dossiers :**
```bash
mkdir -p docs/dev/api
mkdir -p docs/dev/decisions
mkdir -p docs/epics
mkdir -p docs/user/guides
mkdir -p docs/user/reference
```

**`docs/state.json` :**
```json
{
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

**`docs/epics/e{n}-{nom}.md`** pour chaque epic :
```markdown
# E{N}: {Nom}

{Description}

## Objectif

- {Objectif 1}
- {Objectif 2}

## Tâches

| # | Tâche | Description |
|---|-------|-------------|
| T1 | {Titre} | {Description} |
| T2 | {Titre} | {Description} |

## T1: {Titre}

{Description détaillée}

**À créer :**
- {fichier/composant}

## T2: {Titre}

{Description détaillée}

## Critères de complétion

- [ ] Build OK
- [ ] Tests OK
- [ ] {Critère fonctionnel}
```

**`CLAUDE.md`** de base :
```markdown
# CLAUDE.md

This file provides guidance to Claude Code when working with this repository.

## Project Overview

{Nom} - {Description complète basée sur la conversation}

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

## Development Flow (TDD)

```
/tdd:flow:1-analyze → /tdd:flow:2-test (RED) → /tdd:flow:3-dev (GREEN) → /tdd:flow:4-review → /tdd:flow:5-docs → /tdd:flow:6-done
```

## Epic Sequence

{E0} → {E1} → {E2} → ...

See `docs/epics/` for details and `docs/state.json` for progress.
```

**`CHANGELOG.md` :**
```markdown
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

### Added
- Initial project setup
```

### 6. Afficher le résumé

```
## Projet initialisé : {nom}

**Stack :** {stack}
**Epics :** {n} epics, {m} tâches total

**Fichiers créés :**
- `docs/state.json`
- `docs/epics/e0-foundation.md`
- `docs/epics/e1-{nom}.md`
- ...
- `CLAUDE.md`
- `CHANGELOG.md`

**Prochaines étapes :**
1. `/tdd:init:2-architecture` - Définir l'architecture technique
2. `/tdd:init:3-standards` - Définir les conventions de code
3. `/tdd:init:4-readme` - Générer le README

Ou sauter directement au dev : `/tdd:flow:1-analyze`
```

## Notes

- La conversation doit être naturelle, pas un interrogatoire
- Adapter les questions au contexte (ne pas demander "SQL ou NoSQL" pour un CLI simple)
- Proposer des choix quand l'utilisateur hésite
- Les epics peuvent être ajustés plus tard
- Privilégier la simplicité : moins d'epics bien définis > beaucoup d'epics vagues
