class CreateClientResponse {
  final String id;

  CreateClientResponse({required this.id});

  factory CreateClientResponse.fromJson(Map<String, dynamic> json) {
    return CreateClientResponse(
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
