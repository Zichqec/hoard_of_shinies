function OnSpectrePlugin@ConfirmCalibration
{
	return "\![raiseplugin,Spectre,OnCustomCalibrationConfirm,--option=include,normal,embarrassed,smile,surprised,discouraged]";
}

function OnSpectrePlugin@Surface
{
	if (Shiori.Reference[0] == "normal") { return "\s[0]"; }
	else if (Shiori.Reference[0] == "embarrassed") { return "\s[1]"; }
	else if (Shiori.Reference[0] == "smile") { return "\s[2]"; }
	else if (Shiori.Reference[0] == "surprised") { return "\s[5]"; }
	else if (Shiori.Reference[0] == "discouraged") { return "\s[6]"; } //It's a bit of a stretch, but... I think it really helps for the dissociated pool
}

function OnSpectrePlugin@Possession
{
	if (Random.GetIndex(0,4) == 0)
	{
		return Reflection.Get("SpectreTalk_{Shiori.Reference[0]}");
	}
}

//—————————— Spectre responses ——————————
talk SpectreTalk_cheerful
{
	\s[2]Hmm-hmm~ Hmm-hmm~
}

talk SpectreTalk_cheerful
{
	\s[2]I'm having so much fun today~!
}

talk SpectreTalk_cheerful
{
	\s[2]Ahh, everything's sparkling perfectly right now, isn't it~?
}

talk SpectreTalk_miserable
{
	\s[0]Um... \s[1]is the water a little colder today?
	
	Maybe I should go for a swim...
}

talk SpectreTalk_miserable
{
	\s[0]Hm... \w8\w8\s[1]Something feels a bit off. Maybe I should clean up a little...
}

talk SpectreTalk_miserable
{
	\s[1]Hm... I feel kinda strange. \s[6]Like there's an energy in me that needs to get out.
	
	\s[1]I wonder if swimming around for a while would help.
}

talk SpectreTalk_dissociated
{
	\s[1]Did you hear someone outside just now...?
	
	Maybe not... It must be my imagination.
}

talk SpectreTalk_dissociated
{
	\s[1]I don't like the way the kelp is swaying today. It feels... ominous.
}

talk SpectreTalk_dissociated
{
	\s[1]I have an odd feeling like something bad is going to happen...
	
	\s[1]\i[450]It's probably nothing, right...? \s[1]Right.
}

//—————————— Needle poking ——————————
talk OnNeedlePoke
{
	\s[5]Oh... \s[4]Is this for me?
	
	\s[2]Ohhh thank you thank you, so sparkly~!!
}

talk OnNeedlePoke
{
	\s[5]Oooh, what's this, what's this?
	
	\s[2]Something new, something new~!
}

talk OnNeedlePoke
{
	\s[5]Ohh... \s[2]Oh wow, where did you find this? \s[5]It's so shiny...
	
	\s[0]Where should we put it...?
}