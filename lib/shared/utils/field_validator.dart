class FieldValidator {
  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty) {
      return 'Email address is required.';
    }

    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formEmail)) return 'Invalid Email Address format.';
    return null;
  }

  String? validatePasswd(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty) {
      return 'Password is required.';
    }

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formPassword)) {
      return '''Password must be at leas 8 characters, include uppercase letter, number and symbol.''';
    }

    return null;
  }
}
