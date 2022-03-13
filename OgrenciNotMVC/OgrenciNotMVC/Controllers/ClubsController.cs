using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OgrenciNotMVC.Models.EntityFramework;
namespace OgrenciNotMVC.Controllers
{
    public class ClubsController : Controller
    {
        // GET: Clubs
        DbMvcOkulEntities db = new DbMvcOkulEntities();
        public ActionResult Index()
        {
            var clubs = db.TblKulupler.ToList();
            return View(clubs);
        }
        [HttpGet]
        public ActionResult NewClub()
        {

            return View();
        }
        [HttpPost]
        public ActionResult NewClub(TblKulupler d)
        {
            db.TblKulupler.Add(d);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Delete(int id)
        {
            var club = db.TblKulupler.Find(id);
            db.TblKulupler.Remove(club);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Update(int id=0)
        {
            var club = db.TblKulupler.Find(id);


            return View("Update",club); 
        }
        public ActionResult Updatee(TblKulupler p)
        {
            var clubb = db.TblKulupler.Find(p.KulupId);
            clubb.KulupAd = p.KulupAd;
            db.SaveChanges();

            return RedirectToAction("Index","Clubs"); 
        }
    }
}