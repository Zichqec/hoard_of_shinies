function OnMouseDoubleClick
{
	if (Shiori.Reference[5] == 0)
	{
		if (Shiori.Reference[3] == 1)
		{
			return IslandBubbling();
		}
		else
		{
			return OnSakuraMenu;
		}
		
	}
}

function OnSakuraMenu
{
	local output = "";
	
	//Ocean Fishies, annoyingly, doesn't have quite a big enough small size to fit the whole menu...
	if (CurrentBalloonName == "Ocean Fishies") { output += "\0\b[2]"; }
	else { output += "\0\b[0]"; }
	
	//Beach day gone wrong is one I'm including as a standard balloon, and it starts typing from the bottom, so it actually needs autoscroll...
	if (CurrentBalloonName != "Beach Day Gone Wrong") { output += "\![set,autoscroll,disable]"; }
	
	output += "\![quicksection,true]\![no-autopause]";
	
	//Talk and repeat buttons
	output += "\![*]\q[Talk,OnStartTalk]  ";
	
	if (LastTalk == "") { output += "\f[color,disable]\![*]Repeat\f[color,default]"; }
	else { output += "\![*]\q[Repeat,OnLastTalk]"; }
	
	output += "\n\n";
	
	if (CurrentBalloonName == "squidloon")
	{
		output += "\![*]\q[Balloon color,OnBalloonColorMenu,squidloon]";
		output += "\n\n";
	}
	
	//Talkrate changer
	output += "\![*]Talkrate:\n";
	local times = TalkTimes();
	
	for (i = 0; i < times.length; i++)
	{
		local time = times[i];
		
		if (time.interval == Save.Data.TalkInterval)
		{
			output += `\_a[OnChangeTalkrate,{time.interval}]{time.label}\_a  `;
		}
		else
		{
			output += `\__q[OnChangeTalkrate,{time.interval}]{time.label}\__q  `;
		}
	}
	output += "\n\n";
	output += "\![*]\q[Cancel,blank]";
	
	return output;
}

function OnLastTalk
{
	return LastTalk;
}

function OnBalloonColorMenu
{
	local output = "\0\b[2]";
	
	local LeftCol = [
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
		{num: "28", name: "Smoke"}
	];
	
	local RightCol = [
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
		{num: "29", name: "Ink"}
	];
	
	output += "\n";
	for (local i = 0; i < LeftCol.length; i++)
	{
		local IsSelected = 0;
		if (LeftCol[i].num == Save.Data.SquidloonColor) {IsSelected = 1;}
		
		if (IsSelected) {output += "\f[bold,1]\![*]";}
		output += "\q[{LeftCol[i].name},OnChangeBalloonColor,squidloon,{LeftCol[i].num}]\n";
		if (IsSelected) {output += "\f[bold,default]";}
	}
	output += "\_l[0,0]\n\_l[110]";
	for (local i = 0; i < RightCol.length; i++)
	{
		local IsSelected = 0;
		if (RightCol[i].num == Save.Data.SquidloonColor) {IsSelected = 1;}
		
		if (IsSelected) {output += "\f[bold,1]\![*]";}
		output += "\q[{RightCol[i].name},OnChangeBalloonColor,squidloon,{RightCol[i].num}]\n\_l[110]";
		if (IsSelected) {output += "\f[bold,default]";}
	}
	
	return output;
}

function OnChangeBalloonColor
{
	if (Shiori.Reference[0] == "squidloon") { Save.Data.SquidloonColor = Shiori.Reference[1]; }
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
		{label: "15m", interval: 900}
	];
}

function OnChangeTalkrate
{
	local interval = Shiori.Reference[0];
	TalkTimer.RandomTalkIntervalSeconds = interval;
	TalkTimer.RandomTalkElapsedSeconds = 0;
	Save.Data.TalkInterval = interval;
	
	return OnSakuraMenu;
}