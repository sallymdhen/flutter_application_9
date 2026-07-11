class NotificationModel {
  final String title;
  final String subtitle;
  final String time;
  final String imagePath;
  final String? originalPrice;
  final String? discountedPrice;
  final bool isCard;

  NotificationModel({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.imagePath,
    this.originalPrice,
    this.discountedPrice,
    this.isCard = false,
  });

  static List<NotificationModel> getRecentNotifications() {
    return [
      NotificationModel(
        title: 'Thanks you for purchasing',
        subtitle: 'Your order will be shipped in 2-4 days',
        time: '7 min ago',
        imagePath: 'assets/image/tshirt2.png',
        isCard: true,
      ),
      NotificationModel(
        title: 'We Have New Products With Offers',
        subtitle: '',
        time: '40 min ago',
        imagePath: 'assets/image/tshirt1.png',
        originalPrice: '\$260.00',
        discountedPrice: '\$364.95',
        isCard: false,
      ),
    ];
  }

  static List<NotificationModel> getYesterdayNotifications() {
    return [
      NotificationModel(
        title: 'We Have New Products With Offers',
        subtitle: '',
        time: '40 min ago',
        imagePath: 'assets/image/tshirt1.png',
        originalPrice: '\$260.00',
        discountedPrice: '\$364.95',
        isCard: false,
      ),
      NotificationModel(
        title: 'We Have New Products With Offers',
        subtitle: '',
        time: '40 min ago',
        imagePath: 'assets/image/tshirt3.png',
        originalPrice: '\$260.00',
        discountedPrice: '\$364.95',
        isCard: false,
      ),
    ];
  }
}
