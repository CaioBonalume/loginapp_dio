import 'package:flutter/material.dart';
import 'package:loginapp/model/card_detail.dart';

class CardDetailPage extends StatelessWidget {
  final CardDetail cardDetail;
  const CardDetailPage({super.key, required this.cardDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.network(
                    cardDetail.url,
                    height: 100,
                  ),
                  const SizedBox(width: 15),
                  Text(
                    cardDetail.title,
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Text(
                cardDetail.text,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
