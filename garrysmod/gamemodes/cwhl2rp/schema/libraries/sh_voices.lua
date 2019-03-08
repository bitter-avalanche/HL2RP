--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

Schema.voices = Clockwork.kernel:NewLibrary("Voices");
Schema.voices.stored = {
	normalVoices = {},
	dispatchVoices = {}
};

-- A function to add a voice.
function Schema.voices:Add(faction, command, phrase, sound, female, menu)
	self.stored.normalVoices[#self.stored.normalVoices + 1] = {
		command = command,
		faction = faction,
		phrase = phrase,
		female = female,
		sound = sound,
		menu = menu
	};
end;

-- A function to add a dispatch voice.
function Schema.voices:AddDispatch(command, phrase, sound)
	self.stored.dispatchVoices[#self.stored.dispatchVoices + 1] = {
		command = command,
		phrase = phrase,
		sound = sound
	};
end;

Schema.voices:AddDispatch("Anti-Citizen", "Attention ground units. Anti-citizen reported in this community. Code: LOCK, CAUTERIZE, STABILIZE.", "npc/overwatch/cityvoice/f_anticitizenreport_spkr.wav");
Schema.voices:AddDispatch("Anti-Civil", "Protection team alert. Evidence of anti-civil activity in this community. Code: ASSEMBLE, PLAN, CONTAIN.", "npc/overwatch/cityvoice/f_anticivilevidence_3_spkr.wav");
Schema.voices:AddDispatch("Person Interest", "Attention please. Unidentified person of interest confirm your civil status with local protection team immediately.", "npc/overwatch/cityvoice/f_confirmcivilstatus_1_spkr.wav");
Schema.voices:AddDispatch("Citizen Inaction", "Citizen reminder. Inaction is conspiracy. Report counter behaviour to a Civil Protection team immediately.", "npc/overwatch/cityvoice/f_innactionisconspiracy_spkr.wav");
Schema.voices:AddDispatch("Unrest Structure", "Alert community ground protection units, local unrest structure detected. ASSEMBLE, ADMINISTER, PACIFY.", "npc/overwatch/cityvoice/f_localunrest_spkr.wav");
Schema.voices:AddDispatch("Status Evasion", "Attention protection team. Status evasion in progress in this community. RESPOND, ISOLATE, ENQUIRE.", "npc/overwatch/cityvoice/f_protectionresponse_1_spkr.wav");
Schema.voices:AddDispatch("Lockdown", "Attention all ground protection teams. Judgment waiver now in effect. Capital prosecution is discretionary.", "npc/overwatch/cityvoice/f_protectionresponse_5_spkr.wav");
Schema.voices:AddDispatch("Rations Deducted", "Attention occupants. Your block is now charged with permissive inactive cohesion. Five ration units deducted.", "npc/overwatch/cityvoice/f_rationunitsdeduct_3_spkr.wav");
Schema.voices:AddDispatch("Inspection", "Citizen notice. Priority identification check in progress. Please assemble in your designated inspection positions.", "npc/overwatch/cityvoice/f_trainstation_assemble_spkr.wav");
Schema.voices:AddDispatch("Inspection 2", "Attention please. All citizens in local residential block, assume your inspection positions.", "npc/overwatch/cityvoice/f_trainstation_assumepositions_spkr.wav");
Schema.voices:AddDispatch("Miscount Detected", "Attention resident. Miscount detected in your block. Co-operation with your Civil Protection team permit full ration reward.", "npc/overwatch/cityvoice/f_trainstation_cooperation_spkr.wav");
Schema.voices:AddDispatch("Infection", "Attention resident. This block contains potential civil infection. INFORM, CO-OPERATE, ASSEMBLE.", "npc/overwatch/cityvoice/f_trainstation_inform_spkr.wav");
Schema.voices:AddDispatch("Relocation", "Citizen notice. Failure to co-operate will result in permanent off-world relocation.", "npc/overwatch/cityvoice/f_trainstation_offworldrelocation_spkr.wav");
Schema.voices:AddDispatch("Unrest Code", "Attention community. Unrest procedure code is now in effect. INOCULATE, SHIELD, PACIFY. Code: PRESSURE, SWORD, STERILIZE.", "npc/overwatch/cityvoice/f_unrestprocedure1_spkr.wav");
Schema.voices:AddDispatch("Evasion", "Attention please. Evasion behaviour consistent with mal-compliant defendant. Ground protection team, alert. Code: ISOLATE, EXPOSE, ADMINISTER.", "npc/overwatch/cityvoice/f_evasionbehavior_2_spkr.wav");
Schema.voices:AddDispatch("Individual", "Individual. You are charged with social endangerment, level one. Protection unit, prosecution code: DUTY, SWORD, MIDNIGHT.", "npc/overwatch/cityvoice/f_sociolevel1_4_spkr.wav");
Schema.voices:AddDispatch("Autonomous", "Attention all ground protection teams. Autonomous judgement is now in effect, sentencing is now discretionary. Code: AMPUTATE, ZERO, CONFIRM.", "npc/overwatch/cityvoice/f_protectionresponse_4_spkr.wav");
Schema.voices:AddDispatch("Citizenship", "Individual. You are convicted of multi anti-civil violations. Implicit citizenship revoked. Status: MALIGNANT.", "npc/overwatch/cityvoice/f_citizenshiprevoked_6_spkr.wav");
Schema.voices:AddDispatch("Malcompliance", "Individual. You are charged with capital malcompliance, anti-citizen status approved.", "npc/overwatch/cityvoice/f_capitalmalcompliance_spkr.wav");
Schema.voices:AddDispatch("Exogen", "Overwatch acknowledges critical exogen breach, AirWatch augmentation force dispatched and inbound. Hold for reinforcements.", "npc/overwatch/cityvoice/fprison_airwatchdispatched.wav");
Schema.voices:AddDispatch("Failure", "Attention ground units. Mission failure will result in permanent off-world assignment. Code reminder: SACRIFICE, COAGULATE, PLAN.", "npc/overwatch/cityvoice/fprison_missionfailurereminder.wav");

Schema.voices:Add("Combine", "Sweeping", "Sweeping for suspect.", "npc/metropolice/hiding02.wav");
Schema.voices:Add("Combine", "Isolate", "Isolate!", "npc/metropolice/hiding05.wav");
Schema.voices:Add("Combine", "You Can Go", "Alright, you can go.", "npc/metropolice/vo/allrightyoucango.wav");
Schema.voices:Add("Combine", "Need Assistance", "Eleven-ninety-nine, officer needs assistance!", "npc/metropolice/vo/11-99officerneedsassistance.wav");
Schema.voices:Add("Combine", "Administer", "Administer.", "npc/metropolice/vo/administer.wav");
Schema.voices:Add("Combine", "Affirmative", "Affirmative.", "npc/metropolice/vo/affirmative.wav");
Schema.voices:Add("Combine", "All Units Move In", "All units move in!", "npc/metropolice/vo/allunitsmovein.wav");
Schema.voices:Add("Combine", "Amputate", "Amputate.", "npc/metropolice/vo/amputate.wav");
Schema.voices:Add("Combine", "Anti-Citizen", "Anti-citizen.", "npc/metropolice/vo/anticitizen.wav");
Schema.voices:Add("Combine", "Citizen", "Citizen.", "npc/metropolice/vo/citizen.wav");
Schema.voices:Add("Combine", "Copy", "Copy.", "npc/metropolice/vo/copy.wav");
Schema.voices:Add("Combine", "Cover Me", "Cover me, I'm going in!", "npc/metropolice/vo/covermegoingin.wav");
Schema.voices:Add("Combine", "Assist Trespass", "Assist for a criminal trespass!", "npc/metropolice/vo/criminaltrespass63.wav");
Schema.voices:Add("Combine", "Destroy Cover", "Destroy that cover!", "npc/metropolice/vo/destroythatcover.wav");
Schema.voices:Add("Combine", "Don't Move", "Don't move!", "npc/metropolice/vo/dontmove.wav");
Schema.voices:Add("Combine", "Final Verdict", "Final verdict administered.", "npc/metropolice/vo/finalverdictadministered.wav");
Schema.voices:Add("Combine", "Final Warning", "Final warning!", "npc/metropolice/vo/finalwarning.wav");
Schema.voices:Add("Combine", "First Warning", "First warning, move away!", "npc/metropolice/vo/firstwarningmove.wav");
Schema.voices:Add("Combine", "Get Down", "Get down!", "npc/metropolice/vo/getdown.wav");
Schema.voices:Add("Combine", "Get Out", "Get out of here!", "npc/metropolice/vo/getoutofhere.wav");
Schema.voices:Add("Combine", "Suspect One", "I got suspect one here.", "npc/metropolice/vo/gotsuspect1here.wav");
Schema.voices:Add("Combine", "Help", "Help!", "npc/metropolice/vo/help.wav");
Schema.voices:Add("Combine", "Running", "He's running!", "npc/metropolice/vo/hesrunning.wav");
Schema.voices:Add("Combine", "Hold It", "Hold it right there!", "npc/metropolice/vo/holditrightthere.wav");
Schema.voices:Add("Combine", "Move Along Repeat", "I said move along.", "npc/metropolice/vo/isaidmovealong.wav");
Schema.voices:Add("Combine", "Malcompliance", "Issuing malcompliance citation.", "npc/metropolice/vo/issuingmalcompliantcitation.wav");
Schema.voices:Add("Combine", "Keep Moving", "Keep moving!", "npc/metropolice/vo/keepmoving.wav");
Schema.voices:Add("Combine", "Lock Position", "All units, lock your position!", "npc/metropolice/vo/lockyourposition.wav");
Schema.voices:Add("Combine", "Trouble", "Lookin' for trouble?", "npc/metropolice/vo/lookingfortrouble.wav");
Schema.voices:Add("Combine", "Look Out", "Look out!", "npc/metropolice/vo/lookout.wav");
Schema.voices:Add("Combine", "Minor Hits", "Minor hits, continuing prosecution.", "npc/metropolice/vo/minorhitscontinuing.wav");
Schema.voices:Add("Combine", "Move", "Move!", "npc/metropolice/vo/move.wav");
Schema.voices:Add("Combine", "Move Along", "Move along!", "npc/metropolice/vo/movealong3.wav");
Schema.voices:Add("Combine", "Move Back", "Move back, right now!", "npc/metropolice/vo/movebackrightnow.wav");
Schema.voices:Add("Combine", "Move It", "Move it!", "npc/metropolice/vo/moveit2.wav");
Schema.voices:Add("Combine", "Hardpoint", "Moving to hardpoint.", "npc/metropolice/vo/movingtohardpoint.wav");
Schema.voices:Add("Combine", "Officer Help", "Officer needs help!", "npc/metropolice/vo/officerneedshelp.wav");
Schema.voices:Add("Combine", "Privacy", "Possible level three civil privacy violator here!", "npc/metropolice/vo/possiblelevel3civilprivacyviolator.wav");
Schema.voices:Add("Combine", "Judgement", "Suspect prepare to receive civil judgement!", "npc/metropolice/vo/prepareforjudgement.wav");
Schema.voices:Add("Combine", "Priority Two", "I have a priority two anti-citizen here!", "npc/metropolice/vo/priority2anticitizenhere.wav");
Schema.voices:Add("Combine", "Prosecute", "Prosecute!", "npc/metropolice/vo/prosecute.wav");
Schema.voices:Add("Combine", "Amputate Ready", "Ready to amputate!", "npc/metropolice/vo/readytoamputate.wav");
Schema.voices:Add("Combine", "Rodger That", "Rodger that!", "npc/metropolice/vo/rodgerthat.wav");
Schema.voices:Add("Combine", "Search", "Search!", "npc/metropolice/vo/search.wav");
Schema.voices:Add("Combine", "Shit", "Shit!", "npc/metropolice/vo/shit.wav");
Schema.voices:Add("Combine", "Sentence Delivered", "Sentence delivered.", "npc/metropolice/vo/sentencedelivered.wav");
Schema.voices:Add("Combine", "Sterilize", "Sterilize!", "npc/metropolice/vo/sterilize.wav");
Schema.voices:Add("Combine", "Take Cover", "Take cover!", "npc/metropolice/vo/takecover.wav");
Schema.voices:Add("Combine", "Restrict", "Restrict!", "npc/metropolice/vo/restrict.wav");
Schema.voices:Add("Combine", "Restricted", "Restricted block.", "npc/metropolice/vo/restrictedblock.wav");
Schema.voices:Add("Combine", "Second Warning", "This is your second warning!", "npc/metropolice/vo/thisisyoursecondwarning.wav");
Schema.voices:Add("Combine", "Verdict", "You want a non-compliance verdict?", "npc/metropolice/vo/youwantamalcomplianceverdict.wav");
Schema.voices:Add("Combine", "Backup", "Backup!", "npc/metropolice/vo/backup.wav");
Schema.voices:Add("Combine", "Apply", "Apply.", "npc/metropolice/vo/apply.wav");
Schema.voices:Add("Combine", "Restriction", "Terminal restriction zone.", "npc/metropolice/vo/terminalrestrictionzone.wav");
Schema.voices:Add("Combine", "Complete", "Protection complete.", "npc/metropolice/vo/protectioncomplete.wav");
Schema.voices:Add("Combine", "Location Unknown", "Suspect location unknown.", "npc/metropolice/vo/suspectlocationunknown.wav");
Schema.voices:Add("Combine", "Can 1", "Pick up that can.", "npc/metropolice/vo/pickupthecan1.wav");
Schema.voices:Add("Combine", "Can 2", "Pick... up... the can.", "npc/metropolice/vo/pickupthecan2.wav");
Schema.voices:Add("Combine", "Wrap It", "That's it, wrap it up.", "npc/combine_soldier/vo/thatsitwrapitup.wav");
Schema.voices:Add("Combine", "Can 3", "I said pickup the can!", "npc/metropolice/vo/pickupthecan3.wav");
Schema.voices:Add("Combine", "Can 4", "Now, put it in the trash can.", "npc/metropolice/vo/putitinthetrash1.wav");
Schema.voices:Add("Combine", "Can 5", "I said put it in the trash can!", "npc/metropolice/vo/putitinthetrash2.wav");
Schema.voices:Add("Combine", "Now Get Out", "Now get out of here!", "npc/metropolice/vo/nowgetoutofhere.wav");
Schema.voices:Add("Combine", "Haha", "Haha.", "npc/metropolice/vo/chuckle.wav");
Schema.voices:Add("Combine", "X-Ray", "X-Ray!", "npc/metropolice/vo/xray.wav");
Schema.voices:Add("Combine", "Patrol", "Patrol!", "npc/metropolice/vo/patrol.wav");
Schema.voices:Add("Combine", "Serve", "Serve.", "npc/metropolice/vo/serve.wav");
Schema.voices:Add("Combine", "Knocked Over", "You knocked it over, pick it up!", "npc/metropolice/vo/youknockeditover.wav");
Schema.voices:Add("Combine", "Watch It", "Watch it!", "npc/metropolice/vo/watchit.wav");
Schema.voices:Add("Combine", "Restricted Canals", "Suspect is using restricted canals at...", "npc/metropolice/vo/suspectusingrestrictedcanals.wav");
Schema.voices:Add("Combine", "505", "Subject is five-oh-five!", "npc/metropolice/vo/subjectis505.wav");
Schema.voices:Add("Combine", "404", "Possible four-zero-oh here!", "npc/metropolice/vo/possible404here.wav");
Schema.voices:Add("Combine", "Vacate", "Vacate citizen!", "npc/metropolice/vo/vacatecitizen.wav");
Schema.voices:Add("Combine", "Escapee", "Priority two escapee.", "npc/combine_soldier/vo/prioritytwoescapee.wav");
Schema.voices:Add("Combine", "Objective", "Priority one objective.", "npc/combine_soldier/vo/priority1objective.wav");
Schema.voices:Add("Combine", "Payback", "Payback.", "npc/combine_soldier/vo/payback.wav");
Schema.voices:Add("Combine", "Got Him Now", "Affirmative, we got him now.", "npc/combine_soldier/vo/affirmativewegothimnow.wav");
Schema.voices:Add("Combine", "Antiseptic", "Antiseptic.", "npc/combine_soldier/vo/antiseptic.wav");
Schema.voices:Add("Combine", "Cleaned", "Cleaned.", "npc/combine_soldier/vo/cleaned.wav");
Schema.voices:Add("Combine", "Engaged Cleanup", "Engaged in cleanup.", "npc/combine_soldier/vo/engagedincleanup.wav");
Schema.voices:Add("Combine", "Engaging", "Engaging.", "npc/combine_soldier/vo/engaging.wav");
Schema.voices:Add("Combine", "Full Response", "Executing full response.", "npc/combine_soldier/vo/executingfullresponse.wav");
Schema.voices:Add("Combine", "Heavy Resistance", "Overwatch advise, we have heavy resistance.", "npc/combine_soldier/vo/heavyresistance.wav");
Schema.voices:Add("Combine", "Inbound", "Inbound.", "npc/combine_soldier/vo/inbound.wav");
Schema.voices:Add("Combine", "Lost Contact", "Lost contact!", "npc/combine_soldier/vo/lostcontact.wav");
Schema.voices:Add("Combine", "Move In", "Move in!", "npc/combine_soldier/vo/movein.wav");
Schema.voices:Add("Combine", "Harden Position", "Harden that position!", "npc/combine_soldier/vo/hardenthatposition.wav");
Schema.voices:Add("Combine", "Go Sharp", "Go sharp, go sharp!", "npc/combine_soldier/vo/gosharpgosharp.wav");
Schema.voices:Add("Combine", "Delivered", "Delivered.", "npc/combine_soldier/vo/delivered.wav");
Schema.voices:Add("Combine", "Necrotics Inbound", "Necrotics, inbound!", "npc/combine_soldier/vo/necroticsinbound.wav");
Schema.voices:Add("Combine", "Necrotics", "Necrotics.", "npc/combine_soldier/vo/necrotics.wav");
Schema.voices:Add("Combine", "Outbreak", "Outbreak!", "npc/combine_soldier/vo/outbreak.wav");
Schema.voices:Add("Combine", "Copy That", "Copy that.", "npc/combine_soldier/vo/copythat.wav");
Schema.voices:Add("Combine", "Outbreak Status", "Outbreak status is code.", "npc/combine_soldier/vo/outbreakstatusiscode.wav");
Schema.voices:Add("Combine", "Overwatch", "Overwatch!", "npc/combine_soldier/vo/overwatch.wav");
Schema.voices:Add("Combine", "Preserve", "Preserve!", "npc/metropolice/vo/preserve.wav");
Schema.voices:Add("Combine", "Pressure", "Pressure!", "npc/metropolice/vo/pressure.wav");
Schema.voices:Add("Combine", "Phantom", "Phantom!", "npc/combine_soldier/vo/phantom.wav");
Schema.voices:Add("Combine", "Stinger", "Stinger!", "npc/combine_soldier/vo/stinger.wav");
Schema.voices:Add("Combine", "Shadow", "Shadow!", "npc/combine_soldier/vo/shadow.wav");
Schema.voices:Add("Combine", "Savage", "Savage!", "npc/combine_soldier/vo/savage.wav");
Schema.voices:Add("Combine", "Reaper", "Reaper!", "npc/combine_soldier/vo/reaper.wav");
Schema.voices:Add("Combine", "Victor", "Victor!", "npc/metropolice/vo/victor.wav");
Schema.voices:Add("Combine", "Sector", "Sector!", "npc/metropolice/vo/sector.wav");
Schema.voices:Add("Combine", "Inject", "Inject!", "npc/metropolice/vo/inject.wav");
Schema.voices:Add("Combine", "Dagger", "Dagger!", "npc/combine_soldier/vo/dagger.wav");
Schema.voices:Add("Combine", "Blade", "Blade!", "npc/combine_soldier/vo/blade.wav");
Schema.voices:Add("Combine", "Razor", "Razor!", "npc/combine_soldier/vo/razor.wav");
Schema.voices:Add("Combine", "Nomad", "Nomad!", "npc/combine_soldier/vo/nomad.wav");
Schema.voices:Add("Combine", "Judge", "Judge!", "npc/combine_soldier/vo/judge.wav");
Schema.voices:Add("Combine", "Ghost", "Ghost!", "npc/combine_soldier/vo/ghost.wav");
Schema.voices:Add("Combine", "Sword", "Sword!", "npc/combine_soldier/vo/sword.wav");
Schema.voices:Add("Combine", "Union", "Union!", "npc/metropolice/vo/union.wav");
Schema.voices:Add("Combine", "Helix", "Helix!", "npc/combine_soldier/vo/helix.wav");
Schema.voices:Add("Combine", "Storm", "Storm!", "npc/combine_soldier/vo/storm.wav");
Schema.voices:Add("Combine", "Spear", "Spear!", "npc/combine_soldier/vo/spear.wav");
Schema.voices:Add("Combine", "Vamp", "Vamp!", "npc/combine_soldier/vo/vamp.wav");
Schema.voices:Add("Combine", "Nova", "Nova!", "npc/combine_soldier/vo/nova.wav");
Schema.voices:Add("Combine", "Mace", "Mace!", "npc/combine_soldier/vo/mace.wav");
Schema.voices:Add("Combine", "Grid", "Grid!", "npc/combine_soldier/vo/grid.wav");
Schema.voices:Add("Combine", "Kilo", "Kilo!", "npc/combine_soldier/vo/kilo.wav");
Schema.voices:Add("Combine", "Echo", "Echo!", "npc/combine_soldier/vo/echo.wav");
Schema.voices:Add("Combine", "Dash", "Dash!", "npc/combine_soldier/vo/dash.wav");
Schema.voices:Add("Combine", "Apex", "Apex!", "npc/combine_soldier/vo/apex.wav");
Schema.voices:Add("Combine", "Jury", "Jury!", "npc/metropolice/vo/jury.wav");
Schema.voices:Add("Combine", "King", "King!", "npc/metropolice/vo/king.wav");
Schema.voices:Add("Combine", "Lock", "Lock!", "npc/metropolice/vo/lock.wav");
Schema.voices:Add("Combine", "Vice", "Vice!", "npc/metropolice/vo/vice.wav");
Schema.voices:Add("Combine", "Zero", "Zero!", "npc/metropolice/vo/zero.wav");
Schema.voices:Add("Combine", "Zone", "Zone!", "npc/metropolice/vo/zone.wav");

if (CLIENT) then
	table.sort(Schema.voices.stored.normalVoices, function(a, b) return a.command < b.command; end);
	table.sort(Schema.voices.stored.dispatchVoices, function(a, b) return a.command < b.command; end);

	for k, v in pairs(Schema.voices.stored.dispatchVoices) do
		Clockwork.directory:AddCode("HelpCombineDispatcher", [[
			<div class="cwTitleSeperator">
				]]..string.upper(v.command)..[[
			</div>
			<div class="cwContentText">
				<lang>]]..v.phrase..[[</lang>
			</div>
		]], true);
	end;

	for k, v in pairs(Schema.voices.stored.normalVoices) do
		Clockwork.directory:AddCode("HelpCivilProtection", [[
			<div class="cwTitleSeperator">
				]]..string.upper(v.command)..[[
			</div>
			<div class="cwContentText">
				<lang>]]..v.phrase..[[</lang>
			</div>
		]], true);
	end;
end;