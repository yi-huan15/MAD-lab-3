/// MODEL layer: a pure data class. No Flutter imports, no UI, no logic.
class CruiseDestination {
  final String name;
  final String location;
  final String description;
  final String imageUrl;
  final String imageCaption;
  final int initialStarCount;

  const CruiseDestination({
    required this.name,
    required this.location,
    required this.description,
    required this.imageUrl,
    required this.imageCaption,
    required this.initialStarCount,
  });
}
