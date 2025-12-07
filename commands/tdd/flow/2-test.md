# Commande: /test

Écrit les tests définis dans le plan (phase RED du TDD).

## Instructions

1. **Charger l'état** : Lis `docs/state.json`

2. **Vérifier la phase** :
   - Si `current.phase` != "test" → afficher erreur
   - Si `null` → suggérer `/analyze`
   - Si autre → suggérer la bonne commande

3. **Charger le plan** : `docs/current-task.md`

4. **Créer les fichiers de tests** :
   - Créer les fichiers listés dans "Tests à créer"
   - Utiliser le code de la section "Tests (RED)"
   - Les tests doivent compiler mais ÉCHOUER (pas d'implémentation)

5. **Vérifier la compilation** :
   ```bash
   dotnet build
   ```
   - Si erreur de compilation → corriger les tests

6. **Exécuter les tests** :
   ```bash
   dotnet test
   ```
   - Les tests doivent ÉCHOUER (RED)
   - C'est normal et attendu à cette étape

7. **Mettre à jour state.json** : `current.phase` = "dev"

8. **Afficher le résumé** :
   ```
   ## RED: [E0] T3 - Titre

   **Tests créés:** 5 tests dans 2 fichiers
   **Build:** OK
   **Tests:** 0/5 passed (RED) ✓

   Les tests échouent comme attendu.

   Lancer `/dev` pour implémenter (GREEN).
   ```

## Flow TDD
```
/analyze → /test (RED) → /dev (GREEN) → /review → /docs → /done
```

## Notes
- Ne pas implémenter le code métier à cette étape
- Les tests doivent être complets et vérifier tous les comportements attendus
- Si un test passe déjà, c'est suspect → vérifier qu'il teste vraiment quelque chose
