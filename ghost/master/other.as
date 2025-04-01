function OnTranslate
{
	local talkstr = Shiori.Reference[0];
	
	talkstr = AutoPause(talkstr);
	
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
	return "1.0.1";
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


function getaistate
{
	local Points = [
		{name: "RandomTalk", val: RandomTalk.length},
		{name: "BootTalk", val: BootTalk.length},
		{name: "CloseTalk", val: CloseTalk.length},
		{name: "SpectreTalk_cheerful", val: SpectreTalk_cheerful.length},
		{name: "SpectreTalk_miserable", val: SpectreTalk_miserable.length},
		{name: "SpectreTalk_dissociated", val: SpectreTalk_dissociated.length},
		{name: "SpectreTalk_spooky", val: SpectreTalk_spooky.length},
		{name: "OnNeedlePoke", val: OnNeedlePoke.length}
	];
	
	local labels = "";
	local values = "";
	
	for (local i = 0; i < Points.length; i++)
	{
		if (values != "") { values += ","; } //there might be a better method in aosora but i'm not sure
		values += Points[i]["val"];
		
		if (labels != "") { labels += ","; }
		labels += Points[i]["name"];
	}
	
	return values + "{(1).ToAscii}" + labels;	
}