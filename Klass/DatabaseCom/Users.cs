using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Klass.DatabaseCom
{
    public static class Users
    {
        static string AdminName = "Admin";
        static string AdminPass = "AdminPass";

        public static bool LoginUser(string username, string password)
        {
            if (username == AdminName && password == AdminPass)
                return true;
            string pass;
            using(var context = new PraRwaProjektEntities())
            {
                pass = context.LoginUser(username).FirstOrDefault();
            }
            if (password == pass)
                return true;
            return false;
        }

        public static GetUsers_Result GetUser(string username)
        {
            throw new NotImplementedException();
        }

        public static void RegisterUser(string username, string pass, string name, string surname, DateTime dob, string sex,
            string email, int weight, int height, int phyAct, int dType)
        {
            using (var context = new PraRwaProjektEntities())
            {
                context.RegisterNewUser(name, surname, dob, email, username, pass, weight, height, phyAct, dType, sex);
            }
        }

        public static bool LoginAdmin(string username, string password)
        {
            if (username == AdminName && password == AdminPass)
                return true;
            return false;
        }

        public static IList<GetUsers2_Result> GetAllUsers()
        {
            using (var context = new PraRwaProjektEntities())
            {
                return context.GetUsers2().ToList();
            }
        }
    }
}
