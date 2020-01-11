using Klass;
using Klass.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class Groceries : System.Web.UI.Page
    {
        public IList<string> ColumnNames{ get; set; }
        private string MarginForText = "\t";

        protected void Page_Load(object sender, EventArgs e)
        {
            Table tbl = GetUITableFromDataTable();
            tbl.HorizontalAlign = HorizontalAlign.Center;
            tbl.BorderStyle = BorderStyle.Dashed;
            tbl.GridLines = GridLines.Both;
            tbl.CssClass = "table";
            tblGroceries.Controls.Add(tbl);
            if (Page.IsPostBack == false)
            {
                ddlType.DataSource = System.Enum.GetNames(typeof(GroceriesTypeEnum));
                ddlType.DataBind();
                ddlMeasuringUnit.DataSource = Klass.DatabaseCom.Groceries.GetMeasuringUnits();
                ddlMeasuringUnit.DataBind();
            }
        }

        private Table GetUITableFromDataTable()
        {
            ColumnNames = new List<string>();
            Table tbl = new Table();
            DataTable table = Klass.DatabaseCom.Groceries.GetGroceriesInUnits();
            TableRow firstRow = new TableRow();
            foreach (DataColumn column in table.Columns)
            {
                TableCell cell = new TableCell
                {
                    Text = column.ColumnName + MarginForText
                };
                firstRow.Cells.Add(cell);
                ColumnNames.Add(column.ColumnName);
            }
            tbl.Rows.Add(firstRow);
            foreach (DataRow row in table.Rows)
            {
                TableRow tblRow = new TableRow();
                foreach (var colName in ColumnNames)
                {
                    TableCell cell = new TableCell
                    {
                        Text = row[colName].ToString()
                    };
                    tblRow.Cells.Add(cell);
                }
                tbl.Rows.Add(tblRow);
            }
            return tbl;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string GrocName = tbName.Text;
            GroceriesTypeEnum GrocType = Klass.Utils.EnumUtils.ParseEnum<GroceriesTypeEnum>( ddlType.SelectedValue.ToString());
            string GrocMeasureUnit = ddlMeasuringUnit.SelectedValue.ToString();
            string GrocKcalQuantity = tbQuantity.Text;
            Klass.DatabaseCom.Groceries.NewGrocerie(GrocName, GrocType, GrocMeasureUnit, GrocKcalQuantity);
            Response.Redirect("./Groceries.aspx");
        }
    }
}