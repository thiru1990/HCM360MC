func @_ServiceBus.Models.ServiceBus.Publish$T$$T$(none) -> none loc("D:\\Solutions\\Services\\HCM360\\ServiceBus\\Models\\ServiceBus.cs" :18 :8) {
^entry (%_obj : none):
%0 = cbde.alloca none loc("D:\\Solutions\\Services\\HCM360\\ServiceBus\\Models\\ServiceBus.cs" :18 :31)
cbde.store %_obj, %0 : memref<none> loc("D:\\Solutions\\Services\\HCM360\\ServiceBus\\Models\\ServiceBus.cs" :18 :31)
br ^0

^0: // JumpBlock
// Entity from another assembly: Encoding
%1 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\ServiceBus\\Models\\ServiceBus.cs" :20 :44) // Encoding.UTF8 (SimpleMemberAccessExpression)
// Entity from another assembly: JsonConvert
%2 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\ServiceBus\\Models\\ServiceBus.cs" :20 :95) // Not a variable of known type: obj
%3 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\ServiceBus\\Models\\ServiceBus.cs" :20 :67) // JsonConvert.SerializeObject(obj) (InvocationExpression)
%4 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\ServiceBus\\Models\\ServiceBus.cs" :20 :44) // Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(obj)) (InvocationExpression)
%5 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\ServiceBus\\Models\\ServiceBus.cs" :20 :26) // new Message(body: Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(obj))) (ObjectCreationExpression)
%7 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\ServiceBus\\Models\\ServiceBus.cs" :21 :12) // Not a variable of known type: message
%8 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\ServiceBus\\Models\\ServiceBus.cs" :21 :12) // message.UserProperties (SimpleMemberAccessExpression)
%9 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\ServiceBus\\Models\\ServiceBus.cs" :21 :35) // "messageType" (StringLiteralExpression)
%10 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\ServiceBus\\Models\\ServiceBus.cs" :21 :12) // message.UserProperties["messageType"] (ElementAccessExpression)
%11 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\ServiceBus\\Models\\ServiceBus.cs" :21 :52) // typeof(T) (TypeOfExpression)
%12 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\ServiceBus\\Models\\ServiceBus.cs" :21 :52) // typeof(T).Name (SimpleMemberAccessExpression)
%13 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\ServiceBus\\Models\\ServiceBus.cs" :22 :19) // Not a variable of known type: _topicClient
%14 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\ServiceBus\\Models\\ServiceBus.cs" :22 :42) // Not a variable of known type: message
%15 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\ServiceBus\\Models\\ServiceBus.cs" :22 :19) // _topicClient.SendAsync(message) (InvocationExpression)
return %15 : none loc("D:\\Solutions\\Services\\HCM360\\ServiceBus\\Models\\ServiceBus.cs" :22 :12)

^1: // ExitBlock
cbde.unreachable

}
