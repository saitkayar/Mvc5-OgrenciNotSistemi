using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OgrenciNotMVC.Models.EntityFramework;

namespace OgrenciNotMVC.Controllers
{
    public class StudentsController : Controller
    {
        // GET: Students
        DbMvcOkulEntities db = new DbMvcOkulEntities();
        public ActionResult Index()
        {
            var ogrenciler = db.TblOgrenciler.ToList();
            return View(ogrenciler);
        }
        [HttpGet]
        public ActionResult NewStudent()
        {
            List<SelectListItem> degerler = (from i in db.TblKulupler.ToList()
                                             select new SelectListItem
                                             {
                                                 Text = i.KulupAd,
                                                 Value = i.KulupId.ToString()
                                             }).ToList();
            ViewBag.dgr = degerler;
            return View();
        }
        [HttpPost]
        public ActionResult NewStudent(TblOgrenciler d)
        {
            var klp = db.TblKulupler.Where(m => m.KulupId == d.TblKulupler.KulupId).FirstOrDefault();
            d.TblKulupler = klp;

            db.TblOgrenciler.Add(d);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Delete(int id)
        {
            var club = db.TblOgrenciler.Find(id);
            db.TblOgrenciler.Remove(club);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Update(int id=0)
        {
            var club = db.TblOgrenciler.Find(id);


            return View("Update", club); 
        }
        public ActionResult Updatee(TblOgrenciler p)
        {
            var clubb = db.TblOgrenciler.Find(p.OgrId);
            clubb.OgrAd = p.OgrAd;
            clubb.OgrSoyad = p.OgrSoyad;
            clubb.OgrCinsiyet = p.OgrCinsiyet;
            clubb.OgrKulup = p.OgrKulup;
            clubb.OgrFoto = p.OgrFoto;
            db.SaveChanges();

            return RedirectToAction("Index", "Students");
        }
    }
}