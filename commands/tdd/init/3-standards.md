# Commande: /tdd:init:3-standards

Définir les conventions de code en se basant sur le stack du projet.

## Instructions

### 1. Charger le contexte (si disponible)

Vérifier et lire si présents :
- `CLAUDE.md` - Stack technique, structure
- `docs/dev/architecture.md` - Patterns choisis

**Si `CLAUDE.md` n'existe pas**, poser les questions de base :
```
Avant de définir les standards, j'ai besoin de quelques infos :

1. Quel langage/stack ? (C#, TypeScript, Python, etc.)
2. Quel framework de test ? (xUnit, Jest, pytest, etc.)
```

Identifier ou collecter :
- Langage principal (C#, TypeScript, Python, etc.)
- Framework (si applicable)
- Framework de test

### 2. Questions ciblées selon le stack

**Adapter les questions au langage détecté.** Ne poser que les questions pertinentes.

#### Questions communes (tous langages) :

```
Quelques questions sur les conventions de {nom} :

1. Documentation du code : Quel niveau ?
   ○ Exhaustif (tout documenter)
   ○ Standard (public API + logique complexe)
   ○ Minimal (signatures évidentes = pas de doc)

2. Langue des commentaires/docs ?
   ○ Français
   ○ Anglais

3. Messages de commit : Quel format ?
   ○ Conventional Commits (feat:, fix:, chore:)
   ○ Epic/Task prefix (E1: T2 - description)
   ○ Libre mais descriptif
```

#### Si C# / .NET :

```
Conventions C# spécifiques :

1. Nullability : Comment gérer ?
   ○ Strict (nullable enabled, pas de ! sauf exception)
   ○ Pragmatique (! autorisé quand évident)
   ○ Désactivé

2. Records vs Classes : Quelle règle ?
   ○ Records pour data, Classes pour services
   ○ Records partout sauf mutable state
   ○ Classes partout

3. Async : Convention de nommage ?
   ○ Suffixe Async obligatoire
   ○ Suffixe Async sauf si évident (GetUser vs GetUserAsync)
   ○ Pas de suffixe

4. Collections : Initialisation ?
   ○ Collection expressions (= [])
   ○ new List<T>()
   ○ Array.Empty<T>() pour immutable
```

#### Si TypeScript / JavaScript :

```
Conventions TypeScript spécifiques :

1. Types : Quelle rigueur ?
   ○ Strict (no any, no implicit any)
   ○ Pragmatique (any autorisé en dernier recours)
   ○ Loose

2. Imports : Quel ordre ?
   ○ Auto (prettier/eslint organise)
   ○ Manuel : externe → interne → relatif
   ○ Pas de règle

3. Fonctions : Quelle syntaxe préférer ?
   ○ Arrow functions partout
   ○ function pour exports, arrow pour callbacks
   ○ Pas de préférence

4. Null handling : Quelle approche ?
   ○ Strict null checks + optional chaining
   ○ Assertions (!) autorisées
   ○ Pas de null, undefined seulement
```

#### Si Python :

```
Conventions Python spécifiques :

1. Type hints : Quelle rigueur ?
   ○ Strict (mypy strict mode)
   ○ Standard (public API typée)
   ○ Minimal (pas de types)

2. Docstrings : Quel format ?
   ○ Google style
   ○ NumPy style
   ○ Sphinx/reST
   ○ Pas de docstrings

3. Imports : Organisation ?
   ○ isort automatique
   ○ Manuel : stdlib → third-party → local
   ○ Pas de règle

4. Classes : Quelle approche ?
   ○ Dataclasses pour data
   ○ Pydantic pour validation
   ○ Classes standard
```

#### Questions sur les tests (tous langages) :

```
Conventions de tests :

1. Organisation des fichiers de test ?
   ○ Miroir de src/ (tests/Module/ClassTests)
   ○ Par feature (tests/features/)
   ○ Colocalisés avec le code (*.test.ts à côté)

2. Nommage des tests ?
   ○ Method_Scenario_Expected (Save_ValidData_ReturnsTrue)
   ○ should_expected_when_scenario
   ○ Description libre ("saves valid data")

3. Structure interne des tests ?
   ○ Arrange/Act/Assert (AAA)
   ○ Given/When/Then
   ○ Pas de structure imposée
```

### 3. Générer le document standards

Créer `docs/dev/standards.md` adapté au stack :

```markdown
# Standards de développement

## Approche TDD

Le projet suit une approche Test-Driven Development :

1. **RED** : Écrire les tests d'abord (doivent échouer)
2. **GREEN** : Implémenter le code minimal pour faire passer les tests
3. **REFACTOR** : Améliorer le code en gardant les tests verts

### Conventions de tests

- Organisation : {structure choisie}
- Nommage : `{convention choisie}`
- Structure : {AAA/GWT/libre}

```{langage}
// Exemple de test
{exemple adapté au stack et conventions}
```

### Couverture

- Chaque comportement public doit avoir un test
- Tester les edge cases (null, vide, limites)
- Pas de code sans test correspondant

## Conventions {Langage}

### Fichiers et nommage

- Fichiers : {convention}
- Types/Classes : {convention}
- Fonctions/Méthodes : {convention}
- Variables : {convention}
- Constantes : {convention}

### Organisation du code

{Conventions spécifiques au stack}

```{langage}
// Exemple de structure de fichier
{exemple}
```

### {Aspect spécifique au langage}

{Conventions basées sur les réponses}

```{langage}
// Exemple
{code}
```

## Documentation

- Niveau : {choix}
- Langue : {choix}

```{langage}
// Exemple de documentation
{exemple selon le style du langage}
```

## Conventions Git

### Commits

```
{format choisi avec exemple}
```

### Branches

- Feature : `feature/{description}`
- Fix : `fix/{description}`
- Epic : `epic/{id}-{nom}` (si applicable)

## Conventions fichiers projet

### Configuration

{Conventions pour les fichiers config}

### Documentation

- Dev docs : `docs/dev/` (français)
- User docs : `docs/user/` (anglais)
- Epics : `docs/epics/e{n}-{nom}.md`
```

### 4. Mettre à jour CLAUDE.md

Ajouter une section "Conventions" dans `CLAUDE.md` avec les points clés :
- Règles de nommage
- Patterns obligatoires
- Ce qu'il faut éviter

### 5. Afficher le résumé

```
## Standards définis : {projet}

**Langage :** {langage}

**Tests :**
- Structure : {organisation}
- Nommage : {convention}

**Code :**
- Documentation : {niveau}
- {Aspect clé 1} : {choix}
- {Aspect clé 2} : {choix}

**Git :**
- Commits : {format}

**Fichiers créés/mis à jour :**
- `docs/dev/standards.md`
- `CLAUDE.md` (section Conventions)

**Prochaine étape :** `/tdd:init:4-readme`
```

## Notes

- Ne pas répéter les conventions standard du langage (obvious stuff)
- Focus sur les choix qui varient entre projets
- Garder le document concis et actionnable
- Les exemples doivent être cohérents avec le stack réel
