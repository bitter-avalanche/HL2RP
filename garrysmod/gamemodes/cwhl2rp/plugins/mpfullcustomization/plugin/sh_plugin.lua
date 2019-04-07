/*--------------------------------------------------------------------------\
| THIS ENTIRE PLUGIN IS CREATED BY VIOMI                                    |
| PLEASE DO NOT COPY OR SELL ANY CODE IN HERE WITHOUT PERMISSION FROM VIOMI |
| Contact: viomi@openmailbox.org                                            |
\--------------------------------------------------------------------------*/

-- CONFIGURATION

-- Do you wish to hide what MPF / OTA units are online to civilians?
mpfhide = true

-- Set the abbreviation for which city you're in
cityname = "C8"

-- Set the MPF's and OTA's names here, along with their prefixes!
mpfname = "Metroplex Protection Force"
mpfprefix = "MPF"

otaname = "Metroplex Transhuman Authority"
otaprefix = "MTA"

-- Set divisions. You can add and subtract divisions as you need
divisions = {}
	divisions[1] = "UNION"
	divisions[2] = "SHIELD"
	divisions[3] = "JUDGE"

-- Set ranks. You can add and subtract ranks as you need
ranks = {}
ranks["i5"] = "i5"
ranks["m5"] = "i5:M"
ranks["e5"] = "i5:E"
ranks["i4"] = "i4"
ranks["m4"] = "i4:M"
ranks["e4"] = "i4:E"
ranks["i3"] = "i3"
ranks["m3"] = "i3:M"
ranks["e3"] = "i3:E"
ranks["i2"] = "i2"
ranks["m2"] = "i2:M"
ranks["e2"] = "i2:E"
ranks["i1"] = "i1"
ranks["m1"] = "i1:M"
ranks["e1"] = "i1:E"
ranks["officer"] = "OfC"
ranks["divisionleader"] = "DvL" // PLEASE leave the "divisionleader" key the same. You can change "DvL" to something else


models = {}
-- Start of Division 1
models[divisions[1]] = {}
models[divisions[1]][ranks["i5"]] = "models/dpfilms/metropolice/c08cop.mdl"
models[divisions[1]][ranks["m5"]] = "models/dpfilms/metropolice/civil_medic.mdl"
models[divisions[1]][ranks["e5"]] = "models/dpfilms/metropolice/police_bt.mdl"
models[divisions[1]][ranks["i4"]] = "models/dpfilms/metropolice/c08cop.mdl"
models[divisions[1]][ranks["m4"]] = "models/dpfilms/metropolice/civil_medic.mdl"
models[divisions[1]][ranks["e4"]] = "models/dpfilms/metropolice/police_bt.mdl"
models[divisions[1]][ranks["i3"]] = "models/dpfilms/metropolice/c08cop.mdl"
models[divisions[1]][ranks["m3"]] = "models/dpfilms/metropolice/civil_medic.mdl"
models[divisions[1]][ranks["e3"]] = "models/dpfilms/metropolice/police_bt.mdl"
models[divisions[1]][ranks["i2"]] = "models/dpfilms/metropolice/c08cop.mdl"
models[divisions[1]][ranks["m2"]] = "models/dpfilms/metropolice/civil_medic.mdl"
models[divisions[1]][ranks["e2"]] = "models/dpfilms/metropolice/police_bt.mdl"
models[divisions[1]][ranks["i1"]] = "models/dpfilms/metropolice/policetrench.mdl"
models[divisions[1]][ranks["m1"]] = "models/leet_police3_medic.mdl"
models[divisions[1]][ranks["e1"]] = "models/dpfilms/metropolice/elite_police.mdl"
models[divisions[1]][ranks["officer"]] = "models/leet_police3.mdl"
models[divisions[1]][ranks["divisionleader"]] = "models/dpfilms/metropolice/phoenix_police.mdl"

-- Start of Division 2
models[divisions[2]] = {}
models[divisions[2]][ranks["i5"]] = "models/dpfilms/metropolice/urban_police.mdl"
models[divisions[2]][ranks["m5"]] = "models/dpfilms/metropolice/civil_medic.mdl"
models[divisions[2]][ranks["i4"]] = "models/dpfilms/metropolice/urban_police.mdl"
models[divisions[2]][ranks["m4"]] = "models/dpfilms/metropolice/civil_medic.mdl"
models[divisions[2]][ranks["i3"]] = "models/dpfilms/metropolice/urban_police.mdl"
models[divisions[2]][ranks["m3"]] = "models/dpfilms/metropolice/civil_medic.mdl"
models[divisions[2]][ranks["i2"]] = "models/dpfilms/metropolice/urban_police.mdl"
models[divisions[2]][ranks["m2"]] = "models/dpfilms/metropolice/civil_medic.mdl"
models[divisions[2]][ranks["i1"]] = "models/dpfilms/metropolice/policetrench.mdl"
models[divisions[2]][ranks["m1"]] = "models/leet_police4_medic.mdl"
models[divisions[2]][ranks["officer"]] = "models/leet_police4.mdl"
models[divisions[2]][ranks["divisionleader"]] = "models/metrold_nobp.mdl"

-- Start of Division 3
models[divisions[3]] = {}
models[divisions[3]][ranks["i5"]] = "models/dpfilms/metropolice/arctic_police.mdl"
models[divisions[3]][ranks["i4"]] = "models/dpfilms/metropolice/arctic_police.mdl"
models[divisions[3]][ranks["i3"]] = "models/dpfilms/metropolice/arctic_police.mdl"
models[divisions[3]][ranks["i2"]] = "models/dpfilms/metropolice/arctic_police.mdl"
models[divisions[3]][ranks["i1"]] = "models/dpfilms/metropolice/arctic_police.mdl"
models[divisions[3]][ranks["officer"]] = "models/leet_police5.mdl"
models[divisions[3]][ranks["divisionleader"]] = "models/dpfilms/metropolice/blacop.mdl"

// Feel free to add more divisions!

-- End of Divisions

-- Non-division ranks
// Non-division ranks can be added, but /please/ don't remove any, especially not commander, sectorial, synth, scanner, eow, and ows.
// If you really want to remove one of those ranks, contact me. There are other parts of this plugin which can and will BREAK if you delete any of the below ranks.
// If you wish to edit any, please edit the SECOND value, and not the key.
// This would be okay: nranks["eow"] = "EPIC"
// This would NOT be okay: nranks["eowwww"] = "EOW"
nranks = {}
nranks["recruit"] = "INT"
nranks["eow"] = "EOW"
nranks["ows"] = "OWS"
nranks["echo"] = "ECHO"
nranks["commander"] = "CmD"
nranks["sectorial"] = "SeC"
nranks["scanner"] = "SCN"
nranks["synth"] = "SYNTH"
nranks["cremator"] = "CRM"
nranks["assassin"] = "ASN"
nranks["AI"] = "DISPATCH"

nmodels = {}
nmodels["recruit"] = "models/dpfilms/metropolice/hl2beta_police.mdl"
nmodels["eow"] = "models/combine_super_soldier.mdl"
nmodels["ows"] = "models/combine_super_soldier.mdl"
nmodels["commander"] = "models/dpfilms/metropolice/arctic_police.mdl"
nmodels["sectorial"] = "models/dpfilms/metropolice/rtb_police.mdl"
nmodels["scanner"] = "models/combine_scanner.mdl"
nmodels["synth"] = "models/shield_scanner.mdl"
nmodels["cremator"] = "models/cremator.mdl"
nmodels["assassin"] = "models/fassassin.mdl"
nmodels["AI"] = "models/dpfilms/metropolice/female_police.mdl"

// END CONFIGURATION


-- DON'T TOUCH BELOW THIS LINE --
Clockwork.kernel:IncludePrefixed("sv_hooks.lua")
Clockwork.kernel:IncludePrefixed("sh_schema.lua")
Clockwork.kernel:IncludePrefixed("cl_hooks.lua")