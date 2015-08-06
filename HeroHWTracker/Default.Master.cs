using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;



namespace HeroHWTracker
{
    public partial class Default : System.Web.UI.MasterPage
    {

        public string imgPath = System.Web.VirtualPathUtility.ToAbsolute("~/img/notebook.png");
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                PrivateNav.Visible = false;
                PublicNav.Visible = true;
            }
            else
            {
                PrivateNav.Visible = true;
                PublicNav.Visible = false;

                //Fill the HEro image and experience sections
                const int MAX_LEVEL = 5;

                int currLevel = 0;
                int currGender = 0;
                int currExp = 0;
                int expNeeded = 0;
                string heroFilePath = "";

                if (!HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    Response.Redirect("~/Login.aspx");
                }
                else
                {

                    //Grab the hero image, exp and homework in progress and get them ready.
                    string currentUser = HttpContext.Current.User.Identity.GetUserName();


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
                                currLevel = (int)reader["Level"];
                                currGender = (int)reader["Hero Gender"];
                                currExp = (int)reader["currExp"];
                            }

                        }
                        conn.Close();
                    }
                    catch (Exception ex1)
                    {
                        message.Text = "User Info Error: " + ex1.Message;
                        conn.Close();
                    }

                    //Set level above exp bar
                    userLevel.Text = currLevel.ToString();

                    //grab the experience needed for current level for level up check
                    SqlCommand grabExp = new SqlCommand("SELECT * FROM [EXP] where [Level]=@level", conn);
                    grabExp.Parameters.AddWithValue("@level", currLevel + 1);

                    try
                    {
                        conn.Open();
                        //open and read the information in the database
                        using (SqlDataReader reader = grabExp.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                expNeeded = (int)reader["expNeededToGetLevel"];

                            }
                        }
                        conn.Close();
                    }
                    catch (Exception ex3)
                    {
                        message.Text = "Hero Error: " + ex3.Message;
                        conn.Close();
                    }

                    //Tell them they got more exp and level if necessary
                    if (HomeWork.Insert.gotExpIn == true || HomeWork.Finish.gotExpCom == true)
                    {
                        //Check to see if you leveled up.
                        if (currExp > expNeeded)
                        {
                            //tell them they leveled up ==============================================
                            currLevel += 1;

                            //subtract 
                            currExp = currExp - expNeeded;

                            //update curr exp
                            SqlCommand update = new SqlCommand("UPDATE [UserInfo] SET [currExp]=@currExp, [Level]=@level WHERE [username]=@name", conn);
                            update.Parameters.AddWithValue("@currExp", currExp);
                            update.Parameters.AddWithValue("@Level", currLevel);
                            update.Parameters.AddWithValue("@name", HttpContext.Current.User.Identity.GetUserName());
                            try
                            {
                                conn.Open();
                                update.ExecuteNonQuery();
                                conn.Close();
                            }
                            catch (Exception ex)
                            {
                                conn.Close();
                            }

                            ModalPopupExtender1.Show();
                            showLevelUp.Text = "Congratulations! You are now level " + currLevel +"!";
                        }


                        //show well and exp you gained
                        ExpWell.Visible = true;
                        if (HomeWork.Insert.gotExpIn == true)
                        {
                            showExp.Text = "You have gained " + HomeWork.Insert.ADD_HW_Exp.ToString() + " experience~!";
                        }
                        else
                        {
                            if (HomeWork.Finish.gotEarlyExp == true)
                            {
                                showExp.Text = "You have gained " + HomeWork.Finish.ADD_COM_EXP_EARLY.ToString() + " experience~!";
                                HomeWork.Finish.gotEarlyExp = false;
                            }
                            else
                            {
                                showExp.Text = "You have gained " + HomeWork.Finish.ADD_COM_EXP.ToString() + " experience~!";
                            }
                        }
                        
                        HomeWork.Insert.gotExpIn = false;
                        HomeWork.Finish.gotExpCom = false;

                    }
                    else
                    {
                        ExpWell.Visible = false;
                    }

                    //grab Hero Image
                    SqlCommand grabHero = new SqlCommand("SELECT * FROM [Hero] where [Gender]=@gender and [Level]=@level", conn);
                    grabHero.Parameters.AddWithValue("@gender", currGender);
                    grabHero.Parameters.AddWithValue("@level", currLevel);

                    try
                    {
                        conn.Open();
                        //open and read the information in the database
                        using (SqlDataReader reader = grabHero.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                heroFilePath = (string)reader["ImageFilePath"];

                            }
                        }
                        conn.Close();

                        //set hero image
                        Hero.ImageUrl = heroFilePath;
                    }
                    catch (Exception ex2)
                    {
                        message.Text = "Hero Error: " + ex2.Message;
                        conn.Close();
                    }


                    //grab Exp Info if person is less than max level
                    if (currLevel < MAX_LEVEL)
                    {

                        SqlCommand grabExp2 = new SqlCommand("SELECT * FROM [EXP] where [Level]=@level", conn);
                        grabExp2.Parameters.AddWithValue("@level", currLevel + 1);

                        try
                        {
                            conn.Open();
                            //open and read the information in the database
                            using (SqlDataReader reader = grabExp2.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    expNeeded = (int)reader["expNeededToGetLevel"];

                                }
                            }
                            conn.Close();
                        }
                        catch (Exception ex3)
                        {
                            message.Text = "Hero Error: " + ex3.Message;
                            conn.Close();
                        }
                    }

                }

                //change the exp bar 
                double divide = ((double)currExp / (double)expNeeded) * 100;

                string progress = divide.ToString();
                SetTheProgress(exp, progress + "%");
                expProgress.Text = currExp.ToString() + "/" + expNeeded.ToString();

            }
        }

        void SetTheProgress(HtmlGenericControl bar, string value)
        {
            bar.Attributes.Add("style", string.Format("width:{0};", value));
        }

        protected void wellB_Click(object sender, EventArgs e)
        {
            ExpWell.Visible = false;
        }

    }
}