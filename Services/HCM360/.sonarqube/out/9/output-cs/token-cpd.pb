È:
WD:\Solutions\Services\HCM360\PhysicianDetailsService\Controllers\PhysicianController.cs
	namespace 	#
PhysicianDetailsService
 !
.! "
Controllers" -
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str ,
), -
]- .
public 

class 
PhysicianController $
:% &
ControllerBase' 5
{ 
private 
readonly $
IPhysicianDetailsService 1
_physicianDetails2 C
;C D
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
ILogger  
<  !
PhysicianController! 4
>4 5
_logger6 =
;= >
private 
readonly 
IHttpClientFactory +
_httpClient, 7
;7 8
public 
PhysicianController "
(" #$
IPhysicianDetailsService# ;
physicianDetails< L
,L M
IConfigurationN \
configuration] j
,j k
ILoggerl s
<s t 
PhysicianController	t á
>
á à
logger
â è
,
è ê 
IHttpClientFactory
ë £

httpClient
§ Æ
)
Æ Ø
=> 

( 
_physicianDetails 
, 
_configuration -
,- .
_logger/ 6
,6 7
_httpClient8 C
)C D
=E F
(G H
physicianDetailsH X
,X Y
configurationZ g
,g h
loggeri o
,o p

httpClientq {
){ |
;| }
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
async 
Task 
< 
ActionResult &
>& '
GetPhysicianAsync( 9
(9 :
int: =
id> @
)@ A
{ 	
_logger 
. 
LogInformation "
(" #
$str# 9
)9 :
;: ;
var 
member 
= 
	GetMember "
(" #
id# %
)% &
;& '
if!! 
(!! 
member!! 
==!! 
null!! 
)!! 
{"" 
_logger## 
.## 
LogInformation## &
(##& '
$str##' >
)##> ?
;##? @
return$$ 
Forbid$$ 
($$ 
)$$ 
;$$  
}%% 
_logger'' 
.'' 
LogInformation'' "
(''" #
$str''# :
)'': ;
;''; <
var(( 
response(( 
=(( 
await((  
GetPhysicianDetail((! 3
(((3 4
member((4 :
)((: ;
;((; <
if)) 
()) 
response)) 
==)) 
null))  
)))  !
{** 
return++ 
NotFound++ 
(++  
)++  !
;++! "
},, 
else-- 
{.. 
return// 
Ok// 
(// 
await// 
GetPhysicianDetail//  2
(//2 3
member//3 9
)//9 :
)//: ;
;//; <
}00 
}11 	
private33 
Member33 
	GetMember33  
(33  !
int33! $
id33% '
)33' (
{44 	
_logger55 
.55 
LogInformation55 "
(55" #
$str55# 1
)551 2
;552 3
try66 
{77 
var88 
response88 
=88 
_httpClient88 *
.88* +
CreateClient88+ 7
(887 8
)888 9
.889 :
GetStringAsync88: H
(88H I
new88I L
Uri88M P
(88P Q
_configuration88Q _
[88_ `
$str88` u
]88u v
+88w x
id88y {
)88{ |
)88| }
.88} ~
Result	88~ Ñ
;
88Ñ Ö
var:: 
member:: 
=:: 
JsonConvert:: (
.::( )
DeserializeObject::) :
<::: ;
Member::; A
>::A B
(::B C
response::C K
)::K L
;::L M
_logger<< 
.<< 
LogDebug<<  
(<<  !
$str<<! >
,<<> ?
JsonConvert<<@ K
.<<K L
SerializeObject<<L [
(<<[ \
member<<\ b
)<<b c
)<<c d
;<<d e
_logger== 
.== 
LogInformation== &
(==& '
$str==' 6
)==6 7
;==7 8
return>> 
member>> 
;>> 
}?? 
catch@@ 
(@@ 
	Exception@@ 
ex@@ 
)@@  
{AA 
_loggerBB 
.BB 
LogErrorBB  
(BB  !
$strBB! A
,BBA B
exBBC E
.BBE F
ToStringBBF N
(BBN O
)BBO P
)BBP Q
;BBQ R
returnCC 
nullCC 
;CC 
}DD 
}EE 	
privateGG 
TaskGG 
<GG 
PhysicianDetailGG $
>GG$ %
GetPhysicianDetailGG& 8
(GG8 9
MemberGG9 ?
memGG@ C
)GGC D
{HH 	
_loggerII 
.II 
LogInformationII "
(II" #
$strII# :
)II: ;
;II; <
varJJ 
	physicianJJ 
=JJ 
_physicianDetailsJJ -
.JJ- .
GetPhysicianByIdJJ. >
(JJ> ?
memJJ? B
.JJB C
PhysicianIdJJC N
.JJN O
ValueJJO T
)JJT U
;JJU V
PhysicianDetailKK 
resultKK "
=KK# $
nullKK% )
;KK) *
ifLL 
(LL 
	physicianLL 
!=LL 
nullLL !
&&LL" $
	physicianLL% .
.LL. /
ResultLL/ 5
!=LL6 8
nullLL9 =
)LL= >
{MM 
resultNN 
=NN 
newNN 
PhysicianDetailNN ,
{NN- .

MemberNameNN/ 9
=NN: ;
memNN< ?
.NN? @
MemberFirstNameNN@ O
+NNP Q
$strNNR U
+NNV W
memNNX [
.NN[ \
MemberLastNameNN\ j
,NNj k
MemberIDNNl t
=NNu v
memNNw z
.NNz {
MemberId	NN{ É
,
NNÉ Ñ
PhysicianName
NNÖ í
=
NNì î
	physician
NNï û
.
NNû ü
Result
NNü •
.
NN• ¶
PhysicianName
NN¶ ≥
}
NN¥ µ
;
NNµ ∂
}OO 
_loggerPP 
.PP 
LogDebugPP 
(PP 
$strPP 4
,PP4 5
JsonConvertPP6 A
.PPA B
SerializeObjectPPB Q
(PPQ R
resultPPR X
)PPX Y
)PPY Z
;PPZ [
_loggerQQ 
.QQ 
LogInformationQQ !
(QQ! "
$strQQ" :
)QQ: ;
;QQ; <
returnRR 
TaskRR 
.RR 
RunRR 
(RR 
(RR 
)RR 
=>RR !
resultRR" (
)RR( )
;RR) *
}SS 	
}TT 
}UU ¸
\D:\Solutions\Services\HCM360\PhysicianDetailsService\DataService\IPhysicianDetailsService.cs
	namespace 	#
PhysicianDetailsService
 !
.! "
DataService" -
{ 
public		 

	interface		 $
IPhysicianDetailsService		 -
{

 
Task 
< 
	Physician 
> 
GetPhysicianById (
(( )
int) ,
id- /
)/ 0
;0 1
} 
} ≠
[D:\Solutions\Services\HCM360\PhysicianDetailsService\DataService\PhysicianDetailsService.cs
	namespace

 	#
PhysicianDetailsService


 !
.

! "
DataService

" -
{ 
public 

class #
PhysicianDetailsService (
:) *$
IPhysicianDetailsService+ C
{ 
private 
readonly 
IRepository $
<$ %
	Physician% .
>. / 
_physicianRepository0 D
;D E
public #
PhysicianDetailsService &
(& '
IRepository' 2
<2 3
	Physician3 <
>< =
physicianRepository> Q
)Q R
{ 	 
_physicianRepository  
=! "
physicianRepository# 6
;6 7
} 	
public 
async 
Task 
< 
	Physician #
># $
GetPhysicianById% 5
(5 6
int6 9
id: <
)< =
{ 	
return 
await  
_physicianRepository -
.- .
GetAll. 4
(4 5
)5 6
.6 7
FirstOrDefaultAsync7 J
(J K
xK L
=>M O
xP Q
.Q R
PhysicianIdR ]
==^ `
ida c
)c d
;d e
} 	
} 
} Å
ND:\Solutions\Services\HCM360\PhysicianDetailsService\Models\PhysicianDetail.cs
	namespace 	#
PhysicianDetailsService
 !
.! "
Models" (
{ 
public 

class 
PhysicianDetail  
{		 
public

 
int

 
MemberID

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 

MemberName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
PhysicianName #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} §

?D:\Solutions\Services\HCM360\PhysicianDetailsService\Program.cs
	namespace

 	#
PhysicianDetailsService


 !
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} Â&
?D:\Solutions\Services\HCM360\PhysicianDetailsService\Startup.cs
	namespace 	#
PhysicianDetailsService
 !
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Log 
. 
Logger 
= 
new 
LoggerConfiguration 0
(0 1
)1 2
.2 3
ReadFrom3 ;
.; <
Configuration< I
(I J
configurationJ W
)W X
.X Y
CreateLoggerY e
(e f
)f g
;g h
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public!! 
void!! 
ConfigureServices!! %
(!!% &
IServiceCollection!!& 8
services!!9 A
)!!A B
{"" 	
services## 
.## 
AddControllers## #
(### $
)##$ %
;##% &
services&& 
.&& 
AddSwaggerGen&& "
(&&" #
)&&# $
;&&$ %
services)) 
.)) 
AddApiVersioning)) %
())% &
config))& ,
=>))- /
{** 
config++ 
.++ 
DefaultApiVersion++ (
=++) *
new+++ .

ApiVersion++/ 9
(++9 :
$num++: ;
,++; <
$num++= >
)++> ?
;++? @
config,, 
.,, /
#AssumeDefaultVersionWhenUnspecified,, :
=,,; <
true,,= A
;,,A B
config-- 
.-- 
ReportApiVersions-- (
=--) *
true--+ /
;--/ 0
}.. 
).. 
;.. 
services00 
.00 
AddDbContext00 !
<00! "
HCM360Context00" /
>00/ 0
(000 1
options001 8
=>009 ;
options00< C
.00C D
UseSqlServer00D P
(00P Q
Configuration00Q ^
[00^ _
$str00_ z
]00z {
)00{ |
)00| }
;00} ~
services22 
.22 
AddTransient22 !
(22! "
typeof22" (
(22( )
IRepository22) 4
<224 5
>225 6
)226 7
,227 8
typeof229 ?
(22? @

Repository22@ J
<22J K
>22K L
)22L M
)22M N
;22N O
services33 
.33 
AddTransient33 !
<33! "$
IPhysicianDetailsService33" :
,33: ;
DataService33< G
.33G H#
PhysicianDetailsService33H _
>33_ `
(33` a
)33a b
;33b c
services55 
.55 
AddHttpClient55 "
(55" #
)55# $
;55$ %
}66 	
public99 
void99 
	Configure99 
(99 
IApplicationBuilder99 1
app992 5
,995 6
IWebHostEnvironment997 J
env99K N
,99N O
ILoggerFactory99P ^
loggerFactory99_ l
)99l m
{:: 	
if;; 
(;; 
env;; 
.;; 
IsDevelopment;; !
(;;! "
);;" #
);;# $
{<< 
app== 
.== %
UseDeveloperExceptionPage== -
(==- .
)==. /
;==/ 0
}>> 
app@@ 
.@@ 
UseHttpsRedirection@@ #
(@@# $
)@@$ %
;@@% &
appBB 
.BB 

UseRoutingBB 
(BB 
)BB 
;BB 
appDD 
.DD 
UseAuthorizationDD  
(DD  !
)DD! "
;DD" #
appFF 
.FF 
UseEndpointsFF 
(FF 
	endpointsFF &
=>FF' )
{GG 
	endpointsHH 
.HH 
MapControllersHH (
(HH( )
)HH) *
;HH* +
}II 
)II 
;II 
appKK 
.KK 

UseSwaggerKK 
(KK 
)KK 
;KK 
appMM 
.MM 
UseSwaggerUIMM 
(MM 
cMM 
=>MM !
{NN 
cOO 
.OO 
SwaggerEndpointOO !
(OO! "
$strOO" <
,OO< =
$strOO> J
)OOJ K
;OOK L
cPP 
.PP 
RoutePrefixPP 
=PP 
stringPP  &
.PP& '
EmptyPP' ,
;PP, -
}QQ 
)QQ 
;QQ 
loggerFactorySS 
.SS 

AddSerilogSS $
(SS$ %
)SS% &
;SS& '
}TT 	
}UU 
}VV 