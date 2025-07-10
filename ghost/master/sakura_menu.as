function OnMouseDoubleClick
{
	if (Shiori.Reference[5] == 0)
	{
		if (Shiori.Reference[3] == 1) return IslandBubbling();
		else return OnSakuraMenu;
	}
}

function OnSakuraMenu
{
	local output = "";
	
	//Ocean Fishies, annoyingly, doesn't have quite a big enough small size to fit the whole menu...
	if (CurrentBalloonName == "Ocean Fishies" || CurrentBalloonName == "Beach Day Gone Wrong") output += "\0\b[2]";
	else output += "\0\b[0]";
	
	//Beach day gone wrong is one I'm including as a standard balloon, and it starts typing from the bottom, so it actually needs autoscroll...
	if (CurrentBalloonName != "Beach Day Gone Wrong") output += "\![set,autoscroll,disable]";
	
	output += "\![quicksection,true]\![no-autopause]";
	
	//Talk and repeat buttons
	output += "\![*]\q[Talk,OnStartTalk]  ";
	
	if (LastTalk == "") output += "\f[color,disable]\![*]Repeat\f[color,default]";
	else output += "\![*]\q[Repeat,OnLastTalk]";
	
	output += "\n\n";
	
	output += "\![*]\q[Settings,OnSettings]";
	
	output += "\n\n";
	output += "\![*]\q[Cancel,blank]";
	
	return output;
}

function OnLastTalk
{
	return LastTalk;
}

function OnSettings
{
	output = "\1\s[10]";
	if (CurrentBalloonName == "Ocean Fishies" || CurrentBalloonName == "Beach Day Gone Wrong") output += "\0\b[2]";
	else output += "\0\b[0]";
	if (CurrentBalloonName != "Beach Day Gone Wrong") output += "\![set,autoscroll,disable]";
	output += "\s[0]\![quicksection,1]\![no-autopause]";
	
	output += "\f[align,center]{emdash} Settings {emdash}\n\f[align,left]\n";
	
	//Talkrate changer
	output += "\![*]Talk rate:\n";
	local times = TalkTimes();
	
	for (i = 0; i < times.length; i++)
	{
		local time = times[i];
		
		if (time.interval == Save.Data.TalkInterval)
		{
			output += `\f[underline,1]\_a[OnChangeTalkrate,{time.interval}]{time.label}\_a\f[underline,default]  `;
		}
		else
		{
			output += `\__q[OnChangeTalkrate,{time.interval}]{time.label}\__q  `;
		}
	}
	
	output += "\n\n";
	
	output += "\![*]Reduced motion: ";
	
	if (Save.Data.ReducedMotion)
	{
		output += "\__q[OnToggleReducedMotion,0]Off\__q  \f[underline,1]\_a[OnToggleReducedMotion,1]On\_a\f[underline,default]";
	}
	else
	{
		output += "\f[underline,1]\_a[OnToggleReducedMotion,0]Off\_a\f[underline,default]  \__q[OnToggleReducedMotion,1]On\__q";
	}
	
	output += "\n\n";
	
	if (CurrentBalloonName == "squidloon")
	{
		output += "\![*]\q[Balloon color,OnBalloonColorMenu,squidloon]";
		output += "\n\n";
	}
	
	output += "\![*]\q[Back,OnSakuraMenu]  \![*]\q[Close,OnBlank]";
	
	return output;
}

function OnBalloonColorMenu
{
	local output = "\C\![lock,balloonrepaint]\c\0\b[2]\![quicksection,1]";
	
	local Columns = [
		[ //LeftCol
			{num: "00", name: "Old Rose"},
			{num: "02", name: "Crimson"},
			{num: "04", name: "Persimmon"},
			{num: "06", name: "Mango"},
			{num: "08", name: "Mantis"},
			{num: "10", name: "Jade"},
			{num: "12", name: "Cerulean"},
			{num: "14", name: "Cosmic"},
			{num: "16", name: "Baby Blue"},
			{num: "18", name: "Thistle"},
			{num: "20", name: "Jazzberry"},
			{num: "22", name: "Wisteria"},
			{num: "24", name: "Chestnut"},
			{num: "26", name: "Vanilla"},
			{num: "28", name: "Smoke"},
		],
		[ //RightCol
			{num: "01", name: "Amaranth"},
			{num: "03", name: "Brick"},
			{num: "05", name: "Coral"},
			{num: "07", name: "Fawn"},
			{num: "09", name: "Moss"},
			{num: "11", name: "Verdegris"},
			{num: "13", name: "Iceberg"},
			{num: "15", name: "Yonder"},
			{num: "17", name: "Quartz"},
			{num: "19", name: "Lilac"},
			{num: "21", name: "Orchid"},
			{num: "23", name: "Ochre"},
			{num: "25", name: "Tumbleweed"},
			{num: "27", name: "Glass"},
			{num: "29", name: "Ink"},
		],
	];
	
	output += "\n";
	
	for (local col = 0; col < Columns.length; col++)
	{
		for (local i = 0; i < Columns[col].length; i++)
		{
			local IsSelected = 0;
			if (Columns[col][i].num == Save.Data.SquidloonColor) IsSelected = 1;
			local tag = "\q[{Columns[col][i].name},OnChangeBalloonColor,squidloon,{Columns[col][i].num}]\n";
			if (col != 0) tag += "\_l[110]";
			
			if (IsSelected) output += "\f[bold,1]\![*]{tag}\f[bold,default]";
			else output += "{tag}";
		}
		if (col == 0) output += "\_l[0,0]\n\_l[110]";
	}
	
	output += "\n\f[align,left]\n";
	
	output += "\![*]\q[Back,OnSettings]  \![*]\q[Close,OnBlank]";
	
	output += "\![unlock,balloonrepaint]";
	
	return output;
}

function OnChangeBalloonColor
{
	if (Shiori.Reference[0] == "squidloon") Save.Data.SquidloonColor = Shiori.Reference[1];
	return OnBalloonColorMenu;
}

function TalkTimes
{
	return [
		{label: "Off", interval: 0},
		{label: "1m", interval: 60},
		{label: "3m", interval: 180},
		{label: "5m", interval: 300},
		{label: "10m", interval: 600},
		{label: "15m", interval: 900},
	];
}

function OnChangeTalkrate
{
	local interval = Shiori.Reference[0];
	TalkTimer.RandomTalkIntervalSeconds = interval;
	TalkTimer.RandomTalkElapsedSeconds = 0;
	Save.Data.TalkInterval = interval;
	
	return OnSettings;
}

function OnToggleReducedMotion
{
	Save.Data.ReducedMotion = Shiori.Reference[0].ToNumber();
	return OnSettings;
}