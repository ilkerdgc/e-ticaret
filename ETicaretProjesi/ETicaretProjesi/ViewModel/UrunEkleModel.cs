using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ETicaretProjesi.ViewModel
{
    public class UrunEkleModel
    {
        [Required(ErrorMessage = "Ürün İsmi Girmelisiniz!")]
        [StringLength(50,ErrorMessage = "Ürün İsmi Alanı En Fazla 50 Karakter Olabilir!")]
        [Display(Name = "Ürün Adı")]
        public string ProductName { get; set; }

        [Required(ErrorMessage = "SupplierID Girmelisiniz!")]        
        public int SupplierID { get; set; }

        [Required(ErrorMessage = "CategoryID Girmelisiniz!")]
        public int CategoryID { get; set; }

        [Required(ErrorMessage = "SubCategoryID Girmelisiniz!")]
        public int SubCategoryID { get; set; }

        [Display(Name = "Birim Miktarı('1' olarak giriniz)")]
        public string QuantityPerUnit { get; set; }

        [Required(ErrorMessage = "UnitPrice Girmelisiniz!")]
        [Display(Name = "Birim Fiyat")]
        public string UnitPrice { get; set; }
        
        [Display(Name = "İndirim")]
        public string Discount { get; set; }

        [Display(Name = "Alt Metin")]
        public string AltText { get; set; }

        [Display(Name = "Kısa Açıklama")]
        public string ShortDescription { get; set; }

        [Display(Name = "Uzun Açıklama")]
        public string LongDescription { get; set; }

        [Display(Name = "Stok Miktarı")]
        public int UnitsInStock { get; set; }

        [Required(ErrorMessage = "Ürün Resimini Yüklemelisiniz!")]
        [Display(Name = "Ürün Resmi")]
        public HttpPostedFileBase ImageUrl { get; set; }

        public List<SelectListItem> SubCategoryList { get; set; }

        public List<SelectListItem> SupplierIDList { get; set; }

        public List<SelectListItem> CategoryIDList { get; set; }
    }
}