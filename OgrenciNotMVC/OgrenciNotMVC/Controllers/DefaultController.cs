using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OgrenciNotMVC.Models.EntityFramework;

namespace OgrenciNotMVC.Controllers
{
    public class DefaultController : Controller
    {
        // GET: Default

        DbMvcOkulEntities db = new DbMvcOkulEntities();

        public ActionResult Index()
        {
            var dersler = db.TblDersler.ToList();
            return View(dersler);
        }
        [HttpGet]
        public ActionResult NewLesson()
        {
         
            return View();
        }
        [HttpPost]
        public ActionResult NewLesson(TblDersler d)
        {
            db.TblDersler.Add(d);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Delete(int id)
        {
            var classes = db.TblDersler.Find(id);
            db.TblDersler.Remove(classes);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Update(int id)
        {
            var club =db.TblDersler.Find(id);


            return View("Update",club); 
        }
        public ActionResult Updatee(TblDersler p)
        {
            var clubb = db.TblDersler.Find(p.DersId);
            clubb.DersAd = p.DersAd;
            db.SaveChanges();

            return RedirectToAction("Index", "Default");
        }
    }
}