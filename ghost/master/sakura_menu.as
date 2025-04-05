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
	
	//Talkrate changer
	output += "\![*]Talkrate:\n";
	local times = TalkTimes();
	
	for (i = 0; i < times.length; i++)
	{
		local time = times[i];
		
		if (time["interval"] == Save.Data.TalkInterval)
		{
			output += `\_a[OnChangeTalkrate,{time["interval"]}]{time["label"]}\_a  `;
		}
		else
		{
			output += `\__q[OnChangeTalkrate,{time["interval"]}]{time["label"]}\__q  `;
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