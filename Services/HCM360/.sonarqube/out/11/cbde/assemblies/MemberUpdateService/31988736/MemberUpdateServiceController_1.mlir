func @_MemberUpdateService.Controllers.MemberUpdateServiceController.UpdateMember$int.Microsoft.AspNetCore.JsonPatch.JsonPatchDocument$MemberUpdateService.Models.MemberDetails$$(i32, none) -> none loc("D:\\Solutions\\Services\\HCM360\\MemberUpdateService\\Controllers\\MemberUpdateServiceController.cs" :33 :8) {
^entry (%_id : i32, %_memberPatch : none):
%0 = cbde.alloca i32 loc("D:\\Solutions\\Services\\HCM360\\MemberUpdateService\\Controllers\\MemberUpdateServiceController.cs" :34 :42)
cbde.store %_id, %0 : memref<i32> loc("D:\\Solutions\\Services\\HCM360\\MemberUpdateService\\Controllers\\MemberUpdateServiceController.cs" :34 :42)
%1 = cbde.alloca none loc("D:\\Solutions\\Services\\HCM360\\MemberUpdateService\\Controllers\\MemberUpdateServiceController.cs" :34 :50)
cbde.store %_memberPatch, %1 : memref<none> loc("D:\\Solutions\\Services\\HCM360\\MemberUpdateService\\Controllers\\MemberUpdateServiceController.cs" :34 :50)
br ^0

^0: // JumpBlock
// Skipped because MethodDeclarationSyntax or ClassDeclarationSyntax or NamespaceDeclarationSyntax: GetMember
%2 = cbde.load %0 : memref<i32> loc("D:\\Solutions\\Services\\HCM360\\MemberUpdateService\\Controllers\\MemberUpdateServiceController.cs" :36 :35)
%3 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\MemberUpdateService\\Controllers\\MemberUpdateServiceController.cs" :36 :25) // GetMember(id) (InvocationExpression)
%5 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\MemberUpdateService\\Controllers\\MemberUpdateServiceController.cs" :37 :12) // Not a variable of known type: memberPatch
%6 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\MemberUpdateService\\Controllers\\MemberUpdateServiceController.cs" :37 :32) // Not a variable of known type: member
%7 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\MemberUpdateService\\Controllers\\MemberUpdateServiceController.cs" :37 :12) // memberPatch.ApplyTo(member) (InvocationExpression)
%8 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\MemberUpdateService\\Controllers\\MemberUpdateServiceController.cs" :38 :12) // Not a variable of known type: _serviceBus
%9 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\MemberUpdateService\\Controllers\\MemberUpdateServiceController.cs" :38 :32) // Not a variable of known type: member
%10 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\MemberUpdateService\\Controllers\\MemberUpdateServiceController.cs" :38 :12) // _serviceBus.Publish(member) (InvocationExpression)
// Entity from another assembly: Ok
%11 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\MemberUpdateService\\Controllers\\MemberUpdateServiceController.cs" :39 :22) // Not a variable of known type: member
%12 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\MemberUpdateService\\Controllers\\MemberUpdateServiceController.cs" :39 :19) // Ok(member) (InvocationExpression)
return %12 : none loc("D:\\Solutions\\Services\\HCM360\\MemberUpdateService\\Controllers\\MemberUpdateServiceController.cs" :39 :12)

^1: // ExitBlock
cbde.unreachable

}
// Skipping function GetMember(i32), it contains poisonous unsupported syntaxes

