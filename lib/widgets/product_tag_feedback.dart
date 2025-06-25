void _openMoodSelector(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => ProductTagFeedback(
      productId: product.id,
      onTagSelected: (tag) {
        // call TagFeedbackTracker.recordFeedback(product.id, tag);
        Navigator.pop(context);
      },
    ),
  );
}
