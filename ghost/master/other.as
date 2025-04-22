function OnTranslate
{
	local talkstr = Shiori.Reference[0];
	
	talkstr = AutoPause(talkstr);
	
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
	return "1.0.4";
}

function Capitalize(word)
{
	word = "{word}";
	local firstlet = word.Substring(0,1);
	local rest = word.Substring(1);
	
	return firstlet.ToUpper() + rest;
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