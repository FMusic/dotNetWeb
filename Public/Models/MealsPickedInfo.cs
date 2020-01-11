using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Public.Models
{
    public class MealsPickedInfo
    {
        private int v;

        public MealsPickedInfo(int v)
        {
            PickedMeals = new List<MealPicked>();
            this.v = v;
            for(int i = 0; i < v; i++)
            {
                PickedMeals.Add(new MealPicked());
            }
        }

        public IList<MealPicked> PickedMeals { get; set; }
    }
}