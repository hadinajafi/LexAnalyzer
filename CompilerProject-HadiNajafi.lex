%{
	int counter = 0;
	int phoneNo = 0;
	int phoneCity = 0;
	int melliCode = 0;
	int url = 0;
	int date = 0;
	int binaryNo = 0;
	int regularNo = 0;
	int hexColor = 0;
	int ipNo = 0;
	int mac = 0;
	int postCode = 0;
	int htmltag = 0;
	int time = 0;
	int path = 0;
	int xyz = 0;
	int kasr = 0;
	int filenames = 0;
	int leader = 0;
	int iran = 0;
	int oil = 0;
	int compiler = 0;
	int peresident = 0;
	int allahgod = 0;
	int regularText = 0;
%}

%%
[a-zA-Z0-9]+[@]([a-zA-Z0-9]{2,}[.]{1})+([com]|[ir])+ 	{printf("%s is Email Address\n", yytext); counter++;}
09[0-9]{9}		{printf("%s is Phone Number\n", yytext); phoneNo++;}
[0-9]{3}-[0-9]{8}	{printf("%s is City Phone number\n", yytext); phoneCity++;}
[0-9]{3}-[0-9]{6}-[0-9]{1}	{printf("%s is a Melli Code\n", yytext); melliCode++;}
htt(p|ps):[/][/]([www]{0,1})([a-zA-Z0-9]{2,}[.]{1})+([com]|[ir]|[org])+		{printf("%s is URL\n", yytext); url++;}
[0-9]{2,4}[-][0-9]{1,2}[-][0-9]{1,2}		{printf("%s is Date\n", yytext); date++;}
[0-1]{2,}		{printf("%s is a Binary number\n", yytext); binaryNo++;}
[0-9]{10}		{printf("%s is Postal code\n", yytext); postCode++;}
(([a-zA-Z]+[0-9]*|[0-9]*[a-zA-Z]+)+([+]|[*]|[-]|[/])+([a-zA-Z]+[0-9]*|[0-9]*[a-zA-Z]+)+)+	{printf("%s is XYZ\n", yytext); xyz++;}
[0-12]{1,2}[:][0-59]{2}	{printf("%s is Time format\n", yytext); time++;}
[0]{1}[0-9]{1}[:][0-59]{2}	{printf("%s is Time format\n", yytext); time++;}
[1-9]{1}:[0-9]{2}	{printf("%s is Time format\n", yytext); time++;}	
[#]([0-9]|[a-f]){3,8}	{printf("%s is a Hex Color\n", yytext); hexColor++;}
[0-9]+		{printf("%s is a regular number\n", yytext); regularNo++;}
[0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3}		{printf("%s is an IP Address\n", yytext); ipNo++;}
([0-9]|[A-Z]){2}:([0-9]|[A-Z]){2}:([0-9]|[A-Z]){2}:([0-9]|[A-Z]){2}:([0-9]|[A-Z]){2}:([0-9]|[A-Z]){2}	{printf("%s is mac address\n", yytext); mac++;}
[<][a-z]+[>]	{printf("%s is HTML tag\n", yytext); htmltag++;}
[<][/][a-z]+[>]	{printf("%s is HTML tag\n", yytext); htmltag++;}
[a-zA-Z]:[/]([a-zA-Z]+[/])*		{printf("%s is System file path\n", yytext); path++;}
[0-9]+[/][1-9]+		{printf("%s is Kasr\n", yytext); kasr++;}
[0-9]+.[0-9]+[/][1-9]+.[0-9]+	{printf("%s is Kasr\n", yytext); kasr++;}
[a-zA-Z]+[.][a-zA-Z]+		{printf("%s is a File\n", yytext); filenames++;}
(l|L)(e|E)(a|A)(d|D)(e|E)(r|R)		leader++;
(i|I)(r|R)(a|A)(n|N)	iran++;
(o|O)(i|I)(l|L)		oil++;
(c|C)(o|O)(m|M)(p|P)(i|I)(l|L)(e|E)(r|R)	compiler++;
(p|P)(r|R)(e|E)(s|S)(i|I)(d|D)(e|E)(n|N)(t|T)	peresident++;
(a|A)(l|L)(l|L)(a|A)(h|H)	allahgod++;
(g|G)(o|O)(d|D)		allahgod++;
. 		regularText++;
%%

yywrap(){}
int main(){
	
	FILE *fp;
	fp = fopen("TheFile.txt", "r");
	yyin = fp;
	
	yylex();
	printf("Number of email addresses: %d\n", counter);
	printf("Number of Phone No: %d\n", phoneNo);
	printf("Number of City Phone Numbers: %d\n", phoneCity);
	printf("Number of Melli Codes: %d\n", melliCode);
	printf("Number of URLS: %d\n", url);
	printf("Number of Dates: %d\n", date);
	printf("Number of Binary numbers: %d\n", binaryNo);
	printf("Number of Regular numbers: %d\n", regularNo);
	printf("Number of Hex Colors: %d\n", hexColor);
	printf("Number of IP addresses: %d\n", ipNo);
	printf("Number of MAC addresses: %d\n", mac);
	printf("Number of Postal Codes: %d\n", postCode);
	printf("Number of HTML tags: %d\n", htmltag);
	printf("Number of Time formats: %d\n", time);
	printf("Number of File Paths: %d\n", path);
	printf("Number of XYZs: %d\n", xyz);
	printf("Number of Kasrs: %d\n", kasr);
	printf("Number of Files: %d\n", filenames);
	printf("Number of 'Leaders' in File: %d\n", leader);
	printf("Number of 'Iran' in File: %d\n", iran);
	printf("Number of 'Oil' in File: %d\n", oil);
	printf("Number of 'Compiler' in File: %d\n", compiler);
	printf("Number of 'President' in File: %d\n", peresident);
	printf("Number of 'Allah or God' in File: %d\n", allahgod);
	return 0;
}