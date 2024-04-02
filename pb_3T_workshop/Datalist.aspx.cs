using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace pb_3T_workshop
{
    public partial class Datalist : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        Class1 cs;
        String nm;
        int p, row,temp;
        PagedDataSource pg;

        void newcon()
        {
            cs = new Class1();
            con = new SqlConnection();
            con = cs.getcon();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            newcon();
            display();
        }
        public void display()
        {
            newcon();
            da = new SqlDataAdapter("select * from Emp_tbl", con);
            ds = new DataSet();
            da.Fill(ds);

            row = ds.Tables[0].Rows.Count;
            pg = new PagedDataSource();
            pg.AllowPaging = true;
            pg.PageSize = 2;
            pg.CurrentPageIndex = Convert.ToInt32(ViewState["pid"]);
            pg.DataSource = ds.Tables[0].DefaultView;


            DataList1.DataSource = pg;
            DataList1.DataBind();

        }

        protected void btnnext_Click(object sender, EventArgs e)
        {
            btnprev.Enabled = true;

            p += pg.CurrentPageIndex + 1;
            ViewState["pid"] = p;
            temp = row / pg.PageSize;
            if (p < temp)
            {
                display();
            }
            else
            {
                btnnext.Enabled = false;
            }
        }

        protected void btnprev_Click(object sender, EventArgs e)
        {
            btnnext.Enabled= true;

            p -= pg.CurrentPageIndex - 1;
            ViewState["pid"] = p;
            temp = row / pg.PageSize;
            if (p == 0)
            {
                display();
                
            }
            else
            {
                btnprev.Enabled = false;
            }
        }

        
    }
}