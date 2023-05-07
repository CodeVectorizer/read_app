import 'package:flutter/material.dart';
import 'package:read_app/theme.dart';
import 'package:read_app/utils/get_image.dart';

class ContentListItemComponent extends StatelessWidget {
  final String? title;
  final String? image;
  final String? description;
  final String? status;
  final bool? isUsingImage;
  final bool? isRead;
  final Function()? onTap;

  const ContentListItemComponent({
    Key? key,
    this.title,
    this.image,
    this.description,
    this.status,
    this.onTap,
    this.isRead = false,
    this.isUsingImage = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: isUsingImage! ? EdgeInsets.only(right: 10) : EdgeInsets.zero,
      child: Stack(
        children: <Widget>[
          new Positioned(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                padding: isUsingImage!
                    ? EdgeInsets.only(top: 10, bottom: 20, left: 86, right: 26)
                    : EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title!,
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      status ?? '-',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
                margin:
                    isUsingImage! ? EdgeInsets.only(left: 46) : EdgeInsets.zero,
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ContentColor,
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
            ),
          ),
          isRead!
              ? Positioned(
                  right: 4,
                  top: 10,
                  child: Row(
                    children: [
                      Icon(Icons.done_all, color: Colors.blue),
                    ],
                  ),
                )
              : Container(),
          isUsingImage!
              ? new Positioned(
                  top: 15,
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: AccentColor,
                      borderRadius: BorderRadius.circular(9),
                    ),
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
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
