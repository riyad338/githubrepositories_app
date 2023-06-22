class Repository {
  final String name;
  final String description;
  final int stars;
  final int forks;
  final String language;
  final String createdAt;

  Repository({
    this.name = '',
    this.description = '',
    this.stars = 0,
    this.forks = 0,
    this.language = '',
    this.createdAt = '',
  });

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      stars: json['stargazers_count'] ?? 0,
      forks: json['forks_count'] ?? 0,
      language: json['language'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}
