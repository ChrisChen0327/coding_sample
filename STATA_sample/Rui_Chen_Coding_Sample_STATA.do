**Final Project

***Topic: Influence of Second Child Policy on Birth Behavior of Female
***Data: Panal Data(CFPS10-16)
***Date: 15/7/2021  Author: CHEN Rui

******************************************

*** Housekeeping ***

set more off
clear all
cd "C:\Data for Stata Lab\data for stata training"
capture log close
set mem 100m
log using "C:\Data for Stata Lab\log for stata training\CFPS", replace text

*** Read in the raw data ***
use "C:\Data for Stata Lab\log for stata training\CFPS", clear

// Method1：

**Drop male sample
drop if male == 1
drop party height weight bmi bmi2 smoke num_smoke drink

** Add new variable named "incremental_children"
count if num_children == 2
gen incremental_children = D.num_children
replace incremental_children = 0 if incremental_children < 0
replace incremental_children = 0 if incremental_children == .

order pid

**Drop outlier sample (the samples are beyond the childbearing age)
drop if age < 15
drop if age > 49

** set as panel data
xtset pid year

** Add new dummy variable called "policy_supportor"
gen birth_behavior=1 if incremental_children >= 1 & num_children >=2
replace birth_behavior = 0 if incremental_children <= 1 & num_children <2
replace birth_behavior = 0 if year == 1 & incremental_children == 0
replace birth_behavior = 0 if year == 4 & incremental_children == 0 & year == 3 & birth_behavior == 1
replace birth_behavior = 0 if birth_behavior==.

** Add a new dummy variable for treatment group
gen post_policy =1 if year == 4
replace post_policy=0 if year <= 3

gen singlechild =1 if num_children == 1
replace singlechild = 0 if num_children != 1

** Descriptive Statistics
sum birth_behavior singlechild

sort singlechild
by singlechild: asdoc tabstat post_policy hk provcd age edu1 health, s(mean sd) 

sort birth_behavior
by birth_behavior: asdoc tabstat singlechild post_policy hk prov age edu1 health, statistics( count mean sd )

count if birth_behavior ==1 & post_policy == 1
count if birth_behavior ==1 & post_policy == 0

count if birth_behavior ==1 & year == 1
count if birth_behavior ==1 & year == 2
count if birth_behavior ==1 & year == 3
count if birth_behavior ==1 & year == 4

count if birth_behavior ==1 & prov == 2 
count if birth_behavior ==1 & prov == 3


asdoc sum singlechild post_policy hk provcd age edu1 health 

sysuse auto
summarize singlechild post_policy hk provcd age edu1 health 

asdoc tabstat post_policy hk provcd age edu1 health, statistics(mean sd)  by (singlechild)

tabstat post_policy hk provcd age edu1 health, s(singlechild)

sum pid

sort birth_behavior
by birth_behavior: sum post_policy


** Pooled method for DID by OLS
gen singlechild_did=singlechild*post_policy

xtreg birth_behavior singlechild singlechild_did hk age edu health prov post_policy, robust


** FE model

asdoc xtreg birth_behavior singlechild singlechild_did post_policy, robust
est store m1

asdoc xtreg birth_behavior singlechild singlechild_did hk prov post_policy, fe vce(cluster pid)
est store m2

asdoc xtreg birth_behavior singlechild singlechild_did hk prov post_policy age edu health, fe vce(cluster pid)
est store m3

search reg2docx

search ar2

reg2docx m1 m2 m3 using result.docx

describe singlechild post_policy singlechild_did hk age edu health prov 


** Simple method for DID
xtreg birth_behavior singlechild if post_policy == 0, fe vce(cluster pid)
scalar singlechild_bef=_b[singlechild]
display singlechild_bef

xtreg birth_behavior singlechild if post_policy == 1, fe vce(cluster pid)
scalar singlechild_aft=_b[singlechild]
display singlechild_aft

scalar singlechild_did=singlechild_aft-singlechild_bef
display "singlechild_did = singlechild_aft - singlechild_bef = "singlechild_did




// Method2：
** Add new dummy variable called "policy_supportor"
gen policy_supportor1=1 if birth_behavior >= 1
replace policy_supportor1 = 0 if birth_behavior < 1

** Logit or probit model
logit policy_supportor1 singlechild age hk edu health post_policy if post_policy == 0
margins, dydx(secondchild)
display 

logit policy_supportor1 singlechild age hk edu health post_policy if post_policy = 1
margins, dydx(secondchild)
display 

scalar singlechild_did=singlechild_aft-singlechild_before
display "singlechild_did = singlechild_aft - singlechild_before = "singlechild_did


gen singlechild_did=singlechild*post_policy
logit birth_behavior singlechild singlechild_did post_policy age health edu hk 

margins, dydx(singlechild_did) atmeans


sum age



//Method3: treatment group is the people having Hukou in cities
**Drop male sample
drop if male == 1

**Drop outlier sample (the samples are beyond the childbearing age)
drop if age < 15
drop if age > 49
drop if year <3

**Add a new dummy variable
gen post_policy =1 if year>=4
replace post_policy=0 if year<4

** Descriptive Statistics
sum pid year num_children singlechild post_policy age work work2 prov hk
sort post_policy
by post_policy: sum num_children

sort work
by work: sum singlechild

sort work2
by work2: sum singlechild

sort hk
by hk: sum singlechild

** Pooled method for DID
gen hk_did_pooled=hk*post_policy
reg num_children hk_did_pooled hk post_policy, robust










