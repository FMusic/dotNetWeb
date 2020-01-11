using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Klass.Model
{
    public class User
    {
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public int Weight { get; set; }
        public int Height { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string Sex { get; set; }
        public string Email { get; set; }
        public int PhysicalActivity { get; set; }
        public int DiabetesType { get; set; }
        public int KcalsInDay { get; set; }
        public PhysicalActivty ActivityEnum { get; set; }
        public Sex SexEnum { get; set; }
        public DiabetesType DiabetesEnum { get; set; }


        public static User GetFullUser(GetUsers2_Result u)
        {
            User user = new User()
            {
                Name = u.Name,
                Surname = u.Surname,
                Username = u.Username,
                Password = u.Password,
                Weight = u.Weight.Value,
                Height = u.Height.Value,
                DateOfBirth = u.DateOfBirth.Value,
                Sex = u.Sex,
                Email = u.Email,
                PhysicalActivity = u.PhysicalActivity.Value,
                DiabetesType = u.DiabetesType.Value
            };
            user.KcalsInDay = UserCalculator.GetKcalForUser(user);
            return user;

        }

        public void DoCalc()
        {
            DiabetesType = DiabetesEnum.ToString() == "One" ? 1 : 2;
            switch (ActivityEnum)
            {
                case PhysicalActivty.Low:
                    PhysicalActivity = 1;
                    break;
                case PhysicalActivty.Middle:
                    PhysicalActivity = 2;
                    break;
                case PhysicalActivty.High:
                    PhysicalActivity = 3;
                    break;
                default:
                    break;
            }
            Sex = SexEnum.ToString() == "Male" ? "M" : "F";
            DoCalcKcals();
        }

        public void DoCalcKcals()
        {
            KcalsInDay = UserCalculator.GetKcalForUser(this);
        }
    }
}
