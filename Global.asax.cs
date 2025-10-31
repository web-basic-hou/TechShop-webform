using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI.WebControls;
using TechShop.App_Code.Models;

namespace TechShop
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            var productList = new List<TechShop.App_Code.Models.Products>();

            productList.Add(
                new TechShop.App_Code.Models.Products {
                    id = 1,
                    productName = "IPhone XS Max",
                    value = 6690000,
                    color = "Đen",
                    capacity = 256,
                    quantity = 100,

                    describe = "iPhone XS Max 256GB màn hình 6.5 inch Super Retina OLED, con chip A12 Bionic xử lý nhanh và hệ thống camera kép 12MP chụp ảnh rõ nét. Bộ nhớ 256GB mang lại không gian rộng rãi để lưu giữ dữ liệu cần thiết.",

                    specification = "Kích thước màn hình: 6.5 inches|Công nghệ màn hình: OLED| Camera sau: 12 MP| Camera trước: 7 MP| Chipset: Apple A12 Bionic 6 nhân| Bộ nhớ trong: 256 GB| Pin: Li-ion| Thẻ SIM: Nano-SIM| Hệ điều hành: 12| Độ phân giải màn hình: 1242 x 2688 pixel",
                    imageUrl = "~/Asset/images/ip1.jpg",
                    rateList = new List<Rates>()
                }
            );

            productList.Add(
                new TechShop.App_Code.Models.Products {
                    id = 2,
                    productName = "IPhone 11",
                    value = 8490000,
                    color = "Trắng",
                    capacity = 128,
                    quantity = 100,

                    describe = "iPhone 11 là mẫu smartphone của Apple ra mắt năm 2019, sở hữu thiết kế sang trọng với khung nhôm và mặt kính. Máy trang bị màn hình Liquid Retina 6.1 inch, chip A13 Bionic mạnh mẽ, cụm camera kép 12MP (góc rộng và siêu rộng) cho chất lượng ảnh vượt trội, cùng camera trước 12MP hỗ trợ quay video 4K. iPhone 11 có hiệu năng ổn định, thời lượng pin tốt và khả năng chống nước, chống bụi đạt chuẩn IP68.",
                    specification = " Kích thước màn hình: 6.1 inches | Công nghệ màn hình: IPS LCD | Camera sau: Camera kép 12 MP (Góc rộng: ƒ/1.8, Siêu rộng: ƒ/2.4) | Camera trước: 12 MP, ƒ/2.2 | Chipset: A13 Bionic | Bộ nhớ trong: 128 GB | Pin: 3110 mAh | Thẻ SIM: Nano-SIM + eSIM | Hệ điều hành: iOS 13 hoặc cao hơn | Độ phân giải màn hình: 1792 x 828 pixel",
                    imageUrl = "~/Asset/images/ip2.jpg",
                    rateList = new List<Rates>()
                }
            );

            productList.Add(
                new TechShop.App_Code.Models.Products {
                    id = 3,
                    productName = "IPhone 12 Pro Max",
                    value = 23490000,
                    color = "Xanh dương",
                    capacity = 128,
                    quantity = 100,

                    describe = "iPhone 12 Pro Max 128GB sở hữu màn hình 6.7 inch Super Retina XDR OLED siêu sắc nét, trang bị chip A14 Bionic mạnh mẽ cho hiệu năng đỉnh cao. Hệ thống ba camera 12MP chuyên nghiệp cho khả năng chụp ảnh, quay video 4K và chụp đêm tuyệt vời. Thiết kế viền thép không gỉ sang trọng, hỗ trợ mạng 5G và khả năng chống nước IP68.",

                    specification = "Kích thước màn hình: 6.7 inches | Công nghệ màn hình: OLED | Camera sau: Chính 12 MP (f/1.6, 26mm, 1.4µm, dual pixel PDAF, OIS), Tele 12 MP (f/2.0, 52mm, PDAF, OIS, 2x zoom), Góc siêu rộng 12 MP (f/2.4, 120˚, 13mm), TOF 3D LiDAR | Camera trước: 12 MP (f/2.2, 23mm), SL 3D | Chipset: Apple A14 Bionic (5 nm) | Bộ nhớ trong: 128 GB | Pin: Li-Ion, sạc nhanh 20W, sạc không dây 15W, USB Power Delivery 2.0 | Thẻ SIM: 2 SIM (nano‑SIM + eSIM) | Hệ điều hành: iOS 14.1 hoặc cao hơn | Độ phân giải màn hình: 1284 x 2778 pixels",
                    imageUrl = "~/Asset/images/ip3.jpg",
                    rateList = new List<Rates>()
                }
            );

            productList.Add(
                new TechShop.App_Code.Models.Products {
                    id = 4,
                    productName = "IPhone 12",
                    value = 9990000,
                    color = "Đen",
                    capacity = 128,
                    quantity = 100,

                    describe = "iPhone 12 128GB sở hữu màn hình 6.1 inch Super Retina XDR OLED sắc nét, sử dụng chip A14 Bionic mạnh mẽ cho hiệu năng vượt trội. Hệ thống camera kép 12MP chụp ảnh chất lượng cao, hỗ trợ chụp đêm và quay video 4K. Thiết kế viền vuông sang trọng, hỗ trợ mạng 5G và khả năng chống nước IP68.",

                    specification = "Kích thước màn hình: 6.1 inches | Công nghệ màn hình: OLED | Camera sau: 12 MP (f/1.6, 26mm, wide, 1.4µm, dual pixel PDAF, OIS), 12 MP (f/2.4, 120˚, 13mm, ultrawide) | Camera trước: 12 MP (f/2.2, 23mm, wide), SL 3D | Chipset: Apple A14 Bionic (5 nm) | Bộ nhớ trong: 128 GB | Pin: Li-Ion, sạc nhanh 20W, sạc không dây 15W, USB Power Delivery 2.0 | Thẻ SIM: 2 SIM (nano‑SIM + eSIM) | Hệ điều hành: iOS 14.1 hoặc cao hơn | Độ phân giải màn hình: 1170 x 2532 pixels",
                    imageUrl = "~/Asset/images/ip4.jpg",
                    rateList = new List<Rates>()
                }
            );

            productList.Add(
                new TechShop.App_Code.Models.Products {
                    id = 5,
                    productName = "iPhone 11 Pro Max",
                    value = 32000000,
                    color = "Xám",
                    capacity = 256,
                    quantity = 120,

                    describe = "iPhone 11 Pro Max 256GB sở hữu màn hình 6.5 inch Super Retina XDR OLED sắc nét, trang bị chip A13 Bionic mạnh mẽ cho hiệu năng mượt mà. Hệ thống ba camera 12MP mang đến chất lượng ảnh vượt trội, hỗ trợ chụp đêm và quay video 4K. Thiết kế viền thép không gỉ sang trọng, dung lượng pin lớn và khả năng chống nước IP68.",

                    specification = "Kích thước màn hình: 6.5 inches | Công nghệ màn hình: OLED | Camera sau: 3 Camera 12 MP (Tele: ƒ/2.0, Góc rộng: ƒ/1.8, Siêu rộng: ƒ/2.4) | Camera trước: 12 MP, ƒ/2.2 | Chipset: A13 Bionic | Bộ nhớ trong: 256 GB | Pin: 3969 mAh | Thẻ SIM: 2 SIM (nano‑SIM + eSIM) | Hệ điều hành: iOS 13 hoặc cao hơn | Độ phân giải màn hình: 2688 x 1242 pixels ",
                    imageUrl = "~/Asset/images/ip5.jpg",
                    rateList = new List<Rates>()
                }
            );

            productList.Add(
                new TechShop.App_Code.Models.Products {
                    id = 6,
                    productName = "iPhone 14",
                    value = 13690000,
                    color = "Đen",
                    capacity = 128,
                    quantity = 12,

                    describe = "iPhone 14 128GB sở hữu màn hình 6.1 inch Super Retina XDR OLED sắc nét, trang bị chip A15 Bionic mạnh mẽ cho hiệu năng vượt trội. Hệ thống camera kép 12MP nâng cấp với chế độ Chụp đêm và Cinematic, hỗ trợ quay video 4K mượt mà. Thiết kế viền nhôm sang trọng, hỗ trợ mạng 5G và khả năng chống nước IP68.",

                    specification = "Kích thước màn hình: 6.1 inches | Công nghệ màn hình: OLED | Camera sau: Góc rộng 12 MP (ƒ/1.5), Góc siêu rộng 12 MP (ƒ/2.4) | Camera trước: 12 MP (ƒ/1.9) | Chipset: Apple A15 Bionic 6 nhân | Bộ nhớ trong: 128 GB | Pin: 3,279 mAh | Thẻ SIM: 2 SIM (nano‑SIM + eSIM) | Hệ điều hành: iOS 16 | Độ phân giải màn hình: 2532 x 1170 pixels",
                    imageUrl = "~/Asset/images/ip6.jpg",
                    rateList = new List<Rates>()
                }
            );

            productList.Add(
                new TechShop.App_Code.Models.Products {
                    id = 7,
                    productName = "iPhone 14 Pro Max",
                    value = 25590000,
                    color = "Đen",
                    capacity = 128,
                    quantity = 15,

                    describe = "iPhone 14 Pro Max 128GB sở hữu màn hình 6.7 inch Super Retina XDR OLED siêu sắc nét với công nghệ ProMotion 120Hz, trang bị chip A16 Bionic mạnh mẽ cho hiệu năng đỉnh cao. Hệ thống ba camera 48MP nâng cấp với chế độ Chụp đêm, Cinematic và quay video 4K chất lượng cao. Thiết kế viền thép không gỉ sang trọng, hỗ trợ mạng 5G và khả năng chống nước IP68.",

                    specification = "Kích thước màn hình: 6.7 inches | Công nghệ màn hình: Super Retina XDR OLED | Camera sau: Chính 48 MP (f/1.8, 24mm, 1.22µm, PDAF, OIS), Góc siêu rộng 12 MP (f/2.2, 13mm, 120˚, 1.4µm, PDAF), Tele 12 MP (f/2.8, 77mm, PDAF, OIS, 3x zoom), TOF 3D LiDAR | Camera trước: Selfie 12 MP (f/1.9, 23mm, PDAF) | Chipset: Apple A16 Bionic 6-core | Bộ nhớ trong: 128 GB | Pin: 4,323 mAh | Thẻ SIM: 2 SIM (nano‑SIM + eSIM) | Hệ điều hành: iOS 16 | Độ phân giải màn hình: 2796 x 1290 pixels",
                    imageUrl = "~/Asset/images/ip7.jpg",
                    rateList = new List<Rates>()
                }
            );

            productList.Add(
                new TechShop.App_Code.Models.Products {
                    id = 8,
                    productName = "iPhone 15",
                    value = 17290000,
                    color = "Đen",
                    capacity = 128,
                    quantity = 22,

                    describe = "Apple iPhone 15 sở hữu màn hình 6,1 inch Super Retina XDR OLED sắc nét.Máy được trang bị chip A16 Bionic (dòng tiêu chuẩn sử dụng A16) cho hiệu năng vượt trội. Hệ thống camera kép nâng cấp với cảm biến chính 48 MP và camera siêu rộng 12 MP, hỗ trợ quay video 4K và chụp ảnh rõ nét. Thiết kế viền nhôm, chuyển sang cổng USB‑C, hỗ trợ mạng 5G và khả năng chống nước bụi chuẩn IP68.",

                    specification = "Kích thước màn hình: 6.1 inches | Công nghệ màn hình: Super Retina XDR OLED | Camera sau: Chính 48 MP & Phụ 12 MP | Camera trước: 12 MP (ƒ/1.9) | Chipset: Apple A16 Bionic 6 nhân | Bộ nhớ trong: 128 GB | Pin: 3,349 mAh | Thẻ SIM: 2 SIM (nano‑SIM + eSIM) | Hệ điều hành: iOS 17 | Độ phân giải màn hình: 2556 x 1179 pixels",
                    imageUrl = "~/Asset/images/ip8.jpg",
                    rateList = new List<Rates>()
                }
            );

            productList.Add(
                new TechShop.App_Code.Models.Products {
                    id = 9,
                    productName = "iPhone 15 Pro Max ",
                    value = 25490000,
                    color = "Titan Đen",
                    capacity = 256,
                    quantity = 30,

                    describe = "iPhone 15 Pro Max sở hữu màn hình 6.7 inch Super Retina XDR OLED siêu sắc nét với công nghệ ProMotion 120 Hz, trang bị chip A17 Pro mạnh mẽ cho hiệu năng đỉnh cao. Hệ thống ba camera – cảm biến chính 48 MP kèm ống kính telephoto 5× và siêu rộng 12 MP – nâng cấp vượt trội với chế độ Chụp đêm, Cinematic và quay video 4K chất lượng cao. Thiết kế khung titan sang trọng, hỗ trợ mạng 5G, chuyển sang cổng USB‑C và khả năng chống nước bụi IP68.",

                    specification = "Kích thước màn hình: 6.7 inches | Công nghệ màn hình: Super Retina XDR OLED | Camera sau: Chính 48 MP (24 mm, ƒ/1.78), Góc siêu rộng 12 MP (13 mm, ƒ/2.2), Tele 5x 12 MP (120 mm, ƒ/2.8), Tele 2x 12 MP (48 mm, ƒ/1.78) | Camera trước: 12 MP (ƒ/1.9) | Chipset: A17 Pro | Bộ nhớ trong: 256 GB | Pin: 4,422 mAh | Thẻ SIM: 2 SIM (nano‑SIM + eSIM) | Hệ điều hành: iOS 17 | Độ phân giải màn hình: 2796 x 1290 pixels",
                    imageUrl = "~/Asset/images/ip9.jpg",
                    rateList = new List<Rates>()
                }
            );

            productList.Add(
                new TechShop.App_Code.Models.Products {
                    id = 10,
                    productName = "iPhone 17 Pro Max ",
                    value = 37990000,
                    color = "Cam vũ trụ",
                    capacity = 256,
                    quantity = 30,

                    describe = "iPhone 17 Pro Max 256 GB sở hữu màn hình 6.9 inch Super Retina XDR OLED siêu sắc nét với công nghệ ProMotion 120Hz. Trang bị chip A19 Pro mạnh mẽ cho hiệu năng đỉnh cao. Hệ thống ba camera 48MP – cảm biến chính, siêu rộng và ống kính telephoto – hỗ trợ chế độ chụp đêm, Cinematic và quay video 4K/8K chất lượng cao. Thiết kế khung nhôm unibody/kim loại cao cấp, hỗ trợ mạng 5G, chuyển sang cổng USB‑C và khả năng chống nước/bụi chuẩn IP68.",

                    specification = "Kích thước màn hình: 6.9 inches | Công nghệ màn hình: Super Retina XDR OLED | Camera sau: Chính 48 MP & Phụ 48 MP, 48 MP | Camera trước: 18 MP | Chipset: Apple A19 Pro 6 nhân | Bộ nhớ trong: 256 GB | Pin: 5,088 mAh | Thẻ SIM: 2 SIM (nano‑SIM + eSIM) | Hệ điều hành: iOS 26 | Độ phân giải màn hình: 1320 x 2868 pixels",
                    imageUrl = "~/Asset/images/ip4.jpg",
                    rateList = new List<Rates>()
                }
            );
            productList.Add(
                new TechShop.App_Code.Models.Products {
                    id = 11,
                    productName = "Samsung Galaxy S24 Ultra 512GB",
                    value = 23490000,
                    color = "Đen",
                    capacity = 512,
                    quantity = 10,

                    describe = "Samsung Galaxy S24 Ultra 512GB là flagship cao cấp nhất của Samsung năm 2024, nổi bật với thiết kế titan bền bỉ, bút S-Pen tích hợp, hiệu năng cực mạnh cùng camera zoom 100x đỉnh cao.",

                    specification = "Kích thước màn hình: 6.8 inches | Công nghệ màn hình: Dynamic AMOLED 2X, QHD+, 120Hz, HDR10+ | Camera sau: 200MP (chính, f/1.7, OIS), 12MP (góc siêu rộng, f/2.2), 10MP (tele 3x, f/2.4), 50MP (tele 5x, f/3.4) | Camera trước: 12MP (f/2.2) | Chipset: Snapdragon 8 Gen 3 for Galaxy (4nm) | RAM: 12 GB | Bộ nhớ trong: 512 GB | Pin: 5000mAh, sạc nhanh 45W, sạc không dây 15W | SIM: 2 SIM (nano + eSIM) | Hệ điều hành: Android 14, One UI 6.1 | Kết nối: 5G, Wi-Fi 7, Bluetooth 5.3, USB-C 3.2 | Chất liệu khung: Titanium + mặt kính Gorilla Armor | Khả năng chống nước: Chuẩn IP68 | Độ phân giải màn hình: 3120 x 1440 pixels",

                    imageUrl = "~/Asset/images/ss3.jpg",
                    rateList = new List<Rates>()
                }
            );

            productList.Add(
                new TechShop.App_Code.Models.Products { 
                    id = 12,
                    productName = "Samsung Galaxy S24+",
                    value = 16390000,
                    color = "Đen",
                    capacity = 256,
                    quantity = 20,

                    describe = "Galaxy S24+ mang lại trải nghiệm cao cấp với hiệu năng mạnh, camera chất lượng và màn hình 120Hz sắc nét.",

                    specification = "Kích thước màn hình: 6.7 inches | Công nghệ màn hình: Dynamic AMOLED 2X, QHD+, 120Hz | Camera sau: 50MP + 12MP + 10MP | Camera trước: 12MP | Chipset: Snapdragon 8 Gen 3 for Galaxy | RAM: 12 GB | Bộ nhớ trong: 256 GB | Pin: 4700mAh, sạc nhanh 45W | SIM: 2 SIM (nano + eSIM) | Hệ điều hành: Android 14 | Độ phân giải màn hình: 3120 x 1440 pixels",

                    imageUrl = "~/Asset/images/ss1.jpg",
                    rateList = new List<Rates>()
                }
            );

            productList.Add(
                new TechShop.App_Code.Models.Products {
                    id = 13,
                    productName = "Samsung Galaxy S24",
                    value = 19190000,
                    color = "Đen",
                    capacity = 512,
                    quantity = 25,

                    describe = "Galaxy S24 có thiết kế nhỏ gọn, hiệu năng mạnh mẽ cùng camera chất lượng cao, phù hợp cho người dùng yêu thích sự tinh tế.",

                    specification = "Kích thước màn hình: 6.2 inches | Công nghệ màn hình: Dynamic AMOLED 2X, FHD+, 120Hz | Camera sau: 50MP + 12MP + 10MP | Camera trước: 12MP | Chipset: Snapdragon 8 Gen 3 for Galaxy | RAM: 8 GB | Bộ nhớ trong: 512 GB | Pin: 4000mAh, sạc nhanh 25W | SIM: 2 SIM (nano + eSIM) | Hệ điều hành: Android 14 | Độ phân giải màn hình: 2340 x 1080 pixels",

                    imageUrl = "~/Asset/images/ss2.jpg",
                    rateList = new List<Rates>()
                }
            );

            productList.Add(
                new TechShop.App_Code.Models.Products {
                    id = 14,
                    productName = "Samsung Galaxy Z Fold5",
                    value = 16490000,
                    color = "Đen",
                    capacity = 512,
                    quantity = 10,

                    describe = "Galaxy Z Fold5 là điện thoại gập cao cấp với thiết kế mỏng nhẹ, tối ưu cho công việc và giải trí.",

                    specification = "Màn hình chính: 7.6 inches QXGA+ Dynamic AMOLED 2X | Màn hình phụ: 6.2 inches AMOLED 120Hz | Camera sau: 50MP + 12MP + 10MP | Camera trước: 10MP (ngoài), 4MP (trong) | Chipset: Snapdragon 8 Gen 2 for Galaxy | RAM: 12 GB | Bộ nhớ trong: 512 GB | Pin: 4400mAh, sạc nhanh 25W | SIM: 2 SIM (nano + eSIM) | Hệ điều hành: Android 14 | Độ phân giải màn hình: 2176 x 1812 pixels",

                    imageUrl = "~/Asset/images/ss3.jpg",
                    rateList = new List<Rates>()
                }
            );

            productList.Add(
                new TechShop.App_Code.Models.Products {
                    id = 15,
                    productName = "Samsung Galaxy Z Flip5",
                    value = 7990000,
                    color = "Kem",
                    capacity = 256,
                    quantity = 18,

                    describe = "Z Flip5 mang đến thiết kế gập vỏ sò hiện đại, kích thước nhỏ gọn và màn hình phụ lớn tiện dụng.",

                    specification = "Màn hình chính: 6.7 inches FHD+ AMOLED 120Hz | Màn hình phụ: 3.4 inches AMOLED | Camera sau: 12MP + 12MP | Camera trước: 10MP | Chipset: Snapdragon 8 Gen 2 for Galaxy | RAM: 8 GB | Bộ nhớ trong: 256 GB | Pin: 3700mAh, sạc nhanh 25W | SIM: 2 SIM (nano + eSIM) | Hệ điều hành: Android 14 | Độ phân giải màn hình: 2640 x 1080 pixels",

                    imageUrl = "~/Asset/images/ip4.jpg",
                    rateList = new List<Rates>()
                }
            );

            productList.Add(
                new TechShop.App_Code.Models.Products {
                    id = 16,
                    productName = "Samsung Galaxy A55 5G",
                    value = 7590000,
                    color = "Đen",
                    capacity = 128,
                    quantity = 30,

                    describe = "Galaxy A55 5G có thiết kế khung kim loại, hiệu năng tốt và camera 50MP chất lượng cao.",

                    specification = "Kích thước màn hình: 6.6 inches | Công nghệ màn hình: Super AMOLED, FHD+, 120Hz | Camera sau: 50MP + 12MP + 5MP | Camera trước: 32MP | Chipset: Exynos 1480 | RAM: 8 GB | Bộ nhớ trong: 128 GB | Pin: 5000mAh, sạc nhanh 25W | SIM: 2 SIM | Hệ điều hành: Android 14 | Độ phân giải màn hình: 2340 x 1080 pixels",

                    imageUrl = "~/Asset/images/ss5.jpg",
                    rateList = new List<Rates>()
                }
            );

            Application["Products"] = productList;

            var userList = new List<TechShop.App_Code.Models.Users>();

            userList.Add(new TechShop.App_Code.Models.Users {
                id = 1,
                username = "admin@system.com",
                password = "password",
                fullname = "Quản trị viên",
                telephone = null,
                address = null,
                city = null,
                district = null,
                ward = null,
                postCode = null,
                role = "admin"
            });

            userList.Add(new TechShop.App_Code.Models.Users {
                id = 2,
                username = "user2@gmail.com",
                password = "123123123",
                fullname = "Nguyễn Văn user2",
                telephone = null,
                address = null,
                city = null,
                district = null,
                ward = null,
                postCode = null,
                role = "user"
            });

            userList.Add(new TechShop.App_Code.Models.Users {
                id = 3,
                username = "user3@gmail.com",
                password = "123123123",
                fullname = "Trần Thị user3",
                telephone = null,
                address = null,
                city = null,
                district = null,
                ward = null,
                postCode = null,
                role = "user"
            });

            Application["Users"] = userList;
        }
    }
}