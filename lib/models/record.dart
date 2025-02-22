class Record {
  final int recordId;
  final dynamic originalText;
  final dynamic translatedText;

  Record({
    required this.recordId,
    required this.originalText,
    required this.translatedText,
  });

  @override
  String toString() =>
      'Knowledge(id: $recordId, rakhine: $originalText, myanmar: $translatedText)';
}
