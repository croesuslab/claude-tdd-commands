# /tdd:flow:3-dev

Implémente le code pour faire passer les tests (phase GREEN).

**Code propre dès le départ.** Simple ≠ laid. Minimal = pas de superflu, pas de dette technique.

## Instructions

### 1. Vérifier
- `docs/state.json` : `current.phase` doit être "dev"
- Charger `docs/current-task.md`

### 2. Lire les tests d'abord

Comprendre :
- API attendue (signatures, types)
- Comportements vérifiés
- Cas d'erreur à gérer

### 3. Implémenter

**Ordre :**
1. Supprimer fichiers listés dans "À supprimer"
2. Créer fichiers listés dans "Code à créer"
3. Modifier fichiers listés dans "À modifier"

**Principes :**

| Principe | Description |
|----------|-------------|
| **YAGNI** | N'implémenter que ce qui est testé |
| **KISS** | Solution la plus simple qui fonctionne |

**Faire :**
- Code propre et lisible dès le départ
- Suivre `docs/dev/standards.md`
- Noms clairs

**Ne pas faire :**
- Fonctionnalités non testées
- Optimisation prématurée
- Code "temporaire" (on ne nettoie jamais)

### 4. Faire passer les tests

```bash
dotnet test
```

**Si échec :**
1. Lire le message d'erreur
2. Corriger l'implémentation (pas le test)
3. Re-tester

**Erreurs courantes :**

| Erreur | Solution |
|--------|----------|
| `NullReferenceException` | Ajouter validation |
| `ArgumentException` non levée | Ajouter `if` + `throw` |
| Mauvaise valeur | Revoir la logique |

### 5. Situations difficiles

**Test ambigu :**
Demander à l'utilisateur quelle approche suivre (test vs plan).

**Problème de design révélé :**
Résoudre maintenant si simple. Sinon demander avant de continuer.

### 6. Validation

```bash
dotnet build && dotnet test  # 100% pass
```

### 7. Finaliser

Mettre `current.phase` = "review".

```
## GREEN: [E1] T4 - Titre

**Fichiers:** X créés, Y modifiés
**Tests:** 18/18 passed ✓

Lancer `/tdd:flow:4-review` pour la revue.
```

## Anti-patterns

```csharp
// Gold plating - fonctionnalité non demandée
public void Import(string path, bool validate = true, ILogger? logger = null)
// → Implémenter seulement ce que les tests demandent

// Sur-engineering
public interface IProcessor { }
public class Processor : IProcessor { }
public class ProcessorFactory { }
// → Direct et simple : public static string Process(string input)
```
