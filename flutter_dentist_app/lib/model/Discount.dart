class Discount {
  String code;
  String description;
  String expiredDay;
  String expiredMonth;
  String discount;
  Discount({
    required this.code,
    required this.description,
    required this.expiredDay,
    required this.expiredMonth,
    required this.discount,
  });
}

List<Discount> dicounts = [
  Discount(
    code: 'AWS1555D',
    description: 'Liên kết ví Momo',
    expiredDay: '10',
    expiredMonth: 'FEB',
    discount: '30',
  ),
  Discount(
    code: 'ZALO321F',
    description: 'Liên kết ví ZaloPay',
    expiredDay: '21',
    expiredMonth: 'FEB',
    discount: '25',
  ),
  Discount(
    code: 'NEW0051F',
    description: 'Lần đầu đặt lịch',
    expiredDay: '15',
    expiredMonth: 'FEB',
    discount: '10',
  ),
];
