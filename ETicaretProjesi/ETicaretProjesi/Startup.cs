using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ETicaretProjesi.Startup))]
namespace ETicaretProjesi
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
