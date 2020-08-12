using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ServiceBus.Models
{
    public interface IServiceBus
    {
        Task Publish<T>(T obj);
    }
}
