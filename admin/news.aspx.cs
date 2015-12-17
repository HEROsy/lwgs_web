using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_news : AdminCheck
{
    public String bcvalue = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        bcvalue = GetClass();

    }

    private string GetClass()
    {
        String r = "";

        DataTable dt = new _BLL().GetNewClass();
        if (dt!=null)
        {
            r = Tools.BiuldJson("", dt);
        }

        return r;
    }
}