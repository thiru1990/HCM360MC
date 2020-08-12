using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http.Authentication;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Configuration;
using System;

namespace Authorization
{
    public class Authorize : AuthorizeAttribute, IAuthorizationFilter
    {
        private readonly IConfiguration _config;

        public Authorize(IConfiguration config)
        {
            _config = config;
        }
        
        public void OnAuthorization(AuthorizationFilterContext context)
        {
            if (!context.HttpContext.Request.Headers.TryGetValue("", out var AuthorizationKey))
            {
                throw new UnauthorizedAccessException();
            }

            var authorizationKey = _config["AuthorizationKey"];

            if(!AuthorizationKey.Equals(authorizationKey))
            {
                throw new UnauthorizedAccessException();
            }
        }
    }
}
