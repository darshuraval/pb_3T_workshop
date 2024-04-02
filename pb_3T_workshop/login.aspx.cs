using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace pb_3T_workshop
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        int i;
        Class1 cs;
        void newcon()
        {
            cs = new Class1();
            con = new SqlConnection();
            con = cs.getcon();   
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(!(string.IsNullOrEmpty(txtemladd.Text)) && !(string.IsNullOrEmpty(txtpwd.Text)))
            {
                newcon();
                cmd = new SqlCommand("select count(*) from Emp_tbl where Email='"+txtemladd.Text+"' and LastName='"+txtpwd.Text+"'",con);
                i = Convert.ToInt32(cmd.ExecuteScalar());
                if (i > 0)
                {
                    Session["Email"] = txtemladd.Text;
                    Response.Redirect("emp_dbConnect.aspx");
                }
                else
                {
                    Response.Write("Invalid Credintial...");
                }
            }
        }

    }
}