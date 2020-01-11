using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void adminLogin_Authenticate(object sender, AuthenticateEventArgs e)
        {
            if (Klass.DatabaseCom.Users.LoginAdmin(adminLogin.UserName, adminLogin.Password))
            {
                e.Authenticated = true;
                adminLogin.Visible = false;
                Response.Redirect("./MainMenu.aspx");
            }
        }
    }
}