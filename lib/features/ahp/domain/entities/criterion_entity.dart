class CriterionEntity {
  final int id;
  final int decisionId;
  final String name;
  final int seedOrder;
  final double? value;
  CriterionEntity({
    required this.id,
    required this.decisionId,
    required this.name,
    required this.seedOrder,
    this.value,
  });
}
