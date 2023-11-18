import 'package:students/models/about_us_model/about_us_model.dart';
import 'package:students/models/blog_model/blog_model.dart';
import 'package:students/models/open_hour_model/open_hour_model.dart';
import 'package:students/models/shopping_item_model/shopping_item_model.dart';

class AppConstants {
  static const String fbUrl = 'https://www.facebook.com/amandestinations';
  static const String twitterUrl = 'https://twitter.com/Amanresorts';
  static const String instagramUrl = 'https://www.instagram.com/aman/';
  static const String ytUrl =
      'https://www.youtube.com/c/AmanResortsHotelsResidences';

  static const String videoUrl = 'https://youtu.be/rMO_mCbNgQo';
  static const String locationUrl =
      'https://www.google.com/maps/place/Iris+Garden+Resident/@21.0320327,105.7601469,17z/data=!3m1!4b1!4m6!3m5!1s0x313455f7865aef31:0x8194caab196325c8!8m2!3d21.0320327!4d105.7601469!16s%2Fg%2F11qnstd_yq?entry=ttu';
  static  const String phoneNumber = '+0923793273';
  static  const String address = 'info.example@gmail.com';

  //dummy data
  static const List<AboutUsModel> dummyAboutModel = <AboutUsModel>[
    AboutUsModel(
      title:
          'Lấy tên từ từ có nguồn gốc từ tiếng Phạn có nghĩa là "hòa bình", Aman đã trải qua một quá trình phát triển hữu cơ trong hơn ba thập kỷ để trở thành một trong những thương hiệu khu nghỉ dưỡng, khách sạn, nơi cư trú và phong cách sống tiên phong và trực quan nhất thế giới. Hành trình của Aman, dù trải nghiệm ở một trong 34 điểm đến hay ở nhà, đều được lấy cảm hứng từ một mục đích duy nhất và nguyên bản: Cung cấp mức độ dịch vụ và trải nghiệm vô song về mọi mặt.',
      text:
          'Thời gian ở bên Aman giống như được chào đón vào một ngôi nhà riêng sang trọng, nơi chỉ tiếp đón một vài vị khách. Bất động sản Aman được kiến tạo một cách toàn diện và phát triển một cách tự nhiên, kiến trúc luôn đúng với từng điểm đến. Các khu bảo tồn và không gian kín đáo rất nhạy cảm và xác thực về mặt địa lý, thiết kế và di sản văn hóa - mọi trải nghiệm của Aman đều nhẹ nhàng mở ra với sự đơn giản và sang trọng mang lại cảm giác thân thuộc ngay lập tức.',
      image:
          'https://www.aman.com/sites/default/files/styles/image_and_text_extra_large/public/2021-01/191-Amangiri_2020_50R0961_AdobeRGB_High-Res_28891.jpg?itok=eeDB4qwy',
    ),
    AboutUsModel(
      text:
          'Aman mở ra sự thanh thản. Giống như một cuốn sách chưa kể, Spirit of Aman là vô hình. Những câu chuyện được kể lại và làm phong phú thêm về văn hóa, cộng đồng, thiên nhiên - đây là một câu chuyện được nhiều người mô phỏng, nhưng do Aman truyền tải, nó không thể bắt chước được.\nNhân viên của chúng tôi chia sẻ Tinh thần của Aman một cách duyên dáng trong mọi việc họ làm. Nhiều người trong số những người tạo nên Aman như hiện tại đã gắn bó với chúng tôi ngay từ những ngày đầu và 35 năm sau tiếp tục gắn kết chúng tôi chặt chẽ với nhiều cộng đồng tại các điểm đến của chúng tôi. Chúng tôi đặt khách hàng là trọng tâm trong mọi việc chúng tôi làm và tạo ra môi trường giúp họ chuyển đổi liền mạch và ngay lập tức từ cuộc sống hàng ngày sang trạng thái bình tĩnh không phức tạp.',
      image:
          'https://www.aman.com/sites/default/files/styles/image_and_text_extra_large/public/2022-03/Amanjena%2C%20Marrakech%20-%20Aman%20Skincare%2C%20Purifying%20CandleAman%20Skincare%2C%20Ultimate%20Skincare%20Gift%20set-2.jpg?itok=jS1OImOh',
    ),
    AboutUsModel(
      text:
          'Aman hiện quản lý 34 dự án phát triển khách sạn, khu nghỉ dưỡng và nhà ở tại 20 quốc gia, 15 trong số đó nằm gần hoặc trong các địa điểm được UNESCO bảo vệ. Đúng như tinh thần tiên phong của thương hiệu, cho đến nay, thêm mười dự án nữa đã được công bố như một phần của kế hoạch phát triển mạnh mẽ trong tương lai.',
      image:
          'https://www.aman.com/sites/default/files/styles/image_and_text_extra_large/public/2023-03/Amankora%2C%20Bhutan%20-%20Journeys%20Landscape.jpg?itok=yX8OFBpT',
    ),
  ];

  static List<BlogModel> dummyBlogModel = <BlogModel>[
    BlogModel(
      title: 'Liệu pháp Spa lấy cảm hứng từ đại dương cho ngôi nhà của bạn',
      shortDescription:
          'Sự lắc lư nhẹ nhàng của đại dương có thể mang lại khung cảnh thư giãn và khoảnh khắc bình yên và chiêm nghiệm rất cần thiết cho bất kỳ ai. Kết hợp điều này với bầu không khí thư giãn và khung cảnh đại dương từ spa và bạn đã sẵn sàng thiết lập lại, phục hồi và phục hồi tâm trí cũng như cơ thể của mình.',
      image:
          'https://onespaworld.com/wp-content/uploads/2020/04/iStock-533711860-1124x749.jpg',
      createdDate: DateTime(2023, 5, 1),
    ),
    BlogModel(
      title: 'Liệu pháp Spa lấy cảm hứng từ đại dương cho ngôi nhà của bạn',
      shortDescription:
      'Sự lắc lư nhẹ nhàng của đại dương có thể mang lại khung cảnh thư giãn và khoảnh khắc bình yên và chiêm nghiệm rất cần thiết cho bất kỳ ai. Kết hợp điều này với bầu không khí thư giãn và khung cảnh đại dương từ spa và bạn đã sẵn sàng thiết lập lại, phục hồi và phục hồi tâm trí cũng như cơ thể của mình.',
      image:
      'https://onespaworld.com/wp-content/uploads/2020/04/iStock-533711860-1124x749.jpg',
      createdDate: DateTime(2023, 5, 5),
    ),
    BlogModel(
      title: 'Một bước quan trọng trong việc thực hành tắm nắng an toàn',
      shortDescription:
      'Nếu có một thứ bạn nên luôn mang theo trong túi xách mùa hè và sau mùa này thì đó chính là kem chống nắng hoặc kem chống nắng. Không có quy trình chăm sóc da nào được hoàn thiện nếu không có nó.',
      image:
      'https://onespaworld.com/wp-content/uploads/2020/07/sun2-1124x569.jpg',
      createdDate: DateTime(2023, 5, 2),
    ),
    BlogModel(
      title: 'Những điều cần thiết khi du lịch: Sản phẩm chăm sóc da, chăm sóc cơ thể cho chuyến đi tiếp theo của bạn',
      shortDescription:
      'Bất kể chuyến du lịch của bạn có thể đưa bạn đến đâu, khả năng di chuyển nhẹ nhàng có thể giúp bạn tận hưởng kỳ nghỉ của mình. Tuy nhiên, thói quen tự chăm sóc bản thân của bạn sẽ không bị ảnh hưởng - do đó tầm quan trọng của việc chăm sóc da và chăm sóc cơ thể theo quy mô du lịch. Điều quan trọng là bạn phải mang theo những món đồ đa năng, từ quần áo đến sữa rửa mặt hàng ngày.',
      image:
      'https://onespaworld.com/wp-content/uploads/2021/05/cover-1124x562.png',
      createdDate: DateTime(2023, 5, 3),
    ),
    BlogModel(
      title: 'Hãy làm theo những lời khuyên của chuyên gia để có làn da khỏe mạnh vào mùa thu này',
      shortDescription:
      'Với những chiếc lá thay đổi sẽ thay đổi nhu cầu cho làn da của bạn. Nhiệt độ giảm và khí hậu khô hơn có thể khiến làn da của bạn cần thêm một số thứ để luôn khỏe mạnh và tươi sáng trong mùa thu đầy sắc màu này',
      image:
      'https://onespaworld.com/wp-content/uploads/2020/10/Fall_Season_Skincare_OneSpaWorld_-1124x562.jpg',
      createdDate: DateTime(2023, 5, 4),
    ),
  ];


  static const List<OpenHourModel> dummyOpenHour = <OpenHourModel>[
    OpenHourModel(
      dayOfWeek: 1,
      startHour: 9,
      startMinute: 0,
      endHour: 18,
      endMinute: 0
    ),
    OpenHourModel(
        dayOfWeek: 2,
        startHour: 9,
        startMinute: 0,
        endHour: 18,
        endMinute: 0
    ),
    OpenHourModel(
        dayOfWeek: 3,
        startHour: 9,
        startMinute: 0,
        endHour: 18,
        endMinute: 0
    ),
    OpenHourModel(
        dayOfWeek: 4,
        startHour: 9,
        startMinute: 0,
        endHour: 18,
        endMinute: 0
    ),
    OpenHourModel(
        dayOfWeek: 5,
        startHour: 9,
        startMinute: 0,
        endHour: 18,
        endMinute: 0
    ),
    OpenHourModel(
        dayOfWeek: 6,
        startHour: 10,
        startMinute: 0,
        endHour: 19,
        endMinute: 0
    ),
    OpenHourModel(
        dayOfWeek: 7,
        startHour: 10,
        startMinute: 0,
        endHour: 19,
        endMinute: 0
    ),
  ];

  static const List<ShoppingItemModel> dummyShoppingItemModel = <ShoppingItemModel>[
    ShoppingItemModel(
      image: 'https://salt.tikicdn.com/cache/280x280/ts/product/c2/38/4a/c73e579e5cdf42e860ce6c2314735a85.png.webp',
      title: 'Sữa rửa mặt',
      price: 200000,
    ),
    ShoppingItemModel(
      image: 'https://salt.tikicdn.com/cache/280x280/ts/product/ab/24/bf/721f33b77f5c9819b15b8998d7e4e12b.jpg.webp',
      title: 'Sữa rửa mặt 2',
      price: 210000,
    ),
    ShoppingItemModel(
      image: 'https://salt.tikicdn.com/cache/280x280/ts/product/b0/80/2f/8e155807a706696d69c1f5dec2ad060b.png.webp',
      title: 'Sữa rửa mặt 3',
      price: 300000,
    ),
    ShoppingItemModel(
      image: 'https://salt.tikicdn.com/cache/280x280/ts/product/ac/c6/cb/37303319856d25885bb1a819edf8044a.jpg.webp',
      title: 'Sữa rửa mặt 4',
      price: 440000,
    ),
    ShoppingItemModel(
      image: 'https://salt.tikicdn.com/cache/280x280/ts/product/7c/9c/a5/4bd1312c3bcdbe0475df20cffee3c5a6.jpg.webp',
      title: 'Sữa rửa mặt 5',
      price: 340000,
    ),
    ShoppingItemModel(
      image: 'https://salt.tikicdn.com/cache/280x280/ts/product/f8/65/f1/3c515c8213fddc85867b8f7f64f43649.jpg.webp',
      title: 'Sữa rửa mặt 6',
      price: 240000,
    ),
    ShoppingItemModel(
      image: 'https://salt.tikicdn.com/cache/280x280/ts/product/ba/a9/7e/754277a603cc96b4cb88b65619b0ec86.jpg.webp',
      title: 'Sữa rửa mặt 7',
      price: 420000,
    ),
    ShoppingItemModel(
      image: 'https://salt.tikicdn.com/cache/280x280/ts/product/a6/bf/f0/012a2bc96689f9e3b3d0344f1009eed5.jpg.webp',
      title: 'Sữa rửa mặt 8',
      price: 450000,
    ),
  ];
}
