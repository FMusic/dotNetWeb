using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class MeasuringUnits : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //unitsGrid.DataSource = Klass.Groceries.GetMeasuringUnits();
            unitsGrid.DataSource = Klass.DatabaseCom.Groceries.GetMeasuringUnits().Select(x => new { strings = x });
            unitsGrid.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Klass.DatabaseCom.Groceries.NewMeasuringUnit(tbNewUnit.Text);
        }
    }
}