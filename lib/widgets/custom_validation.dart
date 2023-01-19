String? validateName(value) {
  String patttern = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";
  RegExp regExp = RegExp(patttern);
  if (value.isEmpty) {
    return 'Please Enter Name';
  } else if (!regExp.hasMatch(value)) {
    return 'Please Enter Valid Name';
  }
  return null;
}

String? validateEmail(value) {
  String patttern = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regExp = RegExp(patttern);
  if (value.isEmpty) {
    return 'Please Enter Email ID';
  } else if (!regExp.hasMatch(value)) {
    return 'Please Enter Valid Email ID';
  }
  return null;
}

String? validateMobile(value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(patttern);
  if (value.isEmpty) {
    return 'Please Enter Mobile Mumber';
  } else if (!regExp.hasMatch(value)) {
    return 'Please Enter Valid Mobile Number';
  }
  return null;
}

String? validateOTP(value) {
  String patttern = r'(^[0-9]{4}$)';
  RegExp regExp = RegExp(patttern);
  if (value.isEmpty) {
    return 'Please Enter OTP';
  } else if (!regExp.hasMatch(value)) {
    return 'Please Enter Valid OTP';
  }
  return null;
}
