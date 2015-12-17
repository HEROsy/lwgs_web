using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_news : AdminCheck
{
    public String classvalue = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = new _BLL().GetSwsList();
        if (dt!=null)
        {
            classvalue = Tools.BiuldJson("", dt);
        }

    }
}