# Commande: /dev

Implémente le code pour faire passer les tests (phase GREEN du TDD).

## Instructions

1. **Charger l'état** : Lis `docs/state.json`

2. **Vérifier la phase** :
   - Si `current.phase` != "dev" → afficher erreur
   - Si `null` → suggérer `/analyze`
   - Si "test" → suggérer `/test`
   - Si "review" → suggérer `/review`

3. **Charger le plan** : `docs/current-task.md`

4. **Vérifier que les tests existent** :
   ```bash
   dotnet test --no-build --list-tests
   ```
   - Si pas de tests → demander `/test` d'abord

5. **Implémenter le code** :
   - Supprimer les fichiers listés dans "À supprimer"
   - Créer les fichiers listés dans "Code à créer" avec le code de "Implémentation (GREEN)"
   - Modifier les fichiers listés dans "À modifier"
   - Exécuter les commandes bash si présentes

6. **Faire passer les tests** :
   ```bash
   dotnet build && dotnet test
   ```
   - Tous les tests doivent PASSER (GREEN)
   - Si échec → ajuster l'implémentation jusqu'à ce que ça passe

7. **Mettre à jour state.json** : `current.phase` = "review"

8. **Afficher le résumé** :
   ```
   ## GREEN: [E0] T3 - Titre

   **Créés:** 3 fichiers
   **Modifiés:** 1 fichier
   **Supprimés:** 2 dossiers
   **Tests:** 5/5 passed (GREEN) ✓

   Lancer `/review` pour valider.
   ```

## Flow TDD
```
/analyze → /test (RED) → /dev (GREEN) → /review → /docs → /done
```

## Notes
- Ne pas charger d'autres documents (architecture, standards) - tout est dans current-task.md
- L'objectif est de faire passer les tests, pas d'ajouter des fonctionnalités non testées
- Si un test échoue, corriger l'implémentation (pas le test)
