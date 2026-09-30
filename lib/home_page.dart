import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var AllColors = [
      Colors.green,
      Colors.red,
      Colors.blueAccent,
      Colors.blue,
      Colors.amberAccent,
      Colors.amber,
      Colors.black,
      Colors.brown,
      Colors.pinkAccent,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('my Page'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          // Screen width
          double width = constraints.maxWidth;

          // Responsive column number
          int crossAxisCount;

          if (width >= 1000) {
            // Desktop
            crossAxisCount = 3;
          } else if (width >= 600) {
            // Tablet
            crossAxisCount = 2;
          } else {
            // Mobile
            crossAxisCount = 1;
          }

          return GridView.builder(
            padding: const EdgeInsets.all(15),

            itemCount: 3,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,

              crossAxisSpacing: 15,
              mainAxisSpacing: 15,

              // Card height
              childAspectRatio: width < 600
                  ? 1.55
                  : width < 1000
                  ? 1.45
                  : 1.30,
            ),

            itemBuilder: (context, index) {
              final courses = [
                {
                  'image': 'https://images.pexels.com/photos/3769021/pexels-photo-3769021.jpeg',
                  'title': 'Modern PsychologyIES',
                  'selected': true,
                },
                {
                  'image': 'https://images.pexels.com/photos/1370295/pexels-photo-1370295.jpeg',
                  'title': 'Modern Psychology',
                  'selected': false,
                },
                {
                  'image': 'https://images.pexels.com/photos/3861969/pexels-photo-3861969.jpeg',
                  'title': 'Modern Psychology',
                  'selected': false,
                },
              ];

              return CourseCard(
                image: courses[index]['image'] as String,
                title: courses[index]['title'] as String,
                selected: courses[index]['selected'] as bool,
              );
            },
          );
        },
      ),
    );
  }
}

// ==========================
// COURSE CARD
// ==========================

class CourseCard extends StatelessWidget {
  final String image;
  final String title;
  final bool selected;

  const CourseCard({
    super.key,
    required this.image,
    required this.title,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    // Card width অনুযায়ী কিছু size automatically change হবে
    double screenWidth = MediaQuery.of(context).size.width;

    double titleSize;
    double smallTextSize;

    if (screenWidth < 600) {
      titleSize = 17;
      smallTextSize = 11;
    } else if (screenWidth < 1000) {
      titleSize = 15;
      smallTextSize = 10;
    } else {
      titleSize = 14;
      smallTextSize = 9;
    }

    return Container(
      padding: const EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(12),

        // Selected হলে blue border
        border: selected
            ? Border.all(color: Colors.blue, width: 2)
            : Border.all(color: Colors.transparent),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // ==================
          // IMAGE
          // ==================

          Expanded(
            flex: 5,

            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),

              child: Image.network(
                image,

                width: double.infinity,

                fit: BoxFit.cover,

                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade300,

                    child: const Center(
                      child: Icon(Icons.image, size: 45, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 8),

          // ==================
          // TITLE
          // ==================
          Text(
            title,

            maxLines: 1,

            overflow: TextOverflow.ellipsis,

            style: TextStyle(
              fontSize: titleSize,
              fontWeight: FontWeight.w600,
              color: const Color(0xff30305c),
            ),
          ),

          const SizedBox(height: 3),

          // ==================
          // DESIGNATION
          // ==================
          Text(
            'Designation',

            style: TextStyle(fontSize: smallTextSize, color: Colors.grey),
          ),

          const SizedBox(height: 7),

          // ==================
          // BUY BUTTON
          // ==================
          SizedBox(
            height: 28,

            child: ElevatedButton(
              onPressed: () {
                print('Buy Course');
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff20b978),

                foregroundColor: Colors.white,

                elevation: 0,

                padding: const EdgeInsets.symmetric(horizontal: 14),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              child: Text(
                'Buy Course',

                style: TextStyle(fontSize: smallTextSize),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // ==================
          // DATE + SEATS
          // ==================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              // Date
              Expanded(
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      size: 11,
                      color: Colors.grey,
                    ),

                    const SizedBox(width: 4),

                    Expanded(
                      child: Text(
                        'Start 20 April, 2021',

                        maxLines: 1,

                        overflow: TextOverflow.ellipsis,

                        style: TextStyle(
                          fontSize: smallTextSize,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              // Seats
              Row(
                children: [
                  const Icon(
                    Icons.people_outline,
                    size: 12,
                    color: Colors.grey,
                  ),

                  const SizedBox(width: 3),

                  Text(
                    '60 seats',

                    style: TextStyle(
                      fontSize: smallTextSize,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
