import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_management_user/constants.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class ComplientScreen extends StatefulWidget {
  const ComplientScreen({super.key});

  @override
  State<ComplientScreen> createState() => _ComplientScreenState();
}

class _ComplientScreenState extends State<ComplientScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor.withOpacity(0.8),
        iconTheme: const IconThemeData(color: kWhiteColor),
        title: Text(
          'Complients',
          style: GoogleFonts.karla(color: kWhiteColor),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(const AddComplientSheet());
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(56.0)),
        child: const Icon(Iconsax.add),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  child: Text(
                    'Pending',
                    style: GoogleFonts.karla(),
                  ),
                ),
                Tab(
                  child: Text(
                    'Resolved',
                    style: GoogleFonts.karla(),
                  ),
                )
              ],
              controller: _tabController,
            ),
            const SizedBox(height: 12.0),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.separated(
                    padding: const EdgeInsets.all(16.0),
                    separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: kPrimaryColor.withOpacity(0.2)),
                        child: Text(index.toString()),
                      );
                    },
                    itemCount: 12,
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.all(16.0),
                    separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: kPrimaryColor.withOpacity(0.2)),
                        child: Text(index.toString()),
                      );
                    },
                    itemCount: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddComplientSheet extends StatefulWidget {
  const AddComplientSheet({super.key});

  @override
  State<AddComplientSheet> createState() => _AddComplientSheetState();
}

class _AddComplientSheetState extends State<AddComplientSheet> {
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _titkeKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _descriptionKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(16.0),
      constraints: BoxConstraints(maxHeight: Get.height * 0.6),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16.0)),
        color: kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Create Complient',
            style: GoogleFonts.poppins(fontSize: 32.0),
          ),
          const SizedBox(height: 32.0),
          Form(
              key: _globalFormKey,
              child: Column(
                children: [
                  TextFormField(
                    key: _titkeKey,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (val) {
                      _titkeKey.currentState!.validate();
                    },
                    decoration: InputDecoration(
                        errorMaxLines: 2,
                        labelText: 'Title',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0))),
                    validator: (val) => val!.isEmpty
                        ? 'Please enter a valid title, Title\'s helps management to respond to your complient faster'
                        : null,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    maxLines: 4,
                    key: _descriptionKey,
                    onFieldSubmitted: (val) {
                      _descriptionKey.currentState!.validate();
                    },
                    decoration: InputDecoration(
                        labelText: 'Description',
                        errorMaxLines: 2,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0))),
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter a valid complient' : null,
                  ),
                  const SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: kPrimaryColor.withOpacity(0.2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0))),
                        onPressed: () async {
                          ImagePicker picker = ImagePicker();
                          XFile? image = await picker.pickImage(
                              source: ImageSource.gallery);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Iconsax.image4, size: 18.0),
                            const SizedBox(width: 8.0),
                            Text(
                              'Image',
                              style: GoogleFonts.poppins(),
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(height: 32.0),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          if (_globalFormKey.currentState!.validate()) {}
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            backgroundColor: kPrimaryColor.withOpacity(0.8),
                            fixedSize: Size(Get.width * 0.9, 56.0)),
                        child: Text(
                          'Submit',
                          style: GoogleFonts.karla(color: kWhiteColor),
                        )),
                  ),
                  const SizedBox(height: 24.0),
                ],
              ))
        ],
      ),
    );
  }
}
