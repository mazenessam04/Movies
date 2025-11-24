import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<OnboardItem> pages = [
    OnboardItem(
      image: "assets/images/Movies Posters.png",
      title: "Find Your Next Favorite Movie Here",
      description:
      "Get access to a huge library of movies to suit all tastes. You will surely like it.",
      btn1: "Explore Now",
    ),
    OnboardItem(
      image: "assets/images/xl_848228_477d9240 1.png",
      title: "Discover Movies",
      description:
      "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
      btn1: "Next",
    ),
    OnboardItem(
      image: "assets/images/The Godfather 1.png",
      title: "Explore All Genres",
      description:
      "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
      btn1: "Next",
      btn2: "Back",
    ),
    OnboardItem(
      image: "assets/images/xl_bad-boys-ride-or-die-movie-poster_591dcde0 1.png",
      title: "Create Watchlists",
      description:
      "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
      btn1: "Next",
      btn2: "Back",
    ),
    OnboardItem(
      image: "assets/images/xl_9419884_887ed6c7 1.png",
      title: "Rate, Review, and Learn",
      description:
      "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
      btn1: "Next",
      btn2: "Back",
    ),
    OnboardItem(
      image: "assets/images/1917_-_Sam_Mendes_-_Hollywood_War_Film_Classic_English_Movie_Poster_9ef86295-4756-4c71-bb4e-20745c5fbc1a 1.png",
      title: "Start Watching Now",
      description: '',
      btn1: "Finish",
      btn2: "Back",
    ),
  ];

  void nextPage() {
    if (_currentIndex < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (_currentIndex > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: pages.length,
        onPageChanged: (index) => setState(() => _currentIndex = index),
        itemBuilder: (context, index) {
          final item = pages[index];
          return Stack(
            children: [
              // Background Image
              Positioned.fill(
                child: Image.asset(
                  item.image,
                  fit: BoxFit.cover,
                ),
              ),

              // Black bottom container
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        item.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          height: 1.3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        item.description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Buttons
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (item.btn1 == "Next") {
                              nextPage();
                            } else if (item.btn1 == "Start") {
                              // TODO: Navigate to Home
                            } else if (item.btn1 == "Explore Now") {
                              nextPage();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            item.btn1,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      if (item.btn2 != null) ...[
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () => previousPage(),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.amber),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              item.btn2!,
                              style: const TextStyle(
                                color: Colors.amber,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class OnboardItem {
  final String image;
  final String title;
  final String description;
  final String btn1;
  final String? btn2;

  OnboardItem({
    required this.image,
    required this.title,
    required this.description,
    required this.btn1,
    this.btn2,
  });
}