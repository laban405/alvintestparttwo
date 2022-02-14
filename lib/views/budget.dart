import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Budget extends StatefulWidget {
  const Budget({Key? key}) : super(key: key);

  @override
  _BudgetState createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  var _tabTextIndexSelected = 0;

  final _listTextTabToggle = ["Essentials", "Wants", "Savings"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(2.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title(),
              toggleButtons(),
              SizedBox(
                height: 2.0.h,
              ),
              budgetSummary(),
              budgetItem(itemName: "Groceries",itemIcon: Icons.shopping_basket_outlined),
              budgetItem(itemName: "Transport",itemIcon: Icons.directions_bus_outlined),
              budgetItem(itemName: "Healthcare",itemIcon: Icons.health_and_safety),
              budgetItem(itemName: "Other",itemIcon: Icons.monetization_on_outlined),
            ],
          ),
        ),
      )),
    );
  }

  Widget title() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0.0.w,
        3.0.w,
        4.0.w,
        5.0.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Monthly budget',
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontSize: 16.0.sp,
                ),
          ),
          Icon(
            Icons.info_rounded,
            size: 8.0.w,
            color: const Color(0xffA9C4D1),
          ),
        ],
      ),
    );
  }

  Widget toggleButtons() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        1.0.w,
        0.0.w,
        1.0.w,
        0.0.w,
      ),
      child: FlutterToggleTab(
        unSelectedBackgroundColors: const [Color(0xffF0F5F6)],
        marginSelected: EdgeInsets.all(
          1.0.w,
        ),
        width: 90,
        borderRadius: 3.0.w,
        height: 6.0.h,
        selectedIndex: _tabTextIndexSelected,
        selectedBackgroundColors: const [Colors.white],
        selectedTextStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 12.0.sp,
            color: Theme.of(context).colorScheme.primary),
        unSelectedTextStyle: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontSize: 12.0.sp, color: const Color(0xff778AA3)),
        labels: _listTextTabToggle,
        selectedLabelIndex: (index) {
          setState(() {
            _tabTextIndexSelected = index;
          });
        },
        isScroll: true,
      ),
    );
  }

  Widget budgetSummary() {
    return Padding(
      padding: EdgeInsets.all(2.0.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              0.0.w,
              1.0.w,
              4.0.w,
              5.0.w,
            ),
            child: Stack(
              children: [
                LinearPercentIndicator(
                  width: 88.0.w,
                  lineHeight: 1.5.h,
                  percent: 0.5,
                  backgroundColor: const Color(0xffA9C4D1),
                  progressColor: const Color(0xff759FB5),
                ),
                LinearPercentIndicator(
                  width: 88.0.w,
                  lineHeight: 1.5.h,
                  percent: 0.2,
                  backgroundColor: const Color(0xffA9C4D1).withOpacity(0),
                  progressColor: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                width: 4.0.w,
                height: 4.0.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  ' KES 24,000 spent',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      fontSize: 12.0.sp,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
              Container(
                width: 4.0.w,
                height: 4.0.w,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff759FB5)),
              ),
              Text(
                ' KES 5,000 available    ',
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    fontSize: 12.0.sp,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
          SizedBox(
            height: 3.0.w,
          ),
          Row(
            children: [
              Container(
                width: 4.0.w,
                height: 4.0.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffA2C0CD),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  ' KES 5,000 unallocated',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      fontSize: 12.0.sp,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget budgetItem({itemName,itemIcon}) {
    return Card(
      margin: EdgeInsets.fromLTRB(
        0.0.w,
        2.0.w,
        0.0.w,
        2.0.w,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          2.0.w,
          2.0.w,
          2.0.w,
          5.0.w,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    3.0.w,
                    3.0.w,
                    5.0.w,
                    3.0.w,
                  ),
                  child: Icon(
                    itemIcon,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    '$itemName',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    3.0.w,
                    3.0.w,
                    0.0.w,
                    3.0.w,
                  ),
                  child:  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: const Color(0xffA9C4D1),
                    size: 5.0.w,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                0.0.w,
                1.0.w,
                4.0.w,
                5.0.w,
              ),
              child: LinearPercentIndicator(
                width: 88.0.w,
                lineHeight: 0.75.h,
                percent: 0.125,
                backgroundColor: const Color(0xffA9C4D1),
                progressColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            Row(
              children: [
                Container(
                  width: 4.0.w,
                  height: 4.0.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    ' KES 24,000 spent',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(fontSize: 11.0.sp),
                  ),
                ),
                Container(
                  width: 4.0.w,
                  height: 4.0.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffA9C4D1)),
                ),
                Text(
                  ' KES 5,000 available    ',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontSize: 11.0.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
