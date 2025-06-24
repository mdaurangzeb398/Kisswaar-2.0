// seo_product_schema.dart
class SEOProductSchema {
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final String currency;

  SEOProductSchema({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.currency = 'INR',
  });

  Map<String, dynamic> toJSONLD() {
    return {
      "@context": "https://schema.org/",
      "@type": "Product",
      "name": name,
      "image": [imageUrl],
      "description": description,
      "offers": {
        "@type": "Offer",
        "priceCurrency": currency,
        "price": price.toString(),
        "availability": "https://schema.org/InStock",
      }
    };
  }
}
