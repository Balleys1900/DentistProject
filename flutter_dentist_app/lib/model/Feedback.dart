class userFeedback {
  final String name;
  final String username;
  final String dateFeedback;
  final String content;
  final int rating;
  final String avatar;

  userFeedback({
    required this.name,
    required this.username,
    required this.dateFeedback,
    required this.content,
    required this.rating,
    required this.avatar,
  });
}

List<userFeedback> feedbacks = [
  userFeedback(
      name: "Dan Dan",
      username: "Dan Dan",
      dateFeedback: "1 day ago",
      content:
          "Đặt lịch hẹn thăm khám tiện lợi, dễ dàng (website, hotline) tại tất cả hệ thống 21 phòng khám Nha Khoa Kim trên toàn quốc.Đội ngũ nhân viên, bác sĩ tận tâm tư vấn, chăm sóc trong suốt quá trình và sau điều trị.Hệ thống quản lý theo dõi và chăm sóc khách hàng theo từng giai đoạn điều trị.",
      rating: 5,
      avatar: "assets/images/user/user1.jpg"),
  userFeedback(
      name: "Randy Lee",
      username: "Randy Lee",
      dateFeedback: "2 days ago",
      content:
          "Hồ sơ điện tử đầy đủ chi tiết theo từng tình trạng của khách hàng trên toàn hệ thống.Giá niêm yết, tư vấn rõ ràng, minh bạch.Chế độ bảo hành dễ dàng, tiện lợi tại 21 phòng khám Nha Khoa Kim trên toàn quốc",
      rating: 4,
      avatar: "assets/images/user/user2.jpg"),
  userFeedback(
      name: "Vo Van C",
      username: "Vo Van C",
      dateFeedback: "4 days ago",
      content:
          "Cơ sở vật chất, trang thiết bị hiện đại sẽ hỗ trợ rất tốt cho các bác sĩ trong quá trình đánh giá chính xác tình trạng răng, cấu trúc xương hàm mỗi người để đưa ra những tư vấn sát nhất cho từng trường hợp",
      rating: 5,
      avatar: "assets/images/user/user3.jpg"),
  userFeedback(
      name: "Tran Van B",
      username: "Tran Van B",
      dateFeedback: "1 month ago",
      content:
          "Đội ngũ chuyên gia giàu kinh nghiệm: Đội ngũ chuyên gia của Nacera có trình độ chuyên môn cao, dàn dạn kinh nghiệm, từng tu nghiệp tại các quốc gia có nền nha khoa thẩm mỹ phát triển vượt bậc như Anh, Pháp, Mỹ",
      rating: 4,
      avatar: "assets/images/user/user4.jpg"),
  userFeedback(
      name: "David Tran",
      username: "David Tran",
      dateFeedback: "2 month ago",
      content: "Cơ sở vật chất sạch sẽ!!!",
      rating: 4,
      avatar: "assets/images/user/user5.jpg"),
];
