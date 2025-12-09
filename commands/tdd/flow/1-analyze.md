# /tdd:flow:1-analyze

Analyse interactive pour préparer la prochaine tâche TDD.

## Instructions

### 1. Charger l'état
Lis `docs/state.json`. Si `current.phase` != `null` → erreur, suggérer la bonne commande.

### 2. Déterminer la tâche
- Prochaine tâche non complétée dans `current.epic`
- Si epic complété → passer au prochain

### 3. Explorer le contexte

**Charger en parallèle :**
- `docs/dev/architecture.md`, `docs/dev/standards.md`
- Fichier epic (ex: `docs/epics/E1-mvr-import.md`)

**Explorer le code :**
- Fichiers/classes qui seront impactés
- Patterns déjà utilisés dans le projet
- Tests existants similaires
- Samples (`docs/samples/`, `tests/*/TestData/`)
- ADRs pertinents (`docs/dev/decisions/`)

### 4. Analyse silencieuse

Avant de parler, identifier :
1. **Impact** - Quels fichiers/modules seront touchés ?
2. **Dépendances** - De quoi dépend cette tâche ? Qu'est-ce qui en dépendra ?
3. **Risques** - Points de complexité ou d'incertitude
4. **Edge cases** - Cas limites à considérer

### 5. Présenter l'analyse

```
## Analyse: [E1] T4 - Titre

### Ce que j'ai compris
[Résumé de la tâche et son contexte]

### Impact identifié
- Fichiers à créer: X
- Fichiers à modifier: Y
- Dépendances: Z

### Points d'attention
1. [Point technique ou architectural notable]
2. [Risque ou complexité identifiée]
3. [Ambiguïté dans la spec]

### Questions ouvertes
[Liste des questions]
```

### 6. Discussion interactive

Engager une **conversation naturelle** pour clarifier.

**Types de questions :**

| Catégorie | Exemple |
|-----------|---------|
| Clarification | "La spec mentionne X, mais le code fait Y. Quelle approche ?" |
| Architecture | "Deux façons : A (simple) ou B (extensible). Préférence ?" |
| Scope | "Tout faire maintenant ou commencer par le minimum ?" |
| Edge cases | "Que doit-il se passer si [cas limite] ?" |
| Données | "As-tu des fichiers de test spécifiques ?" |

**Règles :**
- Questions **ouvertes** (pas oui/non)
- **Itérer** sur les réponses
- **Challenger** les hypothèses si nécessaire
- Continuer jusqu'à compréhension claire du scope, des décisions, des priorités

### 7. Synthèse des décisions

```
## Décisions finales

### Scope
- [Ce qui est inclus]
- [Ce qui est exclu]

### Architecture
- [Choix techniques retenus]

### Cas limites
- [Comment les gérer]
```

Demander confirmation avant de continuer.

### 8. Mettre à jour state.json

```json
{ "current": { "epic": "E1", "task": "T4", "phase": "analyze" } }
```

### 9. Écrire `docs/current-task.md`

```markdown
# [E1] T4 - Titre

## Objectif
[Description claire]

## Décisions
[Résumé des décisions de la discussion]

## Contexte technique

### Code existant pertinent
- `path/to/file.cs` - Description

### Patterns à suivre
- [Pattern identifié]

## Fichiers

### Tests à créer
- `tests/Spotlight.Core.Tests/...`

### Code à créer
- `src/Spotlight.Core/...`

### À modifier
- (liste ou "aucun")

## Tests (RED)
[Specs des tests]

## Implémentation (GREEN)
[Approche et structure du code]

## Notes
- Points d'attention
- Risques identifiés
```

### 10. Finaliser

Mettre `current.phase` = "test".

```
## Prête: [E1] T4 - Titre

**Scope:** [Résumé en 1 ligne]
**Décisions clés:** [Liste]
**Tests prévus:** X tests
**Code prévu:** Y fichiers

Lancer `/tdd:flow:2-test` pour écrire les tests (RED).
```

## Adapter la profondeur

| Tâche simple | Tâche complexe |
|--------------|----------------|
| 1-2 questions | Discussion approfondie |
| Patterns évidents | Exploration des alternatives |
| Analyse rapide | Analyse détaillée du code |
