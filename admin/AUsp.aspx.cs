using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_AUsws : AdminCheck
{
    public String PageHead = "";
    public String BtnValue = "";

    public String json_bc = "";

    _BLL bll = null;

    public String name = "";
    public String px = "";
    public String sfilepath = "";
    public String bfilepath = "";
    public String contents = "";
    public String ischecked = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        String uid = Request.QueryString["spid"];

        if (String.IsNullOrEmpty(uid))
        {
            PageHead = "添加视频";
            BtnValue = "确认添加";
        }
        else
        {
            PageHead = "修改视频";
            BtnValue = "确认修改";
            bll = new _BLL();
            DataTable dt = bll.GetSws_one(uid);
            if (dt!=null)
            {
                name=dt.Rows[0]["titles"].ToString();
                px = dt.Rows[0]["zd"].ToString();
                if (!String.IsNullOrEmpty(px))
                {
                    if (px.Equals("True"))
                    {
                        ischecked = "checked='checked'";
                    }
                }

                sfilepath = dt.Rows[0]["smallsrc"].ToString();
                bfilepath = dt.Rows[0]["bigsrc"].ToString();
            }
        }

    }

    
}