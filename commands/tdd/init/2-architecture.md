# /tdd:init:2-architecture

Définition interactive de l'architecture technique basée sur une compréhension approfondie du projet.

## Instructions

### 1. Charger et analyser le contexte

**Explorer silencieusement :**
- `CLAUDE.md` - Vue d'ensemble, stack, structure
- `docs/state.json` - Métadonnées du projet
- `docs/epics/*.md` - Fonctionnalités prévues
- Code existant (si présent) - Patterns émergents

**Si aucun contexte n'existe :**
```
Avant de définir l'architecture, j'ai besoin de comprendre le projet.

Parle-moi de ce que tu construis :
- Quel type de projet ? (web, API, CLI, desktop, library)
- Quel stack technique ?
- Quelles sont les fonctionnalités principales ?
```

### 2. Analyse silencieuse

**Avant de parler, identifier :**

1. **Type d'architecture naturel**
   - Le projet suggère-t-il une architecture spécifique ?
   - Quels patterns sont idiomatiques pour ce stack ?

2. **Composants probables**
   - Quels modules/couches seront nécessaires ?
   - Comment vont-ils interagir ?

3. **Décisions critiques**
   - Quels choix architecturaux auront le plus d'impact ?
   - Quelles sont les options pour chaque décision ?

4. **Risques architecturaux**
   - Où sont les points de couplage ?
   - Quelles décisions seront difficiles à changer ?

5. **Contraintes détectées**
   - Performance, scalabilité, sécurité ?
   - Intégrations externes ?

### 3. Présenter l'analyse

```
## Analyse architecturale: {projet}

### Ce que j'ai compris
- **Type:** {web app / API / CLI / etc.}
- **Stack:** {stack détecté}
- **Fonctionnalités clés:** {résumé des epics}

### Architecture naturelle pour ce type de projet
[Expliquer quelle architecture est typique/recommandée]

### Composants que j'identifie
| Composant | Rôle | Interactions |
|-----------|------|--------------|
| {Composant 1} | {rôle} | {avec qui il interagit} |
| {Composant 2} | {rôle} | {avec qui il interagit} |

### Décisions architecturales à prendre
1. {Décision 1} - Impact: {élevé/moyen/faible}
2. {Décision 2} - Impact: {élevé/moyen/faible}

### Points d'attention
- {Risque ou complexité identifié}
- {Contrainte à considérer}
```

### 4. Discussion interactive des décisions

Pour chaque décision architecturale importante, engager une discussion :

**Format de présentation d'une décision :**
```
### Décision: {Aspect}

**Contexte:** {Pourquoi cette décision est nécessaire}

**Options:**

| Option | Description | Avantages | Inconvénients |
|--------|-------------|-----------|---------------|
| A | {description} | {pros} | {cons} |
| B | {description} | {pros} | {cons} |

**Ma recommandation:** {Option} parce que {raisonnement}

**Questions:**
- {Question pour clarifier le contexte}
- {Question sur les contraintes}

Qu'est-ce qui te parle le plus ?
```

**Types de décisions selon le projet :**

| Type de projet | Décisions typiques |
|----------------|-------------------|
| Web Frontend | State management, routing, styling, data fetching |
| Backend/API | Pattern API, accès données, auth, validation |
| CLI | Parsing args, config, output format, error handling |
| Desktop | UI pattern, threading, persistance locale |
| Library | API publique, extensibilité, versioning |

**Règles de discussion :**
- Présenter les **trade-offs** honnêtement
- **Recommander** mais laisser le choix
- **Creuser** les "pourquoi" derrière les préférences
- **Challenger** si un choix semble sous-optimal pour le contexte
- Documenter la **raison** du choix, pas juste le choix

### 5. Synthèse des décisions

```
## Décisions architecturales retenues

| Aspect | Choix | Raison |
|--------|-------|--------|
| {Aspect 1} | {Choix} | {Justification} |
| {Aspect 2} | {Choix} | {Justification} |

### Impact sur la structure
[Comment ces choix affectent l'organisation du code]

### À garder en tête
- {Implication du choix 1}
- {Implication du choix 2}

Ça te convient ? Des ajustements ?
```

Attendre validation.

### 6. Générer la documentation

**`docs/dev/architecture.md` :**
```markdown
# {Projet} - Architecture

{Description du projet et de sa raison d'être}

## Vue d'ensemble

### Stack technique
| Couche | Technologie | Rôle |
|--------|-------------|------|
| {Couche} | {Tech} | {Rôle} |

### Diagramme d'architecture

```
{Diagramme ASCII montrant les composants et leurs relations}
{Adapter au type de projet - pas de diagramme générique}
```

## Composants

### {Composant 1}

| Aspect | Description |
|--------|-------------|
| Rôle | {description} |
| Responsabilités | {liste} |
| Dépendances | {ce dont il dépend} |
| Utilisé par | {ce qui l'utilise} |

```{langage}
// Exemple de code illustrant le pattern
{code exemple}
```

### {Composant 2}

...

## Patterns architecturaux

### {Pattern principal}

**Pourquoi ce pattern:** {justification basée sur la discussion}

**Comment l'appliquer:**
```{langage}
// Exemple concret
{code}
```

### {Pattern secondaire si applicable}

...

## Flux de données

### {Flux principal}

```
{Diagramme de séquence ASCII}
{Montrer comment les données circulent}
```

**Étapes:**
1. {Étape 1}
2. {Étape 2}
...

## Structure du projet

```
{racine}/
├── {dossier}/          # {description et responsabilité}
│   ├── {sous-dossier}/ # {description}
│   └── {fichier}       # {description}
├── {dossier}/          # {description}
└── tests/
    └── {structure des tests}
```

## Décisions architecturales (ADR)

| # | Décision | Choix | Raison | Date |
|---|----------|-------|--------|------|
| 1 | {aspect} | {choix} | {justification} | {date} |
| 2 | {aspect} | {choix} | {justification} | {date} |

## Contraintes et limites

- **{Contrainte 1}:** {description et impact}
- **{Contrainte 2}:** {description et impact}

## Évolutions futures

| Évolution | Quand | Impact |
|-----------|-------|--------|
| {évolution possible} | {trigger} | {ce qui changera} |
```

### 7. Mettre à jour CLAUDE.md

Enrichir la section Architecture avec :
- Structure projet détaillée
- Patterns à suivre
- Décisions clés à respecter

### 8. Créer les ADRs si nécessaire

Pour les décisions importantes, créer `docs/dev/decisions/adr-{n}-{titre}.md` :

```markdown
# ADR-{N}: {Titre}

## Statut
Accepté

## Contexte
{Pourquoi cette décision était nécessaire}

## Décision
{Ce qui a été décidé}

## Options considérées

### Option A: {nom}
- Avantages: {liste}
- Inconvénients: {liste}

### Option B: {nom}
- Avantages: {liste}
- Inconvénients: {liste}

## Justification
{Pourquoi cette option a été choisie}

## Conséquences
- {Implication 1}
- {Implication 2}
```

### 9. Afficher le résumé

```
## Architecture définie: {projet}

### Vue d'ensemble
```
{Diagramme ASCII simplifié}
```

### Composants principaux
- **{Composant 1}** - {rôle en 1 ligne}
- **{Composant 2}** - {rôle en 1 ligne}

### Décisions clés
| Décision | Choix |
|----------|-------|
| {Aspect 1} | {Choix} |
| {Aspect 2} | {Choix} |

### Fichiers créés/mis à jour
- `docs/dev/architecture.md` - Architecture complète
- `docs/dev/decisions/adr-*.md` - Décisions documentées (si applicable)
- `CLAUDE.md` - Section Architecture enrichie

### Prochaine étape
`/tdd:init:3-standards` - Définir les conventions de code
```

## Adapter la profondeur

| Projet simple | Projet complexe |
|---------------|-----------------|
| 1-2 décisions clés | 5+ décisions documentées |
| Structure évidente | Discussion approfondie |
| Pas d'ADR | ADRs pour décisions majeures |
| Diagramme simple | Diagrammes multiples |
