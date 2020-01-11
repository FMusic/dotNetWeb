using Klass;
using Klass.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class Users : System.Web.UI.Page
    {
        public IList<GetUsers2_Result> UsersList { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            usersGrid.DataSource = UsersList;
            Task.Run(() => UsersList = Klass.DatabaseCom.Users.GetAllUsers());
            usersGrid.DataBind();
        }
    }
}