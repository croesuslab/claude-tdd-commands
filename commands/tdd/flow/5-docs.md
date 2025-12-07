# Commande: /docs

Documente la tâche complétée pour les développeurs et/ou les utilisateurs.

## Instructions

1. **Charger le contexte** :
   - Lis `docs/state.json`
   - Lis `docs/current-task.md`

2. **Vérifier la phase** :
   - Si `current.phase` n'est pas `"review"` → afficher erreur
   - Suggérer la commande appropriée

3. **Déterminer le type de documentation nécessaire** :

   | Type de changement | Doc dev | Doc user |
   |-------------------|---------|----------|
   | Modèles internes | Oui | Non |
   | API/Services publics | Oui | Non |
   | Import/Export | Oui | Oui |
   | UI features | Non | Oui |
   | Bug fixes | Non | Changelog only |
   | Refactoring | ADR si significatif | Non |

4. **Documentation développeur** (français) :
   - **API Reference** : `docs/dev/api/{module}.md`
     - Classes, méthodes, paramètres
     - Exemples d'utilisation
   - **ADR** (si décision architecturale) : `docs/dev/decisions/NNN-titre.md`
     - Contexte, décision, conséquences
     - Numéroter séquentiellement (001, 002, ...)

5. **Documentation utilisateur** (anglais) :
   - **Guides** : `docs/user/guides/{feature}.md`
     - Step-by-step instructions
     - Screenshots si UI
   - **Reference** : `docs/user/reference/{topic}.md`

6. **Mettre à jour CHANGELOG.md** :
   ```markdown
   ## [Unreleased]

   ### Added
   - GDTF import support for fixture library (#issue)

   ### Changed
   - ...

   ### Fixed
   - ...
   ```

7. **Réviser et mettre à jour les docs existantes** (si pertinent) :
   - `docs/dev/architecture.md` - Si nouvelle architecture/composants
   - `docs/dev/standards.md` - Si nouvelles conventions
   - `CLAUDE.md` - Si nouvelles commandes/conventions
   - `README.md` - Si changements majeurs visibles
   - `docs/dev/README.md` - Si nouveau module API
   - `docs/user/README.md` - Si nouvelle feature utilisateur

8. **Mettre à jour la phase** : `current.phase` = "docs"

9. **Afficher** :
   ```
   ## Documentation: [E1] T2 - Parser GDTF

   ### Créé
   - `docs/dev/api/import.md` - API reference GdtfImporter
   - `docs/dev/decisions/001-gdtf-attribute-mapping.md` - ADR mapping attributs

   ### Mis à jour
   - `CHANGELOG.md` - Added GDTF import

   Lancer `/done` pour committer et finaliser.
   ```

## Templates

### ADR Template (docs/dev/decisions/NNN-titre.md)
```markdown
# NNN - Titre de la décision

Date: YYYY-MM-DD

## Contexte

Quel est le problème ou la question à résoudre ?

## Décision

Quelle solution a été choisie ?

## Conséquences

### Positif
- ...

### Négatif
- ...

### Risques
- ...
```

### API Reference Template (docs/dev/api/{module}.md)
```markdown
# Module {Name}

## Vue d'ensemble

Description du module et son rôle.

## Classes

### ClassName

Description.

#### Constructeur

```csharp
public ClassName(param1, param2)
```

#### Méthodes

##### MethodName

Description.

```csharp
public ReturnType MethodName(params)
```

**Paramètres:**
- `param1` - Description

**Retourne:** Description

**Exemple:**
```csharp
var result = instance.MethodName(value);
```

## Voir aussi

- [Autre doc](lien)
```

### User Guide Template (docs/user/guides/{feature}.md)
```markdown
# Feature Name

Brief description of what this feature does.

## Prerequisites

- What the user needs before starting

## Steps

### 1. First Step

Description and instructions.

### 2. Second Step

Description and instructions.

## Example

Complete example workflow.

## Troubleshooting

### Common Issue 1

Solution.

## See Also

- [Related Guide](link)
```

## Flow TDD
```
/analyze → /test (RED) → /dev (GREEN) → /review → /docs → /done
```
