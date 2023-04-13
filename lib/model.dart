class Hewan {
  String namahewan;
  String gambar;
  String id;
  String jenishewan;

  Hewan({
    required this.namahewan,
    required this.gambar,
    required this.id,
    required this.jenishewan,
  });

  factory Hewan.fromJson(Map<String, dynamic> json) {
    return Hewan(
      id: json['id'],
      namahewan: json['namahewan'],
      gambar: json['gambar'],
      jenishewan: json['jenishewan'],
    );
  }
}
