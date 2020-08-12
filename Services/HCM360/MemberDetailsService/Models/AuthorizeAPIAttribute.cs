using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MemberDetailsService.Models
{
    public class AuthorizeAPIAttribute : Attribute, IAsyncActionFilter
    {
        public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            //Out Variable
            if (!context.HttpContext.Request.Headers.TryGetValue("AuthorizationKey", out var AuthorizationKey))
            {
                context.Result = new UnauthorizedResult();
                return;
            }
            var config = context.HttpContext.RequestServices.GetRequiredService<IConfiguration>();
            var authorizationKey = config.GetValue<string>("AuthorizationKey");

            if(!authorizationKey.Equals(AuthorizationKey))
            {
                context.Result = new UnauthorizedResult();
                return;
            }

            await next();
        }
    }
}
