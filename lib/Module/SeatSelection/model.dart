class SeatModel {
  final String id;       // ID unik kursi, contoh: A1, B2
  bool isBooked;         // True jika kursi sudah dipesan
  bool isSelected;       // True jika kursi sedang dipilih oleh user

  SeatModel({
    required this.id,
    this.isBooked = false,
    this.isSelected = false,
  });
}
