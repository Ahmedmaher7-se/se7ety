import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/routes/navigation.dart';
import 'package:se7ety/core/routes/routes.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_styles.dart';
import 'package:se7ety/features/patient/home/presentation/widgets/specialists_widget.dart';
import 'package:se7ety/features/patient/home/presentation/widgets/top_rated_widget.dart';

class PatientHomeScreen extends StatefulWidget {
  const PatientHomeScreen({super.key});

  @override
  State<PatientHomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<PatientHomeScreen> {
  final TextEditingController _doctorName = TextEditingController();
  User? user;

  Future<void> _getUser() async {
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_active,
              color: AppColors.darkColor,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        title: Text(
          'صــــــحّـتــي',
          style: TextStyles.title.copyWith(color: AppColors.darkColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'مرحبًا، ', style: TextStyles.body),
                    TextSpan(
                      text: user?.displayName ?? '',
                      style: TextStyles.title.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Text(
                "احجز الآن وكن جزءًا من رحلتك الصحية.",
                style: TextStyles.title.copyWith(
                  color: AppColors.darkColor,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 20),

              // --------------- Search Bar --------------------------
              Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.3),
                      blurRadius: 15,
                      offset: const Offset(5, 5),
                    ),
                  ],
                ),
                child: TextFormField(
                  textInputAction: TextInputAction.search,
                  controller: _doctorName,
                  cursorColor: AppColors.primaryColor,
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    hintStyle: TextStyles.body,
                    filled: true,
                    hintText: 'ابحث عن دكتور',
                    suffixIcon: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: IconButton(
                        iconSize: 20,
                        splashRadius: 20,
                        color: Colors.white,
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          if (_doctorName.text.isNotEmpty) {
                            pushTo(
                              context,
                              Routes.homeSearch,
                              extra: _doctorName.text,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  style: TextStyles.body,
                  onFieldSubmitted: (String value) {
                    if (_doctorName.text.isNotEmpty) {
                      pushTo(
                        context,
                        Routes.homeSearch,
                        extra: _doctorName.text,
                      );
                    }
                  },
                ),
              ),

              const SizedBox(height: 20),

              // ----------------  SpecialistsWidget --------------------,
              const SpecialistsBanner(),
              const SizedBox(height: 10),

              // ----------------  Top Rated --------------------,
              Text(
                "الأعلي تقييماً",
                textAlign: TextAlign.center,
                style: TextStyles.title.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const TopRatedList(),
            ],
          ),
        ),
      ),
    );
  }
}
