using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_newslist : System.Web.UI.Page
{


   // String sid = "5";
    /*通知公告：json_tzgg 返回字段：id,bclass,sclass,titles　查询条件：表　article，bclass=5
     *招工信息：json_zgxx 返回字段：id,bclass,sclass,titles  查询条件：表　article，bclass=6
     *类名：sclassname  查询条件：fl表里id=sid的行的names字段值
     */
    _BLL b = new _BLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        string json_tzgg = json_tzggg();
        string  json_zgxx = json_zgxxx();
         string sclassname = b.sclassname();
   
    }

    public  string  json_tzggg ()
   
    {
         
        string jason = "";
       
        DataTable dt = b.tzggg();

        jason = Tools.BiuldJson("", dt);
        
        return jason;

    }


    public  string json_zgxxx()

    {
        string jason = "";

        DataTable dt = b.zgxxx();

        jason = Tools.BiuldJson("", dt);

        return jason;
    }

    


}