String? validInput(String val, String field) {
  if (val.isEmpty) {
    return "$field can't be empty";
  } else if (field == 'Email') {
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(val)) {
      return 'Please enter a valid email address';
    }
  } else if (field == 'Username') {
    if (val.length < 6 || val.length > 20) {
      return 'The username must be between 6 and 20 characters long.';
    }

    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(val)) {
      return 'Username can only contain letters, numbers, and underscores';
    }
  } else if (field == 'Password') {
    if (val.length < 8) {
      return "$field must be at least 8 characters";
    } else if (!RegExp(r'(?=.*[a-z])').hasMatch(val)) {
      return "$field must contain at least one lowercase letter";
    } else if (!RegExp(r'(?=.*[A-Z])').hasMatch(val)) {
      return "$field must contain at least one uppercase letter";
    } else if (!RegExp(r'(?=.*\d)').hasMatch(val)) {
      return "$field must contain at least one digit";
    } else if (!RegExp(r'^[a-zA-Z0-9@#$%^&+=]+$').hasMatch(val)) {
      return "$field can't contain these characters";
    }
  }

  return null;
}
