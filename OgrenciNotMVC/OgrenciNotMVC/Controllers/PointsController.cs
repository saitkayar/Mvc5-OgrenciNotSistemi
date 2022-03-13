using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OgrenciNotMVC.Models.EntityFramework;

namespace OgrenciNotMVC.Controllers
{
    public class PointsController : Controller
    {
        DbMvcOkulEntities db = new DbMvcOkulEntities();
        // GET: Points
        
        public ActionResult Index()
        {
            var notlar = db.TblNotlar.ToList();
            return View(notlar);
        }
        [HttpGet]
        public ActionResult NewPoints()
        {
          
            return View();
        }
        [HttpPost]
        public ActionResult Newpoints(TblNotlar d)
        {
          

            db.TblNotlar.Add(d);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Delete(int id)
        {
            var club = db.TblNotlar.Find(id);
            db.TblNotlar.Remove(club);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Update(int id=0)
        {
            var club = db.TblNotlar.Find(id);


            return View("Update", club); 
        }
        public ActionResult Updatee(TblNotlar p)
        {
            var clubb = db.TblNotlar.Find(p.NotId);
            clubb.Sınav1 = p.Sınav1;
            clubb.Sınav2 = p.Sınav2;
            clubb.Sınav3 = p.Sınav3;
            clubb.Proje = p.Proje;
           
            db.SaveChanges();

            return RedirectToAction("Index",clubb);
        }
    }
}