// 📄 lib/utils/product_clipboard_copy.dart

import 'package:flutter/services.dart';
import '../utils/auto_tag_sorter.dart';

class ProductClipboardCopy {
  static void copyTagGroup(String tag, List<ProductItem> items) {
    final text = 'Tag: $tag\nProducts:\n${items.map((e) => '- ${e.name}').join('\n')}';
    Clipboard.setData(ClipboardData(text: text));
  }

  static void copySingleProduct(ProductItem item) {
    final text = '${item.name}\n${item.description}\nTags: ${item.tags.join(', ')}';
    Clipboard.setData(ClipboardData(text: text));
  }
}
