using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

namespace pb_3T_workshop
{
    public class Class1
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;

        public SqlConnection getcon()
        {
            string s = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            con = new SqlConnection(s);
            con.Open();
            return con;
        }
        
        public void insert(string fnm,string lnm,string eml,string city,string mbl,string img)
        {

            cmd = new SqlCommand("insert into Emp_tbl(FirstName,LastName,Email,City,Mobile,Image)values('"+fnm+"','"+lnm+"','"+eml+"','"+city+"','"+mbl+"','"+img+"')", con);
            cmd.ExecuteNonQuery();
        }
        public DataSet select()
        {
            da = new SqlDataAdapter("select * from Emp_tbl",con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        
        public DataSet filldata(int id)
        {
            da = new SqlDataAdapter("select * from Emp_tbl where Id='" + id + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        public void update(int id,string fnm, string lnm, string eml, string city, string mbl)
        {
            cmd = new SqlCommand("update emp_tbl set FirstName='" + fnm + "',LastName='" + lnm + "',Email='" + eml + "',City='" + city + "',Mobile='" + mbl + "' where Id='" + id + "' ",con);
                cmd.ExecuteNonQuery();
        }
       public void delete(int id)
        {
            cmd = new SqlCommand("delete from Emp_tbl where Id='"+id+"'",con);
            cmd.ExecuteNonQuery();
        }
        
    }
}