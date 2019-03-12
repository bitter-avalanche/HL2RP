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
ranks["i5"] = "I"
ranks["m5"] = "M:I"
ranks["i4"] = "II"
ranks["m4"] = "M:II"
ranks["i3"] = "III"
ranks["m3"] = "M:III"
ranks["i2"] = "IV"
ranks["m2"] = "M:IV"
ranks["i1"] = "V"
ranks["m1"] = "M:V"
ranks["officer"] = "OfC"
ranks["divisionleader"] = "DvL" // PLEASE leave the "divisionleader" key the same. You can change "DvL" to something else


models = {}
-- Start of Division 1
models[divisions[1]] = {}
models[divisions[1]][ranks["i5"]] = "models/dpfilms/metropolice/c08cop.mdl"
models[divisions[1]][ranks["m5"]] = "models/dpfilms/metropolice/civil_medic.mdl"
models[divisions[1]][ranks["i4"]] = "models/dpfilms/metropolice/c08cop.mdl"
models[divisions[1]][ranks["m4"]] = "models/dpfilms/metropolice/civil_medic.mdl"
models[divisions[1]][ranks["i3"]] = "models/dpfilms/metropolice/c08cop.mdl"
models[divisions[1]][ranks["m3"]] = "models/dpfilms/metropolice/civil_medic.mdl"
models[divisions[1]][ranks["i2"]] = "models/dpfilms/metropolice/c08cop.mdl"
models[divisions[1]][ranks["m2"]] = "models/dpfilms/metropolice/civil_medic.mdl"
models[divisions[1]][ranks["i1"]] = "models/dpfilms/metropolice/policetrench.mdl"
models[divisions[1]][ranks["m1"]] = "models/leet_police3_medic.mdl"
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