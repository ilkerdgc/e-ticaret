using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ETicaretProjesi.Models;
using System.IO;
using ETicaretProjesi.ViewModel;
using System.Data.Entity;
using System.Net;

namespace ETicaretProjesi.Controllers
{
    public class AdminController : Controller
    {
        ECommerceDBEntities db = new ECommerceDBEntities();

        public ActionResult AdminPanel()
        {
            ViewBag.bilgi1 = db.Reviews.Count<Review>();
            ViewBag.bilgi2 = db.SubCategories.Count<SubCategory>();
            ViewBag.bilgi3 = db.Products.Count<Product>();
            ViewBag.bilgi4 = db.Customers.Count<Customer>();
            return View();
        }

        public ActionResult Kategoriler()
        {
            List<SubCategory> sub = db.SubCategories.ToList();
            return View(sub);
        }

        public ActionResult Yorumlar()
        {
            List<Review> rev = db.Reviews.ToList();
            return View(rev);
        }

        public ActionResult Uyeler()
        {
            List<Customer> cus = db.Customers.ToList();
            return View(cus);
        }

        public ActionResult Urunler()
        {
            TempData["urun"] = db.Products.ToList();
            return View();
        }

        public ActionResult YeniUrun()
        {
            UrunEkleModel model = GetModel();
            return View(model);
        }

        [HttpPost]
        public ActionResult YeniUrun(UrunEkleModel model)
        {
            ECommerceDBEntities db = new ECommerceDBEntities();
            Product productModel = new Product();

            productModel.Name = model.ProductName;
            productModel.SupplierID = model.SupplierID;
            productModel.CategoryID = model.CategoryID;
            productModel.SubCategoryID = model.SubCategoryID;
            productModel.QuantityPerUnit = model.QuantityPerUnit;
            productModel.UnitPrice = Convert.ToDecimal(model.UnitPrice);
            productModel.Discount = Convert.ToDecimal(model.Discount);
            productModel.AltText = model.AltText;
            productModel.ShortDescription = model.ShortDescription;
            productModel.LongDescription = model.LongDescription;
            productModel.UnitsInStock = model.UnitsInStock;           

            if (model.ImageUrl != null && model.ImageUrl.ContentLength > 0)
            {
                bool durum = false;
                foreach (var item in db.Products.ToList())
                {
                    if (item.Name.ToLower() == model.ProductName.ToLower())
                    {
                        durum = true;
                        break;
                    }
                }
                if (durum == false)
                {
                    if (model.SubCategoryID == 1)
                    {
                        model.ImageUrl.SaveAs(Server.MapPath("~/images/aksiyon/" + model.ImageUrl.FileName));
                        productModel.ImageUrl = "~/images/aksiyon/" + model.ImageUrl.FileName;
                    }
                    else if (model.SubCategoryID == 2)
                    {
                        model.ImageUrl.SaveAs(Server.MapPath("~/images/bilimkurgu/" + model.ImageUrl.FileName));
                        productModel.ImageUrl = "~/images/bilimkurgu/" + model.ImageUrl.FileName;
                    }
                    else if (model.SubCategoryID == 3)
                    {
                        model.ImageUrl.SaveAs(Server.MapPath("~/images/dram/" + model.ImageUrl.FileName));
                        productModel.ImageUrl = "~/images/dram/" + model.ImageUrl.FileName;
                    }
                    db.Products.Add(productModel);
                    db.SaveChanges();
                }            
            }

            return RedirectToAction("Urunler","Admin");
            
        }

        private UrunEkleModel GetModel()
        {
            UrunEkleModel model = new UrunEkleModel();
            ECommerceDBEntities db = new ECommerceDBEntities();            

            model.SubCategoryList = (from subC in db.SubCategories
                                     select new SelectListItem
                                     {
                                         Selected = false,
                                         Text = subC.Name,
                                         Value = subC.SubCategoryID.ToString()
                                     }).ToList();

            model.SupplierIDList = (from sup in db.Suppliers
                                     select new SelectListItem
                                     {
                                         Selected = false,
                                         Text = sup.SuppliersID.ToString(),
                                         Value = sup.SuppliersID.ToString()
                                     }).ToList();

            model.CategoryIDList = (from cat in db.Categories
                                    select new SelectListItem
                                    {
                                        Selected = false,
                                        Text = cat.CategoryID.ToString(),
                                        Value = cat.CategoryID.ToString()
                                    }).ToList();

            model.SubCategoryList.Insert(0, new SelectListItem
            {
                Selected = true,
                Value = "",
                Text = "..Seçiniz.."
            });

            model.SupplierIDList.Insert(0, new SelectListItem
            {
                Selected = true,
                Value = "",
                Text = "..Seçiniz.."
            });

            model.CategoryIDList.Insert(0, new SelectListItem
            {
                Selected = true,
                Value = "",
                Text = "..Seçiniz.."
            });

            return model;
        }

        public ActionResult UrunDetay(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        public ActionResult UrunDuzenle(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.SubCategoryID = new SelectList(db.SubCategories, "SubCategoryID", "Name", product.SubCategoryID);
            ViewBag.SupplierID = new SelectList(db.Suppliers, "SuppliersID", "CompanyName", product.SupplierID);
            return View(product);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UrunDuzenle([Bind(Include = "ProductID,Name,SupplierID,CategoryID,SubCategoryID,QuantityPerUnit,UnitPrice,OldPrice,UnitWeight,Size,Discount,UnitsInStock,UnitOnOrder,ProductAvailable,ImageUrl,AltText,AddBadge,OjjerTitle,OjjerBadgeClass,ShortDescription,LongDescription,Picture1,Picture2,Picture3,Picture4,Note")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Urunler");
            }
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.SubCategoryID = new SelectList(db.SubCategories, "SubCategoryID", "Name", product.SubCategoryID);
            ViewBag.SupplierID = new SelectList(db.Suppliers, "SuppliersID", "CompanyName", product.SupplierID);
            return View(product);
        }

        public ActionResult UrunSil(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        [HttpPost, ActionName("UrunSil")]
        [ValidateAntiForgeryToken]
        public ActionResult UrunSil(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Urunler");
        }
    }
}