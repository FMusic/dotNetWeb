using Klass;
using Klass.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class Meals : System.Web.UI.Page
    {
        public string[] ColumnNames { get; set; } = { "#", "Name", "Protein Grocery", "Carbohydrate Grocery", "Fat Grocery" };
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadTable();
            if(Page.IsPostBack == false)
                LoadDDLs();
        }

        private void LoadTable()
        {
            int i = 1;
            Table tbl = new Table();
            tbl.HorizontalAlign = HorizontalAlign.Center;
            tbl.BorderStyle = BorderStyle.Dashed;
            tbl.GridLines = GridLines.Both;
            tbl.CssClass = "table";
            TableRow row = new TableRow();
            foreach (var colName in ColumnNames)
            {
                TableCell cell = new TableCell
                {
                    Text = colName
                };
                row.Cells.Add(cell);
            }
            tbl.Rows.Add(row);
            var meals = Klass.DatabaseCom.Meals.GetMeals();
            foreach (var meal in meals)
            {
                TableRow rowData = new TableRow();
                TableCell cellNum = new TableCell
                {
                    Text = i.ToString()
                };
                rowData.Cells.Add(cellNum);
                i++;
                TableCell cellName = new TableCell
                {
                    Text = meal.Name
                };
                rowData.Cells.Add(cellName);
                TableCell cell2 = new TableCell
                {
                    Text = meal.ProteinGrocerie
                };
                rowData.Cells.Add(cell2);
                TableCell cell3 = new TableCell
                {
                    Text = meal.CarboGrocerie
                };
                rowData.Cells.Add(cell3);
                TableCell cell4 = new TableCell
                {
                    Text = meal.FatGrocerie
                };
                rowData.Cells.Add(cell4);
                tbl.Rows.Add(rowData);
            }
            tblMeals.Controls.Add(tbl);
        }

        private void LoadDDLs()
        {
            var grocs = Klass.DatabaseCom.Groceries.GetGroceries();
            IList<string> carbsGrocs = GetGrocsWithType(grocs, "Carbohydrates");
            IList<string> fatGrocs = GetGrocsWithType(grocs, "Fat");
            IList<string> proteinGrocs = GetGrocsWithType(grocs, "Proteins");

            ddlCarbo.DataSource = carbsGrocs;
            ddlCarbo.DataBind();
            ddlFat.DataSource = fatGrocs;
            ddlFat.DataBind();
            ddlProtein.DataSource = proteinGrocs;
            ddlProtein.DataBind();

        }

        private IList<string> GetGrocsWithType(IList<GetGroceries2_Result> grocs, string v)
        {
            var result = (
                    from groc in grocs
                    where groc.GrocerieType == v
                    select groc.Name
                ).ToList();
            return result;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string mealName = tbNameNew.Text;
            string fatGroc = ddlFat.SelectedValue;
            string proteinGroc = ddlProtein.SelectedValue;
            string carboGroc = ddlCarbo.SelectedValue;

            Klass.DatabaseCom.Meals.NewMeal(mealName, fatGroc, proteinGroc, carboGroc);
            Response.Redirect("./Meals.aspx");
        }
    }
}