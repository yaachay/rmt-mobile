class Record {
  final int? recordId;
  final String originalText;
  final String translatedText;
  final String fromLang;
  final String toLang;

  Record({
    this.recordId,
    required this.originalText,
    required this.translatedText,
    required this.fromLang,
    required this.toLang,
  });

  factory Record.fromMap(Map<String, dynamic> map) {
    return Record(
      recordId: map['recordId'],
      originalText: map['originalText'],
      translatedText: map['translatedText'],
      fromLang: map['fromLang'],
      toLang: map['toLang'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'recordId': recordId,
      'originalText': originalText,
      'translatedText': translatedText,
      'fromLang': fromLang,
      'toLang': toLang,
    };
  }

  @override
  String toString() {
    return 'Record(recordId: $recordId, originalText: $originalText, translatedText: $translatedText, fromLang: $fromLang, toLang: $toLang)';
  }
}
