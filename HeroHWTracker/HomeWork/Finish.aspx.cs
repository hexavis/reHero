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
using System.Data.SqlClient;

namespace HeroHWTracker.HomeWork
{
    public partial class Finish : System.Web.UI.Page
    {
		protected HeroHWTracker.Models.HeroEntities _db = new HeroHWTracker.Models.HeroEntities();
        public static Boolean gotExpCom = false;
        public const int ADD_COM_EXP = 45, ADD_COM_EXP_EARLY = 55;

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

        // This is the Update methd to update the selected HomeWork item
        // USAGE: <asp:FormView UpdateMethod="UpdateItem">
        public void UpdateItem(int  HomeWorkID)
        {
     
            string cs = "Data Source=pbc2o8qyql.database.windows.net;Initial Catalog=Hero;User ID=apple;Password=skull!1223;Trusted_Connection=False;Encrypt=True;";
            SqlConnection conn = new SqlConnection(cs);

            SqlCommand update = new SqlCommand("UPDATE [HomeWork] SET [isComplete]=@isCom WHERE [HomeWorkID]=@ID", conn);
            update.Parameters.AddWithValue("@isCom", 1);
            update.Parameters.AddWithValue("@ID", HomeWorkID);

            try
            {
                conn.Open();
                gotExpCom = true;
                update.ExecuteNonQuery();
                conn.Close();

                //grab current Exp
                int currExp = 0;
                SqlCommand check = new SqlCommand("SELECT * FROM [UserInfo] where [Username]=@username", conn);
                check.Parameters.AddWithValue("@username", HttpContext.Current.User.Identity.GetUserName());

                try
                {
                    conn.Open();
                    //open and read the information in the database
                    using (SqlDataReader reader = check.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            currExp = (int)reader["currExp"];
                        }

                    }
                    conn.Close();
                }
                catch (Exception ex1)
                {
                    conn.Close();
                }

                int newExp = 0;
               
                newExp = currExp + ADD_COM_EXP;
               
                   
                SqlCommand update2 = new SqlCommand("UPDATE [UserInfo] SET [currExp]=@currExp WHERE [username]=@name", conn);
                update2.Parameters.AddWithValue("@currExp", newExp);
                update2.Parameters.AddWithValue("@name", HttpContext.Current.User.Identity.GetUserName());
                try
                {
                    conn.Open();
                    gotExpCom = true;
                    update2.ExecuteNonQuery();
                    conn.Close();
                }
                catch (Exception ex)
                {
                    conn.Close();
                }
                Response.Redirect("../Default");
            }
            catch (Exception ex)
            {
                conn.Close();
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
    }
}
