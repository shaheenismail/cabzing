import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'cabZing',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18.0),
        ),
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://yt3.googleusercontent.com/Xv77VwsjfwSCfeqGw5mVnWpwe362H5yFvyTxrILLbpwLHwXJ_r-MDVt93ZhlEQqXg_m0ZRBgjg=s900-c-k-c0x00ffffff-no-rj', // Update with correct image URL
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SAR 2,78,000.00',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '+21% than last month.',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.greenAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Revenue',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const SizedBox(
                height: 200,
                child: CustomLineChart(),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  8,
                  (index) => GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: index == 1 ? Colors.blue : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${index + 1}'.padLeft(2, '0'),
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: const Color(0xff0F0F0F),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Container(
                          height: 95,
                          width: 45,
                          decoration: BoxDecoration(
                              color: const Color(0xffF6EFED),
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Bookings",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              "123",
                              style: TextStyle(
                                fontSize: 22,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Reserved",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Color(0xff565656),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 80.0, right: 15.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: const Color(0xff131313)),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: const Color(0xff0F0F0F),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Container(
                          height: 95,
                          width: 45,
                          decoration: BoxDecoration(
                              color: const Color(0xffA9C9C5),
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Invoices",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              "10,232",
                              style: TextStyle(
                                fontSize: 22,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Reserved",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Color(0xff565656),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 80.0, right: 15.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: const Color(0xff131313)),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomLineChart extends StatelessWidget {
  const CustomLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toString(),
                  style: const TextStyle(color: Colors.white),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(
                  '${value.toInt()}',
                  style: const TextStyle(color: Colors.white),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.white),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(1, 1000),
              FlSpot(2, 3945),
              FlSpot(3, 3000),
              FlSpot(4, 1500),
              FlSpot(5, 2800),
              FlSpot(6, 2500),
              FlSpot(7, 1900),
              FlSpot(8, 1200),
            ],
            isCurved: true,
            // colors: [Colors.blue],
            barWidth: 2,
            dotData: const FlDotData(show: false),
          ),
        ],
      ),
    );
  }
}
