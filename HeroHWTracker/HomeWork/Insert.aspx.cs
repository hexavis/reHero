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

namespace HeroHWTracker.HomeWork
{
    public partial class Insert : System.Web.UI.Page
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

        // This is the Insert method to insert the entered HomeWork item
        // USAGE: <asp:FormView InsertMethod="InsertItem">
        public void InsertItem()
        {
            using (_db)
            {
                var item = new HeroHWTracker.Models.HomeWork();

                const int MAX_MONSTERS = 2;

                //set default to not complete
                item.isComplete = 0;

                //get the user info id
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


                item.UserInfoID = userInfoID;

                //pick a random monster
                Random rnd = new Random();
                int numMon = rnd.Next(1, MAX_MONSTERS + 1); // creates a number 1 and # of monsters



                //grab hero level, gender and exp
                SqlCommand mon = new SqlCommand("SELECT * FROM [Monster] where [MonsterID]=@ID", conn);
                mon.Parameters.AddWithValue("@ID", numMon);
                string filePath = "";
                try
                {
                    conn.Open();
                    //open and read the information in the database
                    using (SqlDataReader reader = check.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            filePath = reader["imageFilePathAlive"].ToString();

                        }

                    }
                    conn.Close();
                }
                catch (Exception ex1)
                {
                    conn.Close();
                }
                item.MonFilePath = filePath;

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
