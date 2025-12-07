# Commande: /analyze

Analyse le projet et prépare le plan détaillé de la prochaine tâche (approche TDD).

## Instructions

### 1. Charger l'état
Lis `docs/state.json`

### 2. Vérifier la phase
- Si `current.phase` n'est pas `null` → afficher erreur, on est déjà en cours de tâche
- Suggérer la commande appropriée (`/test`, `/dev`, `/review`)

### 3. Déterminer la tâche
- Prendre `current.epic` (ex: "E1")
- Trouver la prochaine tâche non complétée (T1, T2, ... pas dans `epics[E1].completed`)
- Si epic complété → passer au prochain epic

### 4. Charger le contexte (en parallèle)
- `docs/dev/architecture.md`
- `docs/dev/standards.md`
- Le fichier epic (ex: `docs/epics/E1-mvr-import.md`)
- Code existant pertinent dans `src/`
- Fichiers samples disponibles si pertinents

### 5. Poser des questions de clarification (NOUVEAU)

Utiliser `AskUserQuestion` pour poser 2-4 questions adaptées au contexte de la tâche.

**Questions types à considérer :**

| Catégorie | Question exemple |
|-----------|------------------|
| **Scope** | Quel niveau de couverture ? (minimal / standard / exhaustif) |
| **Samples** | As-tu des fichiers de test disponibles ? Où ? |
| **Priorités** | Quel aspect privilégier ? (performance / lisibilité / extensibilité) |
| **Intégration** | Comment cette fonctionnalité sera-t-elle utilisée ? |
| **Contraintes** | Y a-t-il des dépendances ou limitations techniques ? |
| **Ambiguïtés** | Clarifier tout point flou dans la spec de la tâche |

**Règles :**
- Adapter les questions au contexte spécifique (pas de questions génériques)
- Maximum 4 questions pour ne pas surcharger
- Si la tâche est simple et claire, poser moins de questions
- Intégrer les réponses dans le plan

### 6. Mettre à jour state.json
```json
{
  "current": {
    "epic": "E1",
    "task": "T4",
    "phase": "analyze"
  }
}
```

### 7. Écrire `docs/current-task.md`

```markdown
# [E1] T4 - Titre de la tâche

## Objectif
Description claire de ce qui doit être fait.

## Décisions (basées sur les réponses)
- Scope: Standard - fixtures + positions + GDTF embarqués
- GDTF: Charger directement dans le show
- ...

## Fichiers

### Tests à créer
- `tests/Spotlight.Core.Tests/Import/MvrImporterTests.cs`

### Code à créer
- `src/Spotlight.Core/Import/MvrImporter.cs`

### À modifier
- (aucun)

### À supprimer
- (aucun)

## Tests (RED)

Spécifications des tests à écrire.

### MvrImporterTests.cs
```csharp
namespace Spotlight.Core.Tests.Import;

public class MvrImporterTests
{
    [Fact]
    public void Import_ValidMvr_ReturnsShow()
    {
        // Vérifie que l'import retourne un Show valide
    }
}
```

## Implémentation (GREEN)

Code minimal pour faire passer les tests.

### MvrImporter.cs
```csharp
namespace Spotlight.Core.Import;

public class MvrImporter
{
    public Show Import(string filePath) { ... }
}
```

## Commandes
```bash
dotnet test --filter "MvrImporter"
```

## Notes
- Points d'attention particuliers
```

### 8. Mettre à jour phase
`current.phase` = "test"

### 9. Afficher le résumé

```
## Prête: [E1] T4 - Parser MVR

**Décisions:**
- Scope: Standard
- GDTF: Charger dans le show

**Tests prévus:** 8 tests dans 1 fichier
**Code prévu:** 1 fichier à créer

Plan écrit dans `docs/current-task.md`

Lancer `/test` pour écrire les tests (RED).
```

## Flow TDD
```
/analyze → /test (RED) → /dev (GREEN) → /review → /docs → /done
    ↑
  Questions guidées
```

## Contexte
- Stack: .NET 10, C# 14, MAUI Blazor Hybrid
- Samples: `docs/samples/`
