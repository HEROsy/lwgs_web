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

    public String swsvalue = "";
    _BLL bll = null;


    public String name = "";
    public String px = "";
    public String contents = "";
    public String pic = "";
    public String dw = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        bll = new _BLL();
        DataTable dt = bll.GetSwsList();
        if (dt != null)
        {
            swsvalue = Tools.BiuldJson("", dt);
        }

        String uid = Request.QueryString["uid"];
        if (String.IsNullOrEmpty(uid))
        {
            PageHead = "添加律师信息";
            BtnValue = "确认添加";
        }
        else
        {
            PageHead = "修改律师信息";
            BtnValue = "确认修改";
            DataTable dtt = bll.GetLawyer_noe(uid);
            name=dtt.Rows[0]["names"].ToString();
            px = dtt.Rows[0]["px"].ToString();
            contents = dtt.Rows[0]["contents"].ToString();
            pic = dtt.Rows[0]["pic"].ToString();
            dw = dtt.Rows[0]["pid"].ToString();

        }
    }
}