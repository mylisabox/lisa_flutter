#!/usr/bin/env bash


flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/src/common/l10n/messages --locale=en lib/src/common/l10n/common_localizations.dart lib/src/common/l10n/error_localizations.dart
#flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/src/common/l10n/messages --locale=fr lib/src/common/l10n/common_localizations.dart lib/src/common/l10n/error_localizations.dart
flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/src/common/l10n/messages/ --no-use-deferred-loading lib/src/common/l10n/common_localizations.dart lib/src/common/l10n/error_localizations.dart lib/src/common/l10n/messages/intl_messages.arb

flutter pub pub run build_runner build --delete-conflicting-outputs
