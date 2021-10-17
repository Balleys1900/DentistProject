class Booking {
  final String id;
  final dynamic user;
  final List<dynamic> services;
  final dynamic clinic;
  final String dateRequest;
  final String dateAppointment;
  final String timeAppoinment;
  final bool status;
  final String message;

  Booking({
    required this.id,
    required this.user,
    required this.services,
    required this.clinic,
    required this.dateRequest,
    required this.dateAppointment,
    required this.timeAppoinment,
    required this.status,
    required this.message,
  });

  factory Booking.fromJson(Map<dynamic, dynamic> json) {
    return Booking(
      id: json['_id'],
      user: json['user'],
      services: json['services'],
      clinic: json['clinic'],
      dateRequest: json['dateRequest'],
      dateAppointment: json['dateAppointment'],
      timeAppoinment: json['timeAppoinment'],
      status: json['status'],
      message: json['message'],
    );
  }
}
