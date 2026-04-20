import 'package:flutter/material.dart';
import 'package:school_management/core/common/custom_form_field/custom_form_field_config.dart';

class FormValidator {
  static checkValidation({
    required BuildContext context,
    required String value,
    required bool isRequired,
    required bool isLogIn,
    required FieldType fieldType,
    required String label,
  }) {
    if (isRequired) {
      if (value.isEmpty) {
        return "$label is required";
      } else if (fieldType == FieldType.email) {
        if (!validateEmail(value)) {
          return "Invalid email address";
        }
      } else if (fieldType == FieldType.phone) {
        if (value.length < 10 || value.length > 10) {
          return "Wrong phone number";
        }
      } else if (fieldType == FieldType.password) {
        if (!isValidPassword(value) && !isLogIn) {
          return "Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, and one number.";
        }
      } else if (fieldType == FieldType.confirmPassword) {
        if (!isValidPassword(value) && !isLogIn) {
          return "Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, and one number.";
        }
      }
    } else {
      return null;
    }
  }

  static bool isValidPassword(String password) {
    final RegExp regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');
    return regex.hasMatch(password);
  }

  static validateEmail(String email) {
    if (RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$",
    ).hasMatch(email)) {
      return true;
    }
    return false;
  }
}
