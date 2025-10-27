using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechShop.App_Code.Models {
    public class Products {
        public int id { get; set; }
        public string productName { get; set; }

        public string imageUrl { get; set; }
        public string value { get; set; }
        public string color { get; set; }
        public int capacity { get; set; }
        public int quantity { get; set; }
        public string describe { get; set; }
        public string specification { get; set; }
        public List<Rates> rateList { get; set; }
    }
}