import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header(),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SectionTitle(title: 'My Courses', subTitle: 'View All'),
                              const SizedBox(height: 10),
                              Expanded(
                                child: GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 2.8,
                                  ),
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return CourseCard(
                                      title: ['French', 'Portuguese', 'Italian', 'German'][index],
                                      percentage: [.7, .5, .2, .8][index],
                                      percentageIndicator: ['75%', '50%', '25%', '81%'][index],
                                      subTitle: ['30 lessons', '40 lessons', '10 lessons', '30 lessons'][index],
                                      icon: Icons.countertops_rounded,
                                      color: [
                                        Colors.blue,
                                        Colors.orange,
                                        Colors.lightGreen,
                                        Colors.amber.shade400,
                                      ][index],
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              const SectionTitle(title: 'Planning', subTitle: 'View All',),
                              const SizedBox(height: 10),
                              Expanded(
                                child: GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 6),
                                  itemCount: 8,
                                  itemBuilder: (context, index) {
                                    return PlanningCard(
                                      title: 'Reading: Beginner Topic ${index + 1}',
                                      icon: [
                                        Icons.edit,
                                        Icons.headphones,
                                        Icons.volume_down_sharp,
                                        Icons.book_outlined,
                                        Icons.edit,
                                        Icons.phone_android_sharp,
                                        Icons.volume_down_sharp,
                                        Icons.headphones,
                                      ][index],
                                      containerColor: [
                                        Colors.blue.shade100,
                                        Colors.orange.shade100,
                                        Colors.lightGreen.shade100,
                                        Colors.amber.shade100,
                                        Colors.lightGreen.shade100,
                                        Colors.blue.shade100,
                                        Colors.amber.shade100,
                                        Colors.orange.shade100,
                                      ][index],
                                      iconColor: [
                                        Colors.blue,
                                        Colors.orange,
                                        Colors.lightGreen,
                                        Colors.amber.shade400,
                                        Colors.lightGreen,
                                        Colors.blue,
                                        Colors.amber.shade400,
                                        Colors.orange,
                                      ][index],
                                      time: ['8:00AM - 10:00 AM','03:00PM - 04:00 PM','01:00PM - 02:00 PM','07:00 PM - 08:00 PM',
                                          '8:00AM - 12:00 PM','8:00AM - 10:00 AM','8:00AM - 12:00 PM','8:00AM - 12:00 PM'][index],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        const VerticalDivider(
                          color: Colors.black12,
                          thickness: 1,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                'Statistics',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Expanded(
                                  child: GridView.builder(
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: 1.6,
                                      ),
                                      itemCount: 4,
                                      itemBuilder: (context, index) {
                                        return StatisticsCard(
                                          title: ['Courses', 'Total Points', 'Courses', 'Tasks'][index],
                                          subTitle: ['Completed', 'Gained', 'InProgress', 'Finished'][index],
                                          count: ['01', '250', '03', '05'][index],
                                        );
                                      })),
                              const SizedBox(height: 20),
                              const ActivityChart(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(
              5.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ),
      child: const Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.language,
                color: Colors.blue,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'SET-T',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'OverView',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.book,
                      color: Colors.black26,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Courses',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black26,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.message,
                      color: Colors.black26,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Message',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black26,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.black26,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Setting',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black26,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Text('Upgrade your plan', style: TextStyle(color: Colors.blue)),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Hello BRUNO, welcome back!',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF368FFF)
          ),
        ),
        CircleAvatar(
          backgroundImage: NetworkImage('https://via.placeholder.com/150'),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String subTitle;

  const SectionTitle({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 4),
        Text(subTitle,style: const TextStyle(fontSize: 10,color: Color(0xFF368FFF)))
      ],
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String percentageIndicator;
  final double percentage;
  final IconData icon;
  final Color color;

  const CourseCard({super.key,
    required this.title,
    required this.subTitle,
    required this.percentage,
    required this.percentageIndicator,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  subTitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                CircularPercentIndicator(
                  radius: 20,
                  backgroundColor: Colors.black12,
                  lineWidth: 6.0,
                  percent: percentage,
                  center: Text(
                    percentageIndicator,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  progressColor: Colors.white,
                )
              ],
            ),
            Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class PlanningCard extends StatelessWidget {
  final String title;
  final String time;
  final IconData icon;
  final Color iconColor;
  final Color containerColor;

  const PlanningCard({super.key,
    required this.title,
    required this.time,
    required this.icon,
    required this.iconColor,
    required this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade100,
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: ListTile(
        leading: Container(
          height: 30,
          width: 50,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: containerColor),
          child: Icon(icon, color: iconColor),
        ),
        title:  Row(
          children: [
            Text(title),
          ],
        ),
        subtitle: Text(time),
        trailing : const Icon(Icons.more_vert_outlined)
      ),
    );
  }
}

class StatisticsCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String count;

  const StatisticsCard({super.key, required this.title, required this.subTitle, required this.count});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            Text(
              subTitle,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('|', style: TextStyle(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold)),
                Text(count, style: const TextStyle(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityChart extends StatelessWidget {
  const ActivityChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Activity',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                borderData: FlBorderData(show: false),
                barGroups: [
                  for (int i = 0; i < 7; i++)
                    BarChartGroupData(
                      x: i,
                      barRods: [
                        BarChartRodData(
                          toY: (i + 1) * 2.0,
                          color: Colors.blue,
                          width: 10,
                        ),
                      ],
                    )
                ],
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                        return Text(
                          days[value.toInt()],
                          style: const TextStyle(fontSize: 12),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
