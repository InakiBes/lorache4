class AemetResponse {
  final String description;
  final int code;
  final String data;
  final String metadata;

  const AemetResponse({
    required this.description,
    required this.code,
    required this.data,
    required this.metadata,
  });

  factory AemetResponse.fromJson(Map<String, dynamic> json) {
    return AemetResponse(
      description: json['descripcion'],
      code: json['estado'],
      data: json['datos'],
      metadata: json['metadatos'],
    );
  }
}