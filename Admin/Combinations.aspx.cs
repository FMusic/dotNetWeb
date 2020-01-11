using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class Combinations : System.Web.UI.Page
    {
        private string[] colNames = { "#", "Meal Name", "% Proteins", "% Fat", "% Carbs", "% in Combination" };
        private string[] possibleNumOfMeals = { "0", "1", "2", "3", "4", "5" };
        Table tbl;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                ddlNumberOfMeals.DataSource = possibleNumOfMeals;
                ddlNumberOfMeals.DataBind();
            }
            tbl = new Table
            {
                Visible = false
            };
            btnSubmit.Visible = false;
            TableRow row = new TableRow();
            foreach (var colName in colNames)
            {
                TableCell cell = new TableCell
                {
                    Text = colName
                };
                row.Cells.Add(cell);
            }
            tbl.Rows.Add(row);
            tblCombinations.Controls.Add(tbl);
            FillTable(Int32.Parse(ddlNumberOfMeals.SelectedValue.ToString()));
            
            
        }

        private void FillTable(int numOfMeals)
        {
            for (int i = 1; i <= numOfMeals; i++)
            {
                TableRow rowTb = new TableRow();

                TableCell cell = new TableCell();
                cell.Text = i.ToString();
                rowTb.Cells.Add(cell);

                TableCell cell2 = new TableCell();
                cell2.Controls.Add(new TextBox());
                rowTb.Cells.Add(cell2);

                TableCell cell3 = new TableCell();
                cell3.Controls.Add(new TextBox());
                rowTb.Cells.Add(cell3);

                TableCell cell4 = new TableCell();
                cell4.Controls.Add(new TextBox());
                rowTb.Cells.Add(cell4);

                TableCell cell5 = new TableCell();
                cell5.Controls.Add(new TextBox());
                rowTb.Cells.Add(cell5);

                TableCell cell6 = new TableCell();
                cell6.Controls.Add(new TextBox());
                rowTb.Cells.Add(cell6);

                tbl.Rows.Add(rowTb);
            }
            if (numOfMeals > 0)
            {
                tbl.Visible = true;
                btnSubmit.Visible = true;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DateTime dtFrom = calFrom.SelectedDate;
            DateTime dtTo = calTo.SelectedDate;
            int numOfMeals = Int32.Parse(ddlNumberOfMeals.SelectedValue);
            int combinationID = Klass.DatabaseCom.Meals.NewCombination(dtFrom, dtTo, numOfMeals);
            for (int i = 1; i < numOfMeals+1; i++)
            {
                TextBox nameStr = tbl.Rows[i].Cells[1].Controls[0] as TextBox;
                string name = nameStr.Text;
                TextBox proteinPerc = tbl.Rows[i].Cells[2].Controls[0] as TextBox;
                int proteins = Int32.Parse(proteinPerc.Text);
                TextBox fatPerc = tbl.Rows[i].Cells[3].Controls[0] as TextBox;
                int fat = Int32.Parse(proteinPerc.Text);
                TextBox carboPerc = tbl.Rows[i].Cells[4].Controls[0] as TextBox;
                int carbs = Int32.Parse(proteinPerc.Text);
                TextBox combPerc = tbl.Rows[i].Cells[5].Controls[0] as TextBox;
                int combo = Int32.Parse(proteinPerc.Text);
                Klass.DatabaseCom.Meals.NewMealNutritions(combinationID, fat, proteins, carbs, combo, i, name);
            }
        }
    }
}