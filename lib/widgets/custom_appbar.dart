import 'package:flutter/material.dart';

import '../utils/color_utils.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
         this.title,
         this.backonTap,
         this.notionTap,

        this.menuIcon = false,
        this.menuonTap
      })
      : super(key: key);

  final String? title;
  final bool menuIcon;

  final Function()? backonTap;
  final Function()? notionTap;

  final Function()? menuonTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
          elevation: 1,
          backgroundColor: gerywhite,
          title: Text(title!,style: TextStyle(
          fontSize: 16,
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w600,
          color: black,
          letterSpacing: 1)),
          leading: GestureDetector(
            onTap: menuonTap,
            child: menuIcon == true
                ? Icon(
              Icons.menu, color: black, // add custom icons also
            )
                : GestureDetector(
              onTap: backonTap,
              child: Icon(
                Icons.arrow_back_ios_new,
                color: black, // add custom icons also
              ),
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: notionTap,
                  child: Icon(
                    Icons.notifications_none,
                    color: black,
                    size: 26.0,
                  ),
                )),
            // Padding(
            //     padding: EdgeInsets.only(right: 20.0),
            //     child: GestureDetector(
            //         onTap: cartonTap,
            //         child: cartIcon == true
            //             ? Icon(
            //           Icons.shopping_cart_outlined,
            //           color: black,
            //         )
            //             : Container())),
          ]),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}