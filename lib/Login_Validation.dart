//In This file check User name Validation, like space, . and @ etc.
import 'package:email_validator/email_validator.dart';
// Usage Read the unit tests under test, or see code example below:

void main() {

    var email = "fredrik@gmail.com";

    assert(EmailValidator.validate(email) == true);

}
