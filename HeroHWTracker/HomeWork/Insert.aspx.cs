using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using HeroHWTracker.Models;
using Microsoft.AspNet.Identity;
using System.Data.SqlClient;

namespace HeroHWTracker.HomeWork
{

    public partial class Insert : System.Web.UI.Page
    {
		protected HeroHWTracker.Models.HeroEntities1 _db = new HeroHWTracker.Models.HeroEntities1();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        // This is the Insert method to insert the entered HomeWork item
        // USAGE: <asp:FormView InsertMethod="InsertItem">
        public void InsertItem()
        {
            using (_db)
            {
                const int MAX_MONSTERS = 2;

                var item = new HeroHWTracker.Models.HomeWork();
                item.isComplete = 0;
                int currentUser;
                Int32.TryParse(User.Identity.GetUserId(), out currentUser);
                item.UserInfoID = currentUser;

                //pick a random monster
                Random rnd = new Random();
                int numMon = rnd.Next(1, MAX_MONSTERS+1); // creates a number 1 and # of monsters
                item.MonsterID = numMon;

                TryUpdateModel(item);

                if (ModelState.IsValid)
                {
                    // Save changes
                    _db.HomeWork.Add(item);
                    _db.SaveChanges();

                    Response.Redirect("Default");
                }
            }
        }

        protected void ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Cancel", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("Default");
            }
        }
    }
}
