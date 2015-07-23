using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeroHWTracker
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            // Default UserStore constructor uses the default connection string named: DefaultConnection
            var userStore = new UserStore<IdentityUser>();
            var manager = new UserManager<IdentityUser>(userStore);
            var user = new IdentityUser() { UserName = UserName.Text, Email = Email.Text };

            IdentityResult result = manager.Create(user, Password.Text);

            if (result.Succeeded)
            {
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                authenticationManager.SignIn(new AuthenticationProperties() { }, userIdentity);

                //insert necessary info into the user info table
                //make a connection to the database
            string cs = "Data Source=pbc2o8qyql.database.windows.net;Initial Catalog=Hero;User ID=apple;Password=skull!1223";
            SqlConnection conn = new SqlConnection(cs);

          
          //insert into database for new user. [hash the password?]
                SqlCommand insert = new SqlCommand("insert into [UserInfo]([Username], [Hero Gender], [Level], [currExp]) values(@username,@herogender, @level, @currExp)", conn);
                insert.Parameters.AddWithValue("@username", UserName.Text);
                insert.Parameters.AddWithValue("@herogender", gender.SelectedValue);
                insert.Parameters.AddWithValue("@level", "1");
                insert.Parameters.AddWithValue("@currExp", "0");
                try
                {
                    conn.Open();
                    insert.ExecuteNonQuery();
                  
                }
                catch (Exception ex)
                {
                    conn.Close();
                }


                Response.Redirect("~/Login.aspx");//change this to in progress page
         
            }
            else
            {
                StatusMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}