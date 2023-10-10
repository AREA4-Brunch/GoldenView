# Jovana Bjelica 2020/0349
from typing import Any, Mapping
from django.core.exceptions import ValidationError

# validations for every input

class PasswordValidationError(ValidationError):
    def __init__(self, message: Any, code: str | None = ..., params: Mapping[str, Any] | None = ...) -> None:
        super().__init__(message, code, params)


class CombinedPasswordValidator:
    def __init__(self):
        self.validators = [
            MinimumLengthPasswordValidator(8),
            MinimumUpperCasePasswordValidator(1),
            MinimumLowerCasePasswordValidator(1),
            MinimumDigitPasswordValidator(1),
            MinimumSpecialCharacterPasswordValidator(1),
        ]

    def validate(self, password, user=None):
        for validator in self.validators:
            validator.validate(password, user)

    def get_help_text(self):
        help = ' AND '.join([v.get_help_text() for v in self.validators])
        return help


class MinimumLengthPasswordValidator:
    def __init__(self, min_len=8):
        self.min_len = min_len

    def validate(self, password, user=None):
        if len(password) < self.min_len:
            raise PasswordValidationError(
                f"The password must contain at least {self.min_len} characters."
            )

    def get_help_text(self):
        return f"Your password must contain at least {self.min_len} characters."


class MinimumUpperCasePasswordValidator:
    def __init__(self, min_uppercase=1):
        self.min_uppercase = min_uppercase

    def validate(self, password, user=None):
        if sum(c.isupper() for c in password) < self.min_uppercase:
            raise PasswordValidationError(
                f"The password must contain at least {self.min_uppercase} uppercase characters."
            )

    def get_help_text(self):
        return f"Your password must contain at least {self.min_uppercase} uppercase characters."


class MinimumLowerCasePasswordValidator:
    def __init__(self, min_lowercase=1):
        self.min_lowercase = min_lowercase

    def validate(self, password, user=None):
        if sum(c.islower() for c in password) < self.min_lowercase:
            raise PasswordValidationError(
                f"The password must contain at least {self.min_lowercase} lowercase characters."
            )

    def get_help_text(self):
        return f"Your password must contain at least {self.min_lowercase} lowercase characters."


class MinimumDigitPasswordValidator:
    def __init__(self, min_digits=1):
        self.min_digits = min_digits

    def validate(self, password, user=None):
        if sum(c.isdigit() for c in password) < self.min_digits:
            raise PasswordValidationError(
                f"The password must contain at least {self.min_digits} digits."
            )

    def get_help_text(self):
        return f"Your password must contain at least {self.min_digits} digits."


class MinimumSpecialCharacterPasswordValidator:
    def __init__(self, min_special_characters=1):
        self.min_special_characters = min_special_characters

    def validate(self, password, user=None):
        special_characters = "!@#$%^&*()_+-=[]{}|;':\",./<>?"
        if sum(c in special_characters for c in password) < self.min_special_characters:
            raise PasswordValidationError(
                f"The password must contain at least {self.min_special_characters} special characters."
            )

    def get_help_text(self):
        return f"Your password must contain at least {self.min_special_characters} special characters."
