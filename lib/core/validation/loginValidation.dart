String? validLoginInput(String val, String field) {
  if (val.isEmpty) {
    return "$field can't be empty";
  } else if (field == 'Email or Username') {
    // Check for dangerous characters
    if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(val)) {
      return '$field contains invalid characters';
    }
    // Check for length if necessary
    // Example: Checking length for username
    if (field == 'Username' && (val.length < 6 || val.length > 100)) {
      return 'The username must be between 6 and 100 characters long.';
    }
  } else if (field == 'Password') {
    // Check for dangerous characters and length
    if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(val)) {
      return '$field contains invalid characters';
    }
    if (val.length < 8) {
      return "$field must be at least 8 characters";
    }
  }

  return null;
}
