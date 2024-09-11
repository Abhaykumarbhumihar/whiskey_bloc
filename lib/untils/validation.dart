class Validation {
  static String? validateEmail(String email) {
    if (email == null || email.isEmpty) {
      return 'Enter email';
    }

    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  static String? validateUrl(String email, type) {
    if (email.isNotEmpty) {
      if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email)) {
        return 'Please enter a valid email';
      }
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.length < 6) {
      return 'Password must have at least 6 characters';
    }

    if (!RegExp(r'^(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>]).{6,}$')
        .hasMatch(password)) {
      return 'Password must contain at least one digit, one uppercase letter, and one special character';
    }

    return null;
  }
}
