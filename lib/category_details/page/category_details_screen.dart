import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryDetailsScreen extends StatefulWidget {
  const CategoryDetailsScreen({super.key});

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  Map categoryDetails = {
    "status": true,
    "message": null,
    "data": {
      "current_page": 1,
      "data": [
        {
          "id": 52,
          "price": 25000,
          "old_price": 25000,
          "discount": 0,
          "image":
              "https://student.valuxapps.com/storage/uploads/products/1615440322npwmU.71DVgBTdyLL._SL1500_.jpg",
          "name": "Apple iPhone 12 Pro Max 256GB 6 GB RAM, Pacific Blue",
          "description":
              "DISPLAY\r\nSize: 6.7 inches\r\nResolution: 2778 x 1284 pixels, 458 PPI\r\nTechnology: OLED\r\nScreen-to-body: 87.45 %\r\nPeak brightness: 1200 cd/m2 (nit)\r\nFeatures: HDR video support, Oleophobic coating, Scratch-resistant glass (Ceramic Shield), Ambient light sensor, Proximity sensor\r\nHARDWARE\r\nSystem chip: Apple A14 Bionic\r\nProcessor: Hexa-core, 64-bit, 5 nm\r\nGPU: Yes\r\nRAM: 6GB LPDDR5\r\nInternal storage: 128GB (NVMe), not expandable\r\nDevice type: Smartphone\r\nOS: iOS (14.x)\r\nBATTERY\r\nType: Li - Ion, Not user replaceable\r\nCharging: USB Power Delivery, Qi wireless charging, MagSafe wireless charging\r\nMax charge speed: Wireless: 15.0W\r\nCAMERA\r\nRear: Triple camera\r\nMain camera: 12 MP (OIS, PDAF)\r\nSpecifications: Aperture size: F1.6; Focal length: 26 mm; Pixel size: 1.7 μm\r\nSecond camera: 12 MP (Telephoto, OIS, PDAF)\r\nSpecifications: Optical zoom: 2x; Aperture size: F2.2; Focal Length: 65 mm\r\nThird camera: 12 MP (Ultra-wide)\r\nSpecifications: Aperture size: F2.4; Focal Length: 13 mm\r\nVideo recording: 3840x2160 (4K UHD) (60 fps), 1920x1080 (Full HD) (240 fps), 1280x720 (HD) (30 fps)\r\nFeatures: OIS, HDR, Time-lapse video, Continuous autofocus, Picture-taking during video recording, Video light\r\nFront: 12 MP (Time-of-Flight (ToF), EIS, HDR, Slow-motion videos)\r\nVideo capture: 3840x2160 (4K UHD) (60 fps)\r\nDESIGN\r\nDimensions: 6.33 x 3.07 x 0.29 inches (160.84 x 78.09 x 7.39 mm)\r\nWeight: 8.03 oz (228.0 g)\r\nMaterials: Back: Glass; Frame: Stainless steel\r\nMaterials & Colors: Pacific Blue\r\nResistance: Water, Splash, Dust; IP68\r\nBiometrics: 3D Face unlock\r\nKeys: Left: Volume control, Other; Right: Lock/Unlock key\r\nCELLULAR\r\n5G: n1, n2, n3, n5, n7, n8, n12, n20, n25, n28, n38, n40, n41, n66, n71, n77, n78, n79, n260, n261, Sub-6, mmWave\r\nLTE (FDD): Bands 1(2100), 2(1900), 3(1800), 4(AWS-1), 5(850), 7(2600), 8(900), 12(700 a), 13(700 c), 14(700 PS), 17(700 b), 18(800 Lower), 19(800 Upper), 20(800 DD), 25(1900+), 26(850+), 28(700 APT), 29(700 d), 30(2300 WCS), 32(1500 L-band), 66(AWS-3), 71(600)\r\nLTE (TDD): Bands 34(2000), 38(2600), 39(1900+), 40(2300), 41(2600+), 42(3500), 46, 48(3600)\r\nUMTS: 850, 900, 1700/2100, 1900, 2100 MHz\r\nData Speed: LTE-A, HSDPA+ (4G) 42.2 Mbit/s, HSUPA 5.76 Mbit/s, UMTS\r\nDual SIM: Yes\r\nSIM type: Nano SIM, eSIM\r\nHD Voice: Yes\r\nVoLTE: Yes\r\nMULTIMEDIA\r\nHeadphones: No 3.5mm jack\r\nSpeakers: Earpiece, Loudspeaker\r\nFeatures: Dolby Atmos\r\nScreen mirroring: Wireless screen share\r\nAdditional microphone(s): for Noise cancellation\r\nCONNECTIVITY & FEATURES\r\nBluetooth: 5.0\r\nWi-Fi: 802.11 a, b, g, n, ac, ax (Wi-Fi 6), dual-band; MIMO, Wi-Fi Direct, Hotspot\r\nUSB: Lightning\r\nFeatures: Charging, Headphones port\r\nLocation: GPS, A-GPS, Glonass, Galileo, BeiDou, QZSS, Cell ID, Wi-Fi positioning\r\nSensors: Accelerometer, Gyroscope, Compass, Barometer, LiDAR scanner\r\nOther: NFC, UMA (Wi-Fi Calling)\r\nHearing aid compatible: M3, T4\r\nBrand : Apple\r\nColor : Pacific Blue\r\nOperating System Type : iOS\r\nStorage Capacity : 128GB\r\nNumber Of SIM : Single SIM & E-SIM\r\nRear Camera Resolution : 12 megapixels\r\nMobile Phone Type : Mobile Phone\r\nCellular Network Technology : 5G\r\nChipset manufacturer : Apple\r\nDisplay Size (Inch) : 6.7 inches\r\nModel Number : iPhone 12 Pro Max\r\nBattery Capacity in mAh : 3,687mAh\r\nFast Charge : Yes\r\nMemory RAM : 6 GB",
          "images": [
            "https://student.valuxapps.com/storage/uploads/products/1615440322UAwSF.81KcqNGQIsL._SL1500_.jpg",
            "https://student.valuxapps.com/storage/uploads/products/1615440322UjY4o.71DVgBTdyLL._SL1500_.jpg"
          ],
          "in_favorites": false,
          "in_cart": false
        },
        {
          "id": 53,
          "price": 5599,
          "old_price": 10230,
          "discount": 45,
          "image":
              "https://student.valuxapps.com/storage/uploads/products/1615440689wYMHV.item_XXL_36330138_142814934.jpeg",
          "name":
              "JBL Xtreme 2 Portable Waterproof Bluetooth Speaker - Blue JBLXTREME2BLUAM",
          "description":
              "GENERAL SPECIFICATIONS\r\nMusic playing time: 15 hours\r\nOutput power (W): 2 x 20\r\nDIMENSIONS\r\nDimensions: 13.6 x 28.8 x 13.2 centimeters\r\nWeight: 2.39 kilograms\r\nCONTROL AND CONNECTION SPECIFICATIONS\r\nBluetooth version: 4.2\r\nBATTERY\r\nBattery capacity: 10000 mAh\r\nCharging time: 3.5 hours\r\nFEATURES\r\n3.5 mm audio cable Input: Yes\r\nAuto power off: Yes\r\nBluetooth: Yes\r\nJBL Connect+: Yes\r\nPower bank: Yes\r\nSpeakerphone: Yes\r\nVoice Assistant: Yes\r\nWaterproof: Yes",
          "images": [
            "https://student.valuxapps.com/storage/uploads/products/1615440689Oojt6.item_XXL_36330138_142814947.jpeg",
            "https://student.valuxapps.com/storage/uploads/products/16154406895ynKU.item_XXL_36330138_142814944.jpeg",
            "https://student.valuxapps.com/storage/uploads/products/1615440689MjvIY.item_XXL_36330138_142814940.jpeg",
            "https://student.valuxapps.com/storage/uploads/products/1615440689QITsu.item_XXL_36330138_142814934.jpeg"
          ],
          "in_favorites": true,
          "in_cart": false
        },
        {
          "id": 54,
          "price": 11499,
          "old_price": 12499,
          "discount": 8,
          "image":
              "https://student.valuxapps.com/storage/uploads/products/1615441020ydvqD.item_XXL_51889566_32a329591e022.jpeg",
          "name":
              "Samsung 65 Inch Smart TV 4K Ultra HD Curved - UA65RU7300RXUM",
          "description":
              "Brand: Samsung\r\nColor: black\r\nModel: UA65RU7300\r\nType: Curve\r\nSize: 65 inch\r\nHDMI: 3\r\nUSB: 2\r\nSmart: Yes\r\nOne Remote: Yes\r\nResolution: 3,840 x 2,160\r\nWeight: 25.0 kg\r\nDimensions (WxHxD): 145.27 x 83.81 x 12.09 cm\r\nAI Upscale: N/A\r\nSmart View: Yes",
          "images": [
            "https://student.valuxapps.com/storage/uploads/products/1615441020SnVry.item_XXL_51889566_32a329591e022.jpeg",
            "https://student.valuxapps.com/storage/uploads/products/1615441020mgFw2.item_XXL_51889566_8dbac7d5b2039.jpeg"
          ],
          "in_favorites": false,
          "in_cart": false
        },
        {
          "id": 55,
          "price": 44500,
          "old_price": 44500,
          "discount": 0,
          "image":
              "https://student.valuxapps.com/storage/uploads/products/1615442168bVx52.item_XXL_36581132_143760083.jpeg",
          "name": "Apple MacBook Pro",
          "description":
              "Bring home the Apple MacBook Pro and experience computing like never before. This Apple laptop features a powerful 2.3Ghz 8th Gen-Intel Core i5 processor that makes sure the system keeps performing efficiently. Experience smooth and fast multitasking with the 8GB RAM. The Intel Iris Plus Graphics render images in high-quality and make your gaming experience a pleasing one. The macOS operating system offers various user-friendly features. Store your movies, audios, and other important files comfortably on the 512GB SSD of this device. The 13.3inch display allows you to view your favorite movies and other content in high quality. The Retina display features bright LED backlighting and a high contrast ratio that enhances your viewing experience. The True Tone technology provides a natural viewing experience by adjusting the white balance of the screen as per the color temperature of the light around. Featuring well-balanced, high-fidelity sounds, this laptop delivers an immersive audio experience. The Apple T2 chip lets you store your data in an encrypted format with the help of its Secure Enclave coprocessor. Also, it tightens the security further with the help of the Touch ID. The Touch ID only allows you to unlock your laptop using your fingerprints. The Touch Bar controls simplify various activities such as sending an email or formatting a document. This lightweight laptop can be easily carried around in your backpack. It features a space grey that gives it a distinguished and beautiful look.",
          "images": [
            "https://student.valuxapps.com/storage/uploads/products/1615442168ijV8V.item_XXL_36581132_143760083.jpeg",
            "https://student.valuxapps.com/storage/uploads/products/161544216881jxI.item_XXL_36581132_143760084.jpeg",
            "https://student.valuxapps.com/storage/uploads/products/1615442168uZNcz.item_XXL_36581132_143760087.jpeg",
            "https://student.valuxapps.com/storage/uploads/products/1615442168VnIxG.item_XXL_36581132_143760088.jpeg"
          ],
          "in_favorites": false,
          "in_cart": false
        },
        {
          "id": 56,
          "price": 32860,
          "old_price": 35000,
          "discount": 6,
          "image":
              "https://student.valuxapps.com/storage/uploads/products/1615450256e0bZk.item_XXL_7582156_7501823.jpeg",
          "name":
              "Nikon FX-format D750 - 24.3 MP, SLR Camera 24-120mm Lens, Black",
          "description":
              "The Nikon FX Format D750 SLR Camera comes loaded with an array of advanced features that provide total control, enabling you to capture life’s fleeting moments in their purest form. The compact camera comes with 24 to 120mm NIKKOR lens that is perfect for capturing portraits, landscapes, and weddings. Even though this imaging device is small and lightweight, it does not compromise on performance. The device’s impressive 24.3MP CMOS image sensor and EXPEED 4 engine provide you with the ability to shoot stellar photos and videos, even in low light conditions. The sleek black camera’s movie shooting menu with preset control settings make it possible to record 1080/60p Full HD movies with reduced moiré and minimal jaggies. The SLR camera’s 3.2inch tilting TFT LCD monitor has a resolution of approximately 1229K dots. It makes it convenient for you to compose shots from tricky angles or playback the captured footage. The device’s built in WiFi simplifies on the spot sharing of your images and videos with the world. The inclusion of all these and several other sought after features make the Nikon D750 perfect for pro and semi pro photographers alike.",
          "images": [
            "https://student.valuxapps.com/storage/uploads/products/1615450256RlWor.item_XXL_7582156_7501823.jpeg",
            "https://student.valuxapps.com/storage/uploads/products/1615450256gJZZG.item_XXL_7582156_7501825.jpeg",
            "https://student.valuxapps.com/storage/uploads/products/1615450256R7y4x.item_XXL_7582156_7501827.jpeg",
            "https://student.valuxapps.com/storage/uploads/products/1615450256NMmZ7.item_XXL_7582156_7501828.jpeg",
            "https://student.valuxapps.com/storage/uploads/products/1615450256zSjsY.item_XXL_7582156_7501830.jpeg",
            "https://student.valuxapps.com/storage/uploads/products/1615450256CbCNI.item_XXL_7582156_7501832.jpeg"
          ],
          "in_favorites": true,
          "in_cart": false
        },
        {
          "id": 57,
          "price": 530,
          "old_price": 530,
          "discount": 0,
          "image":
              "https://student.valuxapps.com/storage/uploads/products/1615451352LMOAF.item_XXL_23705724_34135503.jpeg",
          "name":
              "Kingston A400 Internal SSD 2.5\" 240GB SATA 3 - SA400S37/240G",
          "description":
              "Brand : kingston\r\nStorage Capacity : 240 GB\r\nCompatible operating systems : Windows\r\nInterface Type : SATA\r\nDrive Type : SSD\r\nStorage Device Use : Internal Laptop\r\nModel Number : SA400S37/240G",
          "images": [
            "https://student.valuxapps.com/storage/uploads/products/16154513529ml4b.item_XXL_23705724_34135503.jpeg",
            "https://student.valuxapps.com/storage/uploads/products/1615451352LKVSq.item_XXL_23705724_34135507.jpeg"
          ],
          "in_favorites": false,
          "in_cart": false
        },
        {
          "id": 82,
          "price": 3075.260000000000218278728425502777099609375,
          "old_price": 3075.260000000000218278728425502777099609375,
          "discount": 0,
          "image":
              "https://student.valuxapps.com/storage/uploads/products/1638734961565J3.11.jpg",
          "name":
              "Xiaomi Redmi 10 Dual SIM Mobile- 6.53 Inch FHD , 64GB, 4GB RAM, 4G LTE - Carbon Gray",
          "description":
              "Model name\tXiaomi Redmi 10\r\nWireless carrier\tUnlocked for All Carriers\r\nBrand\tXiaomi\r\nForm factor\tFoldable Screen\r\nMemory storage capacity\t4 GB\r\nOS\tAndroid 11.0\r\nColour\tCarbon Gray\r\nCellular technology\tLTE\r\nSIM card slot count\tDual SIM\r\nModel year\t2021\r\n------------\r\nAbout this item\r\nAI quad camera | 90Hz FHD+ display , 5000mAh battery , Gaming CPU , fast charging\r\nWeight: 181g\r\nHelio G88 processor,Octa-Core ,12nm manufacturing process Dimensions:161.95mm x 75.53mm x 8.92mm\r\nMain camera : 50MP\r\nFront camera : 8MP",
          "images": [
            "https://student.valuxapps.com/storage/uploads/products/163873496133DmC.11.jpg",
            "https://student.valuxapps.com/storage/uploads/products/1638734961lq9NM.12.jpg",
            "https://student.valuxapps.com/storage/uploads/products/1638734961JJsUU.13.jpg",
            "https://student.valuxapps.com/storage/uploads/products/1638734961M75SS.14.jpg",
            "https://student.valuxapps.com/storage/uploads/products/1638734961oRfP5.15.jpg",
            "https://student.valuxapps.com/storage/uploads/products/16387349613Ufwq.16.jpg",
            "https://student.valuxapps.com/storage/uploads/products/1638734961xdhWc.17.jpg"
          ],
          "in_favorites": true,
          "in_cart": false
        },
        {
          "id": 83,
          "price": 444,
          "old_price": 656,
          "discount": 32,
          "image":
              "https://student.valuxapps.com/storage/uploads/products/1638735246ToPmP.21.jpg",
          "name": "Xiaomi Mi Smart Band 5 - Black",
          "description":
              "Brand\tXiaomi\r\nWireless communication standard\tBluetooth\r\nColour\tBlack\r\nCompatible devices\tMulti\r\nHuman interface input\tTouchscreen\r\nScreen size\t3 Inches\r\nBandwidth\t15 Millimeters\r\nWireless carrier\t3\r\n---------------\r\nAbout this item\r\nLightweight design\r\nMade of high quality materials\r\nWater resistant",
          "images": [
            "https://student.valuxapps.com/storage/uploads/products/163873524655oou.21.jpg",
            "https://student.valuxapps.com/storage/uploads/products/1638735246umUmo.22.jpg",
            "https://student.valuxapps.com/storage/uploads/products/1638735246fXBko.23.jpg"
          ],
          "in_favorites": false,
          "in_cart": false
        },
        {
          "id": 86,
          "price": 1596.920000000000072759576141834259033203125,
          "old_price": 2659.0500000000001818989403545856475830078125,
          "discount": 40,
          "image":
              "https://student.valuxapps.com/storage/uploads/products/16387377980g2kx.11.jpg",
          "name": "Sony Pulse 3D Wireless Gaming Headset for PlayStation 5",
          "description":
              "Brand\tSony\r\nColour\tWhite & Black\r\nConnectivity technology\tWireless\r\nItem weight\t1.5 Pounds\r\nCompatible Devices\tMulti\r\n---------------------\r\nAbout this item\r\nBuilt for a new generation\r\nFine-tuned for 3D Audio on PS5 consoles1.\r\nEnjoy comfortable gaming with refined earpads and headband strap.\r\nPlay in style with a sleek design that complements the PS5 console.\r\nDesigned for gamers; Chat with friends through the hidden noise-cancelling microphones2.\r\nQuickly adjust audio and chat settings with easy-access controls.",
          "images": [
            "https://student.valuxapps.com/storage/uploads/products/1638737798SfPxq.11.jpg",
            "https://student.valuxapps.com/storage/uploads/products/1638737798ZJ4C4.12.jpg",
            "https://student.valuxapps.com/storage/uploads/products/1638737798EGD9X.13.jpg"
          ],
          "in_favorites": false,
          "in_cart": false
        },
        {
          "id": 87,
          "price": 499,
          "old_price": 999,
          "discount": 50,
          "image":
              "https://student.valuxapps.com/storage/uploads/products/1638737964KFEyZ.21.jpg",
          "name": "Sony WI-C200 Wireless Headphones - Black",
          "description":
              "Brand\tSony\r\nColour\tBlack\r\nConnectivity technology\tWireless\r\nItem weight\t0.01 Kilograms\r\nCompatible devices\tAll\r\nWireless communication technologies\tBluetooth\r\nStyle\tClosed-back\r\n-----------------\r\nAbout this item\r\nCompatible with multiple devices and easy to use.\r\nBalanced Pure Sound\r\nDesigned and tested for using safely",
          "images": [
            "https://student.valuxapps.com/storage/uploads/products/1638737964rr3wr.21.jpg",
            "https://student.valuxapps.com/storage/uploads/products/1638737964AyYrU.22.jpg",
            "https://student.valuxapps.com/storage/uploads/products/1638737964rwKIT.23.jpg",
            "https://student.valuxapps.com/storage/uploads/products/16387379645kCy3.24.jpg",
            "https://student.valuxapps.com/storage/uploads/products/1638737964wD6NE.25.jpg",
            "https://student.valuxapps.com/storage/uploads/products/1638737964O81Zm.26.jpg",
            "https://student.valuxapps.com/storage/uploads/products/1638737965f9T5b.27.jpg"
          ],
          "in_favorites": false,
          "in_cart": false
        }
      ],
      "first_page_url":
          "https://student.valuxapps.com/api/categories/44?page=1",
      "from": 1,
      "last_page": 1,
      "last_page_url": "https://student.valuxapps.com/api/categories/44?page=1",
      "next_page_url": null,
      "path": "https://student.valuxapps.com/api/categories/44",
      "per_page": 35,
      "prev_page_url": null,
      "to": 10,
      "total": 10
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: GridView.builder(
          itemCount: categoryDetails['data']['data'].length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 9,
              mainAxisSpacing: 6,
              mainAxisExtent: 350,
              crossAxisCount: 2),
          itemBuilder: (context, index) => buildProducts(index),
        ),
      ),
    );
  }

  Widget buildProducts(index) {
    return Container(
      child: InkWell(
        child: Column(
          children: [
            Container(
              height: 181,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                border: Border.all(
                  width: 5,
                  style: BorderStyle.solid,
                  color: Color(0xFFF4F4F4),
                ),
                image: DecorationImage(
                    image: NetworkImage(
                        categoryDetails['data']['data'][index]['image']),
                    fit: BoxFit.fill),
              ),
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  alignment: Alignment.centerLeft,
                  height: 32,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          categoryDetails['data']['data'][index]['name'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            textAlign: TextAlign.start,
                            '\$${categoryDetails['data']['data'][index]['price'].toString()}',
                            style: TextStyle(
                              color: Color(0xFF202020),
                              fontSize: 17,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              height: 0.07,
                              letterSpacing: -0.17,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            overlayColor: WidgetStateColor.transparent,
                            child: isLiked(index),
                          ),
                        ],
                      ),
                      discount(index),
                    ],
                  )),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }

  Widget isLiked(index) {
    if (categoryDetails['data']['data'][index]['in_favorites']) {
      return SvgPicture.asset('assets/icons/like_true.svg');
    } else {
      return SvgPicture.asset('assets/icons/like_false.svg');
    }
  }

  Widget discount(index) {
    if (categoryDetails['data']['data'][index]['discount'] > 0) {
      return SizedBox(
        child: Row(
          children: [
            Text(
              '\$${categoryDetails['data']['data'][index]['old_price']}',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                decorationColor: Color(0xFFF1AEAE),
                color: Color(0xFFF1AEAE),
                fontSize: 14,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w800,
                letterSpacing: 0.17,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6),
              width: 39,
              height: 18,
              alignment: Alignment.center,
              child: Text(
                '-${categoryDetails['data']['data'][index]['discount']}%',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  height: 0.10,
                  letterSpacing: -0.13,
                ),
              ),
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-1.00, 0.00),
                  end: Alignment(1, 0),
                  colors: [Color(0xFFFF5790), Color(0xFFF81140)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox(
        height: 18,
      );
    }
  }
}
