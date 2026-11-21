import 'package:flutter/rendering.dart' show ScrollDirection;
import 'package:flutter/services.dart' show TextInputType;
import 'package:flutter/widgets.dart'
    show CrossAxisAlignment, MainAxisAlignment, MainAxisSize;

/// Which way a scrollable is moving.
///
/// Named for the ends of the list rather than for the screen: "up" and "down"
/// are wrong on a horizontal list, and Flutter's own [ScrollDirection] is named
/// for where the content travels relative to offset zero, so its `reverse`
/// means the user is scrolling *down* a normal list.
enum AppScrollDirection {
  /// Nothing has scrolled yet, or the list has come to rest.
  idle,

  /// Moving back towards the first item — scrolling up on a normal list.
  towardStart,

  /// Moving on towards the last item — scrolling down on a normal list.
  towardEnd,
}

extension AppScrollDirectionFromFlutter on ScrollDirection {
  ///
  /// [ScrollDirection.forward] means the content is heading back towards offset
  /// zero, which is the user travelling towards the start of the list, and
  /// [ScrollDirection.reverse] is the opposite. The names invert here; that
  /// inversion is the reason this enum exists.
  AppScrollDirection get ffScrollDirection => switch (this) {
        ScrollDirection.idle => AppScrollDirection.idle,
        ScrollDirection.forward => AppScrollDirection.towardStart,
        ScrollDirection.reverse => AppScrollDirection.towardEnd,
      };
}

enum AppMainAxisSize { min, max }

extension AppMainAxisSizeToFlutter on AppMainAxisSize {
  MainAxisSize get flutterValue => switch (this) {
        AppMainAxisSize.min => MainAxisSize.min,
        AppMainAxisSize.max => MainAxisSize.max,
      };
}

enum AppMainAxisAlignment {
  start,
  center,
  end,
  spaceAround,
  spaceEvenly,
  spaceBetween,
}

extension AppMainAxisAlignmentToFlutter on AppMainAxisAlignment {
  MainAxisAlignment get flutterValue => switch (this) {
        AppMainAxisAlignment.start => MainAxisAlignment.start,
        AppMainAxisAlignment.center => MainAxisAlignment.center,
        AppMainAxisAlignment.end => MainAxisAlignment.end,
        AppMainAxisAlignment.spaceAround => MainAxisAlignment.spaceAround,
        AppMainAxisAlignment.spaceEvenly => MainAxisAlignment.spaceEvenly,
        AppMainAxisAlignment.spaceBetween => MainAxisAlignment.spaceBetween,
      };
}

enum AppCrossAxisAlignment { start, center, end, stretch, baseline }

extension AppCrossAxisAlignmentToFlutter on AppCrossAxisAlignment {
  CrossAxisAlignment get flutterValue => switch (this) {
        AppCrossAxisAlignment.start => CrossAxisAlignment.start,
        AppCrossAxisAlignment.center => CrossAxisAlignment.center,
        AppCrossAxisAlignment.end => CrossAxisAlignment.end,
        AppCrossAxisAlignment.stretch => CrossAxisAlignment.stretch,
        AppCrossAxisAlignment.baseline => CrossAxisAlignment.baseline,
      };
}

enum AppKeyboardType {
  text,
  multiline,
  number,
  decimal,
  signedDecimal,
  phone,
  dateTime,
  emailAddress,
  url,
  visiblePassword,
  name,
  streetAddress,
}

extension AppKeyboardTypeToFlutter on AppKeyboardType {
  TextInputType get flutterValue => switch (this) {
        AppKeyboardType.text => TextInputType.text,
        AppKeyboardType.multiline => TextInputType.multiline,
        AppKeyboardType.number => TextInputType.number,
        AppKeyboardType.decimal =>
          const TextInputType.numberWithOptions(decimal: true),
        AppKeyboardType.signedDecimal =>
          const TextInputType.numberWithOptions(signed: true, decimal: true),
        AppKeyboardType.phone => TextInputType.phone,
        AppKeyboardType.dateTime => TextInputType.datetime,
        AppKeyboardType.emailAddress => TextInputType.emailAddress,
        AppKeyboardType.url => TextInputType.url,
        AppKeyboardType.visiblePassword => TextInputType.visiblePassword,
        AppKeyboardType.name => TextInputType.name,
        AppKeyboardType.streetAddress => TextInputType.streetAddress,
      };
}
