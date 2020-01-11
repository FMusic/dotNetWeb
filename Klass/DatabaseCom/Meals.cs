using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Klass.DatabaseCom
{
    public static class Meals
    {
        public static IList<GetMeals_Result> GetMeals()
        {
            using(var context = new PraRwaProjektEntities())
            {
                return context.GetMeals().ToList();
            }
        }

        public static void NewMeal(string name, string grocFat, string grocProtein, string grocCarbs)
        {
            using(var context = new PraRwaProjektEntities())
            {
                context.NewMeal(name, grocFat, grocProtein, grocCarbs);
            }
        }

        public static int NewCombination(DateTime dateFrom, DateTime dateTo, int numberOfMeals)
        {
            decimal combinationNumber; 

            using (var context = new PraRwaProjektEntities())
            {
                combinationNumber =  context.NewCombination3(dateFrom, dateTo, numberOfMeals).FirstOrDefault().Value;
            }

            return Decimal.ToInt32(combinationNumber);
        }

        public static void NewMealNutritions(int combinationNumber, int fatPercentage, int proteinPercentage, int carboPercentage, int comboPercentage, int mealNumber, string name)
        {
            using(var context= new PraRwaProjektEntities())
            {
                context.NewNutritionsForCombination(combinationNumber, fatPercentage, proteinPercentage, carboPercentage, comboPercentage, mealNumber, name);
            }
        }
    }
}
