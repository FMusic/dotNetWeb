using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Public.Models
{
    public class MealToPick
    {
        public string ProteinGroc { get; set; }
        public string FatGroc { get; set; }
        public string CarboGroc { get; set; }

        public bool ProteinTook { get; set; }
        public bool FatTook { get; set; }
        public bool CarbTook { get; set; }

        public string MealName { get; set; }
        public int MealKcal { get; set; }

        //public static GetMealToPick(int kcal, string mealName)
        //{

        //}
    }
}