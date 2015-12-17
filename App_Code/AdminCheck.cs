using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// FCheck 的摘要说明
/// </summary>
public class AdminCheck:System.Web.UI.Page
{
    public AdminCheck()
	{
        this.Load += new EventHandler(Check);
	}

    private void Check(object sender,EventArgs e)
    {
        //if (Session["adminid"] != null)
        //{
        //    if (Session["adminid"].ToString().Equals(""))
        //    {
        //        Response.Write("<script>window.location.href='login.aspx'</script>");
        //        Response.End();
        //    }
        //}
        //else
        //{
        //    Response.Write("<script>window.location.href='login.aspx'</script>");
        //    Response.End();
        //}
       
    }
}