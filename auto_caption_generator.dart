// 📄 lib/utils/auto_caption_generator.dart
String generateCaption(ProductItem p) {
  return """
✨ New Drop on Kisswaar: "${p.name}"  
🎁 Shop now: kisswaar.in/product/${p.slug}  
#${p.tags.join(' #')} #KisswaarDrop
""";
}
