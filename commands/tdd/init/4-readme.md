# Commande: /tdd:init:4-readme

Génère le README.md final en synthétisant toute la documentation du projet.

## Instructions

### 1. Charger le contexte disponible

Vérifier et lire si présents :
- `CLAUDE.md` - Vue d'ensemble, stack, commandes
- `docs/dev/architecture.md` - Architecture technique
- `docs/dev/standards.md` - Conventions
- `docs/epics/*.md` - Fonctionnalités planifiées
- `docs/state.json` - État actuel

**Si aucun de ces fichiers n'existe**, poser les questions essentielles :
```
Pour générer le README, j'ai besoin de quelques infos :

1. Nom du projet ?
2. Description en 1-2 phrases ?
3. Stack technique ?
4. Commande pour build ?
5. Commande pour run tests ?
6. Commande pour lancer le projet ?
```

### 2. Questions optionnelles

Si des informations manquent, demander :

```
Pour compléter le README :

1. License du projet ?
   ○ MIT
   ○ Apache 2.0
   ○ GPL
   ○ Propriétaire / Pas de license
   ○ Autre

2. Le projet est-il public ou privé ?
   ○ Public (README complet pour contributeurs externes)
   ○ Privé (README interne, moins de détails d'installation)

3. Badges à inclure ?
   ☐ Build status
   ☐ Coverage
   ☐ Version/Release
   ☐ License
   ☐ Aucun pour l'instant
```

### 3. Générer README.md

Créer `README.md` à la racine :

```markdown
# {Nom du projet}

{Description en 1-2 phrases - extraite de CLAUDE.md}

## Features

{Liste des fonctionnalités principales - extraites des epics}

- {Feature 1 de E1}
- {Feature 2 de E2}
- ...

## Getting Started

### Prerequisites

- {Runtime} {version}
- {Autres dépendances}

### Installation

```bash
{Commandes d'installation selon le stack}
```

### Running

```bash
{Commande pour lancer le projet}
```

## Development

### Setup

```bash
# Clone the repository
git clone {url si connu}
cd {nom-projet}

# Install dependencies
{commande install}

# Run tests
{commande test}
```

### Project Structure

```
{Structure simplifiée du projet}
```

### Testing

```bash
# Run all tests
{commande test}

# Run specific test
{commande test single}
```

## Documentation

- [Architecture](docs/dev/architecture.md) - Technical architecture
- [Standards](docs/dev/standards.md) - Code conventions
- [Epics](docs/epics/) - Feature roadmap

## Roadmap

{Résumé des epics planifiés}

| Epic | Description | Status |
|------|-------------|--------|
| E0 | Foundation | {status} |
| E1 | {Nom} | {status} |
| ... | ... | ... |

## Contributing

{Si projet public}

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## License

{License choisie ou "Proprietary"}
```

### 4. Adapter selon le type de projet

**Pour une library/SDK :**
Ajouter une section "Usage" avec exemples de code.

```markdown
## Usage

```{langage}
// Exemple d'utilisation basique
{code exemple}
```

### API Reference

See [API Documentation](docs/dev/api/) for detailed reference.
```

**Pour une CLI :**
Ajouter une section "Commands" avec les commandes disponibles.

```markdown
## Commands

| Command | Description |
|---------|-------------|
| `{cmd} {args}` | {description} |
| ... | ... |

### Examples

```bash
# Example 1
{commande exemple}

# Example 2
{commande exemple}
```
```

**Pour une app web :**
Ajouter des infos sur le déploiement si pertinent.

```markdown
## Deployment

{Instructions de déploiement ou lien vers la doc}
```

### 5. Afficher le résumé final

```
## Initialisation terminée : {projet}

**Fichiers créés :**
- `README.md` - Documentation principale

**Toute la structure init :**
```
{projet}/
├── README.md
├── CLAUDE.md
├── CHANGELOG.md
└── docs/
    ├── state.json
    ├── dev/
    │   ├── architecture.md
    │   └── standards.md
    └── epics/
        ├── e0-foundation.md
        └── e1-{feature}.md
```

**Le projet est prêt pour le développement !**

Lancer `/tdd:flow:1-analyze` pour commencer la première tâche.
```

## Notes

- Le README doit être autonome (compréhensible sans lire les autres docs)
- Garder le README concis - détails dans les docs dédiées
- Adapter le ton : formel pour public, décontracté pour interne
- Les sections optionnelles peuvent être omises si non pertinentes
- Mettre à jour le README quand les features sont implémentées
