import 'package:equatable/equatable.dart';

class BaseInfo extends Equatable {
  final String name;
  final String url;

  BaseInfo({
    required this.name,
    required this.url,
  });

  @override
  List<Object?> get props => [
        name,
        url,
      ];

  factory BaseInfo.fromJson(Map<String, dynamic> json) {
    return BaseInfo(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
