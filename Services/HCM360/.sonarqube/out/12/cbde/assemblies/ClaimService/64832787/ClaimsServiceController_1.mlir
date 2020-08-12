func @_ClaimService.Controllers.ClaimsServiceController.InsertClaim$ClaimService.Models.ClaimRequest$(none) -> none loc("D:\\Solutions\\Services\\HCM360\\ClaimService\\Controllers\\ClaimsServiceController.cs" :25 :8) {
^entry (%_request : none):
%0 = cbde.alloca none loc("D:\\Solutions\\Services\\HCM360\\ClaimService\\Controllers\\ClaimsServiceController.cs" :26 :41)
cbde.store %_request, %0 : memref<none> loc("D:\\Solutions\\Services\\HCM360\\ClaimService\\Controllers\\ClaimsServiceController.cs" :26 :41)
br ^0

^0: // JumpBlock
%1 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\ClaimService\\Controllers\\ClaimsServiceController.cs" :28 :12) // Not a variable of known type: _serviceBus
%2 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\ClaimService\\Controllers\\ClaimsServiceController.cs" :28 :32) // Not a variable of known type: request
%3 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\ClaimService\\Controllers\\ClaimsServiceController.cs" :28 :12) // _serviceBus.Publish(request) (InvocationExpression)
// Entity from another assembly: Ok
%4 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\ClaimService\\Controllers\\ClaimsServiceController.cs" :29 :19) // Ok() (InvocationExpression)
return %4 : none loc("D:\\Solutions\\Services\\HCM360\\ClaimService\\Controllers\\ClaimsServiceController.cs" :29 :12)

^1: // ExitBlock
cbde.unreachable

}
