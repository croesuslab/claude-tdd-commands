# /tdd:flow:4-review

Revue critique du code.

## Instructions

### 1. Vérifier
- `docs/state.json` : `current.phase` doit être "review"
- Charger `docs/current-task.md`, `docs/dev/standards.md`

### 2. Qualité et tests

Exécuter les commandes de validation appropriées selon le langage du projet:
- Linter/formatter
- Type checking
- Tests unitaires

Consulter `CLAUDE.md` ou `README.md` pour les commandes exactes du projet.

Si échec → corriger d'abord.

### 3. Revue du code

Lire **chaque fichier modifié/créé**.

#### A. Adéquation avec le besoin

- Le code fait-il exactement ce qui était demandé ?
- Y a-t-il du scope creep ou des oublis ?
- Les décisions de l'analyse sont-elles respectées ?

#### B. Design

| Aspect | Question |
|--------|----------|
| Responsabilité | Classe/fonction fait une seule chose ? |
| Couplage | Trop dépendant d'autres modules ? |
| Testabilité | Facile à tester en isolation ? |

**Signaux d'alerte :**
- Fichier > 200 lignes, fonction/méthode > 30 lignes
- Plus de 3 niveaux d'indentation
- Plus de 4 paramètres
- Noms génériques (`data`, `manager`, `helper`)

#### C. Robustesse

- Erreurs gérées correctement ?
- Ressources libérées proprement ?
- Cas limites couverts ?

### 4. Revue des tests

**Couverture :**

| Catégorie | Présent ? |
|-----------|-----------|
| Comportements métier | |
| Validation inputs | |
| Invariants | |
| Cas limites | |
| Gestion erreurs | |

**Tests manquants ?**
- Chaque branche conditionnelle testée ?
- Chaque exception/erreur déclenchable par un test ?

### 5. Conformité standards

Vérifier la conformité avec `docs/dev/standards.md` du projet.

### 6. Corrections

**Mineurs :** Corriger directement (renommages, formatage, tests simples manquants).

**Majeurs :** Présenter le problème et demander confirmation avant de corriger.

### 7. Finaliser

Garder `current.phase` = "review".

```
## Review: [Epic] Task - Titre

**Qualité:** ✓ | **Tests:** X passed

**Corrections appliquées:**
- [Liste]

**Couverture tests:** ✓

Lancer `/tdd:flow:5-docs` pour documenter.
```

## Questions utiles

- "Si je modifie ce code dans 6 mois, qu'est-ce qui me poserait problème ?"
- "Ce test pourrait-il passer alors que le code est cassé ?"
- "Est-ce la solution la plus simple qui fonctionne ?"
