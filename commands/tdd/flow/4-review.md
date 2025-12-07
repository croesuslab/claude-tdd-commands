# Commande: /review

Revue complète de la tâche, corrections et validation (phase finale TDD).

## Instructions

1. **Charger l'état** : Lis `docs/state.json`

2. **Vérifier la phase** :
   - Si `current.phase` != "review" → afficher erreur
   - Si `null` → suggérer `/analyze`
   - Si autre → suggérer la bonne commande

3. **Charger le contexte complet** (en parallèle) :
   - `docs/current-task.md` - Le plan original
   - `docs/dev/architecture.md`
   - `docs/dev/standards.md`
   - Le fichier epic pour les critères de complétion

4. **Build & Tests** :
   ```bash
   dotnet build
   dotnet test
   ```
   - Si échec → analyser et corriger
   - **TOUS les tests doivent passer**

5. **Vérifier la couverture TDD** :
   - Chaque comportement du code doit avoir un test correspondant
   - Les tests doivent être significatifs (pas juste `Assert.True(true)`)
   - Si code non testé détecté → ajouter les tests manquants

6. **Revue de code** :
   - Lire les fichiers créés/modifiés (tests ET code)
   - Vérifier conformité avec `standards.md` :
     - File-scoped namespaces
     - Records vs classes
     - Nullable, async patterns
   - Vérifier cohérence avec `architecture.md`

7. **Corrections** :
   - Appliquer les fixes nécessaires
   - Re-run build/tests si modifié

8. **Si tout est OK - Mettre à jour state.json** :
   ```json
   {
     "current": {
       "phase": "review"
     }
   }
   ```
   - Garder `current.phase` à `"review"` (sera mis à `"docs"` par `/docs`)

9. **Afficher le statut** :
   ```
   ## ✓ [E0] T3 - Titre validée

   **Build:** OK
   **Tests:** 5/5 passed
   **Standards:** OK

   **Corrections appliquées:**
   - Ajouté file-scoped namespace dans X.cs

   **Progression E0:** 3/8 tâches

   Lancer `/docs` pour documenter.
   ```

## Si échec non résolu
Ne pas marquer comme complété. Afficher :
```
## ✗ [E0] T3 - Problèmes non résolus

**Erreurs:**
- Description du problème

**Action requise:** Description de ce qui doit être fait
```

## Flow TDD complet
```
/analyze → /test (RED) → /dev (GREEN) → /review (VALIDATE) → /docs → /done
```
