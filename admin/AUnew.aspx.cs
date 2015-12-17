using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addnew : AdminCheck
{
    public String PageHead = "";
    public String btname = "";
    public String classvalue = "";

    public String contents = "";
    public String ec = "";

    _BLL bll = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        String qstr = Request.QueryString["uid"];
        bll = new _BLL();
        classvalue = GetClassValue_json();
        if (!String.IsNullOrEmpty(qstr))
        {
            PageHead = "新闻修改";
            btname = "确认修改";
            DataTable dt = bll.GetNews_one(qstr);
            if (dt!=null && dt.Rows.Count>0)
            {
                contents = Tools.BiuldJson("titles,bclass,sclass", dt);
                ec=dt.Rows[0]["contents"].ToString();
            }
        }
        else
        {
            PageHead = "新闻添加";
            btname = "确认添加";
        }




    }

    private String GetClassValue_json()
    {
        String r = "";
        DataTable dt = bll.GetNewClass();
        if (dt != null)
        {
            r = Tools.BiuldJson("", dt);
        }

        return r;
    }
}