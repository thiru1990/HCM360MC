ƒ#
]D:\Solutions\Services\HCM360\MemberUpdateService\Controllers\MemberUpdateServiceController.cs
	namespace 	
MemberUpdateService
 
. 
Controllers )
{ 
[ 
Route 

(
 
$str ,
), -
]- .
[ 
ApiController 
] 
public 

class )
MemberUpdateServiceController .
:/ 0
ControllerBase1 ?
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
ILogger  
<  !)
MemberUpdateServiceController! >
>> ?
_logger@ G
;G H
private 
readonly 
IHttpClientFactory +
_httpClient, 7
;7 8
private 
readonly 
IServiceBus $
_serviceBus% 0
;0 1
public )
MemberUpdateServiceController ,
(, -
IConfiguration- ;
configuration< I
,I J
ILoggerK R
<R S)
MemberUpdateServiceControllerS p
>p q
loggerr x
,x y
IHttpClientFactory	z å

httpClient
ç ó
,
ó ò
IServiceBus
ô §

serviceBus
• Ø
)
Ø ∞
{ 	
_configuration 
= 
configuration *
;* +
_logger 
= 
logger 
; 
_httpClient 
= 

httpClient $
;$ %
_serviceBus 
= 

serviceBus $
;$ %
}   	
["" 	
	HttpPatch""	 
]"" 
public## 
IActionResult## 
UpdateMember## )
(##) *
int##* -
id##. 0
,##0 1
[##2 3
FromBody##3 ;
]##; <
JsonPatchDocument##= N
<##N O
MemberDetails##O \
>##\ ]
memberPatch##^ i
)##i j
{$$ 	
var%% 
member%% 
=%% 
	GetMember%% "
(%%" #
id%%# %
)%%% &
;%%& '
memberPatch&& 
.&& 
ApplyTo&& 
(&&  
member&&  &
)&&& '
;&&' (
_serviceBus'' 
.'' 
Publish'' 
(''  
member''  &
)''& '
;''' (
return(( 
Ok(( 
((( 
member(( 
)(( 
;(( 
})) 	
private++ 
MemberDetails++ 
	GetMember++ '
(++' (
int++( +
id++, .
)++. /
{,, 	
_logger-- 
.-- 
LogInformation-- "
(--" #
$str--# 1
)--1 2
;--2 3
try.. 
{// 
var00 
response00 
=00 
_httpClient00 *
.00* +
CreateClient00+ 7
(007 8
)008 9
.009 :
GetStringAsync00: H
(00H I
new00I L
Uri00M P
(00P Q
_configuration00Q _
[00_ `
$str00` u
]00u v
+00w x
id00y {
)00{ |
)00| }
.00} ~
Result	00~ Ñ
;
00Ñ Ö
var22 
member22 
=22 
JsonConvert22 (
.22( )
DeserializeObject22) :
<22: ;
MemberDetails22; H
>22H I
(22I J
response22J R
)22R S
;22S T
_logger44 
.44 
LogDebug44  
(44  !
$str44! >
,44> ?
JsonConvert44@ K
.44K L
SerializeObject44L [
(44[ \
member44\ b
)44b c
)44c d
;44d e
_logger55 
.55 
LogInformation55 &
(55& '
$str55' 6
)556 7
;557 8
return66 
member66 
;66 
}77 
catch88 
(88 
	Exception88 
ex88 
)88  
{99 
_logger:: 
.:: 
LogError::  
(::  !
$str::! A
,::A B
ex::C E
.::E F
ToString::F N
(::N O
)::O P
)::P Q
;::Q R
return;; 
null;; 
;;; 
}<< 
}== 	
}>> 
}?? Ç
HD:\Solutions\Services\HCM360\MemberUpdateService\Models\MemberDetails.cs
	namespace 	
MemberUpdateService
 
. 
Models $
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
} ú

;D:\Solutions\Services\HCM360\MemberUpdateService\Program.cs
	namespace

 	
MemberUpdateService
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
} ı'
;D:\Solutions\Services\HCM360\MemberUpdateService\Startup.cs
	namespace 	
MemberUpdateService
 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Log 
. 
Logger 
= 
new 
LoggerConfiguration 0
(0 1
)1 2
.2 3
ReadFrom3 ;
.; <
Configuration< I
(I J
configurationJ W
)W X
.X Y
CreateLoggerY e
(e f
)f g
;g h
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services   
.   
AddControllers   #
(  # $
)  $ %
;  % &
services## 
.## 
AddSwaggerGen## "
(##" #
)### $
;##$ %
services&& 
.&& 
AddApiVersioning&& %
(&&% &
config&&& ,
=>&&- /
{'' 
config(( 
.(( 
DefaultApiVersion(( (
=(() *
new((+ .

ApiVersion((/ 9
(((9 :
$num((: ;
,((; <
$num((= >
)((> ?
;((? @
config)) 
.)) /
#AssumeDefaultVersionWhenUnspecified)) :
=)); <
true))= A
;))A B
config** 
.** 
ReportApiVersions** (
=**) *
true**+ /
;**/ 0
}++ 
)++ 
;++ 
services-- 
.-- 
AddHttpClient-- "
(--" #
)--# $
;--$ %
services// 
.00 #
AddControllersWithViews00 (
(00( )
)00) *
.11 
AddNewtonsoftJson11 "
(11" #
)11# $
;11$ %
services33 
.33 
AddSingleton33 !
<33! "
ITopicClient33" .
>33. /
(33/ 0
IServiceProvider330 @
=>33A C
new33D G
TopicClient33H S
(33S T
Configuration33T a
.33a b
GetValue33b j
<33j k
string33k q
>33q r
(33r s
$str	33s ê
)
33ê ë
,
33ë í
Configuration
33ì †
.
33† °
GetValue
33° ©
<
33© ™
string
33™ ∞
>
33∞ ±
(
33± ≤
$str
33≤ »
)
33» …
)
33…  
)
33  À
;
33À Ã
services44 
.44 
AddSingleton44 !
<44! "
IServiceBus44" -
,44- .

ServiceBus44/ 9
.449 :
Models44: @
.44@ A

ServiceBus44A K
>44K L
(44L M
)44M N
;44N O
}55 	
public88 
void88 
	Configure88 
(88 
IApplicationBuilder88 1
app882 5
,885 6
IWebHostEnvironment887 J
env88K N
,88N O
ILoggerFactory88P ^
loggerFactory88_ l
)88l m
{99 	
if:: 
(:: 
env:: 
.:: 
IsDevelopment:: !
(::! "
)::" #
)::# $
{;; 
app<< 
.<< %
UseDeveloperExceptionPage<< -
(<<- .
)<<. /
;<</ 0
}== 
app?? 
.?? 
UseHttpsRedirection?? #
(??# $
)??$ %
;??% &
appAA 
.AA 

UseRoutingAA 
(AA 
)AA 
;AA 
appCC 
.CC 
UseAuthorizationCC  
(CC  !
)CC! "
;CC" #
appEE 
.EE 
UseEndpointsEE 
(EE 
	endpointsEE &
=>EE' )
{FF 
	endpointsGG 
.GG 
MapControllersGG (
(GG( )
)GG) *
;GG* +
}HH 
)HH 
;HH 
appJJ 
.JJ 

UseSwaggerJJ 
(JJ 
)JJ 
;JJ 
appLL 
.LL 
UseSwaggerUILL 
(LL 
cLL 
=>LL !
{MM 
cNN 
.NN 
SwaggerEndpointNN !
(NN! "
$strNN" <
,NN< =
$strNN> J
)NNJ K
;NNK L
cOO 
.OO 
RoutePrefixOO 
=OO 
stringOO  &
.OO& '
EmptyOO' ,
;OO, -
}PP 
)PP 
;PP 
loggerFactoryRR 
.RR 

AddSerilogRR $
(RR$ %
)RR% &
;RR& '
}SS 	
}TT 
}UU 