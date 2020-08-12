Ê2
WD:\Solutions\Services\HCM360\MemberDetailsService\Controllers\MemberDetailController.cs
	namespace 	 
MemberDetailsService
 
. 
Controllers *
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str ,
), -
]- .
public 

class "
MemberDetailController '
:( )
ControllerBase* 8
{ 
private 
readonly !
IMemberDetailsService .
_memberDetails/ =
;= >
private 
readonly 
ILogger  
<  !"
MemberDetailController! 7
>7 8
_logger9 @
;@ A
public "
MemberDetailController %
(% &!
IMemberDetailsService& ;
memberDetails< I
,I J
ILoggerK R
<R S"
MemberDetailControllerS i
>i j
loggerk q
)q r
{ 	
_memberDetails 
= 
memberDetails *
;* +
_logger 
= 
logger 
; 
} 	
[ 	
AuthorizeAPI	 
] 
[ 	
HttpGet	 
( 
$str 
) 
] 
[ 	

ApiVersion	 
( 
$str 
) 
] 
public 
async 
Task 
< 
ActionResult &
>& '
	GetMember( 1
(1 2
int2 5
id6 8
)8 9
{ 	
_logger 
. 
LogInformation "
(" #
$str# 1
)1 2
;2 3
var   
response   
=   
await    !
GetRelativeMemberInfo  ! 6
(  6 7
id  7 9
)  9 :
;  : ;
if!! 
(!! 
response!! 
==!! 
null!!  
)!!  !
{"" 
_logger## 
.## 
LogInformation## &
(##& '
$str##' 6
)##6 7
;##7 8
return$$ 
NotFound$$ 
($$  
)$$  !
;$$! "
}%% 
else&& 
{'' 
_logger(( 
.(( 
LogInformation(( &
(((& '
$str((' 6
)((6 7
;((7 8
return)) 
Ok)) 
()) 
response)) "
)))" #
;))# $
}** 
}++ 	
[-- 	
AuthorizeAPI--	 
]-- 
[.. 	
HttpGet..	 
(.. 
$str.. 
).. 
].. 
[// 	

ApiVersion//	 
(// 
$str// 
)// 
]// 
public00 
async00 
Task00 
<00 
ActionResult00 &
>00& '
GetMemberV200( 3
(003 4
int004 7
id008 :
)00: ;
{11 	
_logger22 
.22 
LogInformation22 "
(22" #
$str22# 1
)221 2
;222 3
var33 
response33 
=33 
await33  !
GetRelativeMemberInfo33! 6
(336 7
id337 9
)339 :
;33: ;
if44 
(44 
response44 
==44 
null44  
)44  !
{55 
_logger66 
.66 
LogInformation66 &
(66& '
$str66' 6
)666 7
;667 8
return77 
NotFound77 
(77  
)77  !
;77! "
}88 
else99 
{:: 
_logger;; 
.;; 
LogInformation;; &
(;;& '
$str;;' 6
);;6 7
;;;7 8
return<< 
Ok<< 
(<< 
response<< "
)<<" #
;<<# $
}== 
}>> 	
private@@ 
Task@@ 
<@@ 
MemberDetails@@ "
>@@" #!
GetRelativeMemberInfo@@$ 9
(@@9 :
int@@: =
id@@> @
)@@@ A
{AA 	
_loggerBB 
.BB 
LogInformationBB "
(BB" #
$strBB# =
)BB= >
;BB> ?
varCC 
memberCC 
=CC 
_memberDetailsCC '
.CC' (
GetMemberByIdCC( 5
(CC5 6
idCC6 8
)CC8 9
;CC9 :
MemberDetailsDD 
resultDD  
=DD! "
nullDD# '
;DD' (
ifEE 
(EE 
memberEE 
!=EE 
nullEE 
&&EE !
memberEE" (
.EE( )
ResultEE) /
!=EE0 2
nullEE3 7
)EE7 8
{FF 
varGG 
memGG 
=GG 
memberGG  
.GG  !
ResultGG! '
;GG' (
resultHH 
=HH 
newHH 
MemberDetailsHH *
{HH+ ,
MemberFirstNameHH- <
=HH= >
memHH? B
.HHB C
MemberFirstNameHHC R
,HHR S
MemberLastNameHHT b
=HHc d
memHHe h
.HHh i
MemberLastNameHHi w
,HHw x
MemberID	HHy 
=
HH‚ ƒ
mem
HH„ ‡
.
HH‡ ˆ
MemberId
HHˆ 
,
HH ‘
Address
HH’ ™
=
HHš ›
mem
HHœ Ÿ
.
HHŸ  
MemberAddress
HH  ­
,
HH­ ®
EmailAddress
HH¯ »
=
HH¼ ½
mem
HH¾ Á
.
HHÁ Â 
MemberEmailAddress
HHÂ Ô
,
HHÔ Õ
State
HHÖ Û
=
HHÜ Ý
mem
HHÞ á
.
HHá â
MemberState
HHâ í
,
HHí î
SSN
HHï ò
=
HHó ô
mem
HHõ ø
.
HHø ù
	MemberSsn
HHù ‚
,
HH‚ ƒ
PhysicianID
HH„ 
=
HH ‘
mem
HH’ •
.
HH• –
PhysicianId
HH– ¡
.
HH¡ ¢
Value
HH¢ §
}
HH¨ ©
;
HH© ª
}II 
_loggerJJ 
.JJ 
LogInformationJJ "
(JJ" #
$strJJ# >
)JJ> ?
;JJ? @
returnKK 
TaskKK 
.KK 
RunKK 
(KK 
(KK 
)KK 
=>KK !
resultKK" (
)KK( )
;KK) *
}LL 	
}MM 
}NN ê
VD:\Solutions\Services\HCM360\MemberDetailsService\DataService\IMemberDetailsService.cs
	namespace 	 
MemberDetailsService
 
. 
DataService *
{ 
public		 

	interface		 !
IMemberDetailsService		 *
{

 
Task 
< 
Member 
> 
GetMemberById "
(" #
int# &
id' )
)) *
;* +
} 
} ý

UD:\Solutions\Services\HCM360\MemberDetailsService\DataService\MemberDetailsService.cs
	namespace		 	 
MemberDetailsService		
 
.		 
DataService		 *
{

 
public 

class  
MemberDetailsService %
:& '!
IMemberDetailsService( =
{ 
private 
readonly 
IRepository $
<$ %
Member% +
>+ ,
_memberRepository- >
;> ?
public  
MemberDetailsService #
($ %
IRepository% 0
<0 1
Member1 7
>7 8
memberRepository9 I
)I J
{ 	
_memberRepository 
= 
memberRepository  0
;0 1
} 	
public 
async 
Task 
< 
Member  
>  !
GetMemberById" /
(/ 0
int0 3
id4 6
)6 7
{ 	
return 
await 
_memberRepository *
.* +
GetAll+ 1
(1 2
)2 3
.3 4
FirstOrDefaultAsync4 G
(G H
xH I
=>J L
xM N
.N O
MemberIdO W
==X Z
id[ ]
)] ^
;^ _
} 	
} 
} ø
QD:\Solutions\Services\HCM360\MemberDetailsService\Models\AuthorizeAPIAttribute.cs
	namespace

 	 
MemberDetailsService


 
.

 
Models

 %
{ 
public 

class !
AuthorizeAPIAttribute &
:' (
	Attribute) 2
,2 3
IAsyncActionFilter4 F
{ 
public 
async 
Task "
OnActionExecutionAsync 0
(0 1"
ActionExecutingContext1 G
contextH O
,O P#
ActionExecutionDelegateQ h
nexti m
)m n
{ 	
if 
( 
! 
context 
. 
HttpContext $
.$ %
Request% ,
., -
Headers- 4
.4 5
TryGetValue5 @
(@ A
$strA S
,S T
outU X
varY \
AuthorizationKey] m
)m n
)n o
{ 
context 
. 
Result 
=  
new! $
UnauthorizedResult% 7
(7 8
)8 9
;9 :
return 
; 
} 
var 
config 
= 
context  
.  !
HttpContext! ,
., -
RequestServices- <
.< =
GetRequiredService= O
<O P
IConfigurationP ^
>^ _
(_ `
)` a
;a b
var 
authorizationKey  
=! "
config# )
.) *
GetValue* 2
<2 3
string3 9
>9 :
(: ;
$str; M
)M N
;N O
if 
( 
! 
authorizationKey  
.  !
Equals! '
(' (
AuthorizationKey( 8
)8 9
)9 :
{ 
context 
. 
Result 
=  
new! $
UnauthorizedResult% 7
(7 8
)8 9
;9 :
return 
; 
} 
await 
next 
( 
) 
; 
}   	
}!! 
}"" ¡
SD:\Solutions\Services\HCM360\MemberDetailsService\Models\ConfigureSwaggerOptions.cs
	namespace 	 
MemberDetailsService
 
. 
Models %
{ 
public 

class #
ConfigureSwaggerOptions (
:) *
IConfigureOptions+ <
<< =
SwaggerGenOptions= N
>N O
{ 
readonly *
IApiVersionDescriptionProvider /
provider0 8
;8 9
public #
ConfigureSwaggerOptions &
(& '*
IApiVersionDescriptionProvider' E
providerF N
)N O
=>P R
this
 
. 
provider 
= 
provider "
;" #
public 
void 
	Configure 
( 
SwaggerGenOptions /
options0 7
)7 8
{ 	
foreach 
( 
var 
description $
in% '
provider( 0
.0 1"
ApiVersionDescriptions1 G
)G H
{ 
options 
. 

SwaggerDoc "
(" #
description 
. 
	GroupName '
,' (
new 
	Microsoft !
.! "
OpenApi" )
.) *
Models* 0
.0 1
OpenApiInfo1 <
(< =
)= >
{ 
Title 
= 
$"  "
Sample API " -
{- .
description. 9
.9 :

ApiVersion: D
}D E
"E F
,F G
Version 
=  !
description" -
.- .

ApiVersion. 8
.8 9
ToString9 A
(A B
)B C
,C D
} 
) 
; 
} 
}   	
}!! 
}"" „
ID:\Solutions\Services\HCM360\MemberDetailsService\Models\MemberDetails.cs
	namespace 	 
MemberDetailsService
 
. 
Models %
{ 
public 

class 
MemberDetails 
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
string 
MemberFirstName %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
MemberLastName $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
State 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
EmailAddress "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
SSN 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 
PhysicianID 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ž

<D:\Solutions\Services\HCM360\MemberDetailsService\Program.cs
	namespace

 	 
MemberDetailsService


 
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
} †8
<D:\Solutions\Services\HCM360\MemberDetailsService\Startup.cs
	namespace 	 
MemberDetailsService
 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Log 
. 
Logger 
= 
new 
LoggerConfiguration 0
(0 1
)1 2
.2 3
ReadFrom3 ;
.; <
Configuration< I
(I J
configurationJ W
)W X
.X Y
CreateLoggerY e
(e f
)f g
;g h
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public   
void   
ConfigureServices   %
(  % &
IServiceCollection  & 8
services  9 A
)  A B
{!! 	
services"" 
."" 
AddControllers"" #
(""# $
)""$ %
;""% &
services%% 
.%% 
AddApiVersioning%% %
(%%% &
config%%& ,
=>%%- /
{&& 
config'' 
.'' 
DefaultApiVersion'' (
='') *
new''+ .

ApiVersion''/ 9
(''9 :
$num'': ;
,''; <
$num''= >
)''> ?
;''? @
config(( 
.(( /
#AssumeDefaultVersionWhenUnspecified(( :
=((; <
true((= A
;((A B
config)) 
.)) 
ReportApiVersions)) (
=))) *
true))+ /
;))/ 0
}** 
)** 
;** 
services++ 
.++ #
AddVersionedApiExplorer++ ,
(++, -
options++- 4
=>++5 7
options++8 ?
.++? @
GroupNameFormat++@ O
=++P Q
$str++R Z
)++Z [
;++[ \
services,, 
.,, 
AddTransient,, !
<,,! "
IConfigureOptions,," 3
<,,3 4
SwaggerGenOptions,,4 E
>,,E F
,,,F G#
ConfigureSwaggerOptions,,H _
>,,_ `
(,,` a
),,a b
;,,b c
services// 
.// 
AddSwaggerGen// "
(//" #
options//# *
=>//+ -
{00 
options11 
.11 !
AddSecurityDefinition11 -
(11- .
$str11. 6
,116 7
new118 ;!
OpenApiSecurityScheme11< Q
{22 
In33 
=33 
ParameterLocation33 *
.33* +
Header33+ 1
,331 2
Description44 
=44  !
$str44" L
,44L M
Name55 
=55 
$str55 -
,55- .
Type66 
=66 
SecuritySchemeType66 -
.66- .
ApiKey66. 4
}77 
)77 
;77 
options88 
.88 "
AddSecurityRequirement88 .
(88. /
new88/ 2&
OpenApiSecurityRequirement883 M
{88N O
{99 
new::  !
OpenApiSecurityScheme::! 6
{;; 
	Reference<< (
=<<) *
new<<+ .
OpenApiReference<</ ?
{==  
Type>>! %
=>>& '
ReferenceType>>( 5
.>>5 6
SecurityScheme>>6 D
,>>D E
Id??! #
=??$ %
$str??& .
}@@  
}AA 
,AA  
newBB !
stringBB" (
[BB( )
]BB) *
{BB+ ,
}BB- .
}CC 
}DD 
)DD 
;DD 
}EE 
)EE 
;EE 
servicesII 
.II 
AddDbContextII !
<II! "
HCM360ContextII" /
>II/ 0
(II0 1
optionsII1 8
=>II9 ;
optionsII< C
.IIC D
UseSqlServerIID P
(IIP Q
ConfigurationIIQ ^
[II^ _
$strII_ z
]IIz {
)II{ |
)II| }
;II} ~
servicesKK 
.KK 
AddTransientKK !
(KK! "
typeofKK" (
(KK( )
IRepositoryKK) 4
<KK4 5
>KK5 6
)KK6 7
,KK7 8
typeofKK9 ?
(KK? @

RepositoryKK@ J
<KKJ K
>KKK L
)KKL M
)KKM N
;KKN O
servicesLL 
.LL 
AddTransientLL !
<LL! "!
IMemberDetailsServiceLL" 7
,LL7 8
DataServiceLL9 D
.LLD E 
MemberDetailsServiceLLE Y
>LLY Z
(LLZ [
)LL[ \
;LL\ ]
}MM 	
publicPP 
voidPP 
	ConfigurePP 
(PP 
IApplicationBuilderPP 1
appPP2 5
,PP5 6
IWebHostEnvironmentPP7 J
envPPK N
,PPN O
ILoggerFactoryPPP ^
loggerFactoryPP_ l
,PPl m+
IApiVersionDescriptionProvider	PPn Œ
provider
PP •
)
PP• –
{QQ 	
ifRR 
(RR 
envRR 
.RR 
IsDevelopmentRR !
(RR! "
)RR" #
)RR# $
{SS 
appTT 
.TT %
UseDeveloperExceptionPageTT -
(TT- .
)TT. /
;TT/ 0
}UU 
appWW 
.WW 
UseHttpsRedirectionWW #
(WW# $
)WW$ %
;WW% &
appYY 
.YY 

UseRoutingYY 
(YY 
)YY 
;YY 
app[[ 
.[[ 
UseAuthorization[[  
([[  !
)[[! "
;[[" #
app]] 
.]] 
UseEndpoints]] 
(]] 
	endpoints]] &
=>]]' )
{^^ 
	endpoints__ 
.__ 
MapControllers__ (
(__( )
)__) *
;__* +
}`` 
)`` 
;`` 
appbb 
.bb 

UseSwaggerbb 
(bb 
)bb 
;bb 
appdd 
.dd 
UseSwaggerUIdd 
(dd 
cdd 
=>dd !
{ee 
foreachgg 
(gg 
vargg 
descriptiongg (
ingg) +
providergg, 4
.gg4 5"
ApiVersionDescriptionsgg5 K
)ggK L
{hh 
cii 
.ii 
SwaggerEndpointii %
(ii% &
$"jj 
	/swagger/jj #
{jj# $
descriptionjj$ /
.jj/ 0
	GroupNamejj0 9
}jj9 :
/swagger.jsonjj: G
"jjG H
,jjH I
descriptionkk #
.kk# $
	GroupNamekk$ -
.kk- .
ToUpperInvariantkk. >
(kk> ?
)kk? @
)kk@ A
;kkA B
}ll 
}oo 
)oo 
;oo 
loggerFactoryqq 
.qq 

AddSerilogqq $
(qq$ %
)qq% &
;qq& '
}rr 	
}ss 
}tt 