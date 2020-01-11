using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class MainMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUsers_Click(object sender, EventArgs e)
        {
            var btn = sender as Button;
            if (btn.ID == btnUsers.ID)
            {
                Response.Redirect("./Users.aspx");
            }
            if (btn.ID == btnGroceries.ID)
            {
                Response.Redirect("./Groceries.aspx");
            }
            if (btn.ID == btnMeasuringUnits.ID)
            {
                Response.Redirect("./MeasuringUnits.aspx");
            }
            if (btn.ID == btnCombinations.ID)
            {
                Response.Redirect("./Users.aspx");
            }
            if (btn.ID == btnMeals.ID)
            {
                Response.Redirect("./Users.aspx");
            }
        }
    }
}