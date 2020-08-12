func @_MemberService.Controllers.MemberServiceController.InsertMember$MemberService.Models.MemberRequest$(none) -> none loc("D:\\Solutions\\Services\\HCM360\\MemberService\\Controllers\\MemberServiceController.cs" :25 :8) {
^entry (%_request : none):
%0 = cbde.alloca none loc("D:\\Solutions\\Services\\HCM360\\MemberService\\Controllers\\MemberServiceController.cs" :26 :42)
cbde.store %_request, %0 : memref<none> loc("D:\\Solutions\\Services\\HCM360\\MemberService\\Controllers\\MemberServiceController.cs" :26 :42)
br ^0

^0: // JumpBlock
%1 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\MemberService\\Controllers\\MemberServiceController.cs" :28 :12) // Not a variable of known type: _serviceBus
%2 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\MemberService\\Controllers\\MemberServiceController.cs" :28 :32) // Not a variable of known type: request
%3 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\MemberService\\Controllers\\MemberServiceController.cs" :28 :12) // _serviceBus.Publish(request) (InvocationExpression)
// Entity from another assembly: Ok
%4 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\MemberService\\Controllers\\MemberServiceController.cs" :29 :19) // Ok() (InvocationExpression)
return %4 : none loc("D:\\Solutions\\Services\\HCM360\\MemberService\\Controllers\\MemberServiceController.cs" :29 :12)

^1: // ExitBlock
cbde.unreachable

}
