String extractRegion(String input) {
  // Utiliser une expression régulière pour extraire la région entre les tirets
  RegExp regex = RegExp(r'- ([A-Z-]+)');

  // Trouver la première correspondance dans la chaîne d'entrée
  Match? match = regex.firstMatch(input);

  // Vérifier si une correspondance a été trouvée et renvoyer le groupe de capture
  if (match != null && match.groupCount > 0) {
    return match.group(1)!;
  }

  // Si aucune correspondance n'a été trouvée avec le premier modèle,
  // essayez un autre modèle qui capture le texte entre les parenthèses
  regex = RegExp(r'\(([^)]+)\)');

  match = regex.firstMatch(input);

  // Vérifier si une correspondance a été trouvée et renvoyer le groupe de capture
  if (match != null && match.groupCount > 0) {
    return match.group(1)!;
  }

  // Retourner une chaîne vide si aucune correspondance n'a été trouvée
  return '';
}
