using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using HeroHWTracker.Models;
using System.Data.SqlClient;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System.Collections.Generic;


namespace HeroHWTracker.HomeWork
{
    public partial class Complete : System.Web.UI.Page
    {
		protected HeroHWTracker.Models.HeroEntities _db = new HeroHWTracker.Models.HeroEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/login.aspx");
            }
            else
            {

            }
        }

        // Model binding method to get List of HomeWork entries
        // USAGE: <asp:ListView SelectMethod="GetData">
        public IQueryable<HeroHWTracker.Models.HomeWork> GetData()
        {
            return _db.HomeWork;
        }

         public IQueryable<HeroHWTracker.Models.HomeWork> Index()
    {
             //Grab the hero image, exp and homework in progress and get them ready.
                    string currentUser = HttpContext.Current.User.Identity.GetUserName();
            int userInfoID = 0;

            //make a connection to the database
            string cs = "Data Source=pbc2o8qyql.database.windows.net;Initial Catalog=Hero;User ID=apple;Password=skull!1223;Trusted_Connection=False;Encrypt=True;";
            SqlConnection conn = new SqlConnection(cs);

            //grab hero level, gender and exp
            SqlCommand check = new SqlCommand("SELECT * FROM [UserInfo] where [Username]=@username", conn);
            check.Parameters.AddWithValue("@username", currentUser);

            try
            {
                conn.Open();
                //open and read the information in the database
                using (SqlDataReader reader = check.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        userInfoID = (int)reader["UserInfoID"];

                    }

                }
                conn.Close();
            }
            catch (Exception ex1)
            {
                conn.Close();
            }

            return _db.HomeWork.Where(a => a.UserInfoID == userInfoID && a.isComplete == 1);
    }

        protected void CompleteB_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/HomeWork/Default.aspx");
        }

    

    }
}

