# /tdd:init:3-standards

Définition interactive des conventions de code basée sur le stack et les préférences de l'équipe.

## Instructions

### 1. Charger et analyser le contexte

**Explorer silencieusement :**
- `CLAUDE.md` - Stack technique, structure
- `docs/dev/architecture.md` - Patterns choisis
- `docs/state.json` - Type de projet
- Code existant (si présent) - Conventions déjà utilisées
- Fichiers de config (`.eslintrc`, `.editorconfig`, `rustfmt.toml`, etc.)

**Identifier :**
1. **Langage principal** et ses conventions idiomatiques
2. **Framework** et ses conventions recommandées
3. **Outils de lint/format** déjà configurés
4. **Patterns existants** dans le code actuel
5. **Incohérences** à résoudre

### 2. Analyse silencieuse

**Avant de parler, identifier :**

1. **Conventions standard du langage**
   - Qu'est-ce qui est "évident" et ne nécessite pas de discussion ?
   - Qu'est-ce qui varie selon les équipes/projets ?

2. **Points de décision**
   - Où y a-t-il plusieurs approches valides ?
   - Qu'est-ce qui impacte la lisibilité/maintenabilité ?

3. **Cohérence avec l'architecture**
   - Les patterns architecturaux impliquent-ils des conventions spécifiques ?
   - Comment nommer les composants de chaque couche ?

4. **Préférences détectées**
   - Le code existant montre-t-il des préférences ?
   - Les outils configurés imposent-ils des choix ?

### 3. Présenter l'analyse

```
## Analyse des conventions: {projet}

### Ce que j'ai détecté
- **Langage:** {langage} ({version si pertinent})
- **Framework:** {framework}
- **Outils configurés:** {eslint, prettier, etc. ou "aucun"}
- **Code existant:** {patterns observés ou "projet vierge"}

### Conventions standard (pas besoin de discuter)
{Liste des conventions évidentes du langage/framework}

### Points à décider ensemble
1. {Aspect où il y a plusieurs approches valides}
2. {Aspect spécifique au projet}
3. {Aspect lié aux tests}

### Incohérences détectées (si applicable)
- {Incohérence dans le code existant}
```

### 4. Discussion interactive des conventions

Pour chaque point de décision, engager une discussion :

**Format de présentation :**
```
### Convention: {Aspect}

**Contexte:** {Pourquoi c'est important pour ce projet}

**Options courantes:**

| Approche | Exemple | Avantages | Inconvénients |
|----------|---------|-----------|---------------|
| A | `{exemple}` | {pros} | {cons} |
| B | `{exemple}` | {pros} | {cons} |

**Ce que le code existant montre:** {observation ou "N/A"}

**Ma recommandation:** {Option} parce que {raisonnement lié au projet}

Quelle approche préfères-tu ? Y a-t-il des contraintes que je ne connais pas ?
```

**Points de discussion typiques par langage :**

| Langage | Points de discussion |
|---------|---------------------|
| TypeScript | Strictness (any, null), imports, functions vs arrow, semicolons |
| Python | Type hints level, docstrings format, imports organization |
| C# | Nullability, records vs classes, async naming, collection init |
| Rust | Error handling (Result vs panic), naming, module organization |
| Go | Error handling, package naming, interface placement |

**Points de discussion tests (tous langages) :**
```
### Convention: Tests

**Organisation des fichiers:**
| Approche | Structure | Avantages |
|----------|-----------|-----------|
| Miroir | `tests/Module/ClassTests` | Facile à naviguer |
| Par feature | `tests/features/` | Groupé par fonctionnalité |
| Colocalisé | `*.test.ts` à côté | Proche du code |

**Nommage des tests:**
| Style | Exemple |
|-------|---------|
| Method_Scenario_Expected | `Save_ValidData_ReturnsTrue` |
| should_when | `should_return_true_when_data_valid` |
| Descriptif | `"saves valid data correctly"` |

**Structure interne:**
- AAA (Arrange/Act/Assert)
- GWT (Given/When/Then)
- Libre

Qu'est-ce qui te parle ?
```

**Règles de discussion :**
- **Ne pas discuter l'évident** (conventions standard du langage)
- **Focus sur ce qui varie** entre projets/équipes
- **Exemples concrets** plutôt que théorie
- **Lier au contexte** du projet spécifique
- **Pragmatisme** > pureté doctrinaire

### 5. Synthèse des conventions

```
## Conventions retenues

### Code
| Aspect | Convention | Exemple |
|--------|------------|---------|
| {Aspect 1} | {Convention} | `{exemple}` |
| {Aspect 2} | {Convention} | `{exemple}` |

### Tests
| Aspect | Convention |
|--------|------------|
| Organisation | {choix} |
| Nommage | {pattern} |
| Structure | {AAA/GWT/libre} |

### Documentation
| Aspect | Convention |
|--------|------------|
| Niveau | {exhaustif/standard/minimal} |
| Langue | {français/anglais} |
| Format | {style selon langage} |

### Git
| Aspect | Convention |
|--------|------------|
| Commits | {format} |
| Branches | {pattern} |

Ça te convient ? Des ajustements ?
```

Attendre validation.

### 6. Générer la documentation

**`docs/dev/standards.md` :**
```markdown
# Standards de développement

## Approche TDD

Le projet suit une approche Test-Driven Development :

1. **RED** - Écrire les tests d'abord (doivent échouer)
2. **GREEN** - Implémenter le code minimal pour passer les tests
3. **REFACTOR** - Améliorer en gardant les tests verts

### Conventions de tests

| Aspect | Convention |
|--------|------------|
| Organisation | {structure choisie} |
| Nommage | `{pattern choisi}` |
| Structure | {AAA/GWT/libre} |

```{langage}
// Exemple de test suivant les conventions
{exemple concret adapté au stack}
```

### Couverture attendue

- Chaque comportement public a un test
- Edge cases couverts (null, vide, limites)
- Pas de code sans test correspondant

## Conventions {Langage}

### Nommage

| Élément | Convention | Exemple |
|---------|------------|---------|
| Fichiers | {convention} | `{exemple}` |
| Classes/Types | {convention} | `{exemple}` |
| Fonctions | {convention} | `{exemple}` |
| Variables | {convention} | `{exemple}` |
| Constantes | {convention} | `{exemple}` |

### Organisation du code

```{langage}
// Structure type d'un fichier
{exemple montrant l'ordre des sections}
```

### {Aspect spécifique 1}

**Convention:** {description}

**Pourquoi:** {justification basée sur la discussion}

```{langage}
// Bon
{exemple correct}

// À éviter
{exemple incorrect}
```

### {Aspect spécifique 2}

...

## Documentation du code

### Niveau

{Description du niveau de documentation attendu}

### Format

```{langage}
// Exemple de documentation selon le style choisi
{exemple}
```

### Quand documenter

- {Cas où la doc est requise}
- {Cas où elle est optionnelle}
- {Cas où elle est inutile}

## Conventions Git

### Messages de commit

```
{format choisi avec exemple complet}
```

**Types:** {si conventional commits}
- `feat:` - Nouvelle fonctionnalité
- `fix:` - Correction de bug
- `refactor:` - Refactoring sans changement fonctionnel
- `test:` - Ajout/modification de tests
- `docs:` - Documentation
- `chore:` - Maintenance

### Branches

| Type | Pattern | Exemple |
|------|---------|---------|
| Feature | `feature/{description}` | `feature/user-auth` |
| Fix | `fix/{description}` | `fix/login-error` |
| Epic | `epic/{id}` | `epic/e1` |

## Structure des fichiers

### Code source

```
src/
├── {convention pour ce dossier}
└── {convention pour ce dossier}
```

### Tests

```
tests/
├── {convention pour ce dossier}
└── {convention pour ce dossier}
```

### Documentation

| Type | Emplacement | Langue |
|------|-------------|--------|
| Dev docs | `docs/dev/` | {langue} |
| User docs | `docs/user/` | {langue} |
| API docs | `docs/dev/api/` | {langue} |

## Outils

### Linting/Formatting

{Outils configurés et comment les utiliser}

```bash
# Vérifier
{commande lint}

# Formater
{commande format}
```

### Pre-commit (si applicable)

{Description des hooks configurés}
```

### 7. Mettre à jour CLAUDE.md

Ajouter une section "Conventions" avec les points clés :
- Règles de nommage
- Patterns obligatoires
- Ce qu'il faut éviter

### 8. Configurer les outils (si souhaité)

Proposer de créer/mettre à jour les fichiers de config :
- `.editorconfig`
- Config linter (`.eslintrc`, `pyproject.toml`, etc.)
- Config formatter

### 9. Afficher le résumé

```
## Standards définis: {projet}

### Résumé
- **Langage:** {langage}
- **Tests:** {organisation} / {nommage} / {structure}
- **Documentation:** {niveau} en {langue}
- **Commits:** {format}

### Conventions clés
- {Convention importante 1}
- {Convention importante 2}
- {Convention importante 3}

### Fichiers créés/mis à jour
- `docs/dev/standards.md` - Conventions complètes
- `CLAUDE.md` - Section Conventions ajoutée
- {Fichiers de config si créés}

### Prochaine étape
`/tdd:init:4-readme` - Générer le README
```

## Adapter la profondeur

| Projet simple | Projet complexe |
|---------------|-----------------|
| Conventions standard du langage | Discussion approfondie |
| Peu d'outils | Config complète lint/format |
| Résumé rapide | Documentation détaillée |
| Solo | Équipe (plus de formalisme) |
