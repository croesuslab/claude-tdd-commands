# /tdd:flow:quickfix $ARGUMENTS

Correction rapide dans un worktree dédié. Bypass le processus TDD complet.

**Argument:** Description courte du fix (ex: "fix typo in MvrImporter", "add missing null check")

## Prérequis

Cette commande s'exécute dans un **worktree séparé** avec une branche `quickfix` persistante.

### Setup initial (une seule fois)

```bash
# Depuis le repo principal - créer worktree avec branche quickfix
git worktree add ../spotlight-quickfix -b quickfix
```

Résultat:
```
D:\Projects\spotlight\          # Travail TDD principal (epic1, epic2, etc.)
D:\Projects\spotlight-quickfix\ # Branche quickfix persistante
```

## Quand utiliser

- Changements < 20 lignes
- Corrections évidentes (typos, imports, null checks)
- Pas de nouvelle fonctionnalité
- Tests existants suffisants

## Quand NE PAS utiliser

- Nouvelle fonctionnalité → `/tdd:flow:1-analyze`
- Changement architectural → `/tdd:flow:1-analyze`
- Besoin de nouveaux tests → `/tdd:flow:1-analyze`

## Instructions

### 1. Vérifier qu'on est dans le worktree

```bash
pwd  # Doit être ../spotlight-quickfix
git branch  # Doit être sur "quickfix"
```

### 2. Sync avec la branche de travail

Lire `docs/state.json` pour trouver l'epic courant, puis rebase:

```bash
git fetch origin
git rebase origin/{branche-courante}  # ex: origin/epic1
```

### 3. Analyser et implémenter

- Identifier le(s) fichier(s) à modifier
- Faire la correction (garder minimal)
- Suivre `docs/dev/standards.md`

### 4. Valider

```bash
dotnet build && dotnet test
```

**Si échec → corriger ou abandonner**

### 5. Commit

```bash
git add -A
git commit -m "$(cat <<'EOF'
quickfix: {description courte}

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>
EOF
)"
```

### 6. Push

```bash
git push origin quickfix --force-with-lease
```

Note: `--force-with-lease` car on rebase régulièrement.

### 7. Créer/Mettre à jour la PR (si première fois ou besoin de recréer)

```bash
gh pr create --base {branche-courante} --title "Quickfixes" --body "$(cat <<'EOF'
## Summary

Accumulated quickfixes for the current epic.

## Commits

See commit list for individual fixes.

## Test plan

- [x] `dotnet build` passes
- [x] `dotnet test` passes

🤖 Generated with [Claude Code](https://claude.com/claude-code)
EOF
)"
```

Si la PR existe déjà, elle se met à jour automatiquement avec le push.

### 8. Rapport

```
## Quickfix ajouté

**Commit:** {hash court} - {description}
**Branche:** quickfix
**PR:** #{number} (vers {branche-courante})

Total quickfixes en attente: {N} commits

---

Dans le repo principal, après merge de la PR:
git pull origin {branche-courante}
```

## Workflow complet

```
Fenêtre 1 (spotlight)           Fenêtre 2 (spotlight-quickfix)
─────────────────────           ──────────────────────────────
Travail TDD normal              /tdd:quickfix "fix X"
       │                               │
       │                        commit quickfix
       │                               │
       │                        /tdd:quickfix "fix Y"
       │                               │
       │                        commit quickfix
       │                               │
       ├──── merge PR ←─────────── PR "Quickfixes"
       │
git pull origin epic1
```

## Changer de branche cible

Si l'epic change (ex: `epic1` → `epic2`):

1. Merger la PR quickfix existante (ou la fermer)
2. Rebase sur la nouvelle branche:
   ```bash
   git fetch origin
   git rebase origin/epic2
   ```
3. Recréer la PR avec `--base epic2`

## Exemples de bons quickfixes

- "fix typo in error message"
- "add missing using statement"
- "fix null reference in edge case"
- "update outdated comment"
- "fix build warning"
