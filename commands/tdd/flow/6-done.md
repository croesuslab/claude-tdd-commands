# Commande: /done

Commit les changements et crée une PR si l'épique est terminée.

## Instructions

1. **Charger l'état** : Lis `docs/state.json`

2. **Vérifier qu'on peut commiter** :
   - `current.phase` doit être `"docs"`
   - Si `"review"` → suggérer `/docs`
   - Si autre → suggérer la bonne commande

3. **Vérifier qu'il y a des changements** :
   ```bash
   git status
   ```
   - Si rien à commiter → afficher message et sortir

4. **Identifier la tâche courante** :
   - Lire `current.task` de `state.json`
   - Charger `docs/current-task.md` et le fichier epic pour la description

5. **Créer le commit** :
   ```bash
   git add -A
   ```

   Format du message :
   ```
   E{N}: T{M} - {description}

   - Point 1 des changements
   - Point 2 des changements

   🤖 Generated with [Claude Code](https://claude.com/claude-code)

   Co-Authored-By: Claude <noreply@anthropic.com>
   ```

6. **Vérifier si l'épique est complète** :
   - Lire le fichier epic pour compter les tâches totales
   - Comparer avec `epics[E0].completed`
   - Si toutes complétées → epic terminé

7. **Finaliser la tâche** :
   - Ajouter `current.task` à `epics[current.epic].completed`
   - Remettre `current.task` et `current.phase` à `null`
   - Supprimer `docs/current-task.md`

8. **Si l'épique est terminée** :
   - Mettre à jour `state.json` : `epics[E0].status` = "completed"
   - Passer `current.epic` au prochain epic
   - Créer une PR :
     ```bash
     gh pr create --title "Epic E{N}: {nom}" --body "..."
     ```

9. **Afficher le résultat** :

   Si commit seul :
   ```
   ## ✓ Commit créé

   **Tâche:** E0-T3 - Titre
   **Commit:** abc1234

   **Progression E0:** 3/8 tâches

   Prochaine étape: `/analyze` pour la tâche suivante
   ```

   Si epic terminé + PR :
   ```
   ## ✓ Epic E0 terminée - PR créée

   **Tâches complétées:** T1, T2, T3...
   **Commit:** abc1234
   **PR:** #123 - https://github.com/...

   Prochaine étape: Merge la PR puis `/analyze` pour le prochain epic
   ```

## Flow TDD complet
```
/analyze → /test (RED) → /dev (GREEN) → /review (VALIDATE) → /docs → /done
```

## Notes
- Ne JAMAIS push sans créer de PR
- Les commits restent locaux jusqu'au merge de la PR
- Si pas de remote configuré, créer uniquement le commit local
