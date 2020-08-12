using Microsoft.Azure.ServiceBus;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ServiceBus.Models
{
    public class ServiceBus : IServiceBus
    {
        private readonly ITopicClient _topicClient;

        public ServiceBus(ITopicClient topicClient)
        {
            _topicClient = topicClient;
        }

        public Task Publish<T>(T obj)
        {
            var message = new Message(body: Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(obj)));
            message.UserProperties["messageType"] = typeof(T).Name;
            return _topicClient.SendAsync(message);
        }
    }
}
