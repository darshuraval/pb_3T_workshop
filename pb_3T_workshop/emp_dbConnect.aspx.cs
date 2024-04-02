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
    public partial class emp_dbConnect : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string file;
        Class1 cs;

        protected void Page_Load(object sender, EventArgs e)
        {
            startcon();
            fillgrid();
            lblwc.Text = "Hello "+Session["Email"].ToString();
        }

        void startcon()
        {
            con = new SqlConnection();
            cs = new Class1();
            con = cs.getcon();
        }

        void upload()
        {
            file = "Images/" + flupimg.FileName;
            flupimg.SaveAs(Server.MapPath(file));
        }
        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (btnsave.Text == "Save")
            {
                startcon();
                con = cs.getcon();
                upload();
                cs.insert(txtfnm.Text,txtlnm.Text,txteml.Text,DropDownList1.SelectedValue,txtmbl.Text,file);
                fillgrid();
                clear();
            }
            else
            {
                    startcon();
                    con = cs.getcon();
                    cs.update(Convert.ToInt32(ViewState["id"]),txtfnm.Text, txtlnm.Text, txteml.Text, DropDownList1.SelectedValue, txtmbl.Text);
                    fillgrid();
                clear();
            }
        }
        public void fillgrid()
        {
            con = cs.getcon();
            GridView1.DataSource=cs.select();
            GridView1.DataBind();
        }
        void clear()
        {
            txtfnm.Text = "";
            txtlnm.Text = "";
            txtmbl.Text = "";
            txteml.Text = "";
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            ViewState["id"] = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "cmd_edt")
            {
                btnsave.Text = "Update";
                filltext();
            }
            else
            {
                cs.delete(Convert.ToInt32(ViewState["id"]));
                fillgrid();
            }
        }
        public void filltext()
        {
            ds = cs.filldata(Convert.ToInt32(ViewState["id"]));
            txtfnm.Text = (ds.Tables[0].Rows[0][1]).ToString();
            txtlnm.Text =( ds.Tables[0].Rows[0][2]).ToString();
            txteml.Text = (ds.Tables[0].Rows[0][3]).ToString();
            DropDownList1.SelectedValue = (ds.Tables[0].Rows[0][4]).ToString();
            txtmbl.Text = (ds.Tables[0].Rows[0][5]).ToString();
        }
    }
}