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
        public static Boolean gotExpIn = false;
        public const int MAX_MONSTERS = 3, ADD_HW_Exp = 15;
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

        // This is the Insert method to insert the entered HomeWork item
        // USAGE: <asp:FormView InsertMethod="InsertItem">
        public void InsertItem()
        {
            using (_db)
            {
                
                var item = new HeroHWTracker.Models.HomeWork();                
                int isComplete = 0;
                item.Due_Date = dueDate;
                

                //get the user info id
                string currentUser = HttpContext.Current.User.Identity.GetUserName();
                int userInfoID = 0;
                int currExp = 0;
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
                            currExp = (int)reader["currExp"];
                        }

                    }
                    conn.Close();
                }
                catch (Exception ex1)
                {
                    conn.Close();
                }


                

                //pick a random monster
                Random rnd = new Random();
                int numMon = rnd.Next(2, MAX_MONSTERS + 1); // creates a number 1 and # of monsters

                //grab hero level, gender and exp
                SqlCommand mon = new SqlCommand("SELECT * FROM [Monster] where [MonsterID]=@ID", conn);
                mon.Parameters.AddWithValue("@ID", numMon);
                string filePath = "";
                try
                {
                    conn.Open();
                    //open and read the information in the database
                    using (SqlDataReader reader = mon.ExecuteReader())
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

                //set default to not complete
                item.isComplete = isComplete;
                item.UserInfoID = userInfoID;

                TryUpdateModel(item);




                if (ModelState.IsValid)
                {
                     //add experience
                    //insert into database.
                    int newExp = currExp + ADD_HW_Exp;
                    SqlCommand update = new SqlCommand("UPDATE [UserInfo] SET [currExp]=@currExp WHERE [username]=@name", conn);
                    update.Parameters.AddWithValue("@currExp", newExp);
                    update.Parameters.AddWithValue("@name", HttpContext.Current.User.Identity.GetUserName());
                    try
                    {
                        conn.Open();
                        gotExpIn = true;
                        update.ExecuteNonQuery();
                        conn.Close();
                    }
                    catch (Exception ex)
                    {
                        conn.Close();
                    }
                
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

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            dueDate = Calendar1.SelectedDate;
            testDate.Text = Calendar1.SelectedDate.ToLongDateString();
        }
    }
}
