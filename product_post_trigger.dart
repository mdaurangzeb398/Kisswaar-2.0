// 📄 lib/triggers/product_post_trigger.dart
// Detects when a new product is added and calls the social posting logic

void onProductAdded(ProductItem product) {
  final asset = product.video ?? product.image;
  final caption = generateCaption(product);
  PlatformShareService.postToAllPlatforms(asset, caption);
}
