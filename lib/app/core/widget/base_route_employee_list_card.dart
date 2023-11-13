import 'package:flutter/material.dart';

import '../values/font_manager.dart';
import 'base_route_employee_card.dart';
import '../../data/model/employee.dart';
import '../values/strings_manager.dart';
import 'custom_text_widgets.dart';

class BaseRouteEmployeeListCard extends StatelessWidget {
  const BaseRouteEmployeeListCard({
    super.key,
    required this.employeeList,
  });

  final List<Employee> employeeList;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        textColor: Colors.black,
        collapsedTextColor: Colors.black,
        collapsedIconColor: Colors.black,
        iconColor: Colors.black,
        title: const CustomText(
          text: AppStrings.employees,
          style: TextStyle(
            fontWeight: FontWeightManager.bold,
          ),
        ),
        children: employeeList
            .map((employee) => BaseRouteEmployeeCard(employee: employee))
            .toList(),
      ),
    );
  }
}
