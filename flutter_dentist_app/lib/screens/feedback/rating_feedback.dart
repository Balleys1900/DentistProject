import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/model/Feedback.dart';

class ratingAndFeedback extends StatelessWidget {
  const ratingAndFeedback({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Đánh giá & Phản hồi',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Xem thêm',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 5,
            // right: 13,
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    '4.3',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'out of 5',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: RatingAndProgress(),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(right: 15),
          child: Text(
            '123 Ratings',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black45,
            ),
          ),
        ),
        Container(
          height: 205,
          margin: EdgeInsets.only(left: 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...feedbacks
                  .map(
                    (feedback) => RenderUserFeedback(feedback: feedback),
                  )
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }
}

class RenderUserFeedback extends StatelessWidget {
  final userFeedback feedback;
  const RenderUserFeedback({
    Key? key,
    required this.feedback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(top: 10, right: 10),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10, top: 10, left: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(feedback.avatar),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            feedback.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              for (var i = 0; i < feedback.rating; i++)
                                Icon(
                                  Icons.star_rate_rounded,
                                  color: Colors.yellow,
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  feedback.dateFeedback,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12, left: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              'Đặt lịch hẹn thăm khám tiện lợi, dễ dàng.Đội ngũ nhân viên, bác sĩ tận tâm tư vấn, chăm sóc trong suốt quá trình và sau điều trị.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RatingAndProgress extends StatelessWidget {
  const RatingAndProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            children: [
              Icon(
                Icons.star_rate_rounded,
                color: Colors.yellow,
                size: 20,
              ),
              Icon(
                Icons.star_rate_rounded,
                color: Colors.yellow,
                size: 20,
              ),
              Icon(
                Icons.star_rate_rounded,
                color: Colors.yellow,
                size: 20,
              ),
              Icon(
                Icons.star_rate_rounded,
                color: Colors.yellow,
                size: 20,
              ),
              Icon(
                Icons.star_rate_rounded,
                color: Colors.yellow,
                size: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 13),
                width: 170,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: LinearProgressIndicator(
                    value: 0.8,
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.grey.shade800),
                    backgroundColor: Colors.grey.shade400,
                    minHeight: 8,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Icon(
                Icons.star_rate_rounded,
                color: Colors.yellow,
                size: 20,
              ),
              Icon(
                Icons.star_rate_rounded,
                color: Colors.yellow,
                size: 20,
              ),
              Icon(
                Icons.star_rate_rounded,
                color: Colors.yellow,
                size: 20,
              ),
              Icon(
                Icons.star_rate_rounded,
                color: Colors.yellow,
                size: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 13),
                width: 170,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: LinearProgressIndicator(
                    value: 0.5,
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.grey.shade800),
                    backgroundColor: Colors.grey.shade400,
                    minHeight: 8,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Row(
            children: [
              Icon(
                Icons.star_rate_rounded,
                color: Colors.yellow,
                size: 20,
              ),
              Icon(
                Icons.star_rate_rounded,
                color: Colors.yellow,
                size: 20,
              ),
              Icon(
                Icons.star_rate_rounded,
                color: Colors.yellow,
                size: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 13),
                width: 170,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: LinearProgressIndicator(
                    value: 0.3,
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.grey.shade800),
                    backgroundColor: Colors.grey.shade400,
                    minHeight: 8,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Row(
            children: [
              Icon(
                Icons.star_rate_rounded,
                color: Colors.yellow,
                size: 20,
              ),
              Icon(
                Icons.star_rate_rounded,
                color: Colors.yellow,
                size: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 13),
                width: 170,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: LinearProgressIndicator(
                    value: 0.2,
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.grey.shade800),
                    backgroundColor: Colors.grey.shade400,
                    minHeight: 8,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Row(
            children: [
              Icon(
                Icons.star_rate_rounded,
                color: Colors.yellow,
                size: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 13),
                width: 170,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: LinearProgressIndicator(
                    value: 0.1,
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.grey.shade800),
                    backgroundColor: Colors.grey.shade400,
                    minHeight: 8,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
