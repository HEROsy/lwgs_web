using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Default : AdminCheck
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String lout = Request.QueryString["out"];
        if (!String.IsNullOrEmpty(lout))
        {
            Session["adminid"] = null;
            Response.Redirect("Default.aspx");
        }
    }
}