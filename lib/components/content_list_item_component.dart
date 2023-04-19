import 'package:flutter/material.dart';
import 'package:read_app/theme.dart';
import 'package:read_app/utils/get_image.dart';

class ContentListItemComponent extends StatelessWidget {
  final String? title;
  final String? image;
  final String? description;
  // ontap
  final Function()? onTap;

  const ContentListItemComponent({
    Key? key,
    this.title,
    this.image,
    this.description,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.only(right: 10),
      child: Stack(
        children: <Widget>[
          new Positioned(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 96),
                child: Text(
                  title!,
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                margin: EdgeInsets.only(left: 46),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ContentColor,
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
            ),
          ),
          new Positioned(
            top: 15,
            child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: AccentColor,
                  borderRadius: BorderRadius.circular(9),
                ),
                // child: Image.network(
                //   fit: BoxFit.cover,
                //   errorBuilder: (context, error, stackTrace) {
                //     print('ANJIRRRRRRR $error');
                //     return Center(
                //       child: Text(
                //         'Error',
                //         style: blackTextStyle.copyWith(
                //           fontSize: 20,
                //           fontWeight: bold,
                //         ),
                //         textAlign: TextAlign.left,
                //       ),
                //     );
                //   },
                //   loadingBuilder: (context, child, loadingProgress) {
                //     if (loadingProgress == null) return child;
                //     return Center(
                //       child: CircularProgressIndicator(
                //         value: loadingProgress.expectedTotalBytes != null
                //             ? loadingProgress.cumulativeBytesLoaded /
                //                 loadingProgress.expectedTotalBytes!
                //             : null,
                //       ),
                //     );
                //   },
                //   image!,
                // )
                child: FutureBuilder(
                  future: getImgUrl(image!),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Image.network(
                        snapshot.data.toString(),
                        fit: BoxFit.cover,
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Error',
                          style: blackTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      );
                    }
                    return Center(
                        child: Image.asset(
                      'assets/images/no-image-square.png',
                      fit: BoxFit.cover,
                      height: 120,
                      width: 120,
                    ));
                  },
                )),
          ),
        ],
      ),
    );
  }
}
