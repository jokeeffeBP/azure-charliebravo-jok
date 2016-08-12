using System.Web;
using System.Web.Mvc;

namespace JOK_PaaS_2Tier_VC_App
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
