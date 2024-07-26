import 'package:cabzing/features/filterpage/bloc/filter_bloc.dart';
import 'package:cabzing/features/filterpage/bloc/filter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterBloc(),
      child: FilterScreenView(),
    );
  }
}

class FilterScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Filters',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  context.read<FilterBloc>().add(ToggleVisibilityEvent());
                },
                icon: const Icon(
                  Icons.visibility_outlined,
                  color: Color(0xff0E74F4),
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read<FilterBloc>().add(ApplyFilterEvent());
                },
                child: const Text(
                  'Filter',
                  style: TextStyle(color: Color(0xff0E74F4)),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          const Divider(
            color: Color(0xff1C3347),
          ),
          Center(
            child: Container(
              height: 40,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: const Color(0xff08131E),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'This Month',
                    style: TextStyle(fontSize: 12.0, color: Colors.white),
                  ),
                  SizedBox(width: 10.0),
                  Icon(
                    Icons.arrow_circle_down_sharp,
                    color: Colors.white,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DateContainer(
                date: '12/09/2023',
                onPressed: () {
                  // Example date change event
                  context.read<FilterBloc>().add(ChangeDateEvent(
                        DateTime(2023, 9, 12),
                        DateTime(2023, 9, 27),
                      ));
                },
              ),
              const SizedBox(width: 10.0),
              DateContainer(
                date: '27/09/2023',
                onPressed: () {
                  // Example date change event
                  context.read<FilterBloc>().add(ChangeDateEvent(
                        DateTime(2023, 9, 12),
                        DateTime(2023, 9, 27),
                      ));
                },
              ),
            ],
          ),
          const Divider(
            color: Color(0xff1C3347),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StatusContainer(
                status: 'Pending',
                onPressed: () {
                  context.read<FilterBloc>().add(ChangeStatusEvent('Pending'));
                },
              ),
              const SizedBox(width: 10),
              StatusContainer(
                status: 'Invoiced',
                onPressed: () {
                  context.read<FilterBloc>().add(ChangeStatusEvent('Invoiced'));
                },
              ),
              const SizedBox(width: 10),
              StatusContainer(
                status: 'Cancelled',
                onPressed: () {
                  context
                      .read<FilterBloc>()
                      .add(ChangeStatusEvent('Cancelled'));
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: const Color(0xff08131E),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Customer',
                    style: TextStyle(
                      color: Color(0xffAEAEAE),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color(0xffAEAEAE),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: Color(0xff1C3347),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: const Color(0xff1B2B30),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'saved farooque',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                    SizedBox(width: 10.0),
                    Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DateContainer extends StatelessWidget {
  final String date;
  final VoidCallback onPressed;

  const DateContainer({required this.date, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: const Color(0xff1B2B30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date,
              style: const TextStyle(fontSize: 12.0, color: Colors.white),
            ),
            const SizedBox(width: 10.0),
            const Icon(
              Icons.arrow_circle_down_sharp,
              color: Colors.white,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class StatusContainer extends StatelessWidget {
  final String status;
  final VoidCallback onPressed;

  const StatusContainer({required this.status, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: const Color(0xff1B2B30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.calendar_month,
              color: Colors.white,
              size: 16,
            ),
            const SizedBox(width: 10.0),
            Text(
              status,
              style: const TextStyle(fontSize: 12.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
