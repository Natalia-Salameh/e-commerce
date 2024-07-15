String? validLoginInput(String val, String field) {
  if (val.isEmpty) {
    return "$field can't be empty";
  } else if (field == 'Email or Username') {
    if (RegExp(r'[!#\$%^&*(),?":{}|<>]').hasMatch(val)) {
      return '$field contains invalid characters';
    }
    if (field == 'Email or Username' && (val.length < 6 || val.length > 20)) {
      return 'The username must be between 6 and 20 characters long.';
    }
  } else if (field == 'Password') {
    if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(val)) {
      return '$field contains invalid characters';
    }
    if (val.length > 8) {
      return "$field must be at most 8 characters";
    }
  }

  return null;
}
