# /tdd:init:4-readme

Génération interactive du README en synthétisant la documentation et en validant avec l'utilisateur.

## Instructions

### 1. Charger et analyser le contexte

**Explorer silencieusement :**
- `CLAUDE.md` - Vue d'ensemble, stack, commandes
- `docs/dev/architecture.md` - Architecture technique
- `docs/dev/standards.md` - Conventions
- `docs/epics/*.md` - Fonctionnalités planifiées
- `docs/state.json` - État et métadonnées
- `README.md` existant (si présent)
- `package.json`, `Cargo.toml`, `*.csproj` - Métadonnées projet

**Si aucun contexte n'existe :**
```
Pour générer un README utile, j'ai besoin de comprendre le projet.

Parle-moi de :
- Qu'est-ce que ce projet fait ?
- Qui va l'utiliser ?
- Comment on l'installe et l'utilise ?
```

### 2. Analyse silencieuse

**Avant de parler, identifier :**

1. **Audience du README**
   - Développeurs internes ? Contributeurs externes ? Utilisateurs finaux ?
   - Niveau technique attendu ?

2. **Informations disponibles**
   - Qu'est-ce qui est documenté ailleurs ?
   - Qu'est-ce qui manque et doit être dans le README ?

3. **Type de projet**
   - Library/SDK → Focus sur l'usage et l'API
   - CLI → Focus sur les commandes
   - App web → Focus sur le déploiement
   - API → Focus sur les endpoints

4. **État du projet**
   - MVP/Early stage → Roadmap importante
   - Mature → Documentation complète

5. **Ton approprié**
   - Projet public → Formel, accueillant
   - Projet interne → Direct, technique

### 3. Présenter l'analyse

```
## Analyse pour le README: {projet}

### Ce que j'ai collecté
- **Nom:** {nom}
- **Description:** {description}
- **Stack:** {stack}
- **Type:** {library/CLI/app/API}

### Audience identifiée
{Qui va lire ce README et pourquoi}

### Sections que je propose
1. {Section 1} - {pourquoi cette section}
2. {Section 2} - {pourquoi cette section}
...

### Informations manquantes
- {Info qui n'est pas dans les docs existantes}

### Questions avant de générer
```

### 4. Discussion interactive

**Questions selon le contexte :**

```
### Finalisation du README

Quelques questions pour un README adapté :

**1. Visibilité du projet**
- Public (contributeurs externes possibles)
- Privé/Interne (équipe seulement)

**2. État actuel**
- En développement actif (montrer la roadmap)
- Stable (focus sur l'usage)
- MVP (disclaimer sur l'état)

**3. Éléments à inclure**
☐ Badges (build, coverage, version)
☐ Screenshot/Demo
☐ Roadmap détaillée
☐ Guide de contribution
☐ License

**4. Ton préféré**
- Professionnel/Formel
- Décontracté/Friendly
- Technique/Direct

Des préférences particulières ?
```

**Questions spécifiques par type :**

| Type | Questions additionnelles |
|------|-------------------------|
| Library | Exemples de code à mettre en avant ? API publique principale ? |
| CLI | Commandes les plus importantes ? Output exemple ? |
| App web | URL de demo ? Screenshots disponibles ? |
| API | Authentification ? Rate limits ? Sandbox ? |

### 5. Proposer la structure

```
## Structure proposée du README

### {Projet}

1. **Header**
   - Nom + tagline
   - Badges: {liste}

2. **Introduction**
   - Description en 2-3 phrases
   - Pourquoi ce projet existe

3. **Features** (si applicable)
   - Liste des fonctionnalités clés

4. **Getting Started**
   - Prerequisites
   - Installation
   - Premier usage

5. **{Section spécifique au type}**
   - {Détails}

6. **Development**
   - Setup dev
   - Tests
   - Structure projet

7. **Documentation**
   - Liens vers docs détaillées

8. **Roadmap** (si early stage)
   - Epics planifiés

9. **Contributing** (si public)
   - Guide contribution

10. **License**

Cette structure te convient ? Des sections à ajouter/retirer ?
```

### 6. Générer le README

**Template de base :**
```markdown
# {Nom}

{Badges si choisis}

{Description concise - 1-2 phrases qui expliquent le "quoi" et le "pourquoi"}

## Features

{Liste des fonctionnalités principales - extraites des epics}

- **{Feature 1}** - {description courte}
- **{Feature 2}** - {description courte}

## Getting Started

### Prerequisites

- {Runtime} {version minimum}
- {Autre dépendance}

### Installation

```bash
{Commandes d'installation}
```

### Quick Start

```bash
{Commande pour démarrer rapidement}
```

{Code exemple minimal si library/SDK}

## {Section spécifique}

{Contenu adapté au type de projet}

## Development

### Setup

```bash
git clone {url}
cd {nom}
{commandes setup}
```

### Testing

```bash
{commande tests}
```

### Project Structure

```
{structure simplifiée avec descriptions}
```

## Documentation

| Document | Description |
|----------|-------------|
| [Architecture](docs/dev/architecture.md) | Technical architecture |
| [Standards](docs/dev/standards.md) | Code conventions |
| [Epics](docs/epics/) | Feature roadmap |

## Roadmap

{Si early stage, sinon omettre}

| Status | Feature | Description |
|--------|---------|-------------|
| ✅ | {Feature done} | {description} |
| 🚧 | {Feature in progress} | {description} |
| 📋 | {Feature planned} | {description} |

## Contributing

{Si public}

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License

{License choisie avec lien}
```

**Adaptations par type :**

**Pour une Library/SDK :**
```markdown
## Usage

### Basic Example

```{langage}
{Exemple d'usage minimal}
```

### API Reference

See [API Documentation](docs/dev/api/) for detailed reference.

### Examples

| Example | Description |
|---------|-------------|
| [Basic](examples/basic) | {description} |
| [Advanced](examples/advanced) | {description} |
```

**Pour une CLI :**
```markdown
## Commands

| Command | Description |
|---------|-------------|
| `{nom} {cmd1}` | {description} |
| `{nom} {cmd2}` | {description} |

### Examples

```bash
# {Description exemple 1}
{commande}

# {Description exemple 2}
{commande}
```

### Configuration

{Info sur le fichier de config si applicable}
```

**Pour une App Web :**
```markdown
## Demo

{Lien ou screenshot}

## Deployment

### Production

```bash
{Commandes de build/deploy}
```

### Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `{VAR}` | {description} | {Yes/No} |
```

**Pour une API :**
```markdown
## API Overview

Base URL: `{url}`

### Authentication

{Méthode d'auth}

### Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/{resource}` | {description} |
| POST | `/api/{resource}` | {description} |

### Example Request

```bash
curl -X GET {url}/api/{resource} \
  -H "Authorization: Bearer {token}"
```
```

### 7. Présenter le résultat

```
## README généré

J'ai créé le README avec :

### Sections incluses
- {Liste des sections}

### Adapté pour
- **Audience:** {audience}
- **Type:** {type de projet}
- **Ton:** {ton choisi}

### Points forts
- {Ce qui est bien mis en valeur}

### À compléter plus tard
- {Éléments placeholder à remplir}

Veux-tu que je modifie quelque chose ?
```

### 8. Finaliser l'initialisation

```
## Initialisation TDD terminée: {projet}

### Structure complète créée

```
{projet}/
├── README.md              ← Nouveau
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

### Récapitulatif

| Étape | Créé | Contenu |
|-------|------|---------|
| 1-project | `state.json`, `epics/*.md`, `CLAUDE.md` | Vision, epics, tâches |
| 2-architecture | `architecture.md` | Stack, composants, patterns |
| 3-standards | `standards.md` | Conventions code et tests |
| 4-readme | `README.md` | Documentation publique |

### Décisions capturées
- {Décision clé 1}
- {Décision clé 2}
- {Décision clé 3}

### Le projet est prêt pour le développement !

**Prochaine étape:** `/tdd:flow:1-analyze` pour commencer la première tâche.
```

## Adapter la profondeur

| Projet simple | Projet complexe |
|---------------|-----------------|
| README minimal | README complet |
| Structure standard | Sections personnalisées |
| Peu de questions | Discussion approfondie |
| Génération rapide | Validation itérative |
