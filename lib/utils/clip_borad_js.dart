import 'dart:js' as js;

void copyToClipboard(String text) {
  js.context.callMethod('copyToClipboard', [text]);
}
