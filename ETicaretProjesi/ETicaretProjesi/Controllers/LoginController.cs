using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ETicaretProjesi.Models;

namespace ETicaretProjesi.Controllers
{
    public class LoginController : Controller
    {
        ECommerceDBEntities db = new ECommerceDBEntities();
        
        // GET: Login
        public ActionResult Giris()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Giris(FormCollection form)
        {
            string kullaniciAdi = form["UserName"];
            string sifre = form["Password"];

            Customer c = db.Customers.Where(x => x.UserName == kullaniciAdi && x.Password == sifre).FirstOrDefault();
            Admin_Logins a = db.Admin_Logins.Where(x => x.UserName == kullaniciAdi && x.Password == sifre).FirstOrDefault();

            if (c != null)
            {
                GeciciUserData.UserID = c.CustomerID;
                Session["kullanici"] = c.UserName;
                return RedirectToAction("AnaSayfa","Home");
            }
            else if (a != null)
            {
                Session["admin"] = a.UserName;
                return RedirectToAction("AnaSayfa", "Home");
            }

            return View();
        }

        public ActionResult Cikis()
        {
            GeciciUserData.UserID = 1;
            Session["kullanici"] = null;
            Session["admin"] = null;
            return RedirectToAction("AnaSayfa","Home");
        }

        public ActionResult UyeOl()
        {
            return View();
        }

        [HttpPost]
        public ActionResult UyeOl(FormCollection form)
        {
            string kulAdi = form["kullaniciadi"];
            Customer cus = db.Customers.Where(x => x.UserName == kulAdi).FirstOrDefault();

            if (cus == null)
            {
                Customer c = new Customer();
                c.FirstName = form["isim"];
                c.LastName = form["soyisim"];
                c.UserName = form["kullaniciadi"];
                c.Password = form["sifre"];
                c.Age = Convert.ToInt32(form["yas"]);
                c.Gender = form["cinsiyet"];
                c.BirthDate = DateTime.Parse(form["dogumtarihi"]);
                c.Email = form["email"];
                c.Mobile1 = form["telefon"];
                c.Address1 = form["adres"];

                db.Customers.Add(c);
                db.SaveChanges();

                GeciciUserData.UserID = db.Customers.Where(x => x.UserName == c.UserName).FirstOrDefault().CustomerID;
                Session["kullanici"] = c.UserName;
                return RedirectToAction("AnaSayfa","Home");
            }

            return View();
        }

    }
}