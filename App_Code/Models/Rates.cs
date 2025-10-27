using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechShop.App_Code.Models {
    public class Rates {
        public int id { get; set; }
        public int userId { get; set; }
        public int productId { get; set; }
        public int star { get; set; }
        public DateTime createTime { get; set; }
    }
}