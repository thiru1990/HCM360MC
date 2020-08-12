func @_HCM360.Data.Models.HCM360Context.OnConfiguring$Microsoft.EntityFrameworkCore.DbContextOptionsBuilder$(none) -> () loc("D:\\Solutions\\Services\\HCM360\\HCM360.Data\\Models\\HCM360Context.cs" :22 :8) {
^entry (%_optionsBuilder : none):
%0 = cbde.alloca none loc("D:\\Solutions\\Services\\HCM360\\HCM360.Data\\Models\\HCM360Context.cs" :22 :46)
cbde.store %_optionsBuilder, %0 : memref<none> loc("D:\\Solutions\\Services\\HCM360\\HCM360.Data\\Models\\HCM360Context.cs" :22 :46)
br ^0

^0: // BinaryBranchBlock
%1 = cbde.unknown : none loc("D:\\Solutions\\Services\\HCM360\\HCM360.Data\\Models\\HCM360Context.cs" :24 :17) // Not a variable of known type: optionsBuilder
%2 = cbde.unknown : i1 loc("D:\\Solutions\\Services\\HCM360\\HCM360.Data\\Models\\HCM360Context.cs" :24 :17) // optionsBuilder.IsConfigured (SimpleMemberAccessExpression)
%3 = cbde.unknown : i1 loc("D:\\Solutions\\Services\\HCM360\\HCM360.Data\\Models\\HCM360Context.cs" :24 :16) // !optionsBuilder.IsConfigured (LogicalNotExpression)
cond_br %3, ^1, ^1 loc("D:\\Solutions\\Services\\HCM360\\HCM360.Data\\Models\\HCM360Context.cs" :24 :16)

^1: // ExitBlock
return

}
// Skipping function OnModelCreating(none), it contains poisonous unsupported syntaxes

