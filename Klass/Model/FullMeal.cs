using Klass.DatabaseCom;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Klass.Model
{
    public class FullMeal
    {
        public string MealName { get; set; }

        public int fatPerc { get; set; }
        public int carbPerc { get; set; }
        public int protPerc { get; set; }

        public string fatGroc { get; set; }
        public string carbGroc { get; set; }
        public string protGroc { get; set; }

        public string fatMU { get; set; }
        public string proteinMU { get; set; }
        public string carbsMU { get; set; }

        public Dictionary<string, int> fatQuantPerMU { get; set; }
        public Dictionary<string,int> protQuantPerMU { get; set; }
        public Dictionary<string,int> carbQuantPerMU { get; set; }

        //kcalPerMU
        public int fatQuantityPerMU { get; set; }
        public int carbQuantityPerMU { get; set; }
        public int proteinQuantityPerMU { get; set; }

        //quantity In whole meal for user
        public double fatQuantity { get; set; }
        public double carbQuantity { get; set; }
        public double proteinQuantity { get; set; }

        public int percInComb { get; set; }
        public double mealKcal{ get; set; }

        public double fatKcal { get; set; }
        public double proteinKcal { get; set; }
        public double carbsKCal { get; set; }

        public IList<GetGroceriesAndUnits_Result> GrocsInUnits { get; set; }
        public IList<string> MeasuringUnits { get; set; }

        public IList<MeasureUnitGroceries> GrocsInMu { get; set; }
        

        internal void DoCalc()
        {
            fatKcal = mealKcal * fatPerc * 0.01;
            proteinKcal = mealKcal * protPerc * 0.01;
            carbsKCal = mealKcal * carbPerc * 0.01;

            fatQuantity = fatKcal / fatQuantityPerMU;
            carbQuantity = carbsKCal / carbQuantityPerMU;
            proteinQuantity = proteinKcal / proteinQuantityPerMU;
            MeasuringUnits = Groceries.GetMeasuringUnits();
            GrocsInMu = new List<MeasureUnitGroceries>();
            foreach (var measureUnit in MeasuringUnits)
            {
                string fat, protein, carb;
                var unit = new MeasureUnitGroceries
                {
                    MeasureUnitName = measureUnit
                };
                try
                {
                    var fatInGroc = fatKcal / (
                                  from grocInUnit in GrocsInUnits
                                  where grocInUnit.GrocerieName == fatGroc && grocInUnit.MeasuringUnitName == measureUnit
                                  select grocInUnit.Quantity
                             ).Single();
                    fat = Math.Ceiling(fatInGroc).ToString();
                }
                catch (Exception)
                {
                    fat = "-";
                }
                try
                {
                    var protInGroc = proteinKcal / (
                                  from grocInUnit in GrocsInUnits
                                  where grocInUnit.GrocerieName == protGroc && grocInUnit.MeasuringUnitName == measureUnit
                                  select grocInUnit.Quantity
                             ).Single();
                    protein = Math.Ceiling(protInGroc).ToString();
                }
                catch (Exception)
                {
                    protein = "-";
                }
                try
                {
                    var carbInGroc = carbsKCal / (
                                  from grocInUnit in GrocsInUnits
                                  where grocInUnit.GrocerieName == carbGroc && grocInUnit.MeasuringUnitName == measureUnit
                                  select grocInUnit.Quantity
                             ).Single();
                    carb = Math.Ceiling(carbInGroc).ToString();
                }
                catch (Exception)
                {
                    carb = "-";
                }
                unit.GrocQuantites.Add(fat);
                unit.GrocQuantites.Add(protein);
                unit.GrocQuantites.Add(carb);
                GrocsInMu.Add(unit);
            }
        }
    }

    public class MeasureUnitGroceries
    {
        //First is fat, second is prot, third is carb
        public IList<string> GrocQuantites { get; set; }
        public string MeasureUnitName { get; set; }
        public MeasureUnitGroceries()
        {
            GrocQuantites = new List<string>();
        }
    }
}
