//Default save data
function OnAosoraDefaultSaveData
{
	Save.Data.TalkInterval = 180;
	Save.Data.Username = "friend";
}

//Values to be set upon loading
function OnAosoraLoad
{
	TalkTimer.RandomTalk = OnStartTalk;
	TalkTimer.RandomTalkIntervalSeconds = Save.Data.TalkInterval;
	TalkBuilder.Default.AutoLineBreak = "\n\w8\w4";
	
	LastTalk = "";
}

function OnBoot()
{
	local dressups = RandomizeDressups();
	
	return "\1\s[10]\![set,alignmenttodesktop,bottom]\0{dressups}\s[0]" + BootTalk();
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
	return CloseTalk() + "\_w[2000]\-";
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