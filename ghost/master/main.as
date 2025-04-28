//Default save data
function OnAosoraDefaultSaveData
{
	Save.Data.TalkInterval = 180;
	Save.Data.Username = "friend";
	Save.Data.SpecialClose = []; //Don't really want to save this but it's QOL for me who reloads a lot...
	Save.Data.ReducedMotion = 0;
}

//Values to be set upon loading
function OnAosoraLoad
{
	TalkTimer.RandomTalk = OnAITalk;
	TalkTimer.RandomTalkIntervalSeconds = Save.Data.TalkInterval;
	TalkBuilder.Default.AutoLineBreak = "\n\w8\w4";
	
	LastTalk = "";
}

function OnBoot()
{
	Save.Data.SpecialClose.Clear();
	
	return "\1\s[10]\![set,alignmenttodesktop,bottom]\0{RandomizeDressups()}\s[0]" + BootTalk();
}

function RandomizeDressups
{
	local dressups = "";
	
	while (dressups == "" || dressups == "\![bind,Belts,,0]\![bind,Hats,,0]\![bind,Necklaces,,0]")
	{
		dressups = "";
		
		dressups += Random.Select([
			"\![bind,Belts,Coral,1]",
			"\![bind,Belts,Seaweed,1]",
			"\![bind,Belts,Pebbles,1]",
			"\![bind,Belts,,0]"
		]);
		
		dressups += Random.Select([
			"\![bind,Hats,Coral,1]",
			"\![bind,Hats,Seaweed,1]",
			"\![bind,Hats,Pebbles,1]",
			"\![bind,Hats,,0]"
		]);
		
		dressups += Random.Select([
			"\![bind,Necklaces,Coral,1]",
			"\![bind,Necklaces,Seaweed,1]",
			"\![bind,Necklaces,Pebbles,1]",
			"\![bind,Necklaces,,0]"
		]);
	}
	return dressups;
}

function OnClose()
{
	local output = "";
	
	//If there is a special closing dialogue, use it
	local SpecialClose = Reflection.Get("CloseTalk_{Save.Data.SpecialClose[0]}");
	if (SpecialClose.IsObject())
	{
		output += SpecialClose();
	}
	else //Otherwise, default
	{
		output += CloseTalk();
	}
	
	return output + "\_w[2000]\-";
}

function OnNotifySelfInfo
{
	CurrentBalloonName = Shiori.Reference[5];
}

function OnNotifyUserInfo
{
	Save.Data.Username = Shiori.Reference[0];
}

function username
{
	return Save.Data.Username;
}

function OnBalloonChange
{
	CurrentBalloonName = Shiori.Reference[0];
}