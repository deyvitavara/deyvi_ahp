class AlternativeEntity {
  final int id;
  final int decisionId;
  final String name;
  final double? score;
  AlternativeEntity({
    required this.id,
    required this.decisionId,
    required this.name,
    this.score,
  });
}
