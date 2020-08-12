©
7D:\Solutions\Services\HCM360\Authorization\Authorize.cs
	namespace 	
Authorization
 
{ 
public		 

class		 
	Authorize		 
:		 
AuthorizeAttribute		 /
,		/ 0 
IAuthorizationFilter		1 E
{

 
private 
readonly 
IConfiguration '
_config( /
;/ 0
public 
	Authorize 
( 
IConfiguration '
config( .
). /
{ 	
_config 
= 
config 
; 
} 	
public 
void 
OnAuthorization #
(# $&
AuthorizationFilterContext$ >
context? F
)F G
{ 	
if 
( 
! 
context 
. 
HttpContext $
.$ %
Request% ,
., -
Headers- 4
.4 5
TryGetValue5 @
(@ A
$strA C
,C D
outE H
varI L
AuthorizationKeyM ]
)] ^
)^ _
{ 
throw 
new '
UnauthorizedAccessException 5
(5 6
)6 7
;7 8
} 
var 
authorizationKey  
=! "
_config# *
[* +
$str+ =
]= >
;> ?
if 
( 
! 
AuthorizationKey  
.  !
Equals! '
(' (
authorizationKey( 8
)8 9
)9 :
{ 
throw 
new '
UnauthorizedAccessException 5
(5 6
)6 7
;7 8
} 
} 	
}   
}!! 