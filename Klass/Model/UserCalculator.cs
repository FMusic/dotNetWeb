using Klass.DatabaseCom;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Klass.Model
{
    public static class UserCalculator
    {
        private const int f_sex_f = -161;
        private const int f_sex_m = 5;

        private const decimal f_act_low = 1.2M;
        private const decimal f_act_med = 1.375M;
        private const decimal f_act_high = 1.5M;

        private const decimal f_type_1 = 0.99M;
        private const decimal f_type_2 = 0.98M;

        private const decimal hHelper = 6.25M;
        //FORMULA = { (10 * tezinaUKg) + (6.25 * visinaUcm) - (5* starost) + f_spol} * f_aktivnost * f_tip_dijabetesa

        public static int GetKcalForUser(User u)
        {
            int sol = 0;
            decimal weigth = 0;
            decimal height = 0;
            decimal age = 0;
            decimal f_sex = 0;
            decimal f_act = 0;
            decimal f_type = 0;

            weigth = (decimal)u.Weight;
            height = (decimal)u.Height;
            age = (decimal)DateTime.Now.Year - u.DateOfBirth.Year;
            f_sex = u.Sex == "m" || u.Sex == "M" ? f_sex_m : f_sex_f;
            if (u.PhysicalActivity == 1)
            {
                f_act = f_act_low;
            }
            else if(u.PhysicalActivity == 2)
            {
                f_act = f_act_med;
            }
            else
            {
                f_act = f_act_high;
            }
            f_type = u.DiabetesType == 1 ? f_type_1 : f_type_2;
            decimal wHelp = 10 * weigth;
            decimal hHelp = hHelper * height;

            sol = Decimal.ToInt32(( wHelp + hHelp - (5 * age) + f_sex) * f_act * f_type);
            return sol;
        }
    }
}
