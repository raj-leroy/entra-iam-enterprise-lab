# ===== Settings =====
$TenantDomain = "RLSecurityConsultant.onmicrosoft.com"
$TempPassword = "TempP@ss1234!"
$ForceChange  = $true

# ===== User Seed Data (30 users) =====
$users = @(
  # Executive
  @{ upn="j.thomas@$TenantDomain"; given="James";  sur="Thomas";  display="James Thomas";  title="Chief Executive Officer";      dept="Executive"; office="HQ";         city="New York";   state="NY"; zip="10001"; country="United States"; usage="US"; street="100 Executive Ave"; phone="2125550101"; mobile="9175550101" },
  @{ upn="m.rivera@$TenantDomain"; given="Maria";  sur="Rivera";  display="Maria Rivera";  title="Chief Financial Officer";      dept="Executive"; office="HQ";         city="New York";   state="NY"; zip="10001"; country="United States"; usage="US"; street="100 Executive Ave"; phone="2125550102"; mobile="9175550102" },
  @{ upn="d.wright@$TenantDomain"; given="Diana";  sur="Wright";  display="Diana Wright";  title="Chief Operating Officer";      dept="Executive"; office="HQ";         city="New York";   state="NY"; zip="10001"; country="United States"; usage="US"; street="100 Executive Ave"; phone="2125550103"; mobile="9175550103" },
  @{ upn="k.bennett@$TenantDomain";given="Kevin";  sur="Bennett"; display="Kevin Bennett"; title="Executive Assistant";          dept="Executive"; office="HQ";         city="New York";   state="NY"; zip="10001"; country="United States"; usage="US"; street="100 Executive Ave"; phone="2125550104"; mobile="9175550104" },
  @{ upn="s.hughes@$TenantDomain"; given="Sarah";  sur="Hughes";  display="Sarah Hughes";  title="VP Strategy";                  dept="Executive"; office="HQ";         city="New York";   state="NY"; zip="10001"; country="United States"; usage="US"; street="100 Executive Ave"; phone="2125550105"; mobile="9175550105" },

  # HR
  @{ upn="s.patel@$TenantDomain";   given="Shreya"; sur="Patel";  display="Shreya Patel";  title="HR Manager";                   dept="HR";        office="ATL Office"; city="Atlanta";    state="GA"; zip="30303"; country="United States"; usage="US"; street="200 Peachtree St";  phone="4045550101"; mobile="4705550101" },
  @{ upn="d.williams@$TenantDomain";given="David";  sur="Williams";display="David Williams";title="HR Generalist";               dept="HR";        office="ATL Office"; city="Atlanta";    state="GA"; zip="30303"; country="United States"; usage="US"; street="200 Peachtree St";  phone="4045550102"; mobile="4705550102" },
  @{ upn="a.green@$TenantDomain";   given="Alicia"; sur="Green";  display="Alicia Green";  title="Talent Acquisition Specialist";dept="HR";        office="ATL Office"; city="Atlanta";    state="GA"; zip="30303"; country="United States"; usage="US"; street="200 Peachtree St";  phone="4045550103"; mobile="4705550103" },
  @{ upn="j.lee@$TenantDomain";     given="Jordan"; sur="Lee";    display="Jordan Lee";    title="HR Coordinator";              dept="HR";        office="ATL Office"; city="Atlanta";    state="GA"; zip="30303"; country="United States"; usage="US"; street="200 Peachtree St";  phone="4045550104"; mobile="4705550104" },
  @{ upn="m.evans@$TenantDomain";   given="Monique";sur="Evans";  display="Monique Evans"; title="Compensation Analyst";         dept="HR";        office="ATL Office"; city="Atlanta";    state="GA"; zip="30303"; country="United States"; usage="US"; street="200 Peachtree St";  phone="4045550105"; mobile="4705550105" },

  # Finance
  @{ upn="l.martin@$TenantDomain";  given="Lisa";   sur="Martin"; display="Lisa Martin";   title="Controller";                   dept="Finance";   office="CHI Office"; city="Chicago";    state="IL"; zip="60601"; country="United States"; usage="US"; street="300 Wacker Dr";     phone="3125550101"; mobile="7735550101" },
  @{ upn="r.chen@$TenantDomain";    given="Ryan";   sur="Chen";   display="Ryan Chen";     title="Finance Analyst";              dept="Finance";   office="CHI Office"; city="Chicago";    state="IL"; zip="60601"; country="United States"; usage="US"; street="300 Wacker Dr";     phone="3125550102"; mobile="7735550102" },
  @{ upn="t.nguyen@$TenantDomain";  given="Trang";  sur="Nguyen"; display="Trang Nguyen";  title="Accounts Payable Specialist";   dept="Finance";   office="CHI Office"; city="Chicago";    state="IL"; zip="60601"; country="United States"; usage="US"; street="300 Wacker Dr";     phone="3125550103"; mobile="7735550103" },
  @{ upn="b.clark@$TenantDomain";   given="Brian";  sur="Clark";  display="Brian Clark";   title="Accounts Receivable Specialist";dept="Finance";   office="CHI Office"; city="Chicago";    state="IL"; zip="60601"; country="United States"; usage="US"; street="300 Wacker Dr";     phone="3125550104"; mobile="7735550104" },
  @{ upn="p.wilson@$TenantDomain";  given="Paula";  sur="Wilson"; display="Paula Wilson";  title="Budget Analyst";               dept="Finance";   office="CHI Office"; city="Chicago";    state="IL"; zip="60601"; country="United States"; usage="US"; street="300 Wacker Dr";     phone="3125550105"; mobile="7735550105" },

  # IT
  @{ upn="a.johnson@$TenantDomain"; given="Alex";   sur="Johnson";display="Alex Johnson";  title="IT Administrator";             dept="IT";        office="DAL Office"; city="Dallas";     state="TX"; zip="75201"; country="United States"; usage="US"; street="400 Tech Way";      phone="9725550101"; mobile="4695550101" },
  @{ upn="n.brown@$TenantDomain";   given="Nathan"; sur="Brown";  display="Nathan Brown";  title="System Engineer";              dept="IT";        office="DAL Office"; city="Dallas";     state="TX"; zip="75201"; country="United States"; usage="US"; street="400 Tech Way";      phone="9725550102"; mobile="4695550102" },
  @{ upn="e.moore@$TenantDomain";   given="Ethan";  sur="Moore";  display="Ethan Moore";   title="Helpdesk Technician";          dept="IT";        office="DAL Office"; city="Dallas";     state="TX"; zip="75201"; country="United States"; usage="US"; street="400 Tech Way";      phone="9725550103"; mobile="4695550103" },
  @{ upn="j.kim@$TenantDomain";     given="Jamie";  sur="Kim";    display="Jamie Kim";     title="Cloud Engineer";               dept="IT";        office="DAL Office"; city="Dallas";     state="TX"; zip="75201"; country="United States"; usage="US"; street="400 Tech Way";      phone="9725550104"; mobile="4695550104" },
  @{ upn="r.singh@$TenantDomain";   given="Rahul";  sur="Singh";  display="Rahul Singh";   title="Endpoint Administrator";       dept="IT";        office="DAL Office"; city="Dallas";     state="TX"; zip="75201"; country="United States"; usage="US"; street="400 Tech Way";      phone="9725550105"; mobile="4695550105" },

  # Security
  @{ upn="k.davis@$TenantDomain";   given="Karen";  sur="Davis";  display="Karen Davis";   title="Security Analyst";             dept="Security";  office="DC Office";  city="Washington"; state="DC"; zip="20001"; country="United States"; usage="US"; street="500 Constitution Ave";phone="2025550101"; mobile="2405550101" },
  @{ upn="t.harris@$TenantDomain";  given="Tyler";  sur="Harris"; display="Tyler Harris";  title="Security Engineer";            dept="Security";  office="DC Office";  city="Washington"; state="DC"; zip="20001"; country="United States"; usage="US"; street="500 Constitution Ave";phone="2025550102"; mobile="2405550102" },
  @{ upn="n.jackson@$TenantDomain"; given="Nia";    sur="Jackson";display="Nia Jackson";   title="Security Operations Analyst";   dept="Security";  office="DC Office";  city="Washington"; state="DC"; zip="20001"; country="United States"; usage="US"; street="500 Constitution Ave";phone="2025550103"; mobile="2405550103" },
  @{ upn="o.mitchell@$TenantDomain";given="Oscar";  sur="Mitchell";display="Oscar Mitchell";title="Identity Governance Analyst";  dept="Security";  office="DC Office";  city="Washington"; state="DC"; zip="20001"; country="United States"; usage="US"; street="500 Constitution Ave";phone="2025550104"; mobile="2405550104" },
  @{ upn="p.reed@$TenantDomain";    given="Paige";  sur="Reed";   display="Paige Reed";    title="Threat Intelligence Analyst";   dept="Security";  office="DC Office";  city="Washington"; state="DC"; zip="20001"; country="United States"; usage="US"; street="500 Constitution Ave";phone="2025550105"; mobile="2405550105" },

  # Sales
  @{ upn="c.lopez@$TenantDomain";   given="Carlos"; sur="Lopez";  display="Carlos Lopez";  title="Sales Manager";                dept="Sales";     office="MIA Office"; city="Miami";      state="FL"; zip="33132"; country="United States"; usage="US"; street="600 Biscayne Blvd"; phone="3055550101"; mobile="7865550101" },
  @{ upn="e.white@$TenantDomain";   given="Emily";  sur="White";  display="Emily White";   title="Account Executive";             dept="Sales";     office="MIA Office"; city="Miami";      state="FL"; zip="33132"; country="United States"; usage="US"; street="600 Biscayne Blvd"; phone="3055550102"; mobile="7865550102" },
  @{ upn="m.garcia@$TenantDomain";  given="Marco";  sur="Garcia"; display="Marco Garcia";  title="Sales Development Rep";         dept="Sales";     office="MIA Office"; city="Miami";      state="FL"; zip="33132"; country="United States"; usage="US"; street="600 Biscayne Blvd"; phone="3055550103"; mobile="7865550103" },
  @{ upn="t.adams@$TenantDomain";   given="Taylor"; sur="Adams";  display="Taylor Adams";  title="Customer Success Rep";          dept="Sales";     office="MIA Office"; city="Miami";      state="FL"; zip="33132"; country="United States"; usage="US"; street="600 Biscayne Blvd"; phone="3055550104"; mobile="7865550104" },
  @{ upn="j.turner@$TenantDomain";  given="Jess";   sur="Turner"; display="Jess Turner";   title="Sales Operations Analyst";      dept="Sales";     office="MIA Office"; city="Miami";      state="FL"; zip="33132"; country="United States"; usage="US"; street="600 Biscayne Blvd"; phone="3055550105"; mobile="7865550105" }
)

# ===== Create Users =====
$created = 0
$skipped = 0

foreach ($u in $users) {
  $upn = $u.upn

  # Skip if user already exists
  $existing = Get-MgUser -Filter "userPrincipalName eq '$upn'" -ConsistencyLevel eventual -ErrorAction SilentlyContinue
  if ($existing) {
    Write-Host "SKIP (exists): $upn"
    $skipped++
    continue
  }

  $mailNick = ($upn.Split("@")[0]).Replace(".","")

  $body = @{
    accountEnabled = $true
    displayName    = $u.display
    mailNickname   = $mailNick
    userPrincipalName = $upn
    passwordProfile = @{
      password = $TempPassword
      forceChangePasswordNextSignIn = $ForceChange
    }
    givenName   = $u.given
    surname     = $u.sur
    jobTitle    = $u.title
    department  = $u.dept
    usageLocation = $u.usage
    mobilePhone = $u.mobile
    businessPhones = @($u.phone)
    officeLocation = $u.office
    streetAddress = $u.street
    state = $u.state
    country = $u.country
    city = $u.city
    postalCode = $u.zip
  }

  New-MgUser -BodyParameter $body | Out-Null
  Write-Host "CREATED: $upn"
  $created++
}

Write-Host "Done. Created=$created Skipped=$skipped Total=$($users.Count)"

