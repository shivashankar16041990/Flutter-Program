
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable(explicitToJson: true)
class TodoObject {
  final List<Todo> data;
  const TodoObject(this.data);

  factory TodoObject.fromJson(Map<String, dynamic> json) =>
      _$TodoObjectFromJson(json);

  Map<String, dynamic> toJson() => _$TodoObjectToJson(this);
}

@JsonSerializable()
class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const Todo(this.userId, this.id, this.title, this.completed);

  factory Todo.fromJson(Map<String, dynamic> json) =>
      _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}

TodoObject _$TodoObjectFromJson(Map<String, dynamic> json) => TodoObject(
  (json['data'] as List<dynamic>)
      .map((e) => Todo.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TodoObjectToJson(TodoObject instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo(
  json['userId'] as int,
  json['id'] as int,
  json['title'] as String,
  json['completed'] as bool,
);

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
  'userId': instance.userId,
  'id': instance.id,
  'title': instance.title,
  'completed': instance.completed,
};

