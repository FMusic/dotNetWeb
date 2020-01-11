using Klass;
using Klass.Model;
using Public.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Public.Controllers
{
    public class HomeController : Controller
    {
        private User UserFull;
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }
        
        public ActionResult GenerateNew()
        {
            return View();
        }

        [HttpPost]
        public PartialViewResult GetMealsToShow(string numOfMeals, DateTime date)
        {
            
            //UserFull.DoCalc();
            //int kcals = Klass.Model.UserCalculator.GetKcalForUser(UserFull);
            int kcals = 1200;
            FullMealsCombination fmc = Klass.DatabaseCom.PickMeals.GetMealsCombinations(date, kcals, Int32.Parse(numOfMeals));
            MealsPickedInfo mpi = new MealsPickedInfo(Int32.Parse(numOfMeals));
            MealsViewModel mvm = new MealsViewModel(fmc, mpi);
            return PartialView("_TableMeals", mvm);
        }

        public ActionResult Login()
        {
            LoginViewModel lvm = new LoginViewModel();
            return View(lvm);
        }

        [HttpPost]
        public ActionResult LoginUser(LoginViewModel viewModel)
        {
            bool loggedIn = Klass.DatabaseCom.Users.LoginUser(viewModel.User.Username, viewModel.User.Password);
            if (loggedIn == true)
            {
                IList<GetUsers2_Result> users = Klass.DatabaseCom.Users.GetAllUsers();
                GetUsers2_Result uresult = (from user in users
                                   where user.Username == viewModel.User.Username
                                   select user).SingleOrDefault();
                UserFull = Klass.Model.User.GetFullUser(uresult);
                UserFull.DoCalcKcals();
                return RedirectToAction("Index", "Home");
            }
            else
                return RedirectToAction("FailedLogin", "Home");
        }

        [HttpPost]
        public ActionResult RegisterUser(LoginViewModel viewModel)
        {
            viewModel.User.DoCalc();
            UserFull = viewModel.User;
            Klass.DatabaseCom.Users.RegisterUser(
                    viewModel.User.Username,
                    viewModel.User.Password,
                    viewModel.User.Name,
                    viewModel.User.Surname,
                    viewModel.User.DateOfBirth,
                    viewModel.User.Sex,
                    viewModel.User.Email,
                    viewModel.User.Weight,
                    viewModel.User.Height,
                    viewModel.User.PhysicalActivity,
                    viewModel.User.DiabetesType
                );
            return RedirectToAction("Index", "Home");
        }

        public ActionResult FailedLogin()
        {
            return View();
        }

        public ActionResult ViewOld()
        {
            return View();
        }
    }
}