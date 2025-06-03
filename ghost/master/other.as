function OnTranslate
{
	local talkstr = Shiori.Reference[0];
	
	talkstr = AutoPause(talkstr);
	
	//What I really want is a new option for TalkBuilder that lets you set specific tags at the start of a talk block... so you can pick balloons, fonts, balloon speeds, etc. Maybe even something to be appended at the end...? hm
	if (CurrentBalloonName == "squidloon")
	{
		talkstr = talkstr.Replace("\b[0]","\b[{Save.Data.SquidloonColor}0]");
		talkstr = talkstr.Replace("\b[2]","\b[{Save.Data.SquidloonColor}2]");
	}
	
	return talkstr;
}

function AutoPause(talkstr)
{
	if (talkstr.IndexOf("\![no-autopause]").IsNull() && talkstr.IndexOf("■Aosora reload completed").IsNull())
	{
		talkstr = talkstr.Replace("\x\n[-200]\n\w8\w4\n\w8\w4","\x"); //bandaid patch for firstboot, I'll try to come up with something better later...
		talkstr = talkstr.Replace(", ",",\w4 ");
		talkstr = talkstr.Replace(". ",".\w8\w8 ");
		talkstr = talkstr.Replace("~ ","~\w8\w8 ");
		talkstr = talkstr.Replace("? ","?\w8\w8 ");
		talkstr = talkstr.Replace("! ","!\w8\w8 ");
		talkstr = talkstr.Replace("; ",";\w8 ");
		talkstr = talkstr.Replace(": ",":\w8 ");
		talkstr = talkstr.Replace("\n\n ","\n\n\w8\w8");
	}
	return talkstr;
}

function OnStartTalk
{
	if (ChainName != "")
	{
		LastTalk = Reflection.Get("{ChainName}")();
		
		ChainIndex++;
		if (ChainIndex >= ChainEnd)
		{
			ChainName = "";
			ChainIndex = 0;
			ChainEnd = 0;
		}
	}
	else
	{
		LastTalk = Reflection.Get("RandomTalk")();
	}
	
	if (CurrentBalloonName == "squidloon")
	{
		LastTalk = "\b[0]" + LastTalk; //bad solution, if you're going to do this i think you should write the balloon tags direct...
	}
	return LastTalk;
}

function OnStartChain
{
	ChainName = Shiori.Reference[0];
	ChainIndex = 0;
	ChainEnd = Reflection.Get("{ChainName}").length;
}

function OnAnchorSelect
{
	if (Shiori.Reference[0].StartsWith("http://") || Shiori.Reference[0].StartsWith("https://"))
	{
		return `\j["{Shiori.Reference[0]}"]`;
	}
}

function OnKeyPress
{
	if (Shiori.Reference[0] == "f1")
	{
		return "\![open,readme]";
	}
	else if (Shiori.Reference[0] == "t")
	{
		return OnStartTalk;
	}
	else if (Shiori.Reference[0] == "r")
	{
		return OnLastTalk;
	}
}

function OnSurfaceRestore
{
	return "\1\s[10]\![set,alignmenttodesktop,bottom]\0\s[0]";
}

function OnWindowStateRestore
{
	return OnSurfaceRestore;
}

function homeurl
{
	return "https://raw.githubusercontent.com/Zichqec/hoard_of_shinies/main/";
}

function ghostver
{
	return "1.0.0";
}

//—————————————————————————————— Right click menu links ——————————————————————————————
function FormatLinks(links)
{
	local output = "";
	for (i = 0; i < links.length; i++)
	{
		output += links[i];
		//Alternate between adding  or 
		if (i % 2 == 1)
		{
			output += (2).ToAscii();
		}
		else
		{
			output += (1).ToAscii();
		}
	}
	return output;
}

function sakura@recommendsites
{
	return FormatLinks(recommendsites_sakura());
}

function recommendsites_sakura
{
	return
	[
		"Zi's Ukagaka Space", "https://ukagaka.zichqec.com/",
		"Merfolk May freeshell", "https://ako-kipali.tumblr.com/ghost-stuff",
		"Aosora SHIORI", "https://github.com/kanadelab/aosora-shiori"
	];
}