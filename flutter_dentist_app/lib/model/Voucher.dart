class Voucher {
  String code;
  String description;
  String expiredDay;
  String expiredMonth;
  String discount;
  Voucher({
    required this.code,
    required this.description,
    required this.expiredDay,
    required this.expiredMonth,
    required this.discount,
  });
}

List<Voucher> vouchers = [
  Voucher(
    code: 'AWS1555D',
    description: 'Liên kết ví Momo',
    expiredDay: '10',
    expiredMonth: 'FEB',
    discount: '30',
  ),
  Voucher(
    code: 'ZALO321F',
    description: 'Liên kết ví ZaloPay',
    expiredDay: '21',
    expiredMonth: 'FEB',
    discount: '25',
  ),
  Voucher(
    code: 'NEW0051F',
    description: 'Lần đầu đặt lịch',
    expiredDay: '15',
    expiredMonth: 'FEB',
    discount: '10',
  ),
];
