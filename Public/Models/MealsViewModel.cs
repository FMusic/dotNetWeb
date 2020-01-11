using Klass.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Public.Models
{
    public class MealsViewModel
    {
        public FullMealsCombination MealsInfo { get; set; }
        public MealsPickedInfo MealsList { get; set; }

        public MealsViewModel(FullMealsCombination mealsInfo, MealsPickedInfo mealsList)
        {
            MealsInfo = mealsInfo;
            MealsList = mealsList;
        }
    }
}