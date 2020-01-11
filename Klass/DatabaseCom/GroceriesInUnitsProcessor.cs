using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Klass.DatabaseCom
{
    public static class GroceriesInUnitsProcessor
    {
        public static DataTable GetGrocsInUnits(IList<GetGroceriesAndUnits_Result> list)
        {
            string FirstColumnName = "GrocerieName";
            string EmptyCellText = "-";
            var types = list.Select(i => i.MeasuringUnitName).Distinct();
            var grocsNames = list.Select(i => i.GrocerieName).Distinct();
            DataTable dt = new DataTable();
            dt.Columns.Add(FirstColumnName);
            foreach (var type in types)
            {
                dt.Columns.Add(type);
            }
            foreach (var item in grocsNames)
            {
                var row = dt.NewRow();
                row[FirstColumnName] = item;
                foreach (var type in types)
                {
                    var grocerieInType = (
                            from listCol in list
                            where listCol.GrocerieName == item && listCol.MeasuringUnitName==type
                            select listCol.Quantity
                        ).FirstOrDefault();
                    if (grocerieInType != 0)
                    {
                        row[type] = grocerieInType.ToString();
                    }
                    else
                    {
                        row[type] = EmptyCellText;
                    }
                }
                dt.Rows.Add(row);
            }
            return dt;
        }
    }
}
