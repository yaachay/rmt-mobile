class Record {
  final int recordId;
  final dynamic originalText;
  final dynamic translatedText;
  final String from;
  final String to;

  Record({
    required this.recordId,
    required this.originalText,
    required this.translatedText,
    required this.from,
    required this.to,
  });

  @override
  String toString() =>
      'Knowledge(id: $recordId, rakhine: $originalText, myanmar: $translatedText, from: $from, to: $to)';
}
