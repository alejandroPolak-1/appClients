class ConfirmClientResponse {
  final bool success;

  ConfirmClientResponse({required this.success});

  factory ConfirmClientResponse.fromJson(Map<String, dynamic> json) {
    return ConfirmClientResponse(
      success: json['success'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
    };
  }
}
