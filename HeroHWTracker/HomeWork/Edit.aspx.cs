using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using Microsoft.AspNet.FriendlyUrls.ModelBinding;
using HeroHWTracker.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace HeroHWTracker.HomeWork
{
    public partial class Edit : System.Web.UI.Page
    {
		protected HeroHWTracker.Models.HeroEntities _db = new HeroHWTracker.Models.HeroEntities();
        private static DateTime dueDate;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/login.aspx");
                BindCalendar();
            }
            else
            {

            }
        }

        private void BindCalendar()
        {
            Calendar1.SelectedDate = DateTime.Now;
        }

        // This is the Update methd to update the selected HomeWork item
        // USAGE: <asp:FormView UpdateMethod="UpdateItem">
        public void UpdateItem(int  HomeWorkID)
        {
            using (_db)
            {
                var item = _db.HomeWork.Find(HomeWorkID);
                item.Due_Date = dueDate;

                if (item == null)
                {
                    // The item wasn't found
                    ModelState.AddModelError("", String.Format("Item with id {0} was not found", HomeWorkID));
                    return;
                }

                TryUpdateModel(item);

                if (ModelState.IsValid)
                {
                    // Save changes here
                    _db.SaveChanges();
                    Response.Redirect("../Default");
                }
            }
        }

        // This is the Select method to selects a single HomeWork item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public HeroHWTracker.Models.HomeWork GetItem([FriendlyUrlSegmentsAttribute(0)]int? HomeWorkID)
        {
            if (HomeWorkID == null)
            {
                return null;
            }

            using (_db)
            {
                return _db.HomeWork.Find(HomeWorkID);
            }
        }

        protected void ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Cancel", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("../Default");
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            dueDate = Calendar1.SelectedDate;
            testDate.Text = Calendar1.SelectedDate.ToLongDateString();
        }
    }
}
