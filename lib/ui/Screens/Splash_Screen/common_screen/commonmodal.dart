import '../../../../utils/image_utils.dart';

class Commonpage {
  String? boldname;
  String? discription;
  String? image;
  Commonpage({this.boldname, this.discription, this.image});
}


List<Commonpage>  contents = [
  Commonpage(
   boldname: 'LINKING YOU AND\nYOUR LOVED ONES',
    discription: "We are here to help your\nloved ones every step of the\nway",
    image: oneonboarding,
  ),

  Commonpage(
  boldname: 'SECURE LEGAL\nDOCUMENTATION',
 discription: 'Faster inheritance with the\nmaster legal document built by\nLegal experts and you',
  image: twoonboarding,
  ),

  Commonpage(
    boldname: 'SECURE WALLET OF\nASSETS',
  discription: "One place to store assets\nin safe & secure wallet",
  image: threeonboarding,
  ),

  Commonpage(
    boldname: 'HASSLE-FREE ASSETS\nTRANSFER',
  discription: "Easy and affordable experience\nwhile transferring the assets\nfrom your name to their name",
  image: fouronboarding,
  ),


];

