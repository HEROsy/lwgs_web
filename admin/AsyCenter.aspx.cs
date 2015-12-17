using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_AsyCenter : System.Web.UI.Page
{
    _BLL bll = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        String tag = Request.Form["aty"];
        if (String.IsNullOrEmpty(tag))
        {
            Response.End();
        }

        bll = new _BLL();

        switch (tag)
        {
            case "addnew":
                addnew();
                break;

            case "getnew":
                getnew();
                break;


            case "getsp":
                getsws();
                break;

            case "deletenew":
                DeleteNew();
                break;

            case "deletesws":
                DeleteSws();
                break;

            case "addsp":
                AddSp();
                break;

            case "upnew":
                UpNew();
                break;

            case "upsp":
                UpSws();
                break;

            case "addlawyer":
                AddLawyer();
                break;

            case "getlawyer":
                GetLawyer();
                break;

            case "deletelawyer":
                DeleteLawyer();
                break;

            case "uplawyer":
                UpLawyer();
                break;

            case "changepw":
                ChangePw();
                break;

            default:
                break;
        }

    }

    private void ChangePw()
    {
        String old=Request.Form["old"];
        String pw1=Request.Form["pw1"];
        String pw2=Request.Form["pw2"];

        DataTable dt = bll.GetAdmin_pw(Session["adminid"].ToString());

        if (!dt.Rows[0]["pw"].ToString().Equals(old))
        {
            Response.Write("no:");
            Response.End();
        }

        int r = bll.UpPw(pw2, Session["adminid"].ToString());
        if (r == 1)
        {
            Session["adminid"] = null;
            Response.Write("ok:");
            Response.End();
        }
        else
        {
            Response.Write("no:");
            Response.End();
        }
    }

    private void UpLawyer()
    {
        String name = Request.Form["name"];
        String dw = Request.Form["dw"];
        String px = Request.Form["px"];
        String pic = Request.Form["pic"];
        String contents = Request.Form["contents"];
        String uid=Request.Form["uid"];

        int r = bll.UpLawyer(name, px, pic, contents, uid, dw);

        if (r == 1)
        {
            Response.Write("ok:");
            Response.End();
        }
        else
        {
            Response.Write("no:");
            Response.End();
        }
    }

    private void DeleteLawyer()
    {
        String did=Request.Form["did"];
        int r = -1;
        if (!String.IsNullOrEmpty(did))
        {
            r = bll.DeleteLawyer(did);
        }

        if (r == 1)
        {
            Response.Write("ok:");
            Response.End();
        }
        else
        {
            Response.Write("no:");
            Response.End();
        }
    }

    private void GetLawyer()
    {
       String swsid=Request.Form["swsid"];
       DataTable dt = bll.GetLawyer(swsid);
       String r = "";
       if (dt!=null)
       {
           r = Tools.BiuldJson("", dt);
       }
       Response.Write(r);
       Response.End();
    }

    private void AddLawyer()
    {
        String name = Request.Form["name"];
        String dw = Request.Form["dw"];
        String px = Request.Form["px"];
        String pic = Request.Form["pic"];
        String contents = Request.Form["contents"];

        int r = bll.AddLawyer(name, px, pic, contents, dw);

        if (r == 1)
        {
            Response.Write("ok:");
            Response.End();
        }
        else
        {
            Response.Write("no:");
            Response.End();
        }

    }

    private void UpSws()
    {
        String name = Request.Form["name"];
        String zd = Request.Form["dis"];
        String sfilename = Request.Form["sfilename"];
        String bfilename = Request.Form["bfilename"];
        String uid=Request.Form["spid"];

        int r = bll.UpSws(name,zd,sfilename,bfilename,uid);
        if (r == 1)
        {
            clerzd();
            setzd(uid);
            Response.Write("ok:");
            Response.End();
        }
        else
        {
            Response.Write("no:");
            Response.End();
        }
    }

    private void DeleteSws()
    {
        String did = Request.Form["did"];
        int r = -1; ;
        String sfname = "";
        String bfname = "";
        if (!String.IsNullOrEmpty(did))
        { 
            
            //delete file
            SqlParameter[] spr = { new SqlParameter("@id",did)};
            String sql = SqlHelper.GetSQLSelect_normal("", "smallsrc,bigsrc", "video", spr, "=", "", "id asc");
            DataTable dt = SqlHelper.GetTable(sql, CommandType.Text, spr);
            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    sfname = dt.Rows[0]["smallsrc"].ToString().Trim();
                    bfname = dt.Rows[0]["bigsrc"].ToString().Trim();
                }
                else
                {
                    Response.Write("no:");
                    Response.End();
                }
            }
            else
            {
                Response.Write("no:");
                Response.End();
            }

            r = bll.DeleteSws(did);
        }
        if (r == 1)
        {
            //if (File.Exists(Server.MapPath("/img/upload/"+sfname)))
            //{
            //    File.de
            //}
            File.Delete(Server.MapPath("/img/upload/"+sfname));
            File.Delete(Server.MapPath("/img/upload/" + bfname));
            

            Response.Write("ok:");
            Response.End();
        }
        else
        {
            Response.Write("no:");
            Response.End();
        }
    }

    private void getsws()
    {
       DataTable dt= bll.GetSws();
       String r = "";
       if (dt!=null)
       {
           r = Tools.BiuldJson("",dt);
       }
       Response.Write(r);
       Response.End();
    }

    private void UpNew()
    {
        String uid = Request.Form["uid"];
        String title = Request.Form["title"];
        String bc = Request.Form["bc"];
        String sc = Request.Form["sc"];
       // String pic = Request.Form["pic"];
        String contents = Request.Form["contents"];

        int r=bll.UpNew(title, bc, sc, contents, uid);
        if (r == 1)
        {
            Response.Write("ok:");
            Response.End();
        }
        else
        {
            Response.Write("no:");
            Response.End();
        }
    }

    private void AddSp()
    {
        String name = Request.Form["name"];
        String dis=Request.Form["dis"];
        String sfilename=Request.Form["sfilename"];
        String bfilename=Request.Form["bfilename"];

        
        if (dis.Trim().Equals("true"))
        {
            clerzd();
        }
        int r=bll.AddSp(name,dis,sfilename,bfilename);
        if (r == 1)
        {
            Response.Write("ok:");
            Response.End();
        }
        else
        {
            Response.Write("no:");
            Response.End();
        }
    }

    private void clerzd()
    {
        String sql = "update video set zd = 'false'";
        SqlHelper.ExcoutSQL(sql,CommandType.Text,null);
    }

    private void setzd(String id)
    {
        String sql = "update video set zd ='true' where id="+id;
        SqlHelper.ExcoutSQL(sql, CommandType.Text, null);
    }

    private void DeleteNew()
    {
        String did=Request.Form["did"];
        int r = -1; ;
        if (!String.IsNullOrEmpty(did))
        {
            r=bll.DeleteNew(did);
        }
        if (r == 1)
        {
            Response.Write("ok:");
            Response.End();
        }
        else
        {
            Response.Write("no:");
            Response.End();
        }
    }

    private void getnew()
    {
        String bs = Request.Form["bs"];
        String ss = Request.Form["ss"];

        SqlParameter[] spr = null;
        if (bs.Equals("-1"))
        {
            //all

        }
        else
        {
            if (ss.Equals("-1"))
            {
                spr = new SqlParameter[]{
            new SqlParameter("@bclass",bs)
            };
            }
            else
            {
                spr = new SqlParameter[]{
        new SqlParameter("@bclass",bs),
        new SqlParameter("@sclass",ss)
            };
            }
        }


        DataTable dt = bll.GetNews(spr);
        String r = "";
        if (dt != null && dt.Rows.Count > 0)
        {
            r = Tools.BiuldJson("", dt);
        }

        Response.Write(r);
        Response.End();
    }

    private void addnew()
    {
        String title = Request.Form["title"];
        String bc = Request.Form["bc"];
        String sc = Request.Form["sc"];
       // String pic = Request.Form["pic"];
        String contents = Request.Form["contents"];

        int r = bll.InsertNew(title, bc, sc, contents, DateTime.Now);
        if (r == 1)
        {
            Response.Write("ok:");
            Response.End();
        }
        else
        {
            Response.Write("no:");
            Response.End();
        }
    }
}