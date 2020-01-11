using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Klass.Model
{
    public class FullMealsCombination
    {
        public IList<FullMeal> Meals { get; set; }
        public int NumberOfMeals { get; set; }

        public FullMealsCombination()
        {
            Meals = new List<FullMeal>();
        }
    }
}
