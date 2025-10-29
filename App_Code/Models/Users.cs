using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechShop.App_Code.Models {
    public class Users {
        public int id { get; set; }
        public string username { get; set; } // email
        public string password { get; set; }
        public string fullname { get; set; }
        public string telephone { get; set; }
        public string address { get; set; }
        public string city { get; set; }
        public string district { get; set; }
        public string ward { get; set; }
        public string postCode { get; set; }
        public string role { get; set; }
    }
}