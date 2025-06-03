function OnTranslate
{
	local talkstr = Shiori.Reference[0];
	
	if (Save.Data.ReducedMotion)
	{
		talkstr = talkstr.Replace("\s[0]","\s[100]");
		talkstr = talkstr.Replace("\s[1]","\s[101]");
		talkstr = talkstr.Replace("\s[2]","\s[102]");
		talkstr = talkstr.Replace("\s[3]","\s[103]");
		talkstr = talkstr.Replace("\s[4]","\s[104]");
		talkstr = talkstr.Replace("\s[5]","\s[105]");
		talkstr = talkstr.Replace("\s[6]","\s[106]");
		talkstr = talkstr.Replace("\s[7]","\s[107]");
		talkstr = talkstr.Replace("\s[8]","\s[108]");
		talkstr = talkstr.Replace("\s[8]","\s[108]");
		talkstr = talkstr.Replace("\s[9]","\s[109]");
		talkstr = talkstr.Replace("\s[10]","\s[110]");
	}
	
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
	if (!(talkstr.Contains("\![no-autopause]") || talkstr.Contains("■Aosora reload completed")))
	{
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

//Call coming from menu, or hotkey
function OnStartTalk
{
	LastTalk = TalkTimer.CallRandomTalk();
	return LastTalk;
}

//Call coming from TalkTimer or \a tag
function OnAITalk
{
	LastTalk = Reflection.Get("RandomTalk")();
	return LastTalk;
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
	if (Shiori.Reference[0] == "f1") { return "\![open,readme]"; }
	else if (Shiori.Reference[0] == "t") { return OnStartTalk; }
	else if (Shiori.Reference[0] == "r") { return OnLastTalk; }
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
	return "1.0.5";
}

function Capitalize(word)
{
	word = "{word}";
	local firstlet = word.Substring(0,1);
	local rest = word.Substring(1);
	
	return firstlet.ToUpper() + rest;
}

function emdash
{
	return "\f[name,calibri]—\f[name,default]";
}

function otherghostname
{
	OpenGhosts = [];
	for (local i = 0; i < Shiori.Reference.length; i++)
	{
		local split = Shiori.Reference[i].Split("{(1).ToAscii()}");
		OpenGhosts.Add(split[0]);
	}
}


//—————————————————————————————— Right click menu links ——————————————————————————————
function FormatLinks(links)
{
	local output = "";
	for (i = 0; i < links.length; i++)
	{
		//Name then 0x01, URL then 0x02
		output += links[i]["name"] + (1).ToAscii();
		output += links[i]["url"] + (2).ToAscii();
	}
	return output;
}

function sakura@recommendsites
{
	return FormatLinks([
		{name: "Zi's Ukagaka Space", url: "https://ukagaka.zichqec.com/"},
		{name: "Merfolk May freeshell", url: "https://ako-kipali.tumblr.com/ghost-stuff"},
		{name: "Aosora SHIORI", url: "https://github.com/kanadelab/aosora-shiori"}
	]);
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
		{name: "NeedleTalk", val: NeedleTalk.length},
		{name: "OnPhantaEepy", val: OnPhantaEepy.length},
		{name: "OnLoboHowl", val: OnLoboHowl.length},
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