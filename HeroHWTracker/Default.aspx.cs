﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeroHWTracker
{
    public partial class Default1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                
            }
            else
            {
                Response.Redirect("~/HomeWork/Default.aspx");
            }

        }

        protected void Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx");
        }
    }
}