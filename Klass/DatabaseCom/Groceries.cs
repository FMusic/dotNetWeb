using Klass.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Klass.DatabaseCom
{
    public static class Groceries
    {
        public static IList<GetGroceries2_Result> GetGroceries()
        {
            using(var context = new PraRwaProjektEntities())
            {
                return context.GetGroceries2().ToList();
            }
        }

        public static DataTable GetGroceriesInUnits()
        {
            IList<GetGroceriesAndUnits_Result> list;
            using (var context = new PraRwaProjektEntities())
            {
                list = context.GetGroceriesAndUnits().ToList();
            }
            DataTable table = GroceriesInUnitsProcessor.GetGrocsInUnits(list);
            return table;
        }

        //public static void NewGrocerie(string name, GroceriesTypeEnum groceriesType, string measureUnit, int kcalPerMu)
        //{
        //    using(var context = new PraRwaProjektEntities())
        //    {
        //        context.NewGrocerie2(name, groceriesType.ToString(), measureUnit, kcalPerMu);
        //    }
        //}

        public static void NewGrocerie(string name, GroceriesTypeEnum groceriesType, string measureUnit, string kcalPerMu)
        {
            int kcal = Int32.Parse(kcalPerMu);
            using (var context = new PraRwaProjektEntities())
            {
                context.NewGrocerie2(name, groceriesType.ToString(), measureUnit, kcal);
            }
        }

        public static IList<string> GetMeasuringUnits()
        {
            using (var context = new PraRwaProjektEntities())
            {
                return context.GetMeasuringUnits().ToList();
            }
        }

        public static void NewMeasuringUnit(string name)
        {
            using(var context = new PraRwaProjektEntities())
            {
                context.NewMeasuringUnit(name);
            }
        }

        
    }
}
