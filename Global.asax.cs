using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace ITJob
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {

        }

        //log4net.ILog log = log4net.LogManager.GetLogger(typeof(Application_Start));

        //public override void Init()
        //{
        //	base.Init();
        //	this.Error += WebApiApplication_Error;
        //}

        //void WebApiApplication_Error(object sender, EventArgs e)
        //{
        //	var ex = Server.GetLastError();
        //	log.Error(ex);
        //}

    }
}