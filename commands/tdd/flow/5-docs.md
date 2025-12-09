# /tdd:flow:5-docs

Documente la tâche complétée.

## Instructions

### 1. Charger le contexte

1. **État** : Lis `docs/state.json`
2. **Vérifier la phase** :
   - Si `current.phase` != "review" → afficher erreur
3. **Plan** : Charger `docs/current-task.md`
4. **Docs existantes** : Lister les fichiers de documentation pertinents

### 2. Analyse d'impact documentation

Avant d'écrire, identifier ce qui doit être documenté.

#### A. Checklist de documentation

| Question | Si oui → Action |
|----------|-----------------|
| Nouvelle API publique ? | Documenter dans `docs/dev/api/{module}.md` |
| Nouveau modèle de domaine ? | Ajouter à `docs/dev/api/models.md` |
| Décision architecturale significative ? | Créer ADR dans `docs/dev/decisions/` |
| Changement de comportement existant ? | Mettre à jour doc existante |
| Nouvelle fonctionnalité utilisateur ? | Guide dans `docs/user/guides/` |
| Bug fix notable ? | CHANGELOG seulement |
| Refactoring interne ? | Aucune doc (ou ADR si significatif) |

#### B. Vérifier la synchronisation

Pour chaque fichier de code modifié/créé, vérifier :
- La doc API correspondante existe-t-elle ?
- Est-elle à jour avec les signatures actuelles ?
- Les exemples fonctionnent-ils encore ?

### 3. Documentation développeur (français)

#### API Reference (`docs/dev/api/`)

**Quand documenter :**
- Classe/interface publique nouvelle
- Méthode publique avec comportement non évident
- Paramètres avec des contraintes spécifiques
- Valeurs de retour avec des cas spéciaux

**Quand NE PAS documenter :**
- Getters/setters triviaux
- Méthodes dont le nom est auto-explicatif
- Code interne non réutilisable

**Structure d'une bonne doc API :**

```markdown
### NomClasse

Description en 1-2 phrases de ce que fait cette classe et pourquoi elle existe.

#### Constructeur

\```csharp
public NomClasse(IDependency dep, IOptions<Options> options)
\```

**Paramètres:**
- `dep` - Description et ce qui se passe si null
- `options` - Configuration requise

#### Méthodes

##### MethodeName

Ce que fait cette méthode et **quand l'utiliser**.

\```csharp
public async Task<Result> MethodeName(string input, CancellationToken ct = default)
\```

**Paramètres:**
- `input` - Ce que ça représente, contraintes (non null, format attendu)
- `ct` - Pour annuler l'opération

**Retourne:** Description du résultat, cas spéciaux (null possible ?)

**Exceptions:**
- `ArgumentNullException` - Si input est null
- `InvalidOperationException` - Si [condition]

**Exemple:**
\```csharp
// Cas d'utilisation typique
var result = await service.MethodeName("value");

// Avec gestion d'erreur
try {
    var result = await service.MethodeName(userInput);
} catch (InvalidOperationException ex) {
    // Gérer le cas X
}
\```

**Notes:**
- Point d'attention important
- Comportement non évident
```

#### ADR - Architecture Decision Records

**Quand créer un ADR :**
- Choix entre plusieurs approches valides
- Décision qui impacte plusieurs modules
- Trade-off significatif (performance vs simplicité, etc.)
- Choix de librairie/framework

**Quand NE PAS créer d'ADR :**
- Implémentation standard sans alternative
- Décision locale à un fichier
- Choix évident sans trade-off

**Numérotation :** `NNN-titre-en-kebab-case.md` (001, 002, ...)

**Template ADR :**

```markdown
# NNN - Titre descriptif de la décision

Date: YYYY-MM-DD
Status: Accepted | Superseded by [ADR-XXX] | Deprecated

## Contexte

Quel problème devait-on résoudre ?
Quelles contraintes existaient ?
Qu'est-ce qui a motivé cette décision ?

## Options considérées

### Option A - Nom

**Avantages:**
- ...

**Inconvénients:**
- ...

### Option B - Nom

**Avantages:**
- ...

**Inconvénients:**
- ...

## Décision

Quelle option a été choisie et **pourquoi**.

## Conséquences

### Positif
- Ce que cette décision permet

### Négatif
- Ce que cette décision empêche ou complique

### Risques
- Ce qui pourrait mal tourner

## Références

- Liens vers discussions, specs, etc.
```

### 4. Documentation utilisateur (anglais)

**Quand documenter :**
- Fonctionnalité visible dans l'UI
- Workflow que l'utilisateur doit connaître
- Configuration utilisateur

**Structure d'un guide :**

```markdown
# Feature Name

What this feature does and why you'd use it.

## Prerequisites

- What you need before starting
- Required setup or configuration

## How to [action]

### Step 1: [action]

Clear instruction with context.

![Screenshot description](path/to/screenshot.png)

### Step 2: [action]

...

## Tips

- Useful shortcuts or best practices
- Common workflows

## Troubleshooting

### Issue: [description]

**Cause:** Why this happens

**Solution:** How to fix it

## See Also

- [Related Feature](link)
```

### 5. CHANGELOG

**Toujours mettre à jour** `CHANGELOG.md` pour tout changement visible.

#### Catégories

| Catégorie | Usage |
|-----------|-------|
| `Added` | Nouvelle fonctionnalité |
| `Changed` | Modification de comportement existant |
| `Deprecated` | Fonctionnalité qui sera supprimée |
| `Removed` | Fonctionnalité supprimée |
| `Fixed` | Correction de bug |
| `Security` | Correction de vulnérabilité |

#### Bonnes pratiques CHANGELOG

**Bon :**
```markdown
### Added
- GDTF import: extract color wheels with CIE xyY values and gobo images
- `FixtureType.Wheels` collection for accessing fixture wheel definitions

### Changed
- `GdtfImporter.Import()` now extracts channel functions with DMX ranges

### Fixed
- GMA2 import: correctly handle files with UTF-8 BOM
```

**Mauvais :**
```markdown
### Added
- Added wheels
- New feature
- Updated importer
```

**Règles :**
- Écrire du point de vue de l'utilisateur/développeur, pas du code
- Commencer par un verbe à l'infinitif ou un nom
- Être spécifique sur ce qui change
- Mentionner les classes/méthodes importantes
- Grouper les changements liés

### 6. Mise à jour des docs existantes

#### Documents à vérifier systématiquement

| Document | Mettre à jour si... |
|----------|---------------------|
| `docs/dev/api/{module}.md` | API modifiée/ajoutée |
| `docs/dev/api/models.md` | Nouveau modèle ou propriété |
| `docs/dev/architecture.md` | Nouveau composant ou flux |
| `docs/dev/standards.md` | Nouvelle convention adoptée |
| `CLAUDE.md` | Nouvelle commande ou convention |
| `README.md` | Changement majeur visible |
| `docs/epics/{epic}.md` | Critères de complétion à cocher |

#### Processus de mise à jour

1. **Lire** la doc existante
2. **Identifier** ce qui est obsolète ou manquant
3. **Modifier** de manière chirurgicale (pas de réécriture complète)
4. **Vérifier** que les exemples fonctionnent encore

### 7. Vérification finale

Avant de terminer :

- [ ] API publique documentée ?
- [ ] Exemples de code testables ?
- [ ] CHANGELOG à jour ?
- [ ] Pas de duplication avec le code ?
- [ ] Liens internes valides ?
- [ ] ADR créé si décision significative ?

### 8. Mise à jour phase

```json
{
  "current": {
    "phase": "docs"
  }
}
```

### 9. Rapport

```
## Documentation: [E2] T1 - Titre

### Créé
- `docs/dev/api/dmx.md` - API reference DmxEngine
- `docs/dev/decisions/003-dmx-thread-model.md` - ADR threading

### Mis à jour
- `docs/dev/api/models.md` - Ajout DmxBuffer, DmxUniverse
- `CHANGELOG.md` - Section Added pour DMX engine

### Vérifié (pas de changement nécessaire)
- `docs/dev/architecture.md` - Structure déjà documentée
- `README.md` - Pas de changement visible utilisateur

Lancer `/tdd:flow:6-done` pour committer et finaliser.
```

## Anti-patterns de documentation

### Documentation morte
```markdown
// Mauvais : Copie du code
/// <summary>
/// Gets the name
/// </summary>
public string Name { get; }

// Bon : Explique le contexte
/// <summary>
/// Display name shown in the fixture library UI.
/// Extracted from GDTF ShortName or GMA2 fixture name.
/// </summary>
public string Name { get; }
```

### Documentation obsolète
```markdown
// Mauvais : Ne correspond plus au code
public void Import(string path)  // Doc dit Import(string path, bool validate)
```

### Sur-documentation
```markdown
// Mauvais : Évident
/// <summary>
/// Returns true if the fixture has color channels.
/// </summary>
/// <returns>True if has color, false otherwise.</returns>
public bool HasColor() => Channels.Any(c => c.Category == Color);

// Bon : Pas de doc, le nom suffit
public bool HasColorChannels() => ...
```

### Documentation technique pour utilisateurs
```markdown
// Mauvais dans un guide utilisateur
"The MvrImporter class parses the GeneralSceneDescription.xml..."

// Bon
"Open your MVR file exported from Vectorworks, Capture, or MA3..."
```

## Ce qui ne doit PAS être documenté

- Code auto-explicatif
- Implémentation interne susceptible de changer
- Détails de débogage
- TODOs ou code temporaire
- Méthodes privées/internes
