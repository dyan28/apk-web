// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Faq {
  final String? title;
  final String? answer;
  Faq({
    this.title,
    this.answer,
  });

  Faq copyWith({
    String? title,
    String? answer,
  }) {
    return Faq(
      title: title ?? this.title,
      answer: answer ?? this.answer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'answer': answer,
    };
  }

  factory Faq.fromMap(Map<String, dynamic> map) {
    return Faq(
      title: map['title'] != null ? map['title'] as String : null,
      answer: map['answer'] != null ? map['answer'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Faq.fromJson(String source) => Faq.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Faq(title: $title, answer: $answer)';

  @override
  bool operator ==(covariant Faq other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.answer == answer;
  }

  @override
  int get hashCode => title.hashCode ^ answer.hashCode;
}
