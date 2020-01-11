using Klass.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Klass.DatabaseCom
{
    public class PickMeals
    {
        public static FullMealsCombination GetMealsCombinations(DateTime date, int kcals, int numOfMeals)
        {
            FullMealsCombination fmc = new FullMealsCombination();
            using(var context = new PraRwaProjektEntities())
            {
                var grocsInUnits = context.GetGroceriesAndUnits();
                var grocsInUni = grocsInUnits.ToList();
                var nutritions =  context.GetNutritionsForADay8(date, numOfMeals).ToList();
                foreach (var meal in nutritions)
                {
                    var grocsInMeal = context.GetMealFromName2(meal.Name).Single();
                    //var nutritionsForMeal = (
                    //       from nutritionInMeal in nutritions
                    //       where nutritionInMeal.Name == grocsInMeal.Name
                    //       select nutritionInMeal
                    //   ).SingleOrDefault();
                    var fatUnit = (
                            from grocerie in grocsInUni
                            where grocerie.GrocerieName == grocsInMeal.Fat
                            select grocerie.MeasuringUnitName
                        ).FirstOrDefault();
                    var protUnit = (
                            from grocerie in grocsInUni
                            where grocerie.GrocerieName == grocsInMeal.Protein
                            select grocerie.MeasuringUnitName
                        ).FirstOrDefault();
                    var carbUnit = (
                            from grocerie in grocsInUni
                            where grocerie.GrocerieName == grocsInMeal.Carb
                            select grocerie.MeasuringUnitName
                        ).FirstOrDefault();

                    FullMeal fm = new FullMeal
                    {
                        MealName = meal.Name,
                        carbGroc = grocsInMeal.Carb,
                        fatGroc = grocsInMeal.Fat,
                        protGroc = grocsInMeal.Protein,

                        fatPerc = meal.FatPerc.Value,
                        protPerc = meal.ProtPerc.Value,
                        carbPerc = meal.CarbPerc.Value,

                        fatMU = fatUnit,
                        proteinMU = protUnit,
                        carbsMU = carbUnit,

                        fatQuantityPerMU = (
                            from groc in grocsInUni
                            where groc.GrocerieName == grocsInMeal.Fat
                            select groc.Quantity
                        ).FirstOrDefault(),

                        proteinQuantityPerMU = (
                            from groc in grocsInUni
                            where groc.GrocerieName == grocsInMeal.Protein
                            select groc.Quantity
                        ).FirstOrDefault(),

                        carbQuantityPerMU = (
                            from groc in grocsInUni
                            where groc.GrocerieName == grocsInMeal.Carb
                            select groc.Quantity
                        ).FirstOrDefault(),
                        GrocsInUnits = grocsInUni.ToList()
                    };
                    fm.percInComb = meal.combPerc.Value;

                    fm.mealKcal = kcals * fm.percInComb * 0.01;

                    fm.DoCalc();
                    fmc.Meals.Add(fm);

                }
            }
            fmc.NumberOfMeals = fmc.Meals.Count;
            return fmc;
        }
    }
}
