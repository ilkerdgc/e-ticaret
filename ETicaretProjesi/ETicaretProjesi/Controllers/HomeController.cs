using ETicaretProjesi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ETicaretProjesi.Controllers
{
    public class HomeController : Controller
    {
        ECommerceDBEntities db = new ECommerceDBEntities();

        public ActionResult AnaSayfa()
        {
            return View();
        }

        public ActionResult Urunler(int id)
        {
            TempData["urunler"] = db.Products.Where(x => x.SubCategoryID == id).ToList();
            return View();
        }

        public ActionResult UrunDetay(int id)
        {
            TempData["urunDetay"] = db.Products.Where(x => x.ProductID == id).FirstOrDefault();
            TempData["yorumlar"] = db.Reviews.Where(x => x.ProductID == id).ToList();

            return View();
        }

        public ActionResult Sepet(int id)
        {
            if (Session["kullanici"] != null)
            {
                OrderDetail od = new OrderDetail();
                od.OrderID = 1;
                od.CustomerID = GeciciUserData.UserID;
                od.ProductID = id;
                od.UnitPrice = db.Products.Find(id).UnitPrice;
                od.Quantity = 1;
                od.Discount = null;
                od.TotalAmount = od.Quantity * od.UnitPrice;
                od.OrderDate = DateTime.Now;              

                if (db.OrderDetails.ToList().Count == 0)
                {
                    db.OrderDetails.Add(od);
                    db.SaveChanges();
                }
                else
                {
                    bool durum = false;
                    foreach (var item in db.OrderDetails.ToList())
                    {
                        if (item.ProductID == id)
                        {
                            durum = true;
                            break;
                        }
                    }
                    if (!durum)
                    {
                        db.OrderDetails.Add(od);
                        db.SaveChanges();
                    }
                }               
            }
            else
            {
                return RedirectToAction("Giris", "Login");
            }

            return RedirectToAction("UrunDetay", new { id = id });

        }

        public ActionResult Istek(int id)
        {
            if (Session["kullanici"] != null)
            {
                Wishlist w = new Wishlist();
                w.CustomerID = GeciciUserData.UserID;
                w.ProductID = id;
                w.IsActive = true;

                

                if (db.Wishlists.ToList().Count == 0)
                {
                    db.Wishlists.Add(w);
                    db.SaveChanges();
                }
                else
                {
                    bool durum = false;
                    foreach (var item in db.Wishlists.ToList())
                    {
                        if (item.ProductID == id)
                        {
                            durum = true;
                            break;
                        }
                    }
                    if (!durum)
                    {
                        db.Wishlists.Add(w);
                        db.SaveChanges();
                    }
                }              
            }
            else
            {
                return RedirectToAction("Giris","Login");
            }       

            return RedirectToAction("UrunDetay", new { id = id });
        }

        public ActionResult YorumEkle(int id, FormCollection frm)
        {
            Review r = new Review();
            r.CustomerID = GeciciUserData.UserID;
            r.ProductID = id;
            r.Name = db.Customers.Find(id).UserName;
            r.Email = db.Reviews.Find(r.CustomerID).Email;
            r.Review1 = frm["Review"];
            r.Rate = int.Parse(frm["Rate"]);
            r.Datetime = DateTime.Now;
            r.IsDeleted = false;

            db.Reviews.Add(r);
            db.SaveChanges();

            TempData["yorumEkle"] = db.Reviews.ToList();

            return RedirectToAction("UrunDetay","Home", new { id = r.ProductID });
        }

        public ActionResult Sepetim()
        {
            TempData["sepetL"] = db.OrderDetails.Where(x => x.CustomerID == GeciciUserData.UserID).ToList();

            return View();
        }

        public ActionResult IstekListem()
        {
            TempData["wishlistL"] = db.Wishlists.Where(x => x.CustomerID == GeciciUserData.UserID).ToList();

            return View();
        }

        public ActionResult SepettenCikar(int id)
        {
            OrderDetail od = db.OrderDetails.Where(x => x.ProductID == id).FirstOrDefault();
            db.OrderDetails.Remove(od);
            db.SaveChanges();

            TempData["orderDetailSepett"] = db.OrderDetails.ToList(); // aslında gerek yok

            return RedirectToAction("Sepetim");
        }

        public ActionResult IstekListemdenCikar(int id)
        {
            Wishlist w = db.Wishlists.Where(x => x.ProductID == id).FirstOrDefault();
            db.Wishlists.Remove(w);
            db.SaveChanges();

            TempData["wishlistIstek"] = db.Wishlists.ToList(); // aslında gerek yok

            return RedirectToAction("IstekListem");
        }

        public ActionResult IstekListemdenSepeteEkle(int id)
        {
            Wishlist w = db.Wishlists.Where(x => x.ProductID == id).FirstOrDefault();
            db.Wishlists.Remove(w);

            OrderDetail od = new OrderDetail();
            od.OrderID = 1;
            od.ProductID = id;
            od.CustomerID = GeciciUserData.UserID;
            od.UnitPrice = db.Products.Find(id).UnitPrice;
            od.Quantity = 1;
            od.Discount = null;
            od.TotalAmount = od.Quantity * od.UnitPrice;
            od.OrderDate = DateTime.Now;

            if (db.OrderDetails.ToList().Count != 0)
            {
                bool durum = false;
                foreach (var item in db.OrderDetails.ToList())
                {
                    if (item.ProductID == id)
                    {
                        durum = true;
                        break;
                    }
                }
                if (!durum)
                {
                    db.OrderDetails.Add(od);
                    db.SaveChanges();
                }
            }

            return RedirectToAction("IstekListem");
        }
       
    }
}