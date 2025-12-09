# /tdd:flow:6-done

Finalise la tâche : vérification, commit, cleanup, et PR si epic terminé.

## Instructions

### 1. Charger le contexte

1. **État** : Lis `docs/state.json`
2. **Vérifier la phase** :
   - Si `current.phase` != "docs" → afficher erreur
   - Si `"review"` → suggérer `/tdd:flow:5-docs`
3. **Charger** `docs/current-task.md` et le fichier epic

### 2. Vérification finale

#### A. Build et tests

```bash
dotnet build && dotnet test
```

**Si échec → ne pas commiter.** Corriger d'abord.

#### B. Checklist de complétion

Vérifier que tout est fait :

| Vérifié | Élément |
|---------|---------|
| | Tests écrits et passent |
| | Code implémenté et propre |
| | Documentation API à jour (si applicable) |
| | CHANGELOG mis à jour |
| | Pas de TODO/FIXME laissés dans le code |
| | Pas de code commenté |
| | Pas de fichiers temporaires |

#### C. Vérifier les changements

```bash
git status
git diff --stat
```

- Si rien à commiter → afficher message et sortir
- Vérifier qu'il n'y a pas de fichiers inattendus

### 3. Cleanup AVANT le commit

**Important :** Faire le cleanup avant de commiter pour tout inclure dans le même commit.

#### A. Mettre à jour state.json

```json
{
  "current": {
    "epic": "E1",
    "task": null,
    "phase": null
  },
  "epics": {
    "E1": {
      "status": "in_progress",
      "completed": ["T1", "T2", "T3", "T4"]  // Ajouter la tâche
    }
  }
}
```

#### B. Nettoyer current-task.md

Remplacer le contenu par :
```markdown
# Current Task

No task in progress.

Run `/tdd:flow:1-analyze` to start the next task.
```

### 4. Créer le commit

```bash
git add -A
```

#### Message de commit

Format :
```
E{N}: T{M} - {description courte}

{Description des changements principaux}

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

**Exemple :**
```
E1: T4 - MVR Import with 3D positions

- Add MvrImporter class for parsing MVR files
- Extract fixtures with positions and DMX addresses
- Import embedded GDTF files automatically
- Add ImportResult/ImportWarning for error handling

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

**Règles du message :**
- Première ligne : identifiant + description concise (< 72 chars)
- Corps : liste des changements significatifs (pas les détails)
- Pas de "Added", "Fixed" - c'est dans le CHANGELOG
- Le cleanup de state.json/current-task.md est inclus silencieusement (pas dans le message)

### 5. Vérifier si l'epic est complète

Comparer `epics[E{N}].completed` avec la liste des tâches dans le fichier epic.

**Si toutes les tâches sont complétées :**
1. Mettre `epics[E{N}].status` = "completed"
2. Passer `current.epic` au prochain epic
3. Créer une PR (si remote configuré)

### 6. Créer la PR (si epic terminé)

```bash
gh pr create --title "Epic E{N}: {nom}" --body "$(cat <<'EOF'
## Summary

{Description de ce que l'epic accomplit}

## Tasks completed

- [x] T1 - {description}
- [x] T2 - {description}
...

## Changes

- {Changement majeur 1}
- {Changement majeur 2}

## Test plan

- [ ] `dotnet build` passes
- [ ] `dotnet test` passes
- [ ] {Test manuel si applicable}

🤖 Generated with [Claude Code](https://claude.com/claude-code)
EOF
)"
```

### 7. Rapport final

#### Commit seul (tâche terminée, epic en cours)

```
## ✓ Commit créé

**Tâche:** E1-T4 - MVR Import
**Commit:** abc1234

**Fichiers:**
- 3 créés
- 2 modifiés
- 1 supprimé

**Progression E1:** 4/10 tâches

Prochaine étape: `/tdd:flow:1-analyze` pour T5
```

#### Epic terminé + PR

```
## ✓ Epic E1 terminée

**Tâches complétées:** T1, T2, T3, T4, T5, T6, T7, T8, T9, T10
**Commits:** 10
**PR:** #42 - https://github.com/user/repo/pull/42

**Prochain epic:** E2 - DMX Output

Prochaine étape: Review/merge la PR, puis `/tdd:flow:1-analyze`
```

## Vérifications automatiques

Avant de commiter, vérifier automatiquement :

```bash
# Pas de markers de conflit
git diff --check

# Pas de fichiers binaires inattendus
git diff --cached --name-only | grep -E '\.(exe|dll|bin|obj)$'

# Pas de secrets potentiels
git diff --cached | grep -iE '(password|secret|api_key|token)\s*='
```

## Si quelque chose ne va pas

### Tests qui échouent
```
## Erreur: Tests en échec

X tests échouent. Impossible de commiter.

Lancer `dotnet test` pour voir les détails, puis corriger.
```

### Fichiers inattendus
```
## Attention: Fichiers inattendus

Les fichiers suivants seront commités:
- bin/Debug/...
- .vs/...

Voulez-vous les exclure ? (Ils devraient être dans .gitignore)
```

### Pas de changements
```
## Info: Rien à commiter

Aucun changement détecté. La tâche est peut-être déjà commitée ?

État actuel: E1-T4 en phase "docs"
```

## Notes

- Ne JAMAIS push directement sur main/master
- Les commits restent locaux jusqu'au merge de la PR
- Si pas de remote configuré, créer uniquement le commit local
