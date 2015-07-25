using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using HeroHWTracker.Models;

namespace HeroHWTracker.HomeWork
{
    public partial class Default : System.Web.UI.Page
    {
		protected HeroHWTracker.Models.HeroEntities1 _db = new HeroHWTracker.Models.HeroEntities1();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        // Model binding method to get List of HomeWork entries
        // USAGE: <asp:ListView SelectMethod="GetData">
        public IQueryable<HeroHWTracker.Models.HomeWork> GetData()
        {
            return _db.HomeWork;
        }
    }
}

