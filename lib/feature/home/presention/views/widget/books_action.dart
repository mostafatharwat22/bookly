import 'package:bookly_app/feature/home/domin/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/widget/custom_button.dart';


class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookEntity bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const  EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children:  [
          const Expanded(
              child: CustomButton(
                text: 'Free',
                backgroundColor: Colors.white,
                textColor: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              )),
          Expanded(
              child: CustomButton(
                onPressed: () async {
                  Uri url = Uri.parse(bookModel.previewLink!);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                fontSize: 16,
                text: 'Preview',
                backgroundColor: const Color(0xffEF8262),
                textColor: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              )),
        ],
      ),
    );
  }
}
