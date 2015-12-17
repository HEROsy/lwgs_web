using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Tools 的摘要说明
/// </summary>
public static class Tools
{
    public static String BiuldJson(String Backcol, DataTable dt)
    {
        //前台js decode
        // function decode(str) {
        //    str = decodeURIComponent(str.replace(/\+/g, '%20'));
        //    return str;
        //}

        String json = "";
        if (dt != null)
        {
            if (dt.Rows.Count <= 0) { return ""; };
            String str = "";
            String[] colnames = null;
            String _key = "";
            String _value = "";

            if (String.IsNullOrEmpty(Backcol))
            {
                int cn = dt.Columns.Count;
                colnames = new String[cn];
                for (int i = 0; i < cn; i++)
                {
                    colnames[i] = dt.Columns[i].ColumnName;
                }
            }
            else
            {
                if (Backcol.Contains(','))
                {
                    colnames = Backcol.Split(',');
                }
                else
                {
                    colnames = new String[] { Backcol };
                }
            }

            foreach (DataRow item in dt.Rows)
            {
                foreach (String cname in colnames)
                {
                    _key = cname;
                    _value = encode(item[cname].ToString());
                    str = str + "\"" + _key + "\":\"" + _value + "\",";
                }
                str = str.Substring(0, str.LastIndexOf(','));
                str = "{" + str + "},";
                json = json + str;
                str = "";
            }


        }
        if (json.Contains(','))
        {
            json = json.Substring(0, json.LastIndexOf(','));
            String r = String.Format("[{0}]", json);
            return r;
        }
        else
        {
            return "";
        }

    }

    public static String BiuldJson_InitTime(String Backcol, DataTable dt, int timecol,String formatstr)
    {
        //前台js decode
        // function decode(str) {
        //    str = decodeURIComponent(str.replace(/\+/g, '%20'));
        //    return str;
        //}

        String json = "";
        if (dt != null)
        {
            if (dt.Rows.Count <= 0) { return ""; };
            String str = "";
            String[] colnames = null;
            String _key = "";
            String _value = "";

            if (String.IsNullOrEmpty(Backcol))
            {
                int cn = dt.Columns.Count;
                colnames = new String[cn];
                for (int i = 0; i < cn; i++)
                {
                    colnames[i] = dt.Columns[i].ColumnName;
                }
            }
            else
            {
                if (Backcol.Contains(','))
                {
                    colnames = Backcol.Split(',');
                }
                else
                {
                    colnames = new String[] { Backcol };
                }
            }

            if (timecol == -1)
            {
                foreach (DataRow item in dt.Rows)
                {
                    foreach (String cname in colnames)
                    {
                        _key = cname;
                        _value = encode(item[cname].ToString());
                        str = str + "\"" + _key + "\":\"" + _value + "\",";
                    }
                    str = str.Substring(0, str.LastIndexOf(','));
                    str = "{" + str + "},";
                    json = json + str;
                    str = "";
                }
            }
            else
            {
                foreach (DataRow item in dt.Rows)
                {
                    for (int i = 0; i < colnames.Length; i++)
                    {
                        _key = colnames[i];
                        if (i == timecol)
                        {
                            try
                            {
                                _value = encode(Convert.ToDateTime(item[_key].ToString()).ToString(formatstr));
                            }
                            catch (Exception)
                            {
                                _value = "1990/00/00 ";
                            }
                        }
                        else
                        {
                            _value = encode(item[_key].ToString());
                        }
                        str = str + "\"" + _key + "\":\"" + _value + "\",";
                    }
                    str = str.Substring(0, str.LastIndexOf(','));
                    str = "{" + str + "},";
                    json = json + str;
                    str = "";
                }
            }


        }
        if (json.Contains(','))
        {
            json = json.Substring(0, json.LastIndexOf(','));
            String r = String.Format("[{0}]", json);
            return r;
        }
        else
        {
            return "";
        }

    }

    public static String encode(String str)
    {
        str = str.Replace("\n", "<br/>");
        str = HttpUtility.UrlEncode(str, Encoding.UTF8);
        return str;
    }
}