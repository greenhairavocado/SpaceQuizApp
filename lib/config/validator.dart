class Validator {
  static nameValidation(String name) {
    if (name.isEmpty) {
      return "Name is not empty";
    } else {
      return null;
    }
  }

  static bool validateEmail(String email) {
    // Regular expression pattern for email validation
    String emailPattern = r'^[\w-]+(\.[\w-]+)*@([a-z0-9A-Z-]+\.)+[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }

  static passwordValidation(String? passCurrentValue) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    var passNonNullValue = passCurrentValue ?? "";
    if (passNonNullValue.isEmpty) {
      return ("Password is required");
    } else if (passNonNullValue.length < 8) {
      return ("Password Must be more than 8 characters");
    } else if (!regex.hasMatch(passNonNullValue)) {
      return ("Password should contain upper,lower,digit and Special character ");
    }
    return null;
  }

  static emailValidation(String? email) {
    var emailNonNullValue = email ?? "";
    if (emailNonNullValue.isEmpty) {
      return "Please enter email";
    } else if (!validateEmail(emailNonNullValue)) {
      return "Please enter valid email.";
    }
    return null;
  }
}
