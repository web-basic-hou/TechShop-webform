﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechShop.App_Code.Models {
    public class Users {
        public int id { get; set; }
        public string username { get; set; }
        public string password { get; set; }

        public string fullname { get; set; }
    }
}