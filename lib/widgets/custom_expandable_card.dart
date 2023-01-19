import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:surakshakadi/theme/app_theme.dart';
import 'package:surakshakadi/utils/strings.dart';

import '../utils/color_utils.dart';
import '../utils/constants/app_constant.dart';
import '../utils/extensions/size_extension.dart';
import '../utils/image_utils.dart';

class CustomExpandableCard extends HookWidget {
  const CustomExpandableCard({
    Key? key,
    required  this.assetname,
    required  this.assetimage,
    required this.boxcolor,
    this.onTap,
    required this.isExpanded,
    this.collapsedChild,
    required this.index,
    this.expandedChild,
    this.openchild,
    this.color,
    this.iconcolor,
    required this.border,
    // this.onCall,
  }) : super(key: key);

  final Function(bool isExpanded, int index)? onTap;
  // final Function? onCall;
  final int animationTime = 600;
  final int index;
  final  Color? color;
  final  Color? iconcolor;
  final Widget? collapsedChild;
  final Widget? expandedChild;
  final Widget? openchild;
  final String assetname;
  final String assetimage;
  final Color boxcolor;
  final BoxBorder border;
  // final Color? color;
  final ValueNotifier<int> isExpanded;

  @override
  Widget build(BuildContext context) {
    final _controller = useAnimationController(
      duration: const Duration(milliseconds: 600),
    );
    final update = useValueListenable(isExpanded);
    useEffect(() {
      if (isExpanded.value == index) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }, [update]);
    final appColors = Theme.of(context).appColors;
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      decoration:  BoxDecoration(
        border: border,
        borderRadius: BorderRadius.all(Radius.circular(8)),

      ),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                // onCall!();
               // print("is Expanded == ${isExpanded.value}");
                if (onTap != null) {
                  onTap!(isExpanded.value == index, index);
                } else {
                  if (isExpanded.value == index) {
                    isExpanded.value = -1;
                  } else {
                    isExpanded.value = index;
                  }
                }
              },
              child:
                  Container(
                    // margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.2 : 16),
                     padding: EdgeInsets.only(right: 20,),
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    color: boxcolor,
                    ),
                    child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Expanded(flex: 3,
                              child: Image.asset(assetimage,scale: 3.8,)),

                         Expanded(flex: 7,
                           child:  Text(assetname,
                           style: TextStyle(color: black,fontSize: 14,fontWeight: FontWeight.w600),),),

                          RotationTransition(
                              turns: Tween(begin: 0.0, end: 0.5)
                                  .animate(_controller),
                              child: Image.asset(
                                  downarrow,scale: 4,color: black,

                              ))
                        ]),
                  )
          ),


          AnimatedSize(
            duration: Duration(milliseconds: animationTime),
            child: SizedBox(
                child: (isExpanded.value != index && collapsedChild != null)
                    ? collapsedChild!
                    : (isExpanded.value == index && expandedChild != null)
                        ? expandedChild!
                        : const SizedBox()),
          )
        ],
      ),
    );
  }
}



class CustomExpandableCardCode extends HookWidget {
  const CustomExpandableCardCode({
    Key? key,

    required this.boxcolor,
    this.onTap,
    this.height,
  required  this.name,
    required this.isExpanded,
    this.collapsedChild,
    required this.index,
    this.expandedChild,
    this.openchild,
    this.color,
    this.iconColor,
    this.textColor,
    required this.border,
    // this.onCall,
  }) : super(key: key);

  final Function(bool isExpanded, int index)? onTap;
  // final Function? onCall;
  final int animationTime = 600;
  final int index;
  final  Color? color;
  final  double? height;
  final  Color? iconColor;
  final  Color? textColor;
  final Widget? collapsedChild;
  final Widget? expandedChild;
  final Widget? openchild;
  final String name;

  final Color boxcolor;
  final BoxBorder border;
  // final Color? color;
  final ValueNotifier<int> isExpanded;

  @override
  Widget build(BuildContext context) {
    final _controller = useAnimationController(
      duration: const Duration(milliseconds: 600),
    );
    final update = useValueListenable(isExpanded);
    useEffect(() {
      if (isExpanded.value == index) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }, [update]);
    final appColors = Theme.of(context).appColors;
    return Container(
      // margin: EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      decoration:  BoxDecoration(
        border: border,
        // borderRadius: BorderRadius.all(Radius.circular(8)),

      ),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                // onCall!();
                // print("is Expanded == ${isExpanded.value}");
                if (onTap != null) {
                  onTap!(isExpanded.value == index, index);
                } else {
                  if (isExpanded.value == index) {
                    isExpanded.value = -1;
                  } else {
                    isExpanded.value = index;
                  }
                }
              },
              child:
              Container(
                // margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.2 : 16),
                padding: EdgeInsets.only(right: 20,left: 20),
                height: height ?? 50,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(8),
                  color: boxcolor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text(name,
                        style: TextStyle(color: textColor,fontSize: 13,fontWeight: FontWeight.w400,fontFamily: fontFamily),),

                      RotationTransition(
                          turns: Tween(begin: 0.0, end: 0.5)
                              .animate(_controller),
                          child: Image.asset(
                            downarrow,scale: 4.5,color: iconColor,

                          ))
                    ]),
              )
          ),


          AnimatedSize(
            duration: Duration(milliseconds: animationTime),
            child: SizedBox(
                child: (isExpanded.value != index && collapsedChild != null)
                    ? collapsedChild!
                    : (isExpanded.value == index && expandedChild != null)
                    ? expandedChild!
                    : const SizedBox()),
          )
        ],
      ),
    );
  }
}







class CustomChildExpandableCard extends HookWidget {
  const CustomChildExpandableCard(
      {Key? key,
      required this.title,
      this.onTap,
      required this.isExpanded,
      this.collapsedChild,
      required this.index,
      this.expandedChild,
      required  this.padding,
      this.titleWidget})
      : super(key: key);
  final Function(bool isExpanded, int index)? onTap;
  final int animationTime = 600;
  final int index;
  final Widget? collapsedChild;
  final Widget? expandedChild;
  final Widget? titleWidget;
  final String title;
  final ValueNotifier<int> isExpanded;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final _controller = useAnimationController(
      duration: const Duration(milliseconds: 600),
    );
    final update = useValueListenable(isExpanded);
    useEffect(() {
      if (isExpanded.value == index) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }, [update]);
    final appColors = Theme.of(context).appColors;
    return Column(
      children: [
        InkWell(
            onTap: () {
              if (onTap != null) {
                onTap!(isExpanded.value == index, index);
              } else {
                if (isExpanded.value == index) {
                  isExpanded.value = -1;
                } else {
                  isExpanded.value = index;
                }
              }
            },
            child: Padding(
                padding: padding,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title,
                          style: TextStyle(
                              color: black,
                              fontSize: context.fontSize(18))),
                      if (titleWidget != null) titleWidget!,
                      RotationTransition(
                          turns:
                              Tween(begin: 0.0, end: 0.5).animate(_controller),
                          child: Image.asset(downarrow,height: 20,width: 20,color: black,)
                          // Utils.svgIconSize(
                          //     icArrowActive,
                          //     context.constantSize(20.c),
                          //     context.constantSize(20.c))
                      ),
                    ]))),
        // if (isExpanded.value != index && collapsedChild != null ||
        //     isExpanded.value == index && expandedChild != null)
          // divider(indent: 0.0, endIndent: 0.0, height: 1.0),
        Padding(
          padding: const EdgeInsets.only(left: 16,right: 10),
          child: Divider(color: black,height: 1.5,  ),
        ),

        AnimatedSize(
          duration: Duration(milliseconds: animationTime),
          child: SizedBox(
              child: (isExpanded.value != index && collapsedChild != null)
                  ? collapsedChild!
                  : (isExpanded.value == index && expandedChild != null)
                      ? expandedChild!
                      : const SizedBox()),
        )
      ],
    );
  }
}
