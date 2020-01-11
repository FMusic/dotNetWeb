using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Klass;
using Klass.Model;

namespace Public.Models
{
    public class LoginViewModel
    {
        public User User { get; set; }

        public LoginViewModel()
        {
            User = new Klass.Model.User();
        }
    }
}