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
    public partial class Details : System.Web.UI.Page
    {
		protected HeroHWTracker.Models.HeroEntities _db = new HeroHWTracker.Models.HeroEntities();

        protected void Page_Load(object sender, EventArgs e){
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/login.aspx");
            }
            else
            {

            }
        
        }

        // This is the Select methd to selects a single HomeWork item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public HeroHWTracker.Models.HomeWork GetItem([FriendlyUrlSegmentsAttribute(0)]int? HomeWorkID)
        {
            if (HomeWorkID == null)
            {
                return null;
            }

            using (_db)
            {
	            return _db.HomeWork.Where(m => m.HomeWorkID == HomeWorkID).FirstOrDefault();
            }
        }

        protected void ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Cancel", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("../Default");
            }
        }
    }
}

