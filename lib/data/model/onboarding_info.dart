class OnboardingInfo{// Widget to create each page content
  String title, subtitle, image;

  OnboardingInfo({
  required this.title,
  required this.subtitle,
  required this.image,
  });
}
class OnboardingItem{
  final List<OnboardingInfo> items = [
    OnboardingInfo(
      title: "Welcome to Flutter App",
      subtitle: "Explore the various features we offer.",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdQLwDqDwd2JfzifvfBTFT8I7iKFFevcedYg&s"
    ),
    OnboardingInfo(
      title: "Welcome to Flutter App",
      subtitle: "Explore the various features we offer.",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdQLwDqDwd2JfzifvfBTFT8I7iKFFevcedYg&s"
    ),
    OnboardingInfo(
      title: "Welcome to Flutter App",
      subtitle: "Explore the various features we offer.",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdQLwDqDwd2JfzifvfBTFT8I7iKFFevcedYg&s"
    ),

  ];
}