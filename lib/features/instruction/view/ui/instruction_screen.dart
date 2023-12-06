import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manowa_apps/configs/themes/app_colors.dart';
import 'package:manowa_apps/constants/core/image_assets_const.dart';
import 'package:manowa_apps/features/instruction/controllers/instruction_controller.dart';
import 'package:manowa_apps/shared/widgets/custom_button_widget.dart';
import 'package:manowa_apps/shared/widgets/my_scaffold_widget.dart';

class InstructionScreen extends StatelessWidget {
  const InstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = InstructionController.to;
    return MyScaffoldWidget(
      bgImage: ImageAssetsConst.bgApps,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Image.asset(
              ImageAssetsConst.drawPetunjuk,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: RawScrollbar(
              padding: EdgeInsets.only(right: 4.w),
              thumbColor: Colors.black54,
              thumbVisibility: true,
              thickness: 6.0,
              radius: Radius.circular(12.r),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 10.h,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 12.h,
                    ),
                    const _TextWidget(
                      """1. Permainan ini dimainkan oleh dua orang."""
                      """ Masing-masing pemain mendapatkan 10 pion untuk bermain"""
                      """ dan terdapat2 pion untuk diletakkan di kolom soal """,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    const _TextWidget(
                      """2. MaNoWa terdiri dari dua bagian, """
                      """sisi kiri dan sisi kanan Pada sisi kiri terdapat """
                      """kolom untuk bermain dan sisi kanan terdapat lingkaran sudut """
                      """istimewa untuk membantu scat bermain. """,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 100.w),
                      child: GestureDetector(
                        onTap: () {
                          controller.onTapImage(
                            ImageAssetsConst.drawExampleInstruction,
                          );
                        },
                        child: Image.asset(
                          ImageAssetsConst.drawExampleInstruction,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    const _TextWidget(
                      """3. Untuk memulai permainan, """
                      """kedua pemain melakukan suit untuk menentukan """
                      """siapa yang bermain terlebih dahulu. """,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    const _TextWidget(
                      """4. Pemain yang menang saat suit berhak meletakkan 2 """
                      """pion secara bebas pada Kolom Trigonometri (memilih sin atau cos) """
                      """serta pada Kolom Sudut Istimewa untuk pertama kalinya. """
                      """Selanjutnya pemain berhak meletakkan pion pada jawaban yang tepat. """
                      """Misalnya, pemain pertama meletakkan satu pion pada kolom sin, """
                      """satu pion pada sudut 180°, lalu meletakkan satu pion pada kolom """
                      """jawaban yakni 0. """,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    const _TextWidget(
                      """4. Pemain yang menang saat suit berhak meletakkan 2 """
                      """pion secara bebas pada Kolom Trigonometri (memilih sin atau cos) """
                      """serta pada Kolom Sudut Istimewa untuk pertama kalinya. """
                      """Selanjutnya pemain berhak meletakkan pion pada jawaban yang tepat. """
                      """Misalnya, pemain pertama meletakkan satu pion pada kolom sin, """
                      """satu pion pada sudut 180°, lalu meletakkan satu pion pada kolom """
                      """jawaban yakni 0. """,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    const _TextWidget(
                      """5. Kemudian, pemain kedua memiliki opsi untuk memindahkan """
                      """pion pada kolom sin atau cos dan juga pada kolom sudut istimewa. """
                      """Misalnya, pemain kedua memindahkan pion dari kotak sin ke kotak cos, """
                      """kemudian pion dari sudut 30 ke sudut cos 60. Pemain kedua juga berhak """
                      """melakukan urutan permainan yang sama seperti pemain pertama. """,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    const _TextWidget(
                      """6. Permainan akan terus berlanjut sampai didapatkan pemenang. """
                      """Pemenang dalam permainan ini adalah pemain yang berhasil menempatkan"""
                      """ 4 pion secara berurutan baik secara vertikal, horizontal, """
                      """atau diagonal pada kolom jawaban.""",
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 25.w),
            child: Align(
              alignment: Alignment.centerRight,
              child: CustomButtonWidget.v3(
                onTap: () {
                  Get.back();
                },
                text: 'MENU',
                minHeight: 20.h,
                minWidth: 100.w,
                fontSize: 24.w,
                customContentPadding: EdgeInsets.fromLTRB(
                  30.w,
                  5,
                  30.w,
                  20.h,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 28.h,
          ),
        ],
      ),
    );
  }
}

class _TextWidget extends StatelessWidget {
  final String text;
  const _TextWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        height: 1.4,
        backgroundColor: AppColors.yellow,
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
        // backgroundColor: Colors.white,
      ),
    );
  }
}
