using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using TechShop.App_Code.Models;

namespace TechShop
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            var productList = new List<TechShop.App_Code.Models.Products>();

            for (int i = 1; i <= 7; i++) {
                var product = new TechShop.App_Code.Models.Products {
                    id = i,
                    productName = "Sản phẩm " + i,
                    value = (i * 1000000).ToString("N0") + "₫",
                    color = (i % 2 == 0) ? "Đen" : "Trắng",
                    capacity = 128 + (i % 3) * 128,
                    quantity = 10 + i,
                    describe = "Mô tả ngắn gọn cho sản phẩm " + i,
                    specification = "Cấu hình chi tiết sản phẩm " + i,
                    //imageUrl = "~/Asset/images/product" + i + ".png",
                    imageUrl = "~/Asset/images/cucGach.png",
                    rateList = new List<Rates>() {
                        new Rates{ userId = 2, productId = i, star = 5 },
                        new Rates{ userId = 3, productId = i, star = 4 }
                    }
                };
                productList.Add(product);
            }

            Application["Products"] = productList;

            var userList = new List<TechShop.App_Code.Models.Users>();

            userList.Add(new TechShop.App_Code.Models.Users {
                id = 1,
                username = "admin@system.com",
                password = "password",
                fullname = "Quản trị viên",
                role = "admin"
            });

            userList.Add(new TechShop.App_Code.Models.Users {
                id = 2,
                username = "user2@gmail.com",
                password = "123123123",
                fullname = "Nguyễn Văn user2",
                role = "user"
            });

            userList.Add(new TechShop.App_Code.Models.Users {
                id = 3,
                username = "user3@gmail.com",
                password = "123123123",
                fullname = "Trần Thị user3",
                role = "user"
            });

            Application["Users"] = userList;
        }
    }
}