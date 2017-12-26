using Data.Model.Entities;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin;
using Owin;
using Web.Models;
using Web.Utils;
using System.Linq;

[assembly: OwinStartupAttribute(typeof(Web.Startup))]
namespace Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            CreateRoles();
        }

        // In this method we will create default User roles
        private void CreateRoles()
        {
            ApplicationDbContext context = new ApplicationDbContext();

            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));


            // In Startup iam creating first Admin Role and creating a default Admin User  
            if (!roleManager.RoleExists(Role.Admin))
            {

                // first we create Admin rool 
                var role = new Microsoft.AspNet.Identity.EntityFramework.IdentityRole();
                role.Name = Role.Admin;
                roleManager.Create(role);
                
            }
            //add admin with role admin
            var db = new Entities();
            var user = db.AspNetUsers.Where(p => p.Email == "admin@sushires.com").FirstOrDefault();
            var result1 = UserManager.AddToRole(user.Id, Role.Admin);

            // creating Creating Manager role  
            if (!roleManager.RoleExists(Role.Staff))
            {
                var role = new Microsoft.AspNet.Identity.EntityFramework.IdentityRole();
                role.Name = Role.Staff;
                roleManager.Create(role);

            }

        }
    }
}
